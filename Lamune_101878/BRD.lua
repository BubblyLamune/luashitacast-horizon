local profile = {}

local fastCastValue = 0.04 -- Only include Fast Cast e.g. Loquacious Earring, Rostrum Pumps
local fastCastValueSong = 0.25 -- Only include Song Spellcasting Time e.g. Minstrel's Ring, Sha'ir Manteel

local ninSJMaxMP = nil -- The Max MP you have when /nin in your idle set
local whmSJMaxMP = 188 -- The Max MP you have when /whm in your idle set
local rdmSJMaxMP = nil -- The Max MP you have when /rdm in your idle set
local blmSJMaxMP = nil -- The Max MP you have when /blm in your idle set

local displayheadOnAbility = true

local minstrels_ring = true;
local minstrels_ring_slot = "Ring1";
local sets = {
	Idle = {
		Main = 'Paper Knife',
		Head = "Choral roundlet",
		Range = "Ryl.Spr. Horn",
		Neck = "Justice Badge",
		Waist = "Corsette +1",
        Body = "Choral Jstcorps",
		Hands = "Custom F Gloves",
		Ring1 = "Minstrel\'s Ring",
		Ring2 = "Balance Ring",
		Back = "lucent cape",
		Legs = "Choral Cannions",
		Feet = "Choral Slippers"
	},
	IdleALT = {},
	IdleMaxMP = {},
	Resting = {
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
	Precast_Songs_HPDown = {},
	Precast = {},
	Precast_Songs = {},
	Casting = {},
	SIRD = {},
	Haste = {},
	ConserveMP = {},
	Sing_Default = {},
	Sing_Buff = {},
	Sing_Debuff = {
		Head = "Noble's Ribbon",
		Ring1 = "Hope Ring",
		Ring2 = "Hope Ring",
		Neck = "Flower Necklace"
	},
	Sing_Ballad_Large = {
		Range = "Harp +1"
	},
	Sing_Ballad_Small = {
		Range = "Ryl.Spr. Horn"
	},
	Sing_Paeon = {
		Range = "Cornette +1"
	},
	Sing_Mazurka = {
		Range = "Cornette +1"
	},
	Sing_Minuet = {
		Range = "Cornette +1"
	},
	Sing_March = {
		Range = "Ryl.Spr. Horn"
	},
	Sing_Madrigal = {
		Range = "Traversiere +1"
	},
	Sing_Elegy = {
		Range = "Horn +1"
	},
	Sing_Lullaby = {
		Range = "Mary's Horn"
	},
	Sing_HordeLullaby_Large = {
		Range = "Mary's Horn"
	},
	Sing_HordeLullaby_Small = {
		Range = "Mary's Horn"
	},
	Sing_SleepRecast = {},
	Sing_FinaleRequiem = {},
	Sing_Carol = {},
	Sing_Mambo = {},
	Sing_Prelude = {
		Range = "Angel's Flute +1"
	},
	Sing_Threnody = {
		Range = "Piccolo"
	},
	Sing_Hymnus = {},
	Cure = {
		Neck = "Justice Badge"
	},
	Cursna = {},
	Enhancing = {},
	Stoneskin = {},
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
	WS_HighAcc = {}
};



profile.Sets = sets;
profile.SetMacroBook = function()
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro book 1");
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro set 9");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 0 down /ma \"Horde Lullaby\"");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 2 down /ma \"Light Threnody\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 3 down /ma \"Utsusemi: Ichi\" <me>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 4 down /ma \"Blade Madrigal\" <me>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 5 down /ma \"Advancing March\" <me>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 6 down /ma \"Valor Minuet III\" <me>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 7 down /ma \"Mage's Ballad\" <me>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 8 down /ma \"Mage's Ballad II\" <me>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 9 down /ma \"Learned Etude\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 1 down /ma \"Foe Lullaby\"");

end;
profile.LoadJobAddons = function()
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/addon load songcast");
end;
profile.UnloadJobAddons = function()
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/addon unload songcast");
end;
--[[
--------------------------------
Everything below can be ignored.
--------------------------------
]]

gcmage = gFunc.LoadFile('common\\gcmage.lua')

profile.HandleAbility = function()
    if (displayheadOnAbility) then
        AshitaCore:GetChatManager():QueueCommand(1, '/displayhead')
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
    gcmage.DoFenrirsEarring()
end

profile.OnLoad = function()
    gcinclude.SetAlias(T{'sballad','shorde','srecast'})
    gcdisplay.CreateToggle('SmallBallad', false)
    gcdisplay.CreateToggle('SmallHorde', false)
    gcdisplay.CreateToggle('SleepRecast', false)
    gcmage.Load()
    profile.SetMacroBook()
	profile.LoadJobAddons();
end

profile.OnUnload = function()
    gcmage.Unload()
    gcinclude.ClearAlias(T{'sballad','shorde','srecast'})
	profile.UnloadJobAddons();
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
	local player = gData.GetPlayer();

	if (player.SubJob == "NIN") then
		sets.Idle.Main = 'ShellBuster'
		sets.Idle.Sub = 'Paper Knife'
	end

    if minstrels_ring and player.HPP <= 75 then
		gFunc.Equip(minstrels_ring_slot, "Minstrel's Ring");
	end;

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
