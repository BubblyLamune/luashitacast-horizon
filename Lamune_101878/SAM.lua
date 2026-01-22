local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

-- Comment out the equipment within these sets if you do not have them or do not wish to use them
local myochin_kabuto = {
    Head = 'Myochin Kabuto',
}
local saotome_kote = {
    Hands = 'Saotome Kote',
}

local sets = {
    Idle = {
        Main = 'Ashura +1',
        Range = 'Composite Bow +1',
        Ammo = 'Horn Arrow',
        Head = 'Emperor Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Custom Vest',
        Hands = 'Custom F Gloves',
        Ring1 = 'Balance Ring',
        Ring2 = 'Balance Ring',
        Back = 'Nomad\'s Mantle',
        Waist = 'Wyvern Belt',
        Legs = 'Republic Subligar',
        Feet = 'Leaping Boots',
    },
    IdleALT = {},
    Resting = {},
    Town = {},
    Movement = {},

    DT = {},
    MDT = {},
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = { -- Only used for Idle sets and not while Override sets are active
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {},

    WS = {},
    WS_HighAcc = {},

    WS_Kaiten = {},

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
}

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 down /ws "Tachi:Enpi" <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 down /ra <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 down /ja "Jump" <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 down /ja "Meditate" <me>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 down /ja "Third Eye" <me>')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 down /ja "Hasso" <me>')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

sets.myochin_kabuto = myochin_kabuto
sets.saotome_kote = saotome_kote
profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Meditate') then
        gFunc.EquipSet('myochin_kabuto')
        gFunc.EquipSet('saotome_kote')
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
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Tachi: Kaiten') then
        gFunc.EquipSet(sets.WS_Kaiten)
    end
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
end

profile.HandleCommand = function(args)
    gcmelee.DoCommands(args)

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)
    gcmelee.DoDefaultOverride()
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
