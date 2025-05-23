local profile = {}

local fastCastValue = 0.04 -- Only include Fast Cast e.g. Loquacious Earring, Rostrum Pumps
local fastCastValueSong = 0.37 -- Only include Song Spellcasting Time e.g. Minstrel's Ring, Sha'ir Manteel

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = nil -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local minstrels_earring = false
local minstrels_earring_slot = 'Ear2'

local sets = {
    Idle = {
       -- Main = 'Terra\'s Staff',
       Head = 'Emperor Hairpin',
       Range = 'Ryl.Spr. Horn',
        Neck = 'Justice Badge',
       -- Ear1 = 'Merman\'s Earring',
       -- Ear2 = 'Merman\'s Earring',
       -- Body = 'Royal Cloak',
       -- Hands = 'Dst. Mittens +1',
       Ring1 = 'Balance Ring',
       Ring2 = 'Balance Ring',
       -- Back = 'Umbra Cape',
       -- Waist = 'Scouter\'s Rope',
       -- Legs = 'Dst. Subligar +1',
       -- Feet = 'Dst. Leggings +1',
    },
    IdleALT = {
       -- Main = 'Terra\'s Staff',
       -- Range = 'Mythic Harp +1',
       -- Neck = 'Checkered Scarf',
       -- Ear1 = 'Merman\'s Earring',
       -- Ear2 = 'Merman\'s Earring',
       -- Head = 'Crow Beret',
       -- Body = 'Crow Jupon',
       -- Hands = 'Dst. Mittens +1',
       -- Ring1 = 'Merman\'s Ring',
       -- Ring2 = 'Sattva Ring',
       -- Back = 'Umbra Cape',
       -- Waist = 'Scouter\'s Rope',
       -- Legs = 'Dst. Subligar +1',
       -- Feet = 'Dst. Leggings +1',
    },
    IdleMaxMP = {},
    Resting = {
     --  Main = 'Pluto\'s Staff',
     --  Head = 'Crow Beret',
     --  Neck = 'Checkered Scarf',
     --  Ear1 = 'Relaxing Earring',
     --  Ear2 = 'Magnetic Earring',
     --  Body = 'Errant Hpl.',
     --  Back = 'Errant Cape',
        Legs = 'Baron\'s Slops',
    },
    Town = {},
    Movement = {},

    DT = {},
    DTNight = {},
    MDT = { -- Shell IV provides 23% MDT
    },
    FireRes = {
     --   Main = 'Neptune\'s Staff',
     --   Head = 'Green Ribbon +1',
     --   Neck = 'Enfeebling Torque',
     --   Body = 'Dst. Harness +1',
     --   Ear1 = 'Ruby Earring',
     --   Ear2 = 'Ruby Earring',
     --   Ring1 = 'Ruby Ring',
     --   Ring2 = 'Malflame Ring',
     --   Feet = 'Suzaku\'s Sune-ate',
    },
    IceRes = {},
    LightningRes = {},
    EarthRes = {},
    WindRes = {},
    WaterRes = {},
    Evasion = {},

    Precast_Songs_HPDown = { -- This set will equip even before precast for songs in case you require HP Down equipment to trigger Minstrel's Ring
    },
    Precast = {
    --   Ear2 = 'Loquac. Earring',
    --   Feet = 'Rostrum Pumps',
    },
    Precast_Songs = {
    --    Main = 'Tutelary',
    --    Sub = 'She-slime Shield',
    --    Ammo = 'Happy Egg',
    --    Head = 'Genbu\'s Kabuto',
    --    Neck = 'Bird Whistle',
    --    Ear1 = 'Pigeon Earring',
    --    Ear2 = 'Loquac. Earring',
    --    Body = 'Sha\'ir Manteel',
    --    Hands = 'Seiryu\'s Kote',
    --    Ring1 = 'Minstrel\'s Ring',
    --    Ring2 = 'Bomb Queen Ring',
    --    Back = 'Gigant Mantle',
    --    Waist = 'Powerful Rope',
    --    Legs = 'Bard\'s Cannions',
    --    Feet = 'Rostrum Pumps',
    },
    Casting = { -- Default Casting Equipment when using Idle sets
     --   Main = 'Terra\'s Staff',
     --   Range = 'Mythic Harp +1',
     --   Neck = 'Evasion Torque',
     --   Ear1 = 'Merman\'s Earring',
     --   Ear2 = 'Merman\'s Earring',
     --   Head = 'Darksteel Cap +1',
     --   Body = 'Dst. Harness +1',
     --   Hands = 'Dst. Mittens +1',
     --   Ring1 = 'Merman\'s Ring',
     --   Ring2 = 'Sattva Ring',
     --   Back = 'Umbra Cape',
     --   Waist = 'Powerful Rope',
     --   Legs = 'Dst. Subligar +1',
     --   Feet = 'Dst. Leggings +1',
    },
    SIRD = { -- Used on Stoneskin, Blink, Aquaveil and Utsusemi casts
    },
    Haste = { -- Used only on Haste, Refresh, Blink and Utsusemi casts
    --   Body = 'Sha\'ir Manteel',
    --   Ear1 = 'Magnetic Earring',
    --   Hands = 'Dusk Gloves',
    --   Waist = 'Swift Belt',
    --   Legs = 'Byakko\'s Haidate',
    --   Feet = 'Dusk Ledelsens',
    },
    ConserveMP = {
   --     Ear2 = 'Magnetic Earring',
    },

    Sing_Default = {
     --   Head = 'Bard\'s Roundlet',
     --   Neck = 'Wind Torque',
     --   Ear1 = 'Singing Earring',
     --   Ear2 = 'Musical Earring',
     --   Hands = 'Chl. Cuffs +1',
     --   Legs = 'Chl. Cannions +1',
     --   Back = 'Astute Cape',
    },
    Sing_Buff = {
    --    Main = 'Chanter\'s Staff',
    --    Body = 'Minstrel\'s Coat',
    },
    Sing_Debuff = {
        Head = 'Noble\'s Ribbon',
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
        Neck = 'Flower Necklace'
    --    Waist = 'Corsette +1',
    --    Feet = 'Sha\'ir Crackows',
    },

    Sing_Ballad_Large = {
        Range = 'Harp +1',
    },
    Sing_Ballad_Small = {
        Range = "Horn +1",
    },
    Sing_Paeon = {
        Range = 'Cornette +1',
    },
    Sing_Mazurka = {
        Range = 'Cornette +1',
    },
    Sing_Minuet = {
        Range = 'Cornette +1',
    },
    Sing_March = {
        Range = 'Ryl.Spr. Horn',
    },
    Sing_Madrigal = {
     --   Range = 'Traversiere +2',
    },
    Sing_Elegy = {
        Range = "Horn +1",
    },
    Sing_Lullaby = {
        Head = 'Noble\'s Ribbon',
        Neck = "Flower Necklace",
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    Sing_HordeLullaby_Large = {
        Head = 'Noble\'s Ribbon',
        Neck = "Flower Necklace",
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    Sing_HordeLullaby_Small = {
        Head = 'Noble\'s Ribbon',
        Neck = "Flower Necklace",
        Ring1 = 'Hope Ring',
        Ring2 = 'Hope Ring',
    },
    Sing_SleepRecast = {
    },
    Sing_FinaleRequiem = {
    --    Range = 'Hamelin Flute',
    --    Main = 'Apollo\'s Staff',
    },
    Sing_Carol = {
     --   Range = 'Crumhorn +1',
    },
    Sing_Mambo = {
    --    Range = 'Gemshorn +1',
    },
    Sing_Prelude = {
     --   Range = 'Angel\'s Flute +1',
    },
    Sing_Threnody = {
    --    Range = 'Sorrowful Harp',
    --    Neck = 'String Torque',
    --    Legs = 'Mahatma Slops',
    },
    Sing_Hymnus = {
    --    Range = 'Angel Lyre',
    },

    Cure = {
    --    Main = 'Apollo\'s Staff',
    --    Head = 'Crow Beret',
        Neck = 'Justice Badge',
    --    Ear1 = 'Magnetic Earring',
    --    Ear2 = 'Merman\'s Earring',
    --    Body = 'Crow Jupon',
    --    Hands = 'Crow Bracers',
    --    Ring1 = 'Aqua Ring',
    --    Ring2 = 'Aqua Ring',
    --    Back = 'Prism Cape',
    --    Waist = 'Penitent\'s Rope',
    --    Legs = 'Crow Hose',
    --    Feet = 'Crow Gaiters',
    },
    Cursna = {},

    Enhancing = {
    --    Ear1 = 'Magnetic Earring',
    },
    Stoneskin = {
   --    Main = 'Chanter\'s Staff',
   --    Head = 'Crow Beret',
   --    Neck = 'Stone Gorget',
   --    Ear1 = 'Magnetic Earring',
   --    Ear2 = 'Geist Earring',
   --    Body = 'Kirin\'s Osode',
   --    Hands = 'Devotee\'s Mitts',
   --    Ring1 = 'Aqua Ring',
   --    Ring2 = 'Aqua Ring',
   --    Back = 'Prism Cape',
   --    Waist = 'Penitent\'s Rope',
   --    Legs = 'Mahatma Slops',
   --    Feet = 'Suzaku\'s Sune-ate',
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

    TP = {},
    TP_HighAcc = {},
    TP_NIN = {},
    TP_Mjollnir_Haste = {},
    WS = {},
    WS_HighAcc = {},
}
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 9')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 down /ma "Foe Lullaby"')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 down /ma "Wind Threnody" <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 down /ma "Utsusemi: Ichi" <me>')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 4 down /ma "Sword Madrigal" <me>')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 5 down /ma "Advancing March" <me>')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 6 down /ma "Valor Minuet II" <me>')
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 7 down /ma "Mage\'s Ballad" <me>')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
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
    gcinclude.SetAlias(T{'sballad','shorde','srecast'})
    gcdisplay.CreateToggle('SmallBallad', false)
    gcdisplay.CreateToggle('SmallHorde', false)
    gcdisplay.CreateToggle('SleepRecast', false)
    gcmage.Load()
    profile.SetMacroBook()
