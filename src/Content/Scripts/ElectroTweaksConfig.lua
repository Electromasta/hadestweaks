-- Electro's Tweaks settings
--
-- Turn each change on (true) or off (false), save this file, then restart the game.
-- Every option can be changed at any time EXCEPT the ones marked SAVE WARNING; read those first.

ElectroTweaksConfig =
{
	-- Weapon aspects can be upgraded to level 10 instead of 5.
	-- Titan Blood per level: 0, 1, 1, 2, 2, 3, 3, 4, 4, 5 (6 to reach level 5, 25 to reach level 10).
	-- Unlocking an aspect (its first level) is free.
	-- Aspect of Chiron is reworked to fit 10 levels: 3 Special shots at level 1, +1 per level, up to 12.
	--
	-- !! SAVE WARNING !!
	-- Aspect levels 6-10 are stored in your save file, and the unmodded game cannot handle them.
	-- Before removing the mod, set this to false and load your save: every aspect above level 5 drops
	-- to level 5 and the Titan Blood spent on levels 6-10 is refunded. Then follow the uninstall steps.
	AspectLevels = false,

	-- Rebalances the six Aspects of Zagreus so they start stronger and scale further:
	--   Sword:  Attack and Move Speed            10% -> 22.5% at level 5 (35% at level 10)
	--   Spear:  Damage, Throw Range, Crit Chance  5% -> 15% (25%)
	--   Shield: +5 Damage and 5% Damage Reduction -> +12 and 12% (+20 and 20%)
	--   Bow:    Crit and Dodge Chance              5% -> 12% (20%)
	--   Fists:  Damage and Dodge Chance           10% -> 20% (30%)
	--   Rail:   +5 Ammo and 5% Damage             -> +12 and 12% (+20 and 20%)
	-- Safe to turn on or off at any time.
	ZagreusAspects = true,

	-- Keepsakes rank up to 5 instead of 3. Each rank takes 25, 50, 75, then 100 more chambers.
	-- Safe to turn on or off at any time (keepsakes just show rank 3 again when off).
	KeepsakeLevels = true,

	-- God keepsakes (Thunder Signet, Owl Pendant, ...) also raise the chance of Epic and Legendary
	-- boons from their god. Per keepsake rank: Rare +7%, Epic +4%, Legendary +3%.
	-- Safe to turn on or off at any time.
	GodKeepsakeRarity = true,

	-- Doubles the number of ranks for most Mirror of Night talents. Existing ranks keep their cost;
	-- the new ranks are much more expensive.
	-- Safe to turn off: the next time you load, ranks above the normal maximum are removed and their
	-- Darkness is refunded.
	MirrorTalents = true,
}
