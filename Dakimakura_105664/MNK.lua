local profile = {}

local max_hp_in_idle_with_regen_gear_equipped = 1632
local fastCastValue = 0.02 -- 2% from gear

-- Replace these with '' if you do not have them
local temple_gaiters = 'Temple Gaiters'
local temple_gloves = 'Temple Gloves'
local temple_cyclas = 'Temple Cyclas'
local temple_crown = 'Temple Crown'

local melee_gaiters = ''
local melee_gloves = ''

local muscle_belt = 'Muscle Belt +1'
local garden_bangles = 'Garden Bangles'
local presidential_hairpin = false
local dream_ribbon = false

local kampfer_ring = false
local kampfer_ring_slot = 'Ring2'
local kampfer_earring = false
local kampfer_earring_slot = 'Ear2'

local sets = {
    ['Idle'] = {
        Main = 'T.M. Hooks +1',
        Head = 'Emperor Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Coral Earring',
        Ear2 = 'Coral Earring',
        Body = 'Scorpion Harness',
        Hands = 'Temple Gloves',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Amemet Mantle',
        Waist = 'Brown Belt',
        Legs = 'Republic Subligar',
        Feet = 'Kung Fu Shoes',
    },
    IdleALT = {
        Main = 'Destroyers',
        Ammo = 'Tiphia Sting',
        Head = 'Dream Ribbon',
        Neck = 'Jeweled Collar',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Wyvern Earring',
        Body = 'Kirin\'s Osode',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Begrudging Ring',
        Back = 'Shadow Mantle',
        Waist = 'Brown Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Herald\'s Gaiters',
    },
    Resting = {
        Neck = 'Paisley Scarf',
        Ear2 = 'Sanative Earring',
        Body = 'Mel. Cyclas +1',
        Hands = 'Dst. Mittens +1',
        Back = 'Melee Cape',
        Feet = 'Dst. Leggings +1',
    },
    Town = {

    },
    Movement = {
        Feet = 'Herald\'s Gaiters',
    },

    --[[
    8% Base
    5% Merits
    45% Counterstance
    5% Melee Gaiters
    ]]
    DT = {
        Main = 'T.M. Hooks +1', -- 5
        Ammo = 'Fenrir\'s Stone',
        Head = 'Optical Hat',
        -- Head = 'Arh. Jinpachi +1',
        Neck = 'Faith Torque',
        -- Neck = 'Evasion Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        -- Ear1 = 'Avenger\'s Earring', -- 1
        -- Ear2 = 'Avenger\'s Earring', -- 1
        Body = 'Kirin\'s Osode',
        -- Body = 'Arhat\'s Gi +1',
        -- Hands = 'Rasetsu Tekko +1', -- 1
        -- Hands = 'Noritsune Kote',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Shadow Mantle',
        Waist = 'Brown Belt',
        Legs = 'Tpl. Hose +1', -- 3
        Feet = 'Rst. Sune-Ate +1', -- 1
    },
    MDT = { -- Shell IV provides 23% MDT
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring',
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = { -- Currently using this as an override for BV2 Zergs
        Head = 'Shr.Znr.Kabuto',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Shura Togi',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Brown Belt',
        Legs = 'Shura Haidate',
        Feet = 'Dune Boots',
    },

    Precast = {
        Ear1 = 'Loquac. Earring',
    },
    SIRD = { -- Combination of PDT and SIRD Gear equipped while casting Utsusemi
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Dst. Harness +1',
        Hands = 'Dst. Mittens +1',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Shadow Mantle',
        Waist = 'Silver Obi +1', -- 8
        Legs = 'Dst. Subligar +1',
        Feet = 'Mountain Gaiters', -- 5
    },
    Haste = { -- Used for Utsusemi cooldown
        Head = 'Panther mask +1',
        Waist = 'Brown Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Fuma Sune-Ate',
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    ['TP_LowAcc'] = {
        Main = 'T.M. Hooks +1',
        Ammo = '',
        Head = 'Emperor Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Coral Earring',
        Ear2 = 'Coral Earring',
        Body = 'Scorpion Harness',
        Hands = 'Temple Gloves',
        Ring1 = 'Sun Ring',
        Ring2 = 'Sun Ring',
        Back = 'Amemet Mantle',
        Waist = 'Brown Belt',
        Legs = 'Republic Subligar',
        Feet = 'Kung fu shoes',
    },
    TP_HighAcc = {
        Head = 'Shr.Znr.Kabuto',
        Neck = 'Faith Torque',
        Ear1 = 'Brutal Earring',
        Ear2 = 'Merman\'s Earring',
        Body = 'Shura Togi',
        Hands = 'Mel. Gloves +1',
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = 'Forager\'s Mantle',
        Waist = 'Brown Belt',
        Legs = 'Byakko\'s Haidate',
        Feet = 'Kung fu shoes',
    },
    TP_Mjollnir_Haste = {},

    TP_Focus = {
        Ring1 = 'Flame Ring',
        Ring2 = 'Triumph Ring',
    },

    SJ_DRG = {
        Ear2 = 'Wyvern Earring',
        Feet = 'Dune Boots',
    },
    SJ_THF = {
        Ear2 = 'Pilferer\'s Earring',
    },

    WS = {
    },
    WS_HighAcc = {
    },

    WS_AsuranFists = {
    },
    WS_DragonKick = {
    },
    WS_HowlingFist = {
    },

    Jump = {
    },
    Chakra = {
    },

    ChiBlast = {
    },

    HundredFists = {
    },
    ['eco'] = {
        Main = 'Lgn. Knuckles',
        Head = 'Mrc.Cpt. Headgear',
        Neck = 'Spike Necklace',
        Ear1 = 'Beetle Earring +1',
        Ear2 = 'Beetle Earring +1',
        Body = 'Bone Harness +1',
        Hands = 'Bone Mittens +1',
        Ring1 = 'Balance Ring',
        Ring2 = 'Courage Ring',
        Back = 'Nomad\'s Mantle',
        Waist = 'Brown Belt',
        Legs = 'Bone Subligar +1',
        Feet = 'Bone Leggings +1',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind ` down /ja "Focus" <me>;/wait 0.7;/ja "Dodge" <me>;/wait 0.7;/ja "Berserk" <me>;')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 down /ja "Boost" <me>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 down /ws "Howling Fist" <t>')
	--AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 down /ws "Dragon Kick" <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 down /ja "Trick Attack" <me>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 down /ja "Sneak Attack" <me>') 
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 down /ja "Bully" <t>')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 0 down /ja "Hide" <me>')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()

    if string.match(action.Name, 'Jump') then
        gFunc.EquipSet(sets.Jump)
    elseif (action.Name == 'Chi Blast') then
        gFunc.EquipSet(sets.ChiBlast)
    elseif (action.Name == 'Chakra') then
        gFunc.EquipSet(sets.Chakra)
        if (temple_cyclas ~= '') then
            gFunc.Equip('Body', temple_cyclas)
        end
        if (melee_gloves ~= '') then
            gFunc.Equip('Hands', melee_gloves)
        end
    elseif (action.Name == 'Dodge') then
        if (temple_gaiters ~= '') then
            gFunc.Equip('Feet', temple_gaiters)
        end
    elseif (action.Name == 'Boost') then
        if (temple_gloves ~= '') then
            gFunc.Equip('Hands', temple_gloves)
        end
    elseif (action.Name == 'Focus') then
        if (temple_crown ~= '') then
            gFunc.Equip('Head', temple_crown)
        end
    elseif (action.Name == 'Counterstance') then
        if (melee_gaiters ~= '') then
            gFunc.Equip('Feet', melee_gaiters)
        end
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
    local player = gData.GetPlayer()

    if (action.Name == 'Asuran Fists') then
        gFunc.EquipSet(sets.WS_AsuranFists)
    elseif (action.Name == 'Dragon Kick') then
        gFunc.EquipSet(sets.WS_DragonKick)
    elseif (action.Name == 'Howling Fist') then
        gFunc.EquipSet(sets.WS_HowlingFist)
    end

    if (player.SubJob == 'THF') then
        gFunc.EquipSet(sets.SJ_THF)
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
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    local focus = gData.GetBuffCount('Focus')
    local hundredFists = gData.GetBuffCount('Hundred Fists')

    if (hundredFists == 1) then
        gFunc.EquipSet(sets.HundredFists)
    end

    if (focus == 1 and gcdisplay.IdleSet == 'LowAcc') then
        gFunc.EquipSet(sets.TP_Focus)
    end

    if (player.Status == 'Engaged') then
        if (player.SubJob == 'DRG') then
            gFunc.EquipSet(sets.SJ_DRG)
        elseif (player.SubJob == 'THF') then
            gFunc.EquipSet(sets.SJ_THF)
        end
    end

    if (player.Status == 'Idle') then
        if (player.HPP < 50 and muscle_belt ~= '') then
            gFunc.Equip('Waist', muscle_belt)
        end
        if (player.HP < max_hp_in_idle_with_regen_gear_equipped) then
            local environment = gData.GetEnvironment()

            if (garden_bangles ~= '' and environment.Time >= 6 and environment.Time < 18) then
                gFunc.Equip('hands', garden_bangles)
            end
            if (presidential_hairpin and conquest:GetOutsideControl()) then
                gFunc.Equip('Head', 'President. Hairpin')
            end
            if (dream_ribbon) then
                gFunc.Equip('Head', 'Dream Ribbon')
            end
        end
    end

    gcmelee.DoDefaultOverride()

    if (gcdisplay.IdleSet == 'DT') then
        if (player.HPP <= 75 and player.TP <= 1000) then
            if (kampfer_ring) then
                gFunc.Equip(kampfer_ring_slot, 'Kampfer Ring')
            end
        end
        if (player.HPP <= 25 and player.TP <= 1000) then
            if (kampfer_earring) then
                gFunc.Equip(kampfer_earring_slot, 'Kampfer Earring')
            end
        end
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)
end

return profile
