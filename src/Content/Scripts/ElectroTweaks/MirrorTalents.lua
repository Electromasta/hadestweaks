-- MirrorTalents: twice as many ranks for most Mirror of Night talents
-- Changes the save file (ranks above the game's maximum); Revert undoes that while the option is off.

local ET = ElectroTweaks
local Option = {}
ET.Options.MirrorTalents = Option

Option.CostTables =
{
	HealthMetaUpgrade = { 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 100, 125, 150, 175, 200, 250, 300, 350, 400, 450 },
	HighHealthDamageMetaUpgrade = { 50, 100, 150, 200, 250, 300, 350, 400, 450, 500 },
	DoorHealMetaUpgrade = { 10, 20, 40, 250, 500 },
	DarknessHealMetaUpgrade = { 30, 60, 250, 500 },
	AmmoMetaUpgrade = { 20, 80, 500, 1000 },
	ReloadAmmoMetaUpgrade = { 60, 120, 500, 1000 },
	StaminaMetaUpgrade = { 50, 500 },
	PerfectDashMetaUpgrade = { 75, 750 },
	BackstabMetaUpgrade = { 10, 15, 20, 25, 30, 100, 150, 200, 250, 300 },
	FirstStrikeMetaUpgrade = { 10, 15, 20, 25, 30, 100, 150, 200, 250, 300 },
	StoredAmmoVulnerabilityMetaUpgrade = { 10, 30, 50, 70, 90, 150, 200, 250, 300, 350 },
	StoredAmmoSlowMetaUpgrade = { 20, 40, 60, 80, 100, 150, 200, 250, 300, 350 },
	UnstoredAmmoVulnerabilityMetaUpgrade = { 10, 30, 50, 70, 90, 150, 200, 250, 300, 350 },
	VulnerabilityEffectBonusMetaUpgrade = { 50, 500, 750, 1000 },
	GodEnhancementMetaUpgrade = { 50, 150, 500, 1000 },
	ExtraChanceMetaUpgrade = { 30, 500, 1000, 2000, 3000 },
	ExtraChanceWrathMetaUpgrade = { 30, 500, 1000, 2000, 3000 },
	ExtraChanceReplenishMetaUpgrade = { 600, 2000 },
	MoneyMetaUpgrade = { 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200 },
	InterestMetaUpgrade = { 70, 90, 110, 250, 500, 1000 },
	RerollMetaUpgrade = { 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250 },
	RerollPanelMetaUpgrade = { 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000 },
}

Option.MaxInvestments =
{
	RareBoonDropMetaUpgrade = 80,
	EpicBoonDropMetaUpgrade = 40,
	DuoRarityBoonDropMetaUpgrade = 20,
	EpicHeroicBoonMetaUpgrade = 20,
	RunProgressRewardMetaUpgrade = 20,
}

function Option.Apply()
	for name, costTable in pairs( Option.CostTables ) do
		MetaUpgradeData[name].CostTable = DeepCopyTable( costTable )
	end
	for name, maxInvestment in pairs( Option.MaxInvestments ) do
		MetaUpgradeData[name].MaxInvestment = maxInvestment
	end
end

-- Lowers talents above the game's maximum and refunds the Darkness spent on those ranks.
-- Runs before the game's own cap check, which only reads the stored rank of unselected talents.
function Option.Revert()
	local function MaxInvestmentPrice( data, index )
		local additionalCost = 0
		if data.CostIncreaseInterval ~= nil and data.CostIncreaseInterval > 0 then
			additionalCost = math.floor( index / data.CostIncreaseInterval ) * data.CostIncrease
		end
		return data.Cost + additionalCost
	end

	local candidates = {}
	for name in pairs( Option.CostTables ) do
		candidates[name] = true
	end
	for name in pairs( Option.MaxInvestments ) do
		candidates[name] = true
	end

	GameState.MetaUpgrades = GameState.MetaUpgrades or {}
	GameState.MetaUpgradeState = GameState.MetaUpgradeState or {}
	for name in pairs( candidates ) do
		local data = MetaUpgradeData[name]
		local cap = data and ((data.CostTable and #data.CostTable) or data.MaxInvestment)
		-- Same rule the game uses to count investment: the live value for the selected talent
		local active = Contains( GameState.MetaUpgradesSelected, name )
		local rank = (active and GameState.MetaUpgrades[name]) or GameState.MetaUpgradeState[name] or 0
		if cap and type(rank) == "number" and rank > cap then
			local refund = 0
			for paidRank = cap + 1, rank do
				if Option.CostTables[name] then
					refund = refund + (Option.CostTables[name][paidRank] or 0)
				else
					refund = refund + MaxInvestmentPrice( data, paidRank - 1 )
				end
			end
			for _, ranks in ipairs( { GameState.MetaUpgrades, GameState.MetaUpgradeState } ) do
				if type(ranks[name]) == "number" and ranks[name] > cap then
					ranks[name] = cap
				end
			end
			ET.AddResource( "MetaPoints", refund )
			DebugPrint({ Text = "ElectroTweaks: "..name.." lowered from rank "..rank.."; refunded "..refund.." Darkness" })
		end
	end
end
