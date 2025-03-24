local profile = {};
local fastCastValue = 0;
local ninSJMaxMP = nil;
local rdmSJMaxMP = nil;
local blmSJMaxMP = nil;
local sets = {
	Idle = {
		Main = "Light Staff",
		-- Body = "Healer's bliaut",
		Body = "Noble's tunic",
		Hands = "Healer's Mitts",
		Legs = "Healer's Pantaln.",
		Head = "Healer\'s Cap",
		Feet = "Healer\'s duckbills",
		Neck = "Justice Badge",
		Waist = "Force Belt",
		Ear1 = "Geist Earring",
		Ear2 = "Geist Earring",
		Ring1 = "Ether Ring",
		Ring2 = "Electrum Ring",
		Back = "White Cape"
	},
	IdleALT = {
		Main = "Darksteel Maul",
		Sub = "Numinous shield",
		-- Body = "Holy Breastplate",
		Hands = "Devotee\'s Mitts",
		Legs = "Healer\'s pantaloons",
		Head = "Healer\'s Cap",
		Feet = "Healer\'s duckbills",
		Neck = "Justice Badge",
		Waist = "Force Belt",
		Ear1 = "Geist Earring",
		Ear2 = "Geist Earring",
		Ring1 = "Ether Ring",
		Ring2 = "Electrum Ring",
		Back = "White Cape"
	},
	IdleMaxMP = {},
	Resting = {
		Main = "Dark Staff",
		Sub = "",
		Body = "Noble's tunic",
		-- Body = "Seer's tunic",
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
	Precast = {},
	Casting = {},
	SIRD = {},
	Haste = {},
	ConserveMP = {},
	Cure = {
		Main = "Light Staff"
	},
	Cure5 = {
		Main = "Light Staff"
	},
	Regen = {
		Body = "Cleric\'s Bliaut"
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
	Banish = {},
	Dark = {},
	Nuke = {},
	NukeACC = {},
	NukeDOT = {},
	LockSet1 = {},
	LockSet2 = {},
	LockSet3 = {},
	TP = {},
	TP_NIN = {},
	WS = {}
};
profile.Sets = sets;
profile.SetMacroBook = function()
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro book 1");
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro set 1");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 1 down /ma \"Cure II\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 2 down /ma \"Cure III\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 3 down /ma \"Cure IV\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 4 down /ma \"Regen\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 5 down /ma \"Haste\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 6 down /ma \"Regen II\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 7 down /ma \"Dia II\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 8 down /ma \"Paralyze\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 9 down /ma \"Slow\" <t>");
end;
gcmage = gFunc.LoadFile("common\\gcmage.lua");
profile.HandleAbility = function()
end;
profile.HandleItem = function()
	gcinclude.DoItem();
end;
profile.HandlePreshot = function()
end;
profile.HandleMidshot = function()
end;
profile.HandleWeaponskill = function()
	gFunc.EquipSet(sets.WS);
end;
profile.OnLoad = function()
	gcmage.Load();
	profile.SetMacroBook();
end;
profile.OnUnload = function()
	gcmage.Unload();
end;
profile.HandleCommand = function(args)
	gcmage.DoCommands(args);
	if args[1] == "horizonmode" then
		profile.HandleDefault();
	end;
end;
profile.HandleDefault = function()
	gcmage.DoDefault(ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP);
	gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()));
end;
profile.HandlePrecast = function()
	gcmage.DoPrecast(fastCastValue);
end;
profile.HandleMidcast = function()
	gcmage.DoMidcast(sets, ninSJMaxMP, nil, blmSJMaxMP, rdmSJMaxMP);
	local action = gData.GetAction();
	if string.match(action.Name, "Regen") then
		gFunc.EquipSet("Regen");
	end;
	if string.match(action.Name, "Banish") then
		gFunc.EquipSet("Banish");
	end;
end;
return profile;
