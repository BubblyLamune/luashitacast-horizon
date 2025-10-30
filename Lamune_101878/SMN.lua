local profile = {}

local fastCastValue = 0.04 -- 4% from gear not including carbuncles cuffs or evokers boots

local carbuncles_cuffs = false
local evokers_boots = false

local cureMP = 895 -- Cure set max MP

local sets = {
    ['Idle'] = {
        Main = 'Earth Staff',
        Head = 'Evoker\'s Horn',
        Neck = 'Ajari Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Evoker\'s Doublet',
        Hands = 'Evoker\'s Bracers',
		Ring1 = "Ether Ring",
		Ring2 = "Tamas Ring",
        Back = 'Red Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Evoker\'s Spats',
        Feet = 'Evoker\'s Pigaches',
    },
    IdleALT = {
        Head = '',
        Body = 'Vermillion Cloak',
    },
    IdleMaxMP = {},
    Resting = {
        Head = '',
        Main = 'Dark Staff',
        Neck = 'Checkered Scarf',
        Body = 'Vermillion Cloak',
        Legs = 'Baron\'s Slops'
    },
    --[[ Resting = {
        Main = 'Pluto\'s Staff',
        Head = 'Hydra Beret',
        Neck = 'Pch. Collar',
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Relaxing Earring',
        Body = 'Errant Hpl.',
        Hands = 'Hydra Gloves',
        Ring1 = 'Bomb Queen Ring',
        Ring2 = 'Ether Ring',
        Back = 'Errant Cape',
        Waist = 'Hierarch Belt',
        Legs = 'Hydra Brais',
        Feet = 'Hydra Gaiters',
    },]]
    Town = {},
    Movement = {
        Feet = 'Herald\'s Gaiters',
    },

    Perpetuation = { -- There is no point in using this set over an Idle set except for equipping Penance Robe
    },

    DT = {
        Main = 'Earth Staff',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
    },
    DTNight = {
        Main = 'Earth Staff',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring',
        Ear2 = 'Merman\'s Earring',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Jelly Ring',
        Ring2 = 'Sattva Ring',
        Back = 'Umbra Cape',
    },
    MDT = { -- Shell IV provides 23% MDT
        Main = 'Earth Staff',
        Head = 'Green Ribbon +1',
        Neck = 'Jeweled Collar',
        Ear1 = 'Merman\'s Earring', -- 2
        Ear2 = 'Merman\'s Earring', -- 2
        Hands = 'Merman\'s Bangles', -- 3
        Ring1 = 'Shadow Ring',
        Ring2 = 'Sattva Ring', -- 5
        Back = 'Hexerei Cape', -- 3
    },
    FireRes = {
        Main = 'Water Staff', -- 20
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Hands = 'Merman\'s Bangles',
        Feet = 'Power Sandals', -- 7
        Back = 'Hexerei Cape',
        Ring1 = 'Triumph Ring', -- 10
        Waist = 'Water Belt', -- 20
        Ring2 = 'Malflame Ring', -- 10
    },
    IceRes = {
        Main = 'Fire Staff', -- 20
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Hands = 'Merman\'s Bangles',
        Back = 'Aurora Mantle', -- 7
        Waist = 'Fire Belt', -- 20
        Ring1 = 'Omniscient Ring', -- 10
        Ring2 = 'Malfrost Ring', -- 10
    },
    LightningRes = {
        Main = 'Earth Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Hexerei Cape',
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Hands = 'Merman\'s Bangles',
        Waist = 'Earth Belt', -- 20
        Ring1 = 'Spinel Ring', -- 9
        Ring2 = 'Malflash Ring', -- 10
    },
    EarthRes = {
        Ring2 = 'Maldust Ring', -- 10
        Main = 'Wind Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Hands = 'Merman\'s Bangles',
        Back = 'Hexerei Cape',
        Ear1 = 'Robust Earring', -- 11
        Ear2 = 'Robust Earring', -- 11
        Waist = 'Wind Belt', -- 20
        Ring1 = 'Robust Ring', -- 10
    },
    WindRes = {
        Ring2 = 'Malgust Ring', -- 10
        Main = 'Ice Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Back = 'Aurora Mantle', -- 7
        Hands = 'Mage\'s Cuffs', -- 5
        Ear1 = 'Diamond Earring', -- 10
        Ear2 = 'Omn. Earring', -- 11
        Waist = 'Ice Belt', -- 20
        Ring1 = 'Emerald Ring', -- 9
    },
    WaterRes = {
        Main = 'Thunder Staff', -- 20
        Head = 'Green Ribbon +1', -- 10
        Neck = 'Jeweled Collar', -- 10
        Hands = 'Merman\'s Bangles',
        Ear1 = 'Cmn. Earring', -- 11
        Ear2 = 'Cmn. Earring', -- 11
        Ring1 = 'Communion Ring', -- 10
        Ring2 = 'Malflood Ring', -- 10
        Back = 'Hexerei Cape',
        Waist = 'Lightning Belt', -- 20
    },
    Evasion = {},

    Precast = {
        Ear1 = 'Loquac. Earring',
        Feet = 'Rostrum Pumps',
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 100 },
    },
    Casting = { -- Default Casting Equipment when using Idle sets
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Genbu\'s Shield',
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Yinyang Robe',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = { Name = 'Errant Cape', Priority = 100 },
        Waist = 'Silver Obi +1', -- 8
        Legs = { Name = 'Evk. Spats +1', Priority = 100 },
        Feet = { Name = 'Mountain Gaiters', Priority = 100 }, -- 5
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
        Main = 'Eremite\'s Wand', -- 25
        Sub = 'Genbu\'s Shield',
        Ammo = 'Hedgehog Bomb',
        Head = 'Nashira Turban', -- 10
        Neck = 'Willpower Torque', -- 5
        Ear1 = 'Loquac. Earring',
        Ear2 = 'Magnetic Earring', -- 8
        Body = 'Yinyang Robe',
        Hands = 'Merman\'s Bangles',
        Ring1 = 'Sattva Ring',
        Ring2 = 'Evoker\'s Ring',
        Back = { Name = 'Errant Cape', Priority = 100 },
        Waist = 'Silver Obi +1', -- 8
        Legs = { Name = 'Evk. Spats +1', Priority = 100 },
        Feet = { Name = 'Mountain Gaiters', Priority = 100 }, -- 5
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
        Head = 'Nashira Turban',
        Ear1 = 'Loquac. Earring',
        Hands = 'Nashira Gages',
        Waist = 'Sonic Belt',
        Legs = 'Nashira Seraweels',
        Feet = 'Nashira Crackows',
    },
    ConserveMP = {
        Ammo = 'Dream Sand',
        Ear2 = 'Magnetic Earring',
        Back = 'Maledictor\'s Shawl',
    },

    Cure = {
        Ammo = 'Dream Sand',
        Head = 'Hydra Beret', -- 8
        Neck = 'Benign Necklace', -- 2
        Ear1 = 'Novia Earring', -- 7
        Ear2 = 'Magnetic Earring',
        Body = 'Hydra Doublet', -- 9
        Hands = 'Hydra Gloves', -- 5
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = { Name = 'Errant Cape', Priority = 100 }, -- 5
        Waist = 'Penitent\'s Rope', -- 3
        Legs = 'Hydra Brais', -- 6
        Feet = 'Hydra Gaiters', -- 5
    },
    Cursna = {
        Back = 'Altruistic Cape',
    },

    Enhancing = {
        Main = 'Kirin\'s Pole',
        Ammo = 'Hedgehog Bomb',
        Head = 'Evk. Horn +1',
        Neck = 'Enhancing Torque',
        Ear1 = 'Cmn. Earring',
        Ear2 = 'Cmn. Earring',
        Body = 'Errant Hpl.',
        Hands = 'Dvt. Mitts +1',
        Ring1 = 'Aqua Ring',
        Ring2 = 'Communion Ring',
        Back = 'Merciful Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Errant Slops',
        Feet = 'Errant Pigaches',
    },
    Stoneskin = {
        Neck = 'Stone Gorget',
        Back = 'Prism Cape',
    },
    Spikes = {},

    Enfeebling = {},
    EnfeeblingMND = {},
    EnfeeblingINT = {},
    EnfeeblingACC = {},

    Divine = {},
    Dark = {},

    Nuke = {},
    NukeACC = {},
    NukeDOT = {},

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    FallbackSub = { -- Used only when you do not have complete staff sets
    },

    BP_Delay = {
        Head = 'Austere Hat',
        -- Head = 'Evk. Horn +1',
        --Legs = 'Evk. Spats +1',
        --Ring1 = { Name = 'Sattva Ring', Priority = 100 },
       -- Ring2 = 'Evoker\'s Ring',
       -- Ear1 = 'Loquac. Earring',
       -- Ear2 = 'Magnetic Earring',
       -- Back = 'Astute Cape',
        Body = 'Austere Robe',
        -- Body = 'Smn. Doublet +1',
        -- Hands = 'Smn. Bracers +1',
        Hands = 'Austere Cuffs',
      --  Feet = 'Nashira Crackows',
      --  Ammo = 'Hedgehog Bomb',
        Waist = { Name = 'Hierarch Belt', Priority = 100 },
        -- Neck = 'Smn. Torque',
    },

    BP = {
        Head = 'Austere Hat',
        -- Head = 'Evk. Horn +1',
        --Legs = 'Evk. Spats +1',
        --Ring1 = { Name = 'Sattva Ring', Priority = 100 },
       -- Ring2 = 'Evoker\'s Ring',
       -- Ear1 = 'Loquac. Earring',
       -- Ear2 = 'Magnetic Earring',
       -- Back = 'Astute Cape',
        Body = 'Austere Robe',
        -- Body = 'Smn. Doublet +1',
        -- Hands = 'Smn. Bracers +1',
        Hands = 'Austere Cuffs',
      --  Feet = 'Nashira Crackows',
      --  Ammo = 'Hedgehog Bomb',
        Waist = { Name = 'Hierarch Belt', Priority = 100 },
        -- Neck = 'Smn. Torque',
    },
    BP_Magical = {
    },
    BP_Physical = {
    },
    BP_Hybrid = {
    },

    TP = {
        Ring1 = 'Jelly Ring',
    },
    TP_HighAcc = {
        Ring1 = { Name = 'Bomb Queen Ring', Priority = 100 },
    },
    TP_NIN = {},
    TP_Mjollnir_Haste = {},
    WS = {},
    WS_HighAcc = {},
    ['eco'] = {
        Main = 'Yew Wand +1',
        Sub = 'Hatchling Shield',
        Ammo = 'Fortune Egg',
        Head = 'Dream Hat +1',
        Neck = 'Justice Badge',
        Body = 'Baron\'s Saio',
        Hands = 'Carbuncle Mitts',
        Legs = 'Baron\'s Slops',
        Feet = 'Dream Boots +1',
    },
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 2')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 2')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F9 //dia')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind F10 //dia')
    AshitaCore:GetChatManager():QueueCommand(-1, "/bind 1 down /ja \"Assault\" <t>");
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind 2 down /ja \"Retreat\" <me>");
	AshitaCore:GetChatManager():QueueCommand(-1, "/bind 3 down /ja \"Release\" <me>");
    AshitaCore:GetChatManager():QueueCommand(-1, "/bind 4 down /party Shock Strike >> <t> <call21>;/pet \"Shock Strike\" <t>");

