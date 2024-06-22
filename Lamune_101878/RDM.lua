local profile = {}

local fastCastValue = 0 -- 20% from traits 22% from gear listed in Precast set

local ninSJMaxMP = 151 -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 613 -- The Max MP you have when /whm in your idle set
local blmSJMaxMP = 632 -- The Max MP you have when /blm in your idle set

local blue_cotehardie = false
local dilation_ring = false
local dilation_ring_slot = 'Ring2'

local sets = {
    Idle = {
        Main = 'Flame Sword',
        Range = '',
        Ammo = '',
        Head = '',
        Neck = 'Spike Necklace',
        Ear1 = 'Opal Earring',
        Ear2 = 'Opal Earring',
        Body = 'Baron\'s saio',
        Hands = 'Battle gloves',
        Ring1 = 'Eremite\'s ring',
        Ring2 = 'Eremite\'s ring',
        Waist = 'Warrior\'s Belt +1',
        Legs = 'Mage\'s Slacks',
        Feet = "Leaping Boots"
    },
    IdleALT = {
    },
    IdleMaxMP = {
    },
    Resting = {
        Legs = 'Baron\'s Slops'
    },
    Town = {},
    Movement = {
    },

    DT = {

    },
    DTNight = {

    },
    MDT = { -- Shell IV provides 23% MDT

    },
    FireRes = { -- 145

    },
    IceRes = { -- 144

    },
    LightningRes = { -- 133

    },
    EarthRes = { -- 144

    },
    WindRes = { -- 138

    },
    WaterRes = { -- 137

    },
    Evasion = {},

    Precast = {

    },
    Casting = { -- Default Casting Equipment when using Idle sets

    },
    SIRD = { -- 102% to Cap, used on Stoneskin, Blink, Aquaveil and Utsusemi casts

    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts

    },
    ConserveMP = {

    },

    Hate = { -- Switches to this set when casting Sleep, Blind, Dispel and Bind if /hate is toggled on

    },
    Cheat_C3HPDown = {

    },
    Cheat_C4HPDown = {

    },
    Cheat_HPUp = {

    },

    Cure = {

    },
    Cursna = {

    },

    Enhancing = {

    },
    Stoneskin = {

    },
    Spikes = {

    },

    Enfeebling = {

    },
    EnfeeblingMND = {

    },
    EnfeeblingINT = {

    },
    EnfeeblingACC = {

    },

    Divine = { -- Just using my Hate set here for Flash

    },
    Dark = {

    },

    Nuke = {

    },
    NukeACC = {

    },
    NukeDOT = {

    },

    Convert = { -- Type /vert to equip this set and /lock your gear at the same time.

    },
    ConvertOOR = { -- Out of Region Convert Set

    },

    Stun = {

    },
    StunACC = { -- You can also type /csstun to equip this set and /lock your gear at the same time if you have a tinfoil hat.

    },

    TP = {

    },
    TP_NIN = {

    },
    WS = {

    },
    WS_Soil = {
    },
    WS_Spirits = {},
    WS_Energy = {

    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //dia')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //dia')
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
    local action = gData.GetAction()

    gFunc.EquipSet(sets.WS)

    if (action.Name == 'Savage Blade') or (action.Name == 'Vorpal Blade') or (action.Name == 'Swift Blade') or (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Soil)
    end

    if (action.Name == 'Energy Drain') or (action.Name == 'Energy Steal') then
        gFunc.EquipSet(sets.WS_Energy)
    end

    if (action.Name == 'Spirits Within') then
        gFunc.EquipSet(sets.WS_Spirits)
    end
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
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil)

    local player = gData.GetPlayer()
    if (blue_cotehardie and player.MP <= 40) then
        gFunc.Equip('Body', 'Blue Cotehardie')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil)

    local action = gData.GetAction()
    if (dilation_ring) then -- Haste is technically MP inefficient but I prefer to just always use it anyway
        if (action.Name == 'Haste' or action.Name == 'Refresh') then
            gFunc.Equip(dilation_ring_slot, 'Dilation Ring')
        end
    end
end

return profile
