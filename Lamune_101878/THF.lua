local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local ta_rogue_armlets = false
local player = gData.GetPlayer()

local sets = {
    Idle = {		
    Main = "Corsair\'s knife",
    Sub = "Hornetneedle",
    Body = "Scorpion Harness",
    Hands = "Custom F gloves",
    Legs = "Republic Subligar",
    Head = "Emperor Hairpin",
    Feet = "Leaping Boots",
    Neck = "Spike necklace",
    Waist = "Life belt",
    Ear1 = "Drone earring",
    Ear2 = "Drone earring",
    Ring1 = "Balance ring",
    Ring2 = "Balance ring",
    Back = "Nomad\'s mantle"
    },
    IdleALT = {
        Main = "Bone knife +1",
        Sub = "Light Buckler",
        Body = "Brigandine",
        Hands = "Custom F gloves",
        Legs = "Rogue's Culottes",
        Head = "Rogue's Bonnet",
        Feet = "Leaping Boots",
        Neck = "Spike necklace",
        Waist = "Life belt",
        Ear1 = "Drone earring",
        Ear2 = "Drone earring",
        Ring1 = "Balance ring",
        Ring2 = "Balance ring",
        Back = "Nomad\'s mantle"
    },
    Resting = {
       -- Main = "Dark Staff",
        -- Sub = ""
    },
    Town = {},
    Movement = {},
    DT = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {},
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast = {},
    SIRD = { -- 102% to Cap
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_HighAcc = {},
    TP_NIN = {},

    WS = {},
    WS_Evisceration = {},
    WS_SharkBite = {},

    SA = {
        Body = "Brigandine",
    },
    TA = {
        Body = "Brigandine",
    },
    SATA = {
        Body = "Brigandine",

    },

    Flee = {},
    Hide = {},
    Steal = {
        Legs = "Rogue's Culottes",
        Head = "Rogue's Bonnet",
        Hands= "Rogue's Armlets"
    },
    Mug = {},

    TH = {},

    Ranged = {
        
    },
    Ranged_INT = {},
}

if player.SubJob == 'NIN' then
    sets.Idle.Sub = "Hornetneedle"
end
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 down /ws "Dancing Edge" <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 down /ra <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 down /ma "Utsusemi: Ichi" <me>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 down /ja "Trick Attack" <me>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 down /ja "Sneak Attack" <me>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 down /ja "Bully" <t>')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local saOverride = 0
local taOverride = 0

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')

profile.HandleAbility = function()
    local action = gData.GetAction()
    if (action.Name == 'Flee') then
        gFunc.EquipSet(sets.Flee)
    elseif (action.Name == 'Hide') then
        gFunc.EquipSet(sets.Hide)
    elseif (action.Name == 'Steal') then
        gFunc.EquipSet(sets.Steal)
    elseif (action.Name == 'Mug') then
        gFunc.EquipSet(sets.Mug)
    elseif (action.Name == 'Sneak Attack') then
        saOverride = os.clock() + 2
    elseif (action.Name == 'Trick Attack') then
        taOverride = os.clock() + 2
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
    -- You may add logic here
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)

    local equipment = gData.GetEquipment()
    local ammo = 'None'

    if (equipment.Ammo ~= nil ) then
        ammo = equipment.Ammo.Name
    end

    if (ammo == 'Bloody Bolt') then
        gFunc.EquipSet(sets.Ranged_INT)
    end

    if (gcdisplay.GetToggle('TH')) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleWeaponskill = function()
    gFunc.EquipSet(sets.WS)

    local action = gData.GetAction()
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.WS_SharkBite)
    end

    local ta = gData.GetBuffCount('Trick Attack')
    if (ta > 0) or (os.clock() < taOverride) then
        if (ta_rogue_armlets) then
            gFunc.Equip('Hands', 'Rogue\'s Armlets +1')
        end
    end

    gcmelee.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcmelee.Load()
    profile.SetMacroBook()

    gcinclude.SetAlias(T{'th'})
    local function createToggle()
        gcdisplay.CreateToggle('TH', false)
    end
    createToggle:once(2)
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'th'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceToggle('TH')
        gcinclude.Message('TH', gcdisplay.GetToggle('TH'))
    else
        gcmelee.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmelee.DoDefault()

    local player = gData.GetPlayer()
    if (player.SubJob == 'NIN' and player.Status == 'Engaged') then
        gFunc.EquipSet('TP_NIN')
    end

    gcmelee.DoDefaultOverride()

    if (gcdisplay.GetToggle('TH')) then
        gFunc.EquipSet(sets.TH)
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        gFunc.EquipSet(sets.SATA)
    elseif (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.SA)
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.TA)
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
