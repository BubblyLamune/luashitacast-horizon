local profile = {}

local fastCastValue = 0.00 -- 0% from gear listed in Precast set

local max_hp_in_idle_with_regen_gear_equipped = 0 -- You could set this to 0 if you do not wish to ever use regen gear

local sets = {
    ['Idle'] = {
        Main = 'Byakko\'s Axe',
        Ammo = 'Bomb Core',
        Head = 'Panther Mask',
        Neck = 'Ryl.Grd. Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Coral Earring',
        Body = 'Haubergeon',
        Hands = 'Warrior\'s Mufflers',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle +1',
        Waist = 'Swift Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Warrior\'s Calligae',
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

    TP_LowAcc = {
        Hands = 'Dusk Gloves',
    },
    TP_Aftermath = {},
    TP_Mjollnir_Haste = {},
    TP_HighAcc = {
        Head = 'Optical Hat',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
    },
    TP_Aggressor = {},

    WS = {
        Head = 'Emperor Hairpin',
        Ring1 = 'Sun Ring',
        Ring2 = 'Sun Ring',
        Feet = 'Leaping Boots',
    },
    WS_HighAcc = {},

    Warcry = {},
    Provoke = {},

    DW = {
        Ear1 = 'Stealth Earring',
    },
    SAM = {
        Ear1 = 'Attila\'s Earring',
    },

    Weapon_Loadout_1 = {},
    Weapon_Loadout_2 = {},
    Weapon_Loadout_3 = {},
    ['thirty'] = {
        Main = 'Centurion\'s Axe',
        Range = 'Power Crossbow',
        Ammo = 'Crossbow Bolt',
        Head = 'Emperor Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Ctr. Scale Mail',
        Hands = 'Savage Gauntlets',
        Ring1 = 'Courage Ring',
        Ring2 = 'Balance Ring',
        Back = 'Nomad\'s Mantle',
        Waist = 'Brave Belt',
        Legs = 'Republic Subligar',
        Feet = 'Leaping Boots',
    },
}

profile.SetMacroBook = function()
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    -- AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 down /ja "Provoke" <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 down /ra <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 down /ma "Utsusemi: Ichi" <me>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 down /ja "Trick Attack" <me>')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.Sets = gcmelee.AppendSets(sets)

profile.HandleAbility = function()
    gcmelee.DoAbility()

    local action = gData.GetAction()
    if (action.Name == 'Warcry') then
        gFunc.EquipSet(sets.Warcry)
    elseif (action.Name == 'Provoke') then
        gFunc.EquipSet(sets.Provoke)
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
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'dw'})
    gcdisplay.CreateToggle('DW', false)
    gcmelee.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'dw'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'dw') then
        gcdisplay.AdvanceToggle('DW')
        gcinclude.Message('DW', gcdisplay.GetToggle('DW'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault(max_hp_in_idle_with_regen_gear_equipped)

    local aggressor = gData.GetBuffCount('Aggressor')
    if (aggressor == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Aggressor)
    end

    local player = gData.GetPlayer()
    if (player.SubJob == 'SAM') then
        gFunc.EquipSet(sets.SAM)
    end
    if (gcdisplay.GetToggle('DW') and player.Status == 'Engaged') then
        gFunc.EquipSet(sets.DW)
    end

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