end

profile.OnUnload = function()
    gcmage.Unload()
    gcinclude.ClearAlias(T{'sballad','shorde','srecast'})
end

profile.HandleCommand = function(args)
    if (args[1] == 'sballad') then
        gcdisplay.AdvanceToggle('SmallBallad')
        gcinclude.Message('SmallBallad', gcdisplay.GetToggle('SmallBallad'))
    elseif (args[1] == 'shorde') then
        gcdisplay.AdvanceToggle('SmallHorde')
        gcinclude.Message('SmallHorde', gcdisplay.GetToggle('SmallHorde'))
    elseif (args[1] == 'srecast') then
        gcdisplay.AdvanceToggle('SleepRecast')
        gcinclude.Message('SleepRecast', gcdisplay.GetToggle('SleepRecast'))
    else
        gcmage.DoCommands(args)
    end

    if (args[1] == 'horizonmode') then
        profile.HandleDefault()
    end
end

profile.HandleDefault = function()
    gcmage.DoDefault(ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    local player = gData.GetPlayer()
    if (minstrels_earring and player.HPP <= 25) then
        gFunc.Equip(minstrels_earring_slot, 'Minstrel\'s Earring')
    end

    gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()))
end

profile.HandlePrecast = function()
    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.ForceEquipSet('Precast_Songs_HPDown')
        gFunc.EquipSet(sets.Precast_Songs)
        local totalFastCast = 1 - (1 - fastCastValueSong) * (1 - fastCastValue)
        gcmage.DoPrecast(totalFastCast)
    else
        gcmage.DoPrecast(fastCastValue)
    end
