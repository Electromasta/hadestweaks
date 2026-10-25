-- GodKeepsakeRarity: god keepsakes also raise the chance of Epic and Legendary boons

local ET = ElectroTweaks
local Option = { ChangesTraitData = true }
ET.Options.GodKeepsakeRarity = Option

Option.Keepsakes =
{
	"ForceZeusBoonTrait", "ForcePoseidonBoonTrait", "ForceAthenaBoonTrait", "ForceAphroditeBoonTrait",
	"ForceAresBoonTrait", "ForceArtemisBoonTrait", "ForceDionysusBoonTrait", "ForceDemeterBoonTrait",
}

function Option.Apply()
	for _, traitName in ipairs( Option.Keepsakes ) do
		local trait = TraitData[traitName]
		trait.RarityLevels = ET.FlatTiers( 1, 2, 3, 4, 5 )
		trait.RarityBonus.RareBonus = { BaseValue = 0.07 }
		trait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
		trait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
		trait.RarityBonus.ExtractValues =
		{
			{
				Key = "RareBonus",
				ExtractAs = "TooltipBonusChance",
				Format = "Percent",
			},
			{
				Key = "EpicBonus",
				ExtractAs = "TooltipBonusChanceEpic",
				Format = "Percent",
			},
			{
				Key = "LegendaryBonus",
				ExtractAs = "TooltipBonusChanceLegendary",
				Format = "Percent",
			},
		}

		for _, id in ipairs( { traitName, traitName.."_Rack", traitName.."_Inactive" } ) do
			ET.EnglishTextRemap[id] = "ET_"..id
		end
	end
end