end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local SmnSkill = T{'Shining Ruby','Glittering Ruby','Crimson Howl','Inferno Howl','Frost Armor','Crystal Blessing','Aerial Armor','Hastega II','Fleet Wind','Hastega','Earthen Ward','Earthen Armor','Rolling Thunder','Lightning Armor','Soothing Current','Ecliptic Growl','Heavenward Howl','Ecliptic Howl','Noctoshield','Dream Shroud','Altana\'s Favor','Reraise','Reraise II','Reraise III','Raise','Raise II','Raise III','Wind\'s Blessing'}
local SmnHealing = T{'Healing Ruby','Healing Ruby II','Whispering Wind','Spring Water'}
local SmnMagical = T{'Searing Light','Meteorite','Holy Mist','Inferno','Fire II','Fire IV','Meteor Strike','Conflag Strike','Diamond Dust','Blizzard II','Blizzard IV','Heavenly Strike','Aerial Blast','Aero II','Aero IV','Wind Blade','Earthen Fury','Stone II','Stone IV','Geocrush','Judgement Bolt','Thunder II','Thunder IV','Thunderstorm','Thunderspark','Tidal Wave','Water II','Water IV','Grand Fall','Howling Moon','Lunar Bay','Ruinous Omen','Somnolence','Nether Blast','Night Terror','Level ? Holy'}
local SmnEnfeebling = T{'Diamond Storm','Sleepga','Shock Squall','Slowga','Tidal Roar','Pavor Nocturnus','Ultimate Terror','Nightmare','Mewing Lullaby','Eerie Eye'}
local SmnHybrid = T{'Flaming Crush','Burning Strike'}

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    gcmage.DoAbility()
    gFunc.EquipSet('BP_Delay')
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
    local petAction = gData.GetPetAction()
    if (petAction ~= nil) then
        gFunc.EquipSet('BP')

        -- Era provides near zero gear options so almost all of these just default to the default BP set or Magical
        if (SmnSkill:contains(petAction.Name)) then
            -- Do Nothing
        elseif (SmnMagical:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Magical)
        elseif (SmnHybrid:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Hybrid)
        elseif (SmnHealing:contains(petAction.Name)) then
            -- Do Nothing
        elseif (SmnEnfeebling:contains(petAction.Name)) then
            gFunc.EquipSet(sets.BP_Magical)
        else
            gFunc.EquipSet(sets.BP_Physical)
        end
    else
        gcmage.DoDefault(nil, nil, nil, nil)
    end
    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    gcmage.DoPrecast(fastCastValue)

    local action = gData.GetAction()
    if (action.Skill == 'Summoning') then
        if (carbuncles_cuffs and evokers_boots and string.match(action.Name, 'Spirit')) then
            gFunc.Equip('Hands', 'Carbuncle\'s Cuffs')
        else
            if (carbuncles_cuffs) then
                gFunc.Equip('Hands', 'Carbuncle\'s Cuffs')
            end
            if (evokers_boots) then
                gFunc.Equip('Feet', 'Evoker\'s Boots')
            end
        end
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, cureMP, cureMP, cureMP, cureMP)
end

return profile