end

profile.HandleMidcast = function()
    gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, rdmSJMaxMP, nil)

    local action = gData.GetAction()
    if (action.Type == 'Bard Song') then
        gFunc.EquipSet(sets.Sing_Default)

        if string.match(action.Name, 'Threnody') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Threnody)
        elseif string.match(action.Name, 'Elegy') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Elegy)
        elseif string.match(action.Name, 'Foe Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_Lullaby)
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif string.match(action.Name, 'Horde Lullaby') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_HordeLullaby_Large)
            if (gcdisplay.GetToggle('SmallHorde')) then
                gFunc.EquipSet(sets.Sing_HordeLullaby_Small)
            end
            if (gcdisplay.GetToggle('SleepRecast')) then
                gFunc.EquipSet(sets.Sing_SleepRecast)
            end
        elseif (action.Name == 'Magic Finale') or string.match(action.Name, 'Requiem') then
            gFunc.EquipSet(sets.Sing_Debuff)
            gFunc.EquipSet(sets.Sing_FinaleRequiem)
        elseif string.match(action.Name, 'Carol') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Carol)
        elseif string.match(action.Name, 'Ballad') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Ballad_Large)
            if (gcdisplay.GetToggle('SmallBallad')) then
                gFunc.EquipSet(sets.Sing_Ballad_Small)
            end
        elseif string.match(action.Name, 'Minuet') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Minuet)
        elseif string.match(action.Name, 'March') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_March)
        elseif string.match(action.Name, 'Madrigal') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Madrigal)
        elseif string.match(action.Name, 'Mambo') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mambo)
        elseif string.match(action.Name, 'Prelude') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Prelude)
        elseif string.match(action.Name, 'Hymnus') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Hymnus)
        elseif (action.Name == 'Chocobo Mazurka') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Mazurka)
        elseif string.match(action.Name, 'Paeon') then
            gFunc.EquipSet(sets.Sing_Buff)
            gFunc.EquipSet(sets.Sing_Paeon)
        end
    end
end

return profile
