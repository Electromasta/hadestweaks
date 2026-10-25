ModUtil.RegisterMod("ElectroTweaks")

ModUtil.LoadOnce(function()
	--Mirror of Night--
	MetaUpgradeData.HealthMetaUpgrade.CostTable = { 40, 45, 50, 55, 60, 65, 70, 75, 80, 85, 100, 125, 150, 175, 200, 250, 300, 350, 400, 450 }
	MetaUpgradeData.HighHealthDamageMetaUpgrade.CostTable = { 50, 100, 150, 200, 250, 300, 350, 400, 450, 500 }
	MetaUpgradeData.DoorHealMetaUpgrade.CostTable = { 10, 20, 40, 250, 500 }
	MetaUpgradeData.DarknessHealMetaUpgrade.CostTable = { 30, 60, 250, 500 }
	MetaUpgradeData.HealthDropMetaUpgrade.CostTable = { 30, 60, 250, 500 }
	MetaUpgradeData.AmmoMetaUpgrade.CostTable = { 20, 80, 500, 1000 }
	MetaUpgradeData.ReloadAmmoMetaUpgrade.CostTable = { 60, 120, 500, 1000 }
	MetaUpgradeData.StaminaMetaUpgrade.CostTable = { 50, 500 }
	MetaUpgradeData.PerfectDashMetaUpgrade.CostTable = { 75, 750 }
	MetaUpgradeData.BackstabMetaUpgrade.CostTable = { 10, 15, 20, 25, 30, 100, 150, 200, 250, 300 }
	MetaUpgradeData.FirstStrikeMetaUpgrade.CostTable = { 10, 15, 20, 25, 30, 100, 150, 200, 250, 300 }
	MetaUpgradeData.StoredAmmoVulnerabilityMetaUpgrade.CostTable = { 10, 30, 50, 70, 90, 150, 200, 250, 300, 350 }
	MetaUpgradeData.StoredAmmoSlowMetaUpgrade.CostTable = { 20, 40, 60, 80, 100, 150, 200, 250, 300, 350 }
	MetaUpgradeData.UnstoredAmmoVulnerabilityMetaUpgrade.CostTable = { 10, 30, 50, 70, 90, 150, 200, 250, 300, 350 }
	MetaUpgradeData.VulnerabilityEffectBonusMetaUpgrade.CostTable = { 50, 500, 750, 1000 }
	MetaUpgradeData.GodEnhancementMetaUpgrade.CostTable = { 50, 150, 500, 1000 }
	MetaUpgradeData.ExtraChanceMetaUpgrade.CostTable = { 30, 500, 1000, 2000, 3000 }
	MetaUpgradeData.ExtraChanceWrathMetaUpgrade.CostTable = { 30, 500, 1000, 2000, 3000 }
	MetaUpgradeData.ExtraChanceReplenishMetaUpgrade.CostTable = { 600, 2000 }
	MetaUpgradeData.MoneyMetaUpgrade.CostTable = { 30, 35, 40, 45, 50, 55, 60, 65, 70, 75, 110, 120, 130, 140, 150, 160, 170, 180, 190, 200 }
	MetaUpgradeData.InterestMetaUpgrade.CostTable = { 70, 90, 110, 250, 500, 1000 }
	MetaUpgradeData.RareBoonDropMetaUpgrade.MaxInvestment = 80
	MetaUpgradeData.EpicBoonDropMetaUpgrade.MaxInvestment = 40
	MetaUpgradeData.DuoRarityBoonDropMetaUpgrade.MaxInvestment = 20
	MetaUpgradeData.EpicHeroicBoonMetaUpgrade.MaxInvestment = 20
	MetaUpgradeData.RunProgressRewardMetaUpgrade.MaxInvestment = 20
	MetaUpgradeData.RerollMetaUpgrade.CostTable = { 500, 750, 1000, 1250, 1500, 1750, 2000, 2250, 2500, 2750, 3000, 3250, 3500, 3750, 4000, 4250 }
	MetaUpgradeData.RerollPanelMetaUpgrade.CostTable = { 1000, 2000, 3000, 4000, 5000, 6000, 7000, 8000 }

	TraitData.WeaponEnchantmentTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5.0, }, Giga1 = { Multiplier = 6.0, }, Giga2 = { Multiplier = 7.0, }, Giga3 = { Multiplier = 8.0, }, Giga4 = { Multiplier = 9.0, }, Giga5 = { Multiplier = 10.0, } }
	
	--Keepsakes--
	TraitData.ShopDurationTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.5, }, Epic = { Multiplier = 2.0, }, Heroic = { Multiplier = 2.5, }, Legendary = { Multiplier = 3.0, } }
	TraitData.ReincarnationTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.5, }, Epic = { Multiplier = 2.0, }, Heroic = { Multiplier = 2.5, }, Legendary = { Multiplier = 3.0, } }
	TraitData.HeroicStandTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ShieldAfterHitTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.25, }, Epic = { Multiplier = 1.5, }, Heroic = { Multiplier = 1.75, }, Legendary = { Multiplier = 2.0, } }
	TraitData.HadesShoutKeepsake.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.HadesShoutTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.5, }, Epic = { Multiplier = 2.0, }, Heroic = { Multiplier = 2.5, }, Legendary = { Multiplier = 3.0, } }
	TraitData.ChamberStackTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 5/6, }, Epic = { Multiplier = 4/6, }, Heroic = { Multiplier = 3/6, }, Legendary = { Multiplier = 2/6, } }
	TraitData.DirectionalArmorTrait.RarityLevels = { Common = { Multiplier = 2.0, }, Rare = { Multiplier = 2.5, }, Epic = { Multiplier = 3.0, }, Heroic = { Multiplier = 3.5, }, Legendary = { Multiplier = 4.0, } }
	TraitData.FastClearDodgeBonusTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.1, }, Epic = { Multiplier = 1.2, }, Heroic = { Multiplier = 1.3, }, Legendary = { Multiplier = 1.5, } }
	TraitData.PerfectClearDamageBonusTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.5, }, Epic = { Multiplier = 2.0, }, Heroic = { Multiplier = 2.5, }, Legendary = { Multiplier = 3.0, } }
	TraitData.PerfectClearHealthBonusTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.BackstabAlphaStrikeTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.5, }, Epic = { Multiplier = 2.0, }, Heroic = { Multiplier = 2.5, }, Legendary = { Multiplier = 3.0, } }
	TraitData.ShieldBossTrait.RarityLevels = { Common = { Multiplier = 3, }, Rare = { Multiplier = 4, }, Epic = { Multiplier = 5, }, Heroic = { Multiplier = 6, }, Legendary = { Multiplier = 7, } }
	TraitData.VanillaTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.5, }, Epic = { Multiplier = 2.0, }, Heroic = { Multiplier = 2.5, }, Legendary = { Multiplier = 3.0, } }
	TraitData.MegaRubbleTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2.0, }, Epic = { Multiplier = 3.0, }, Heroic = { Multiplier = 3.5, }, Legendary = { Multiplier = 4.0, } }
	TraitData.DistanceDamageTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.MaxHealthKeepsakeTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2.0, }, Epic = { Multiplier = 3.0, }, Heroic = { Multiplier = 3.5, }, Legendary = { Multiplier = 4.0, } }
	TraitData.MaxHealthKeepsakeTrait.RarityLevels = { Common = { Multiplier = 1.25, }, Rare = { Multiplier = 1.5, }, Epic = { Multiplier = 1.75, }, Heroic = { Multiplier = 2.0, }, Legendary = { Multiplier = 2.25, } }
	TraitData.BonusMoneyTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 1.25, }, Epic = { Multiplier = 1.5, }, Heroic = { Multiplier = 1.75, }, Legendary = { Multiplier = 2.0, } }

	--Zeus Affinity Keepsake--
	TraitData.ForceZeusBoonTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ForceZeusBoonTrait.RarityBonus.RareBonus = { BaseValue = 0.07 }
	TraitData.ForceZeusBoonTrait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
	TraitData.ForceZeusBoonTrait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
	TraitData.ForceZeusBoonTrait.RarityBonus.ExtractValues = {
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

	--Demeter Affinity Keepsake--
	TraitData.ForceDemeterBoonTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ForceDemeterBoonTrait.RarityBonus.RareBonus = { BaseValue = 0.07 }
	TraitData.ForceDemeterBoonTrait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
	TraitData.ForceDemeterBoonTrait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
	TraitData.ForceDemeterBoonTrait.RarityBonus.ExtractValues = {
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

	--Artemis Affinity Keepsake.  She is the Best Girl.  Artemis Grant me Sight--
	TraitData.ForceArtemisBoonTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ForceArtemisBoonTrait.RarityBonus.RareBonus = { BaseValue = 0.07 }
	TraitData.ForceArtemisBoonTrait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
	TraitData.ForceArtemisBoonTrait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
	TraitData.ForceArtemisBoonTrait.RarityBonus.ExtractValues = {
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

	--Aphrodite Affinity Keepsake--
	TraitData.ForceAphroditeBoonTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ForceAphroditeBoonTrait.RarityBonus.RareBonus = { BaseValue = 0.07 }
	TraitData.ForceAphroditeBoonTrait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
	TraitData.ForceAphroditeBoonTrait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
	TraitData.ForceAphroditeBoonTrait.RarityBonus.ExtractValues = {
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

	--Ares Affinity Keepsake--
	TraitData.ForceAresBoonTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ForceAresBoonTrait.RarityBonus.RareBonus = { BaseValue = 0.07 }
	TraitData.ForceAresBoonTrait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
	TraitData.ForceAresBoonTrait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
	TraitData.ForceAresBoonTrait.RarityBonus.ExtractValues = {
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

	--Athena Affinity Keepsake--
	TraitData.ForceAthenaBoonTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ForceAthenaBoonTrait.RarityBonus.RareBonus = { BaseValue = 0.07 }
	TraitData.ForceAthenaBoonTrait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
	TraitData.ForceAthenaBoonTrait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
	TraitData.ForceAthenaBoonTrait.RarityBonus.ExtractValues = {
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

	--Dionysus Affinity Keepsake--
	TraitData.ForceDionysusBoonTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ForceDionysusBoonTrait.RarityBonus.RareBonus = { BaseValue = 0.07 }
	TraitData.ForceDionysusBoonTrait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
	TraitData.ForceDionysusBoonTrait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
	TraitData.ForceDionysusBoonTrait.RarityBonus.ExtractValues = {
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

	--Poseideon Affinity Keepsake--
	TraitData.ForcePoseidonBoonTrait.RarityLevels = { Common = { Multiplier = 1.0, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, } }
	TraitData.ForcePoseidonBoonTrait.RarityBonus.RareBonus = { BaseValue = 0.07 }
	TraitData.ForcePoseidonBoonTrait.RarityBonus.EpicBonus = { BaseValue = 0.04 }
	TraitData.ForcePoseidonBoonTrait.RarityBonus.LegendaryBonus = { BaseValue = 0.03 }
	TraitData.ForcePoseidonBoonTrait.RarityBonus.ExtractValues = {
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

	TraitData.SwordCriticalParryTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 1.25, }, Epic = { Multiplier = 1.5, }, Heroic = { Multiplier = 1.75, }, Legendary = { Multiplier = 2.0, }, Giga1 = { Multiplier = 2.2, }, Giga2 = { Multiplier = 2.4, }, Giga3 = { Multiplier = 2.6, }, Giga4 = { Multiplier = 2.8, }, Giga5 = { Multiplier = 3.0, } }
	TraitData.SwordConsecrationTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 1.25, }, Epic = { Multiplier = 1.5, }, Heroic = { Multiplier = 1.75, }, Legendary = { Multiplier = 2.0, }, Giga1 = { Multiplier = 2.2, }, Giga2 = { Multiplier = 2.4, }, Giga3 = { Multiplier = 2.6, }, Giga4 = { Multiplier = 2.8, }, Giga5 = { Multiplier = 3.0, } }
	TraitData.ShieldLoadAmmoTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, }, Giga1 = { Multiplier = 6, }, Giga2 = { Multiplier = 7, }, Giga3 = { Multiplier = 8, }, Giga4 = { Multiplier = 9, }, Giga5 = { Multiplier = 10, } }
	TraitData.ShieldTwoShieldTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 1.75, }, Epic = { Multiplier = 2.5, }, Heroic = { Multiplier = 3.25, }, Legendary = { Multiplier = 4, }, Giga1 = { Multiplier = 4.45, }, Giga2 = { Multiplier = 4.9, }, Giga3 = { Multiplier = 5.35, }, Giga4 = { Multiplier = 5.8, }, Giga5 = { Multiplier = 6.25, } }
	TraitData.SpearSpinTravel.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 0.65/0.7, MaxMultiplier = 0.65/0.7 }, Epic = { MinMultiplier = 0.60/0.7, MaxMultiplier = 0.60/0.7 }, Heroic = { MinMultiplier = 0.55/0.7, MaxMultiplier = 0.55/0.7 }, Legendary = { MinMultiplier = 0.50/0.7, MaxMultiplier = 0.50/0.7 }, Giga1 = { MinMultiplier = 0.45/0.7, MaxMultiplier = 0.45/0.7 }, Giga2 = { MinMultiplier = 0.40/0.7, MaxMultiplier = 0.40/0.7 }, Giga3 = { MinMultiplier = 0.35/0.7, MaxMultiplier = 0.35/0.7 }, Giga4 = { MinMultiplier = 0.30/0.7, MaxMultiplier = 0.30/0.7 }, Giga5 = { MinMultiplier = 0.25/0.7, MaxMultiplier = 0.25/0.7 } }
	TraitData.GunGrenadeSelfEmpowerTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, }, Giga1 = { Multiplier = 6, }, Giga2 = { Multiplier = 6.5, }, Giga3 = { Multiplier = 7, }, Giga4 = { Multiplier = 7.5, }, Giga5 = { Multiplier = 8, } }
	TraitData.FistVacuumTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, }, Giga1 = { Multiplier = 6, }, Giga2 = { Multiplier = 6.5, }, Giga3 = { Multiplier = 7, }, Giga4 = { Multiplier = 7.5, }, Giga5 = { Multiplier = 8, } }
	TraitData.FistBaseUpgradeTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 1.25, }, Epic = { Multiplier = 1.5, }, Heroic = { Multiplier = 1.75, }, Legendary = { Multiplier = 2, }, Giga1 = { Multiplier = 2.2, }, Giga2 = { Multiplier = 2.4, }, Giga3 = { Multiplier = 2.6, }, Giga4 = { Multiplier = 2.8, }, Giga5 = { Multiplier = 3, } }
	TraitData.FistBaseUpgradeTrait.AddOutgoingDamageModifiers =
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
		  }
	}
	TraitData.FistBaseUpgradeTrait.PropertyChanges[1].BaseValue = 0.1

	TraitData.FistWeaveTrait.RarityLevels = { Common = { Multiplier = 1, }, Rare = { Multiplier = 2, }, Epic = { Multiplier = 3, }, Heroic = { Multiplier = 4, }, Legendary = { Multiplier = 5, }, Giga1 = { Multiplier = 6, }, Giga2 = { Multiplier = 7, }, Giga3 = { Multiplier = 8, }, Giga4 = { Multiplier = 9, }, Giga5 = { Multiplier = 10, } }

	TraitData.FistDetonateTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.75, MaxMultiplier = 1.75 }, Epic = { MinMultiplier = 2.5, MaxMultiplier = 2.5 }, Heroic = { MinMultiplier = 3.25, MaxMultiplier = 3.25 }, Legendary = { MinMultiplier = 4, MaxMultiplier = 4 }, Giga1 = { MinMultiplier = 4.35, MaxMultiplier = 4.35 }, Giga2 = { MinMultiplier = 4.65, MaxMultiplier = 4.65 }, Giga3 = { MinMultiplier = 5, MaxMultiplier = 5 }, Giga4 = { MinMultiplier = 5.5, MaxMultiplier = 5.5 }, Giga5 = { MinMultiplier = 6, MaxMultiplier = 6 } }

    --pick off here with  SwordBaseUpgradeTrait--

	TraitData.SwordBaseUpgradeTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.5, MaxMultiplier = 1.5 }, Epic = { MinMultiplier = 1.75, MaxMultiplier = 1.75 }, Heroic = { MinMultiplier = 2, MaxMultiplier = 2 }, Legendary = { MinMultiplier = 2.25, MaxMultiplier = 2.25 }, Giga1 = { MinMultiplier = 2.5, MaxMultiplier = 2.5 }, Giga2 = { MinMultiplier = 2.75, MaxMultiplier = 2.75 }, Giga3 = { MinMultiplier = 3, MaxMultiplier = 3 }, Giga4 = { MinMultiplier = 3.25, MaxMultiplier = 3.25 }, Giga5 = { MinMultiplier = 3.5, MaxMultiplier = 3.5 } }
	TraitData.SwordBaseUpgradeTrait.PropertyChanges[1].BaseValue = 0.9
	TraitData.SwordBaseUpgradeTrait.PropertyChanges[2].BaseValue = 0.9
	TraitData.SwordBaseUpgradeTrait.PropertyChanges[3].BaseValue = 0.9
	TraitData.SwordBaseUpgradeTrait.PropertyChanges[4].BaseValue = 0.9
	TraitData.SwordBaseUpgradeTrait.PropertyChanges[5].BaseValue = 0.9
	TraitData.SwordBaseUpgradeTrait.PropertyChanges[6].BaseValue = 0.9
	TraitData.SwordBaseUpgradeTrait.PropertyChanges[7].BaseValue = 1.1
	TraitData.SwordBaseUpgradeTrait.ExtractEntry = { BaseValue = 0.90, SourceIsMultiplier = true, }

	TraitData.BowBaseUpgradeTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.35, MaxMultiplier = 1.35 }, Epic = { MinMultiplier = 1.65, MaxMultiplier = 1.65 }, Heroic = { MinMultiplier = 2, MaxMultiplier = 2 }, Legendary = { MinMultiplier = 2.35, MaxMultiplier = 2.35 }, Giga1 = { MinMultiplier = 2.65, MaxMultiplier = 2.65 }, Giga2 = { MinMultiplier = 3, MaxMultiplier = 3 }, Giga3 = { MinMultiplier = 3.35, MaxMultiplier = 3.35 }, Giga4 = { MinMultiplier = 3.65, MaxMultiplier = 3.65 }, Giga5 = { MinMultiplier = 4, MaxMultiplier = 4 } }
	TraitData.BowBaseUpgradeTrait.PropertyChanges[1].BaseMin = 0.05
	TraitData.BowBaseUpgradeTrait.PropertyChanges[1].BaseMax = 0.05
	TraitData.BowBaseUpgradeTrait.PropertyChanges[2] = 
	{
		LifeProperty = "DodgeChance",
		BaseValue = 0.05,
		ChangeType = "Add",
		DataValue = false,
		ExtractValue =
		{
			ExtractAs = "TooltipChance",
			Format = "Percent"
		},
	}

	TraitData.SpearBaseUpgradeTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.5, MaxMultiplier = 1.5 }, Epic = { MinMultiplier = 2, MaxMultiplier = 2 }, Heroic = { MinMultiplier = 2.5, MaxMultiplier = 2.5 }, Legendary = { MinMultiplier = 3, MaxMultiplier = 3 }, Giga1 = { MinMultiplier = 3.5, MaxMultiplier = 3.5 }, Giga2 = { MinMultiplier = 4, MaxMultiplier = 4 }, Giga3 = { MinMultiplier = 4.35, MaxMultiplier = 4.35 }, Giga4 = { MinMultiplier = 4.65, MaxMultiplier = 4.65 }, Giga5 = { MinMultiplier = 5, MaxMultiplier = 5 } }
	TraitData.SpearBaseUpgradeTrait.AddOutgoingDamageModifiers.ValidWeaponMultiplier.BaseValue = 1.05
	TraitData.SpearBaseUpgradeTrait.AddOutgoingDamageModifiers.ValidWeapons = { "SpearWeapon", "SpearWeaponTwoThree", "SpearWeaponThrowReturn", "SpearWeaponThrow" }
	TraitData.SpearBaseUpgradeTrait.PropertyChanges[1].BaseValue = 1.05
	TraitData.SpearBaseUpgradeTrait.PropertyChanges[2] = {
		WeaponNames = { "SpearWeapon", "SpearWeaponTwoThree", "SpearWeaponThrowReturn", "SpearWeaponThrow" },
		ProjectileProperty = "CriticalHitChance",
		BaseMin = 0.05,
		BaseMax = 0.05,
		ChangeType = "Add",
		ExtractValue =
		{
			ExtractAs = "TooltipCritChance",
			Format = "Percent",
		}
  	}

	TraitData.ShieldBaseUpgradeTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.35, MaxMultiplier = 1.35 }, Epic = { MinMultiplier = 1.65, MaxMultiplier = 1.65 }, Heroic = { MinMultiplier = 2, MaxMultiplier = 2 }, Legendary = { MinMultiplier = 2.35, MaxMultiplier = 2.35 }, Giga1 = { MinMultiplier = 2.65, MaxMultiplier = 2.65 }, Giga2 = { MinMultiplier = 3, MaxMultiplier = 3 }, Giga3 = { MinMultiplier = 3.35, MaxMultiplier = 3.35 }, Giga4 = { MinMultiplier = 3.65, MaxMultiplier = 3.65 }, Giga5 = { MinMultiplier = 4, MaxMultiplier = 4 } }
	TraitData.ShieldBaseUpgradeTrait.PropertyChanges[1].BaseValue = 5
	TraitData.ShieldBaseUpgradeTrait.AddIncomingDamageModifiers =
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
		}
	}

	TraitData.GunBaseUpgradeTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.35, MaxMultiplier = 1.35 }, Epic = { MinMultiplier = 1.65, MaxMultiplier = 1.65 }, Heroic = { MinMultiplier = 2, MaxMultiplier = 2 }, Legendary = { MinMultiplier = 2.35, MaxMultiplier = 2.35 }, Giga1 = { MinMultiplier = 2.65, MaxMultiplier = 2.65 }, Giga2 = { MinMultiplier = 3, MaxMultiplier = 3 }, Giga3 = { MinMultiplier = 3.35, MaxMultiplier = 3.35 }, Giga4 = { MinMultiplier = 3.65, MaxMultiplier = 3.65 }, Giga5 = { MinMultiplier = 4, MaxMultiplier = 4 } }
	TraitData.GunBaseUpgradeTrait.AddOutgoingDamageModifiers = 
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
		}
	}
	TraitData.GunBaseUpgradeTrait.PropertyChanges[1].BaseValue = 5

	TraitData.GunManualReloadTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.5, MaxMultiplier = 1.5 }, Epic = { MinMultiplier = 2.0, MaxMultiplier = 2.0 }, Heroic = { MinMultiplier = 2.5, MaxMultiplier = 2.5 }, Legendary = { MinMultiplier = 3, MaxMultiplier = 3 }, Giga1 = { MinMultiplier = 3.2, MaxMultiplier = 3.2 }, Giga2 = { MinMultiplier = 3.4, MaxMultiplier = 3.4 }, Giga3 = { MinMultiplier = 3.6, MaxMultiplier = 3.6 }, Giga4 = { MinMultiplier = 3.8, MaxMultiplier = 3.8 }, Giga5 = { MinMultiplier = 4, MaxMultiplier = 4 } }
	TraitData.GunLoadedGrenadeTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.25, MaxMultiplier = 1.25 }, Epic = { MinMultiplier = 1.5, MaxMultiplier = 1.5 }, Heroic = { MinMultiplier = 1.75, MaxMultiplier = 1.75 }, Legendary = { MinMultiplier = 2, MaxMultiplier = 2 }, Giga1 = { MinMultiplier = 2.1, MaxMultiplier = 2.1 }, Giga2 = { MinMultiplier = 2.2, MaxMultiplier = 2.2 }, Giga3 = { MinMultiplier = 2.3, MaxMultiplier = 2.3 }, Giga4 = { MinMultiplier = 2.4, MaxMultiplier = 2.4 }, Giga5 = { MinMultiplier = 2.5, MaxMultiplier = 2.5 } }
	TraitData.BowMarkHomingTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 5/6, MaxMultiplier = 5/6 }, Epic = { MinMultiplier = 4/6, MaxMultiplier = 4/6 }, Heroic = { MinMultiplier = 3/6, MaxMultiplier = 3/6 }, Legendary = { MinMultiplier = 2/6, MaxMultiplier = 2/6 }, Giga1 = { MinMultiplier = 1/6, MaxMultiplier = 1/6 }, Giga2 = { MinMultiplier = 1/6, MaxMultiplier = 1/6 }, Giga3 = { MinMultiplier = 0/6, MaxMultiplier = 0/6 }, Giga4 = { MinMultiplier = -1/6, MaxMultiplier = -1/6 }, Giga5 = { MinMultiplier = -2/6, MaxMultiplier = -2/6 } }
	TraitData.BowMarkHomingTrait.PropertyChanges[2].BaseValue = -6
	TraitData.BowMarkHomingTrait.ExtractProjectiles = 
	{ 
		CustomRarityMultiplier =
		{
			Common =
			{
				MinMultiplier = 1.00,
				MaxMultiplier = 1.00,
			},
			Rare =
			{
				MinMultiplier = 1.35,
				MaxMultiplier = 1.35,
			},
			Epic =
			{
				MinMultiplier = 1.65,
				MaxMultiplier = 1.65,
			},
			Heroic =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Legendary =
			{
				MinMultiplier = 2,
				MaxMultiplier = 2,
			},
			Giga1 = 
			{
				MinMultiplier = 2.35,
				MaxMultiplier = 2.35,
			},
			Giga2 = 
			{
				MinMultiplier = 2.65,
				MaxMultiplier = 2.65,
			},
			Giga3 = 
			{
				MinMultiplier = 3,
				MaxMultiplier = 3,
			},
			Giga4 = 
			{
				MinMultiplier = 3.35,
				MaxMultiplier = 3.35,
			},
			Giga5 = 
			{
				MinMultiplier = 3.65,
				MaxMultiplier = 3.65,
			},
		},
		BaseValue = 3 
	}

	TraitData.BowLoadAmmoTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.66, MaxMultiplier = 1.66 }, Epic = { MinMultiplier = 2.33, MaxMultiplier = 2.33 }, Heroic = { MinMultiplier = 2.66, MaxMultiplier = 2.66 }, Legendary = { MinMultiplier = 3.66, MaxMultiplier = 3.66 }, Giga1 = { MinMultiplier = 4, MaxMultiplier = 4 }, Giga2 = { MinMultiplier = 4.25, MaxMultiplier = 4.25 }, Giga3 = { MinMultiplier = 4.5, MaxMultiplier = 4.5 }, Giga4 = { MinMultiplier = 4.75, MaxMultiplier = 4.75 }, Giga5 = { MinMultiplier = 5, MaxMultiplier = 5 } }
	TraitData.BowBondTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.25, MaxMultiplier = 1.25 }, Epic = { MinMultiplier = 1.5, MaxMultiplier = 1.5 }, Heroic = { MinMultiplier = 1.75, MaxMultiplier = 1.75 }, Legendary = { MinMultiplier = 2, MaxMultiplier = 2 }, Giga1 = { MinMultiplier = 2.2, MaxMultiplier = 2.2 }, Giga2 = { MinMultiplier = 2.4, MaxMultiplier = 2.4 }, Giga3 = { MinMultiplier = 2.6, MaxMultiplier = 2.6 }, Giga4 = { MinMultiplier = 2.8, MaxMultiplier = 2.8 }, Giga5 = { MinMultiplier = 3, MaxMultiplier = 3 } }
	TraitData.SpearWeaveTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 2, MaxMultiplier = 2 }, Epic = { MinMultiplier = 3, MaxMultiplier = 3 }, Heroic = { MinMultiplier = 4, MaxMultiplier = 4 }, Legendary = { MinMultiplier = 5, MaxMultiplier = 5 }, Giga1 = { MinMultiplier = 5.65, MaxMultiplier = 5.65 }, Giga2 = { MinMultiplier = 6.35, MaxMultiplier = 6.35 }, Giga3 = { MinMultiplier = 7, MaxMultiplier = 7 }, Giga4 = { MinMultiplier = 7.65, MaxMultiplier = 7.65 }, Giga5 = { MinMultiplier = 8, MaxMultiplier = 8 } }
	TraitData.SpearTeleportTrait.RarityLevels = { Common = { MinMultiplier = 1, MaxMultiplier = 1 }, Rare = { MinMultiplier = 1.5, MaxMultiplier = 1.5 }, Epic = { MinMultiplier = 2.0, MaxMultiplier = 2.0 }, Heroic = { MinMultiplier = 2.5, MaxMultiplier = 2.5 }, Legendary = { MinMultiplier = 3, MaxMultiplier = 3 }, Giga1 = { MinMultiplier = 3.2, MaxMultiplier = 3.2 }, Giga2 = { MinMultiplier = 3.4, MaxMultiplier = 3.4 }, Giga3 = { MinMultiplier = 3.6, MaxMultiplier = 3.6 }, Giga4 = { MinMultiplier = 3.8, MaxMultiplier = 3.8 }, Giga5 = { MinMultiplier = 4, MaxMultiplier = 4 } }


	--Weapon Upgrade Max level and Standard Costs--
	for k,v in pairs(WeaponUpgradeData) do
		if k ~= "DefaultGameStateRequirement" then
			for k,v in pairs(v) do
				v.Costs = { 0, 1, 1, 2, 2, 3, 3, 4, 4, 5 }
				v.MaxUpgradeLevel = 10
			end
		end
	end

