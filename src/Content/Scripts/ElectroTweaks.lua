-- Electro's Tweaks
--
-- Loaded by the one line added to the end of RoomManager.lua, after every game data table and
-- script has been imported. Each option in ElectroTweaksConfig.lua has its own file in
-- ElectroTweaks/, named after the option. This file holds the shared helpers, turns options on,
-- and on every save load undoes the save-file changes of options that are off.
-- With every option off nothing in the game's data changes.

Import "ElectroTweaksConfig.lua"

ElectroTweaks = ElectroTweaks or {}
local ET = ElectroTweaks
ET.Config = ElectroTweaksConfig or {}
ET.Options = {}

ET.RarityOrder = { "Common", "Rare", "Epic", "Heroic", "Legendary", "Giga1", "Giga2", "Giga3", "Giga4", "Giga5" }

-- Text Ids swapped for this mod's versions (see the text remap section below)
ET.TextRemap = {}
ET.EnglishTextRemap = {}

-- Helpers --

local function DeepEquals( a, b )
	if a == b then
		return true
	end
	if type(a) ~= "table" or type(b) ~= "table" then
		return false
	end
	for key, value in pairs( a ) do
		if not DeepEquals( value, b[key] ) then
			return false
		end
	end
	for key in pairs( b ) do
		if a[key] == nil then
			return false
		end
	end
	return true
end

function ET.InheritsFrom( dataStore, name, ancestorName, visited )
	local data = dataStore[name]
	if data == nil or data.InheritFrom == nil then
		return false
	end
	visited = visited or {}
	if visited[name] then
		return false
	end
	visited[name] = true
	for _, parentName in ipairs( data.InheritFrom ) do
		if parentName == ancestorName or ET.InheritsFrom( dataStore, parentName, ancestorName, visited ) then
			return true
		end
	end
	return false
end

-- Inheritance was resolved when the game loaded its data (SetupRunData), so heirs hold their own
-- copy of each inherited value. Changing the parent alone would not reach them; this changes the
-- parent and every heir whose value still matches what it inherited.
function ET.SetInherited( dataStore, name, key, value )
	local oldValue = dataStore[name][key]
	for heirName, heir in pairs( dataStore ) do
		if heirName ~= name and ET.InheritsFrom( dataStore, heirName, name ) and DeepEquals( heir[key], oldValue ) then
			heir[key] = DeepCopyTable( value )
		end
	end
	dataStore[name][key] = value
end

-- Builds a RarityLevels table from multipliers listed in ET.RarityOrder order
function ET.RangeTiers( ... )
	local tiers = {}
	for i, multiplier in ipairs( { ... } ) do
		tiers[ET.RarityOrder[i]] = { MinMultiplier = multiplier, MaxMultiplier = multiplier }
	end
	return tiers
end

function ET.FlatTiers( ... )
	local tiers = {}
	for i, multiplier in ipairs( { ... } ) do
		tiers[ET.RarityOrder[i]] = { Multiplier = multiplier }
	end
	return tiers
end

-- Adds tiers after the existing ones, starting at rarity number firstIndex
function ET.AddRangeTiers( traitName, firstIndex, ... )
	local tiers = TraitData[traitName].RarityLevels
	for i, multiplier in ipairs( { ... } ) do
		tiers[ET.RarityOrder[firstIndex + i - 1]] = { MinMultiplier = multiplier, MaxMultiplier = multiplier }
	end
end

function ET.AddFlatTiers( traitName, firstIndex, ... )
	local tiers = TraitData[traitName].RarityLevels
	for i, multiplier in ipairs( { ... } ) do
		tiers[ET.RarityOrder[firstIndex + i - 1]] = { Multiplier = multiplier }
	end
end

function ET.AddResource( name, amount )
	GameState.Resources = GameState.Resources or {}
	GameState.Resources[name] = (GameState.Resources[name] or 0) + amount
end

local function GetRarityIndex( rarity )
	for i, name in ipairs( ET.RarityOrder ) do
		if name == rarity then
			return i
		end
	end
end

-- Options --
-- Applied in this order: GodKeepsakeRarity must come after KeepsakeLevels, which gives every
-- keepsake five ranks first.

