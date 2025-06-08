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
    AshitaCore:GetChatManager():QueueCommand(-1, '/bind 0 down /ja "Hide" <me>')
end

--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

local saOverride = 0
local taOverride = 0
local taggedMobs = {}

gcmelee = gFunc.LoadFile('common\\gcmelee.lua')
actionpacket = gFunc.LoadFile('common\\actionpacket.lua')

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

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.HandleItem = function()
    gcinclude.DoItem()
end

profile.HandlePreshot = function()
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
    end

    local ta = gData.GetBuffCount('Trick Attack')
    if (ta > 0) or (os.clock() < taOverride) then
        if (ta_rogue_armlets) then
            gFunc.Equip('Hands', 'Rogue\'s Armlets +1')
        end
    end

    if (profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'th'})
    gcdisplay.CreateCycle('TH', {[1] = 'auto', [2] = 'on', [3] = 'off'})
    gcmelee.Load()
    profile.SetMacroBook()
    profile.WatchTreasureHunter()
end

profile.OnUnload = function()
    gcmelee.Unload()
    gcinclude.ClearAlias(T{'th'})
    ashita.events.unregister('packet_in', 'watch_treasure_hunter');
end

profile.HandleCommand = function(args)
    if (args[1] == 'th') then
        gcdisplay.AdvanceCycle('TH')
        gcinclude.Message('TH', gcdisplay.GetCycle('TH'))
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
end

profile.HandleMidcast = function()
    gcmelee.DoMidcast(sets)

    local action = gData.GetAction()
    if (action.Skill ~= 'Ninjutsu' and profile.NeedTH()) then
        gFunc.EquipSet(sets.TH)
    end
end

profile.NeedTH = function()
    if (gcdisplay.GetCycle('TH') == 'auto') then
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

    return gcdisplay.GetCycle('TH') == 'on'
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
