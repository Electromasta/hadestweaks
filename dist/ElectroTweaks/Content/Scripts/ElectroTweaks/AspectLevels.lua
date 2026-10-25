-- AspectLevels: weapon aspects up to level 10
-- Changes the save file (aspect levels 6-10); Revert undoes that while the option is off.

local ET = ElectroTweaks
local Option = { ChangesTraitData = true }
ET.Options.AspectLevels = Option

-- Titan Blood cost of reaching each aspect level (Costs[n] is paid to go from level n - 1 to n)
Option.Costs = { 0, 1, 1, 2, 2, 3, 3, 4, 4, 5 }
Option.MaxLevel = 10

function Option.Apply()
	for weaponName, upgrades in pairs( WeaponUpgradeData ) do
		if weaponName ~= "DefaultGameStateRequirement" then
			for _, upgrade in ipairs( upgrades ) do
				upgrade.Costs = DeepCopyTable( Option.Costs )
				upgrade.MaxUpgradeLevel = Option.MaxLevel
			end
		end
	end

	-- Every aspect inherits from WeaponEnchantmentTrait unless it defines its own tiers
	local enchantmentTiers = DeepCopyTable( TraitData.WeaponEnchantmentTrait.RarityLevels )
	for i, multiplier in ipairs( { 6, 7, 8, 9, 10 } ) do
		enchantmentTiers[ET.RarityOrder[5 + i]] = { MinMultiplier = multiplier, MaxMultiplier = multiplier }
	end
	ET.SetInherited( TraitData, "WeaponEnchantmentTrait", "RarityLevels", enchantmentTiers )

	ET.AddRangeTiers( "SwordCriticalParryTrait", 6, 2.2, 2.4, 2.6, 2.8, 3.0 )
	ET.AddRangeTiers( "SwordConsecrationTrait", 6, 2.2, 2.4, 2.6, 2.8, 3.0 )
	ET.AddRangeTiers( "ShieldLoadAmmoTrait", 6, 6, 7, 8, 9, 10 )
	ET.AddRangeTiers( "ShieldTwoShieldTrait", 6, 4.45, 4.9, 5.35, 5.8, 6.25 )
	ET.AddRangeTiers( "SpearSpinTravel", 6, 0.45/0.7, 0.40/0.7, 0.35/0.7, 0.30/0.7, 0.25/0.7 )
	ET.AddRangeTiers( "SpearWeaveTrait", 6, 5.65, 6.35, 7, 7.65, 8 )
	ET.AddRangeTiers( "SpearTeleportTrait", 6, 3.2, 3.4, 3.6, 3.8, 4 )
	ET.AddRangeTiers( "GunGrenadeSelfEmpowerTrait", 6, 6, 6.5, 7, 7.5, 8 )
	ET.AddRangeTiers( "GunManualReloadTrait", 6, 3.2, 3.4, 3.6, 3.8, 4 )
	ET.AddRangeTiers( "GunLoadedGrenadeTrait", 6, 2.1, 2.2, 2.3, 2.4, 2.5 )
	ET.AddRangeTiers( "FistVacuumTrait", 6, 6, 6.5, 7, 7.5, 8 )
	ET.AddRangeTiers( "FistWeaveTrait", 6, 6, 7, 8, 9, 10 )
	ET.AddRangeTiers( "FistDetonateTrait", 6, 4.35, 4.65, 5, 5.5, 6 )
	ET.AddRangeTiers( "BowLoadAmmoTrait", 6, 4, 4.25, 4.5, 4.75, 5 )
	ET.AddRangeTiers( "BowBondTrait", 6, 2.2, 2.4, 2.6, 2.8, 3 )

	-- Aspect of Chiron: Special shots = 9 (BowSplitShot) + BaseValue * multiplier.
	-- 3 shots at level 1, one more per level, 12 at level 10.
	local chiron = TraitData.BowMarkHomingTrait
	chiron.RarityLevels = ET.RangeTiers( 6/6, 5/6, 4/6, 3/6, 2/6, 1/6, 0/6, -1/6, -2/6, -3/6 )
	chiron.PropertyChanges[2].BaseValue = -6
	-- The tooltip shows BaseValue * multiplier as the shot count
	chiron.ExtractProjectiles.BaseValue = 3
	chiron.ExtractProjectiles.CustomRarityMultiplier = ET.RangeTiers( 3/3, 4/3, 5/3, 6/3, 7/3, 8/3, 9/3, 10/3, 11/3, 12/3 )

	function GetRarityKey( index )
		return ET.RarityOrder[index]
	end

	function IsWeaponUpgradeMaxed( weaponName, index )
		if IsBuyWeaponUpgradeDisabled( weaponName, index ) then
			return false
		end
		if not GameState.WeaponUnlocks or not GameState.WeaponUnlocks[weaponName] or not GameState.WeaponUnlocks[weaponName][index] then
			return false
		end
		return GameState.WeaponUnlocks[weaponName][index] >= WeaponUpgradeData[weaponName][index].MaxUpgradeLevel
	end
end

-- Lowers aspects above the game's maximum and refunds the Titan Blood spent on those levels
function Option.Revert()
	for weaponName, levels in pairs( GameState.WeaponUnlocks or {} ) do
		for index, level in pairs( levels ) do
			local upgrade = WeaponUpgradeData[weaponName] and WeaponUpgradeData[weaponName][index]
			if upgrade and type(level) == "number" and level > upgrade.MaxUpgradeLevel then
				local refund = 0
				for paidLevel = upgrade.MaxUpgradeLevel + 1, level do
					refund = refund + (Option.Costs[paidLevel] or 0)
				end
				levels[index] = upgrade.MaxUpgradeLevel
				ET.AddResource( "SuperLockKeys", refund )
				DebugPrint({ Text = "ElectroTweaks: "..weaponName.." aspect "..index.." lowered from level "..level.."; refunded "..refund.." Titan Blood" })
			end
		end
	end
end
