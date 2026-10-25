-- KeepsakeLevels: keepsakes rank up to 5

local ET = ElectroTweaks
local Option = { ChangesTraitData = true }
ET.Options.KeepsakeLevels = Option

function Option.Apply()
	ET.SetInherited( TraitData, "GiftTrait", "ChamberThresholds", { 25, 50, 75, 100 } )
	ET.SetInherited( TraitData, "AssistTrait", "ChamberThresholds", { 25, 50, 75, 100 } )
	ET.SetInherited( TraitData, "GiftTrait", "RarityLevels", ET.FlatTiers( 1, 1.5, 2, 2.5, 3 ) )

	ET.AddFlatTiers( "ShopDurationTrait", 4, 2.5, 3 )
	ET.AddFlatTiers( "ReincarnationTrait", 4, 2.5, 3 )
	ET.AddFlatTiers( "HeroicStandTrait", 4, 4, 5 )
	ET.AddFlatTiers( "ShieldAfterHitTrait", 4, 1.75, 2 )
	ET.AddFlatTiers( "HadesShoutKeepsake", 4, 4, 5 )
	ET.AddFlatTiers( "HadesShoutTrait", 4, 2.5, 3 )
	ET.AddFlatTiers( "ChamberStackTrait", 4, 3/6, 2/6 )
	ET.AddFlatTiers( "DirectionalArmorTrait", 4, 3.5, 4 )
	ET.AddFlatTiers( "FastClearDodgeBonusTrait", 4, 1.3, 1.5 )
	ET.AddFlatTiers( "PerfectClearDamageBonusTrait", 4, 2.5, 3 )
	ET.AddFlatTiers( "PerfectClearHealthBonusTrait", 4, 4, 5 )
	ET.AddFlatTiers( "BackstabAlphaStrikeTrait", 4, 2.5, 3 )
	ET.AddFlatTiers( "ShieldBossTrait", 4, 6, 7 )
	ET.AddFlatTiers( "VanillaTrait", 4, 2.5, 3 )
	ET.AddFlatTiers( "MegaRubbleTrait", 4, 3.5, 4 )
	ET.AddFlatTiers( "DistanceDamageTrait", 4, 4, 5 )
	ET.AddFlatTiers( "MaxHealthKeepsakeTrait", 4, 2.5, 3 )
	ET.AddFlatTiers( "RetainMoneyOnDeathTrait", 4, 2, 2.25 )
	ET.AddFlatTiers( "BonusMoneyTrait", 4, 1.75, 2 )

	-- The game only steps back one threshold, which is only right for 2 thresholds
	local function ChambersBeforeLevel( traitName, level )
		local chambers = 0
		for i = 1, level - 1 do
			chambers = chambers + TraitData[traitName].ChamberThresholds[i]
		end
		return chambers
	end

	function GetKeepsakeProgress( traitName )
		local currentLevel = GetKeepsakeLevel( traitName )
		if not GameState.KeepsakeChambers[traitName] or not TraitData[traitName].ChamberThresholds then
			return 0
		end

		if IsKeepsakeMaxed( traitName ) then
			return 1
		end
		return (GameState.KeepsakeChambers[traitName] - ChambersBeforeLevel( traitName, currentLevel )) / TraitData[traitName].ChamberThresholds[currentLevel]
	end

	function GetKeepsakeChambersToNextLevel( traitName )
		if IsKeepsakeMaxed( traitName ) then
			return 0
		end

		local currentLevel = GetKeepsakeLevel( traitName )
		local currentChambers = GameState.KeepsakeChambers[traitName] or 0
		return TraitData[traitName].ChamberThresholds[currentLevel] - ( currentChambers - ChambersBeforeLevel( traitName, currentLevel ) )
	end

	-- The game's 5-rank icon set, already used by the companion keepsakes
	for level = 1, 5 do
		ET.TextRemap["Keepsake_Level_"..level] = "LegendaryKeepsake_Level_"..level
	end
end
