local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local sets = {
	Idle = {
		Body = "Seer\'s Tunic",
		Hands = "Devotee's Mitts",
		Legs = "Custom Pants",
		Head = "Seer\'s Crown",
		Feet = "Seer\'s Pumps",
		Neck = "Justic Badge",
		Waist = "Force Belt",
		Ear1 = "Magician\'s Earring",
		Ear2 = "Opal Earring",
		Ring1 = "Ether Ring",
		Ring2 = "Electrum Ring",
		Back = "White Cape"
	},
	IdleALT = {},
	IdleMaxMP = {
	},
	Resting = {
    },
	Town = {},
	Movement = {},
	DT = {},
	DTNight = {},
	MDT = {},
	FireRes = {},
	IceRes = {},
	LightningRes = {},
	EarthRes = {},
	WindRes = {},
	WaterRes = {},
	Evasion = {},
	Precast = {},
	Casting = {},
	SIRD = {},
	Haste = {},
	ConserveMP = {},
	Cure = {},
	Cure5 = {},
	Regen = {
		Body = "Cleric\'s Bliaut"
	},
	Cursna = {},
	Enhancing = {},
	Stoneskin = {},
	Spikes = {},
	Enfeebling = {},
	EnfeeblingMND = {},
	EnfeeblingINT = {},
	EnfeeblingACC = {},
	Divine = {},
	Banish = {},
	Dark = {},
	Nuke = {},
	NukeACC = {},
	NukeDOT = {},
	LockSet1 = {},
	LockSet2 = {},
	LockSet3 = {},
	TP = {},
	TP_NIN = {},
	WS = {}
};
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    -- You may add logic here
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    -- You may add logic here
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
end

profile.OnLoad = function()
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
end

profile.HandleCommand = function(args)
    gcmage.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP)

    local action = gData.GetAction()
    if (string.match(action.Name, 'Regen')) then
        gFunc.EquipSet('Regen')
    end
    if (string.match(action.Name, 'Banish')) then
        gFunc.EquipSet('Banish')
    end
end

return profile