end)

--Replaced Helper Functions--
ModUtil.WrapBaseFunction( "GetKeepsakeProgress", function( base, traitName )
	local currentLevel = GetKeepsakeLevel( traitName )
	if not GameState.KeepsakeChambers[traitName] or not TraitData[traitName].ChamberThresholds then
		return 0
	end

	if IsKeepsakeMaxed( traitName ) then
		return 1
	end
	local lastThreshold = 0
	if currentLevel > 1 then
		lastThreshold = TraitData[traitName].ChamberThresholds[currentLevel - 1]
	end
	if currentLevel > 2 then
		lastThreshold = (lastThreshold + TraitData[traitName].ChamberThresholds[currentLevel - 2])
	end
	if currentLevel > 3 then
		lastThreshold = (lastThreshold + TraitData[traitName].ChamberThresholds[currentLevel - 3])
	end
	return (GameState.KeepsakeChambers[traitName] - lastThreshold) / TraitData[traitName].ChamberThresholds[currentLevel]
end, ElectroTweaks )

ModUtil.WrapBaseFunction( "GetKeepsakeChambersToNextLevel", function( base, traitName )
	if IsKeepsakeMaxed( traitName ) then
		return 0
	end

	local currentLevel = GetKeepsakeLevel( traitName )
	local currentChambers = GameState.KeepsakeChambers[traitName] or 0
	local lastThreshold = 0
	if currentLevel > 1 then
		lastThreshold = TraitData[traitName].ChamberThresholds[currentLevel - 1]
	end
	if currentLevel > 2 then
		lastThreshold = (lastThreshold + TraitData[traitName].ChamberThresholds[currentLevel - 2])
	end
	if currentLevel > 3 then
		lastThreshold = (lastThreshold + TraitData[traitName].ChamberThresholds[currentLevel - 3])
	end
	return TraitData[traitName].ChamberThresholds[currentLevel] - ( currentChambers - lastThreshold ) 
end, ElectroTweaks )

ModUtil.WrapBaseFunction( "GetRarityKey", function( base, index )
	local rarityOrdering = {"Common", "Rare", "Epic", "Heroic", "Legendary", "Giga1", "Giga2", "Giga3", "Giga4", "Giga5" }
	return rarityOrdering[index]
end, ElectroTweaks )

ModUtil.WrapBaseFunction( "IsWeaponUpgradeMaxed", function( base, weaponName, index )
	if IsBuyWeaponUpgradeDisabled( weaponName, index ) then
		return false
	end
	if not GameState.WeaponUnlocks then
		return false
	end
	if not GameState.WeaponUnlocks[weaponName] then
		return false
	end
	if GameState.WeaponUnlocks[weaponName][index] ~= 10 then
		return false
	end

	return true
end, ElectroTweaks )