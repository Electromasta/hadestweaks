# Electro's Tweaks

My personal overhaul of Hades progression: Level 10 Weapon Aspects, Level 5 Keepsakes, and double
the talents on the Mirror of Night.

Every change is now its own option, so you can take only the parts you want. Options are turned
on and off in one settings file (`ElectroTweaksConfig.lua`). The mod is rebuilt for the latest
version of Hades and no longer replaces the game's own scripts and text, so none of Supergiant's
later fixes are lost.

This mod went unmaintained for years while Supergiant kept updating the game. I've come back to it
and used an LLM to help fix the bugs caused by the mismatch between the original mod and the
current version of the game, and to split the changes into separate options.

Found a bug or have a request? Open an issue or pull request on GitHub:
https://github.com/Electromasta/hadestweaks

## Options

### Weapon Aspects (`AspectLevels`, off by default)

- Weapons can be upgraded from level 1 to level 10, with costs: 0, 1, 1, 2, 2, 3, 3, 4, 4, 5
- Level 1 of every aspect costs 0, to encourage experimenting
- Level 1 -> Level 5 costs 6 Titan Blood total, about the same as vanilla
- Level 1 -> Level 10 costs 25 Titan Blood total, a significant investment for greater values than
  vanilla
- Every aspect, including the hidden ones, keeps scaling past level 5
- Aspect of Chiron is reworked to fit 10 levels: 3 Special shots at level 1, +1 per level, up to 12

> **Save warning:** aspect levels 6 to 10 are stored in your save, and the unmodded game cannot
> handle them. That is why this option is off by default. To turn it off later, or to uninstall,
> set it to `false` and load your save: every aspect above level 5 drops to level 5 and the Titan
> Blood spent on levels 6 to 10 is refunded. See [Uninstall](#uninstall).

### Zagreus Aspect Rebalance (`ZagreusAspects`, on by default)

- Sword starts at 10% Attack and Move Speed and scales to 35%
- Spear starts at 5% Critical Chance, Throw Range, and Damage and scales to 25%
- Shield starts at +5 base damage and 5% Damage Reduction and scales to +20 / 20%
- Bow starts at 5% Critical Chance and Dodge Chance and scales to 20%
- Fist starts at 10% Damage and Dodge Chance and scales to 30%
- Rail starts at +5 ammo and 5% damage and scales to +20 / 20%

The top values are at level 10; without `AspectLevels` the aspects stop at level 5, about halfway.
Safe to turn on or off at any time.

### Keepsakes (`KeepsakeLevels`, on by default)

- Keepsakes scale to level 5, taking 75 / 100 more chambers to reach level 4 / 5
- Levels show with the game's 5-rank keepsake icons

Safe to turn on or off at any time; keepsakes just show level 3 again when off.

### God Keepsakes (`GodKeepsakeRarity`, on by default)

Keepsakes that force a god's boon (Thunder Signet, Owl Pendant, ...) also give an extra chance for
Epic and Legendary boons from that god:

- Rare: 7% per level, up to 35%
- Epic: 4% per level, up to 20%
- Legendary: 3% per level, up to 15%

Safe to turn on or off at any time.

### Mirror of Night (`MirrorTalents`, on by default)

- Doubles the talents on the Mirror of Night
- Base talents are unchanged
- New talents are significantly more expensive

Safe to turn off: the next time you load, talents above the normal maximum are lowered and their
Darkness is refunded.

### Miscellaneous (optional file)

- Rail has 20 base ammo so I don't end up shooting myself when I use it. Install the
  `Optional\Rail 20 Ammo` folder to get it; delete or verify the game files to remove it.

## Install

1. Back up your save folder: `Documents\Saved Games\Hades` (Windows).
2. Open the Hades install folder (Steam: right-click Hades > Manage > Browse local files).
3. Unzip the mod and copy its `Content` folder into the Hades folder, replacing files when asked.
4. Optional: also copy `Optional\Rail 20 Ammo\Content` the same way.
5. To choose which changes you get, open `Content\Scripts\ElectroTweaksConfig.lua` in a text
   editor, set each option to `true` or `false`, and restart the game.

Updating from an older version of Electro's Tweaks? Verify the game files in Steam first
(right-click Hades > Properties > Installed Files > Verify integrity), then install.

You no longer need to respec the Mirror of Night before installing.

## Uninstall

> **Weapon Aspects warning:** if you used `AspectLevels`, you must do steps 1 and 2 before removing
> the mod. Aspect levels 6 to 10 are saved in your profile, and weapons over level 5 get real
> cranky in the unmodded game.

1. In `ElectroTweaksConfig.lua`, set every option to `false`.
2. Start the game, load your save, and walk into the next room (or out of the House into a new
   escape attempt) so the game saves. Aspects drop to level 5 and Mirror talents to their normal
   maximum, and the Titan Blood and Darkness you spent on the extra levels is refunded.
3. Quit, then verify the game files in Steam to restore the original files, and delete
   `Content\Scripts\ElectroTweaks.lua`, `ElectroTweaksConfig.lua` and the
   `Content\Scripts\ElectroTweaks` folder if they are still there.

## Notes

- Tooltips for the reworked aspects and keepsakes are in English only; other languages show the
  game's normal text.
- Not compatible with other mods that replace `RoomManager.lua` or `HelpText.en.sjson`.

## For developers

The files in `src/` are not installable by themselves: the mod also needs two of the game's own
files with small additions (`RoomManager.lua` with the line that loads the mod, and
`HelpText.en.sjson` with the mod's text). `tools/build.py` makes those from your installed game, so
they always match its version, and puts together the release:

```
python3 tools/build.py [--game PATH-TO-HADES] [--out DIR] [--install]
```

- `--game` is the Hades install folder. The default is
  `~/.steam/steam/steamapps/common/Hades`; pass it when Hades is installed elsewhere, for example
  `--game ~/.steam/debian-installation/steamapps/common/Hades` or, on Windows (run with `py`),
  `--game "C:\Program Files (x86)\Steam\steamapps\common\Hades"`.
- `--out` is where the release goes (default `dist/`): `dist/ElectroTweaks/` with the `Content` and
  `Optional` folders, and `dist/ElectroTweaks.zip` for uploading.
- `--install` also copies the release's `Content` folder into the game, for testing. An existing
  `ElectroTweaksConfig.lua` in the game is kept, so your test settings survive. The optional Rail
  file is not installed; copy it by hand if you want it.
- The first build needs an unmodded game (verify the game files in Steam first). It saves copies of
  the game files it uses in `vanilla/` (not committed), and later builds read those, so you can
  rebuild with the mod installed. Delete `vanilla/` after a game update so the next build picks up
  the new files.

- `src/Content/Scripts/ElectroTweaks.lua` is loaded by one `Import` line added to the end of the
  game's `RoomManager.lua`. It holds the shared helpers, imports one file per config option from
  `src/Content/Scripts/ElectroTweaks/` (`AspectLevels.lua`, `ZagreusAspects.lua`, ...), and runs
  each option's `Apply` when it is on and its `Revert` (save cleanup) when it is off.
- `src/Content/Game/Text/en/HelpText.ElectroTweaks.en.sjson` holds the mod's text as new `ET_` Ids,
  appended to the game's `HelpText.en.sjson`. The game's own entries are never replaced; the mod
  points text boxes at the `ET_` entries only while the matching option is on.
- `old/looseleaf/` and `old/ElectrosTweaks/` are the 2021 (v2.5.1) looseleaf and ModImporter
  releases, kept for reference.