Import "ElectroTweaks/AspectLevels.lua"
Import "ElectroTweaks/ZagreusAspects.lua"
Import "ElectroTweaks/KeepsakeLevels.lua"
Import "ElectroTweaks/GodKeepsakeRarity.lua"
Import "ElectroTweaks/MirrorTalents.lua"

ET.OptionOrder = { "AspectLevels", "ZagreusAspects", "KeepsakeLevels", "GodKeepsakeRarity", "MirrorTalents" }

-- Undoing save changes of options that are off --

-- A run saved mid-escape keeps its traits; give any trait whose rarity this mod added and is now
-- missing the highest rarity that still exists, so its tooltip and re-equip still work.
function ET.SanitizeRunTraits()
	if not CurrentRun or not CurrentRun.Hero or not CurrentRun.Hero.Traits then
		return
	end
	for _, trait in pairs( CurrentRun.Hero.Traits ) do
		local data = trait.Name and TraitData[trait.Name]
		local index = GetRarityIndex( trait.Rarity )
		local addedByMod = index ~= nil and (index > 5 or (index > 3 and ET.InheritsFrom( TraitData, trait.Name, "GiftTrait" )))
		if addedByMod and data and data.RarityLevels and not data.RarityLevels[trait.Rarity] then
			for i = index - 1, 1, -1 do
				if data.RarityLevels[ET.RarityOrder[i]] then
					trait.Rarity = ET.RarityOrder[i]
					break
				end
			end
		end
	end
end

function ET.RevertSave()
	if GameState == nil then
		return
	end
	for _, name in ipairs( ET.OptionOrder ) do
		local option = ET.Options[name]
		if option.Revert and not ET.Config[name] then
			option.Revert()
		end
	end
	ET.SanitizeRunTraits()
end

-- The game saves every global not in SaveIgnores, and cannot save functions (ElectroTweaks holds
-- them). Keeping the config out of the save also stops a save from overriding the config file.
function ET.IgnoreInSave()
	if SaveIgnores ~= nil then
		SaveIgnores.ElectroTweaks = true
		SaveIgnores.ElectroTweaksConfig = true
	end
end
ET.IgnoreInSave()

-- Runs on every save load, before the game's own save fixups
local baseDoPatches = DoPatches
function DoPatches( ... )
	-- Again here in case Main.lua (which defines SaveIgnores) loads after this file
	ET.IgnoreInSave()
	ET.RevertSave()
	return baseDoPatches( ... )
end

-- Text remap --
-- Text boxes look text up by Id. Instead of replacing the game's text, this mod adds its own
-- entries (ET_...) to HelpText.en.sjson and points the game at them only while an option is on.
-- Those entries are English only, so other languages keep the game's text.

local function RemapTextArgs( args )
	if type(args) ~= "table" or args.Text == nil then
		return args
	end
	local remapped = ET.TextRemap[args.Text]
	if remapped == nil and ET.EnglishTextRemap[args.Text] and GetLanguage({}) == "en" then
		remapped = ET.EnglishTextRemap[args.Text]
	end
	if remapped == nil then
		return args
	end
	-- Copy, as some callers pass tables that live in game data
	local copy = {}
	for key, value in pairs( args ) do
		copy[key] = value
	end
	copy.Text = remapped
	return copy
end

function ET.InstallTextRemap()
	if next( ET.TextRemap ) == nil and next( ET.EnglishTextRemap ) == nil then
		return
	end
	for _, functionName in ipairs( { "CreateTextBox", "ModifyTextBox", "GetDisplayName", "HasDisplayName" } ) do
		local baseFunction = _G[functionName]
		_G[functionName] = function( args, ... )
			return baseFunction( RemapTextArgs( args ), ... )
		end
	end
end

-- Apply --

local traitDataChanged = false
for _, name in ipairs( ET.OptionOrder ) do
	if ET.Config[name] then
		ET.Options[name].Apply()
		traitDataChanged = traitDataChanged or ET.Options[name].ChangesTraitData
	end
end
ET.InstallTextRemap()

-- Re-run the game's trait setup so new and changed values get the same processing as the originals
-- (linked weapons, percentage formatting). The game itself runs this at the start of every run.
if traitDataChanged then
	SetupRunData()
end
