#!/usr/bin/env python3
"""Build the Electro's Tweaks looseleaf release from an unmodded Hades install.

The release overwrites only two game files, each rebuilt from the installed game so no game fixes
are lost: RoomManager.lua (plus one Import line) and HelpText.en.sjson (plus this mod's text
entries). Everything else is new files.

The first build copies the unmodded game files it needs into vanilla/ (ignored by git); later
builds read those copies, so they keep working after the mod is installed into the game.

Usage: python3 tools/build.py [--game PATH] [--out DIR] [--install]
"""
import argparse
import re
import shutil
import sys
import zipfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SRC = ROOT / "src" / "Content"
DEFAULT_GAME = Path.home() / ".steam/steam/steamapps/common/Hades"
VANILLA = ROOT / "vanilla"
IMPORT_LINE = b'Import "ElectroTweaks.lua"'
RAIL_AMMO = 20
# GunWeapon's own MaxAmmo line, inside its block in PlayerWeapons.sjson
RAIL_PATTERN = re.compile(rb'(Name = "GunWeapon"\r\n(?:(?!\s*Name = ).*\r\n)*?\s*MaxAmmo = )12\r\n')


def crlf(data):
    return data.replace(b"\r\n", b"\n").replace(b"\n", b"\r\n")


def is_modded(relative, data):
    if relative.endswith("RoomManager.lua"):
        return IMPORT_LINE in data
    if relative.endswith("HelpText.en.sjson"):
        return b'Id = "ET_' in data
    return RAIL_PATTERN.search(data) is None  # Rail ammo already changed


def read_vanilla(game, relative):
    """The unmodded game file: the saved copy in vanilla/, or the game's file (saved on first use)."""
    saved = VANILLA / relative
    if saved.is_file():
        return saved.read_bytes()
    data = (game / relative).read_bytes()
    if is_modded(relative, data):
        sys.exit(f"{relative} in the game already contains the mod and there is no saved copy in vanilla/; "
                 "verify the game files in Steam first")
    saved.parent.mkdir(parents=True, exist_ok=True)
    saved.write_bytes(data)
    print(f"saved unmodded {relative} to vanilla/")
    return data


def build_room_manager(vanilla):
    if IMPORT_LINE in vanilla:
        sys.exit("RoomManager.lua already imports ElectroTweaks.lua; verify the game files in Steam first")
    return vanilla.rstrip(b"\r\n") + b"\r\n\r\n" + IMPORT_LINE + b"\r\n"


def build_help_text(vanilla, additions):
    if b'Id = "ET_' in vanilla:
        sys.exit("HelpText.en.sjson already contains Electro's Tweaks text; verify the game files in Steam first")
    end = vanilla.rfind(b"\r\n  ]\r\n}")
    if end < 0:
        sys.exit("HelpText.en.sjson: could not find the end of the Texts list")
    return vanilla[:end] + b"\r\n" + crlf(additions).rstrip(b"\r\n") + vanilla[end:]


def build_player_weapons(vanilla):
    result, count = RAIL_PATTERN.subn(rb"\g<1>" + str(RAIL_AMMO).encode() + b"\r\n", vanilla)
    if count != 1:
        sys.exit("PlayerWeapons.sjson: expected exactly one GunWeapon MaxAmmo = 12, found %d" % count)
    return result


def main():
    parser = argparse.ArgumentParser(description=__doc__.splitlines()[0])
    parser.add_argument("--game", type=Path, default=DEFAULT_GAME, help="Hades install folder (default: %(default)s)")
    parser.add_argument("--out", type=Path, default=ROOT / "dist", help="output folder (default: %(default)s)")
    parser.add_argument("--install", action="store_true", help="also copy the release's Content folder into the game")
    args = parser.parse_args()

    game = args.game / "Content"
    if not (game / "Scripts" / "RoomManager.lua").is_file():
        sys.exit(f"Not a Hades install: {args.game}")

    release = args.out / "ElectroTweaks"
    if release.exists():
        shutil.rmtree(release)
    content = release / "Content"
    optional = release / "Optional" / "Rail 20 Ammo" / "Content"

    outputs = {
        content / "Scripts" / "RoomManager.lua": build_room_manager(read_vanilla(game, "Scripts/RoomManager.lua")),
        content / "Scripts" / "ElectroTweaks.lua": crlf((SRC / "Scripts" / "ElectroTweaks.lua").read_bytes()),
        content / "Scripts" / "ElectroTweaksConfig.lua": crlf((SRC / "Scripts" / "ElectroTweaksConfig.lua").read_bytes()),
        content / "Game" / "Text" / "en" / "HelpText.en.sjson": build_help_text(
            read_vanilla(game, "Game/Text/en/HelpText.en.sjson"),
            (SRC / "Game" / "Text" / "en" / "HelpText.ElectroTweaks.en.sjson").read_bytes()),
        optional / "Game" / "Weapons" / "PlayerWeapons.sjson": build_player_weapons(
            read_vanilla(game, "Game/Weapons/PlayerWeapons.sjson")),
        release / "README.md": crlf((ROOT / "README.md").read_bytes()),
    }
    # One file per config option
    for option in sorted((SRC / "Scripts" / "ElectroTweaks").glob("*.lua")):
        outputs[content / "Scripts" / "ElectroTweaks" / option.name] = crlf(option.read_bytes())
    for path, data in outputs.items():
        path.parent.mkdir(parents=True, exist_ok=True)
        path.write_bytes(data)

    archive = args.out / "ElectroTweaks.zip"
    with zipfile.ZipFile(archive, "w", zipfile.ZIP_DEFLATED) as zf:
        for path in sorted(release.rglob("*")):
            if path.is_file():
                zf.write(path, path.relative_to(args.out))

    for path in sorted(outputs):
        print(path.relative_to(args.out))
    print(f"-> {archive}")

    if args.install:
        # Keep the player's settings: an existing config file in the game is never replaced
        config = Path("Scripts") / "ElectroTweaksConfig.lua"
        keep = (game / config).is_file()
        shutil.copytree(content, game, dirs_exist_ok=True,
                        ignore=lambda folder, names: ["ElectroTweaksConfig.lua"] if keep and Path(folder) == content / "Scripts" else [])
        print(f"installed Content into {game}" + (" (kept existing ElectroTweaksConfig.lua)" if keep else ""))


if __name__ == "__main__":
    main()
