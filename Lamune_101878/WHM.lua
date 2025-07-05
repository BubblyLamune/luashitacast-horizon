local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set. Note: Do NOT include cure clogs / ruckes rung here.

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local virology_ring = false
local virology_ring_slot = 'Ring2'

local displayheadOnAbility = true

local sets = {
	Idle = {
		Main = "Earth Staff",
		Hands = "Blessed Mitts",
		Head = "Healer\'s Cap",
		Body = "Noble's tunic",
		Legs = "Blessed Trousers",
		Feet = "Errant Pigaches",
		Neck = "Ajari Necklace",
		Waist = "Hierarch Belt",
		Ear1 = "Geist Earring",
		Ear2 = "Geist Earring",
		Ring1 = "Ether Ring",
		Ring2 = "Electrum Ring",
		Back = "White Cape"
	},
	IdleALT = {
		Main = "Purgatory Mace",
		Sub = "Numinous shield",
		Hands = "Blessed Mitts",
		Head = "Healer\'s Cap",
		Body = "Noble's tunic",
		Legs = "Blessed Trousers",
		Feet = "Errant Pigaches",
		Neck = "Ajari Necklace",
		Waist = "Hierarch Belt",
		Ear1 = "Geist Earring",
		Ear2 = "Geist Earring",
		Ring1 = "Ether Ring",
		Ring2 = "Electrum Ring",
		Back = "White Cape"
	},
	IdleMaxMP = {},
	Resting = {
		Main = "Dark Staff",
		Sub = "",
		Body = "Errant Hpl.",
		-- Body = "Noble's tunic",
		-- Body = "Seer's tunic",
		Legs = "Baron's Slops"
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
	Cure = {
		Main = "Light Staff"
	},
	Cure5 = {
		Main = "Light Staff"
	},
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
	Divine = {	
		Main = "Water Staff",
		Hands = "Devotee\'s Mitts",
		Feet = "Seer\'s pumps",
	},
	Banish = {},
	Dark = {},
	Nuke = {

	},
	NukeACC = {},
	NukeDOT = {},
	LockSet1 = {},
	LockSet2 = {},
	LockSet3 = {},
	TP = {
		Main = "Purgatory Mace",
		Sub = "Numinous shield",
	},
	TP_NIN = {},
	WS = {}
,
    ['tav'] = {
        Main = 'Solid Wand',
        Sub = 'Light Buckler',
        Ammo = 'Fortune Egg',
        Head = 'Seer\'s Crown',
        Neck = 'Justice Badge',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Seer\'s Tunic',
        Hands = 'Devotee\'s Mitts',
        Ring1 = 'Ether Ring',
        Ring2 = 'Electrum Ring',
        Back = 'White Cape',
        Waist = 'Mrc.Cpt. Belt',
        Legs = 'Custom Pants',
        Feet = 'Custom F Boots',
    }};
profile.Sets = sets

profile.SetMacroBook = function()
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro book 1");
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro set 1");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 1 down /ma \"Cure II\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 2 down /ma \"Cure III\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 3 down /ma \"Cure IV\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 4 down /ma \"Regen\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 5 down /ma \"Haste\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 6 down /ma \"Regen II\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 7 down /ma \"Dia II\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 8 down /ma \"Paralyze\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 9 down /ma \"Slow\" <t>");
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    if (displayheadOnAbility) then
        AshitaCore:GetChatManager():QueueCommand(-1, '/displayhead')
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
end

profile.HandleMidshot = function()
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)
    if (gcdisplay.GetCycle('TP') == 'HighAcc') then
        gFunc.EquipSet('WS_HighAcc')
    end

    local action = gData.GetAction()
    if (action.Name == 'Randgrith') then
        gFunc.EquipSet(sets.WS_Randgrith)
    end

    gcmage.DoFenrirsEarring()
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
    gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Skill == 'Enhancing Magic') then
        if (string.match(action.Name, 'Regen')) then
            gFunc.EquipSet('Regen')
        elseif (string.match(action.Name, 'Bar')) then
            gFunc.EquipSet('Barspell')
        end
    elseif (string.match(action.Name, 'Banish')) then
        gFunc.EquipSet('Banish')
    elseif virology_ring and (string.match(action.Name, '.*na$') or (action.Name == 'Erase')) then
        gFunc.Equip(virology_ring_slot, 'Virology Ring')
    end
end

return profile
