-- ZagreusAspects: the six Aspects of Zagreus start stronger and scale further

local ET = ElectroTweaks
local Option = { ChangesTraitData = true }
ET.Options.ZagreusAspects = Option

function Option.Apply()
	local sword = TraitData.SwordBaseUpgradeTrait
	sword.RarityLevels = ET.RangeTiers( 1, 1.5, 1.75, 2, 2.25, 2.5, 2.75, 3, 3.25, 3.5 )
	for i = 1, 6 do
		sword.PropertyChanges[i].BaseValue = 0.9 -- attack charge and recovery time
	end
	sword.PropertyChanges[7].BaseValue = 1.1 -- move speed
	sword.ExtractEntry.BaseValue = 0.9

	local spearWeapons = { "SpearWeapon", "SpearWeaponTwoThree", "SpearWeaponThrowReturn", "SpearWeaponThrow" }
	local spear = TraitData.SpearBaseUpgradeTrait
	spear.RarityLevels = ET.RangeTiers( 1, 1.5, 2, 2.5, 3, 3.5, 4, 4.35, 4.65, 5 )
	spear.AddOutgoingDamageModifiers.ValidWeaponMultiplier.BaseValue = 1.05
	spear.AddOutgoingDamageModifiers.ValidWeapons = spearWeapons
	local throwRange = spear.PropertyChanges[1]
	throwRange.BaseValue = 1.05
	-- Replaces the vanilla throw speed and charge time bonuses with crit chance
	spear.PropertyChanges =
	{
		throwRange,
		{
			WeaponNames = spearWeapons,
			ProjectileProperty = "CriticalHitChance",
			BaseMin = 0.05,
			BaseMax = 0.05,
			ChangeType = "Add",
			ExtractValue =
			{
				ExtractAs = "TooltipCritChance",
				Format = "Percent",
			},
		},
	}

	local shield = TraitData.ShieldBaseUpgradeTrait
	shield.RarityLevels = ET.RangeTiers( 1, 1.35, 1.65, 2, 2.35, 2.65, 3, 3.35, 3.65, 4 )
	shield.PropertyChanges[1].BaseValue = 5
	shield.AddIncomingDamageModifiers =
	{
		GlobalMultiplier =
		{
			BaseValue = 0.95,
			SourceIsMultiplier = true,
		},
		ExtractValues =
		{
			{
				Key = "GlobalMultiplier",
				ExtractAs = "TooltipDamageReduction",
				Format = "NegativePercentDelta",
			},
		},
	}

	local bow = TraitData.BowBaseUpgradeTrait
	bow.RarityLevels = ET.RangeTiers( 1, 1.35, 1.65, 2, 2.35, 2.65, 3, 3.35, 3.65, 4 )
	bow.PropertyChanges[1].BaseMin = 0.05
	bow.PropertyChanges[1].BaseMax = 0.05
	bow.PropertyChanges[2] =
	{
		LifeProperty = "DodgeChance",
		BaseValue = 0.05,
		ChangeType = "Add",
		DataValue = false,
		ExtractValue =
		{
			ExtractAs = "TooltipChance",
			Format = "Percent",
		},
	}

	local fist = TraitData.FistBaseUpgradeTrait
	fist.RarityLevels = ET.RangeTiers( 1, 1.25, 1.5, 1.75, 2, 2.2, 2.4, 2.6, 2.8, 3 )
	fist.PropertyChanges[1].BaseValue = 0.1
	fist.AddOutgoingDamageModifiers =
	{
		ValidWeaponMultiplier =
		{
			BaseValue = 1.1,
			SourceIsMultiplier = true,
		},
		ValidWeapons = { "FistWeapon", "FistWeaponSpecial" },
		ExtractValues =
		{
			{
				Key = "ValidWeaponMultiplier",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
			},
		},
	}

	local gun = TraitData.GunBaseUpgradeTrait
	gun.RarityLevels = ET.RangeTiers( 1, 1.35, 1.65, 2, 2.35, 2.65, 3, 3.35, 3.65, 4 )
	gun.PropertyChanges[1].BaseValue = 5
	gun.AddOutgoingDamageModifiers =
	{
		ValidWeaponMultiplier =
		{
			BaseValue = 1.05,
			SourceIsMultiplier = true,
		},
		ValidWeapons = { "GunWeapon" },
		ExtractValues =
		{
			{
				Key = "ValidWeaponMultiplier",
				ExtractAs = "TooltipDamage",
				Format = "PercentDelta",
			},
		},
	}

	-- Sword text is unchanged; the other descriptions name the new stats
	for _, weapon in ipairs( { "Spear", "Shield", "Bow", "Fist", "Gun" } ) do
		for _, id in ipairs( { weapon.."Weapon_Unequipped", weapon.."BaseUpgradeTrait", weapon.."BaseUpgradeTrait_Delta", weapon.."BaseUpgradeTrait_Tray" } ) do
			ET.EnglishTextRemap[id] = "ET_"..id
		end
	end
end
