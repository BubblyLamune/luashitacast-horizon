local profile = {}

local fastCastValue = 0.00 -- 0% from gear

local ta_rogue_armlets = false
local player = gData.GetPlayer()

local sets = {
    Idle = {		
        Main = "Cermet Kukri +1",
        Sub = "Garuda\'s Dagger",
        Body = "Rapparee Harness",
        Hands = "Custom F gloves",
        Legs = "Rogue\'s Culottes",
        --Head = "Rogue's Bonnet",
        Head = "Emperor Hairpin",
        Feet = "Leaping Boots",
        Neck = "Spike necklace",
        Waist = "Swift belt",
        Ear1 = 'Merman\'s Earring',
        Ear2 = "Coral earring",
        Ring1 = 'Toreador\'s Ring',
        Ring2 = 'Toreador\'s Ring',
        Back = "Amemet mantle"
    },
    IdleALT = {
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
    SIRD = {
    },
    Haste = { -- Used for Utsusemi cooldown
    },

    LockSet1 = {},
    LockSet2 = {},
    LockSet3 = {},

    TP_LowAcc = {},
    TP_HighAcc = {},
    TP_NIN = {},
    TP_Mjollnir_Haste = {},

    WS = {},
    WS_HighAcc = {},

    WS_Evisceration = {},
    WS_SharkBite = {},

    SA = {
        Head = "Rogue's Bonnet",
        Body = "Brigandine",
        Legs = "Rogue's Culottes",
    },
    TA = {
        Head = "Rogue's Bonnet",
        Body = "Brigandine",
        Legs = "Rogue's Culottes",
    },
    SATA = {
        Head = "Rogue's Bonnet",
        Body = "Brigandine",
        Legs = "Rogue's Culottes",
    },

    Flee = {
        Feet = "Rogue\'s Poulaines",
    },
    Hide = {
        Body = "Rogue's Vest",

    },
    Steal = {
        Legs = "Rogue's Culottes",
        Head = "Rogue's Bonnet",
        Hands = "Rogue's Armlets"
    },
    Mug = {},

    TH = {},
    Charm = {
        Head = "Noble\'s Ribbon",
        Ring1 = 'Hope Ring',
        Ring2 = "Hope Ring",
        Neck = 'Flower Necklace',

    },

    Ranged = {
        
    },
    Ranged_INT = {
        Head = "Rogue's Bonnet",
        Neck = 'Checkered Scarf',
        Ear1 = 'Morion Earring',
        Ear2 = 'Moldavite Earring',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Genius Ring',
        Feet = 'Custom F Boots'

    },
    ['bcnmfourty'] = {
        Main = 'Marauder\'s Knife',
        Sub = 'Kingdom Dagger',
        Head = 'Emperor Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Drone Earring',
        Ear2 = 'Drone Earring',
        Body = 'Mrc.Cpt. Doublet',
        Hands = 'Custom F Gloves',
        Ring1 = 'Balance Ring',
        Ring2 = 'Balance Ring',
        Back = 'Nomad\'s Mantle',
        Waist = 'Tilt Belt',
        Legs = 'Republic Subligar',
        Feet = 'Leaping Boots',
    },
    Acid = {
        Ammo = 'Acid Bolt',
    },
    Sleep = {
        Ammo = 'Sleep Bolt',
    },
    Bloody = {
        Ammo = 'Bloody Bolt',
    },
    Blind = {
        Ammo = 'Blind Bolt',
    },
    Venom = {
        Ammo = 'Venom Bolt',
    },
}

if player.SubJob == 'NIN' then
    sets.Idle.Sub = "Garuda\'s Dagger"
end
profile.Sets = sets

profile.SetMacroBook = function()
    AshitaCore:GetChatManager():QueueCommand(1, '/macro book 1')
    AshitaCore:GetChatManager():QueueCommand(1, '/macro set 1')

    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 1 down /ws "Evisceration" <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 2 down /ra <t>')
	AshitaCore:GetChatManager():QueueCommand(-1, '/bind 3 down /ma "Utsusemi: Ichi" <me>')
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

local ammo = T{'aacid','asleep','abloody','ablind','avenom'}

local AmmoTable1 = {
    [1] = 'Acid',
    [2] = 'Sleep',
    [3] = 'Bloody',
    [4] = 'Blind',
    [5] = 'Venom',
}
local AmmoTable2 = {
    ['acid'] = 1,
    ['sleep'] = 2,
    ['bloody'] = 3,
    ['blind'] = 4,
    ['venom'] = 5,
}

local saOverride = 0
local taOverride = 0
local taggedMobs = {}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')
actionpacket = gFunc.LoadFile('common\\actionpacket.lua')

profile.HandleAbility = function()
    gcmelee.DoAbility()

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

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
	gFunc.EquipSet(sets[gcdisplay.GetCycle('Ammo')]);
end

profile.HandleMidshot = function()
    gFunc.EquipSet(sets.Ranged)

    local ammo = gData.GetEquipment().Ammo
    if (ammo ~= nil and ammo.Name == 'Bloody Bolt') then
        gFunc.EquipSet(sets.Ranged_INT)
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleWeaponskill = function()
    gcmelee.DoWS()

    local action = gData.GetAction()
    if (action.Name == 'Evisceration') then
        gFunc.EquipSet(sets.WS_Evisceration)
    elseif (action.Name == 'Shark Bite') then
        gFunc.EquipSet(sets.WS_SharkBite)
    elseif (action.Name == 'Dancing Edge') then
        gFunc.EquipSet(sets.WS_DancingEdge)
    elseif (action.Name == 'Mercy Stroke') then
        gFunc.EquipSet(sets.WS_MercyStroke)
    end

    local sa = gData.GetBuffCount('Sneak Attack')
    local ta = gData.GetBuffCount('Trick Attack')

    if (sa == 1) or (os.clock() < saOverride) then
        gFunc.EquipSet(sets.WS_SA)
    end

    if (sa == 1 and ta == 1) or (os.clock() < saOverride and os.clock() < taOverride) then
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_SATA_SharkBite)
        end
    elseif (ta == 1) or (os.clock() < taOverride) then
        gFunc.EquipSet(sets.WS_TA)
        if (action.Name == 'Shark Bite') then
            gFunc.EquipSet(sets.WS_TA_SharkBite)
        elseif (action.Name == 'Mercy Stroke') then
            gFunc.EquipSet(sets.WS_TA_MercyStroke)
        end
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(ammo)
    gcdisplay.CreateCycle('Ammo', AmmoTable1)
    gcinclude.SetAlias(T{'ammo'})
    gcinclude.SetAlias(T{'th'})
    gcdisplay.CreateCycle('TH', {[1] = 'Auto', [2] = 'On', [3] = 'Off'})
    gcmelee.Load()
    profile.SetMacroBook()
    profile.WatchTreasureHunter()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(ammo)
    gcinclude.ClearAlias(T{'ammo'})
    gcinclude.ClearAlias(T{'th'})
    ashita.events.unregister('packet_in', 'watch_treasure_hunter');
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceCycle('TH')
        gcinclude.Message('TH', gcdisplay.GetCycle('TH'))
    elseif (args[1] == 'ammo') then
        gcdisplay.AdvanceCycle('Ammo')
        gcinclude.Message('Ammo', gcdisplay.GetCycle('Ammo'))
    elseif (ammo:contains(args[1])) then
        gcdisplay.SetCycleIndex('Ammo', AmmoTable2[args[1]:sub(2)])
        gcinclude.Message('Ammo', gcdisplay.GetCycle('Ammo'))
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

    if (conquest:GetOutsideControl() and evasion_master_casters_mitts and gcdisplay.IdleSet == 'Evasion') then
        gFunc.Equip('Hands', 'Mst.Cst. Mitts')
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

    if (player.Status == 'Engaged' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandlePrecast = function()
    gcmelee.DoPrecast(fastCastValue)
	gFunc.EquipSet(sets[gcdisplay.GetCycle('Ammo')]);
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill ~= 'Ninjutsu' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.NeedTH = function()
    if (gcdisplay.GetCycle('TH') == 'Auto') then
        local targetId
        local actionTarget = gData.GetActionTarget()

        if (actionTarget ~= nil) then
            targetId = actionTarget.Id
        else
            local targetIndex = gData.GetTargetIndex()
            if (targetIndex == 0) then
                return false
            end

            targetId = AshitaCore:GetMemoryManager():GetEntity():GetServerId(targetIndex)
        end

        if bit.band(targetId, 0xFF000000) ~= 0 then  --isMob
            return taggedMobs[targetId] == nil
        end

        return false
    end

    return gcdisplay.GetCycle('TH') == 'On'
end

profile.WatchTreasureHunter = function()
    ashita.events.register('packet_in', 'watch_treasure_hunter', function(e)
        local playerEntity = GetPlayerEntity();
        if (not playerEntity) then
            return
        end

        if (e.id == 0x28) then
            local type = T { 1, 2, 4, 6 };
            local packet = actionpacket:parse(e);
            if (packet.UserId == playerEntity.ServerId) then
                if (type:contains(packet.Type)) then
                    local reaction = T { 0, 8, 
                        9, -- melee/range attack missed, comment out for pedantic TH mode
                    }
                    for _, target in ipairs(packet.Targets) do
                        for i = 1, #target.Actions do
                            local action = target.Actions[1]
                            if bit.band(target.Id, 0xFF000000) ~= 0 then -- isMob, also triggers on NPC but it's benign
                                if reaction:contains(action.Reaction) and target.Id then
                                    taggedMobs[target.Id] = true;
                                end
                            end
                        end
                    end
                end
            end
        elseif (e.id == 0x29) then
            local deathMes = T { 6, 20, 97, 113, 406, 605, 646 };
            -- Mob died, clear from table
            local message = struct.unpack('i2', e.data, 0x18 + 1);
            if (deathMes:contains(message)) then
                local target = struct.unpack('i4', e.data, 0x08 + 1);
                taggedMobs[target] = nil;
            end
        elseif (e.id == 0x0A or e.id == 0x0B) then
            -- Changed zone, clear all TH
            taggedMobs = {};
        end
    end)
end

return profile