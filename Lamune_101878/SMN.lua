local profile = {};
local fastCastValue = 0.04;
local cureMP = 895;
local conjurersRingForced = true;
local conjurersRingMaxHP = 737;
local carbuncles_cuffs = {};
local evokers_boots = {};
local warlocks_mantle = {
	Back = "Warlock's Mantle"
};
local carbuncle_mitts = {
	Hands = "Carbuncle Mitts"
};
local yinyang_robe = {
	Body = "Yinyang Robe"
};
local summoners_doublet = {
	Body = "Summoner's Doublet"
};
local summoners_horn = {
	Head = "Summoner's Horn"
};
local conjurers_ring = {
	Ring1 = "Conjurer's Ring"
};
local bahamuts_staff = {};
local sets = {
	Idle = {
		Main = "Earth Staff",
		Head = "Evoker's Horn",
		Neck = "Ajari Necklace",
		Ear1 = "Geist Earring",
		Ear2 = "Geist Earring",
		Body = "Evoker's Doublet",
		Hands = "Summoner's Brcr.",
		Ring1 = "Ether Ring",
		Ring2 = "Tamas Ring",
		Back = "Prism Cape",
		Waist = "Penitent's Rope",
		Legs = "Summoner's Spats",
		Feet = "Summoner's Pgch."
	},
	IdleALT = {},
	IdleMaxMP = {},
	Resting = {
		Main = "Dark Staff",
		Body = "Errant Hpl.",
		Waist = "Hierarch belt",
		Neck = "Checkered Scarf",
		Legs = "Baron's Slops"
	},
	Town = {},
	Movement = {
		Feet = "Herald's Gaiters"
	},
	Perpetuation = {},
	DT = {
		Main = "Earth Staff",
		Neck = "Jeweled Collar",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Hands = "Merman's Bangles",
		Ring1 = "Jelly Ring",
		Ring2 = "Sattva Ring",
		Back = "Umbra Cape"
	},
	DTNight = {
		Main = "Earth Staff",
		Neck = "Jeweled Collar",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Hands = "Merman's Bangles",
		Ring1 = "Jelly Ring",
		Ring2 = "Sattva Ring",
		Back = "Umbra Cape"
	},
	MDT = {
		Main = "Earth Staff",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Hands = "Merman's Bangles",
		Ring1 = "Shadow Ring",
		Ring2 = "Sattva Ring",
		Back = "Hexerei Cape"
	},
	FireRes = {
		Main = "Water Staff",
		Ear1 = "Cmn. Earring",
		Ear2 = "Cmn. Earring",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Hands = "Merman's Bangles",
		Feet = "Power Sandals",
		Back = "Hexerei Cape",
		Ring1 = "Triumph Ring",
		Waist = "Water Belt",
		Ring2 = "Malflame Ring"
	},
	IceRes = {
		Main = "Fire Staff",
		Ear1 = "Diamond Earring",
		Ear2 = "Omn. Earring",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Hands = "Merman's Bangles",
		Back = "Aurora Mantle +1",
		Waist = "Fire Belt",
		Ring1 = "Omniscient Ring",
		Ring2 = "Malfrost Ring"
	},
	LightningRes = {
		Main = "Earth Staff",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Back = "Hexerei Cape",
		Ear1 = "Robust Earring",
		Ear2 = "Robust Earring",
		Hands = "Merman's Bangles",
		Waist = "Earth Belt",
		Ring1 = "Spinel Ring",
		Ring2 = "Malflash Ring"
	},
	EarthRes = {
		Ring2 = "Maldust Ring",
		Main = "Wind Staff",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Hands = "Merman's Bangles",
		Back = "Hexerei Cape",
		Ear1 = "Robust Earring",
		Ear2 = "Robust Earring",
		Waist = "Wind Belt",
		Ring1 = "Robust Ring"
	},
	WindRes = {
		Ring2 = "Malgust Ring",
		Main = "Ice Staff",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Back = "Aurora Mantle +1",
		Hands = "Mage's Cuffs",
		Ear1 = "Diamond Earring",
		Ear2 = "Omn. Earring",
		Waist = "Ice Belt",
		Ring1 = "Emerald Ring"
	},
	WaterRes = {
		Main = "Thunder Staff",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Hands = "Merman's Bangles",
		Ear1 = "Cmn. Earring",
		Ear2 = "Cmn. Earring",
		Ring1 = "Communion Ring",
		Ring2 = "Malflood Ring",
		Back = "Hexerei Cape",
		Waist = "Lightning Belt"
	},
	Evasion = {},
	Precast = {
		Ear1 = "Loquac. Earring",
		Feet = "Rostrum Pumps",
		Ring1 = {
			Name = "Bomb Queen Ring",
			Priority = 100
		}
	},
	Casting = {
		Main = "Eremite's Wand",
		Sub = "Genbu's Shield",
		Ammo = "Hedgehog Bomb",
		Head = "Nashira Turban",
		Neck = "Willpower Torque",
		Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
		Body = "Yinyang Robe",
		Hands = "Merman's Bangles",
		Ring1 = "Sattva Ring",
		Ring2 = "Evoker's Ring",
		Back = {
			Name = "Mahatma Cape",
			Priority = 100
		},
		Waist = "Silver Obi +1",
		Legs = {
			Name = "Evoker's Spats",
			Priority = 100
		},
		Feet = {
			Name = "Mountain Gaiters",
			Priority = 100
		}
	},
	SIRD = {
		Main = "Eremite's Wand",
		Sub = "Genbu's Shield",
		Ammo = "Hedgehog Bomb",
		Head = "Nashira Turban",
		Neck = "Willpower Torque",
		Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
		Body = "Yinyang Robe",
		Hands = "Merman's Bangles",
		Ring1 = "Sattva Ring",
		Ring2 = "Evoker's Ring",
		Back = {
			Name = "Mahatma Cape",
			Priority = 100
		},
		Waist = "Silver Obi +1",
		Legs = {
			Name = "Evoker's Spats",
			Priority = 100
		},
		Feet = {
			Name = "Mountain Gaiters",
			Priority = 100
		}
	},
	Haste = {
		Head = "Nashira Turban",
		Ear1 = "Loquac. Earring",
		Hands = "Nashira Gages",
		Waist = "Swift Belt",
		Legs = "Nashira Seraweels",
		Feet = "Nashira Crackows"
	},
	ConserveMP = {
		Ammo = "Dream Sand",
		Ear2 = "Magnetic Earring",
		Back = "Maledictor's Shawl"
	},
	Cure = {
		Ammo = "Dream Sand",
		Head = "Hydra Beret",
		Neck = "Benign Necklace",
		Ear1 = "Novia Earring",
		Ear2 = "Magnetic Earring",
		Body = "Hydra Doublet",
		Hands = "Hydra Gloves",
		Ring1 = "Aqua Ring",
		Ring2 = "Communion Ring",
		Back = {
			Name = "Mahatma Cape",
			Priority = 100
		},
		Waist = "Penitent's Rope",
		Legs = "Hydra Brais",
		Feet = "Hydra Gaiters"
	},
	Cursna = {
		Back = "Altruistic Cape"
	},
	Enhancing = {
		Main = "Kirin's Pole",
		Ammo = "Hedgehog Bomb",
		Head = "Maat's Cap",
		Neck = "Enhancing Torque",
		Ear1 = "Cmn. Earring",
		Ear2 = "Cmn. Earring",
		Body = "Errant Hpl.",
		Hands = "Dvt. Mitts +1",
		Ring1 = "Aqua Ring",
		Ring2 = "Communion Ring",
		Back = "Merciful Cape",
		Waist = "Penitent's Rope",
		Legs = "Errant Slops",
		Feet = "Mahatma Pigaches"
	},
	Stoneskin = {
		Neck = "Stone Gorget",
		Back = "Prism Cape"
	},
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
	FallbackSub = {},
	BP_Delay = {
		Head = "Summoner's Horn",
		Legs = "Summoner's Spats",
		Ring2 = "Evoker's Ring",
		Ear1 = "Loquac. Earring",
		Ear2 = "Novia Earring",
		Ring1 = {
			Name = "Bomb Queen Ring",
			Priority = 100
		},
		Back = "Mahatma Cape",
		Body = "Austere Robe",
		Hands = {
			Name = "Summoner's Brcr.",
			Priority = 100
		},
		Feet = "Summoner's Pgch.",
		Ammo = "Hedgehog Bomb",
		Waist = {
			Name = "Penitent's Rope",
			Priority = -1
		},
		Neck = "Smn. Torque"
	},
	BP = {
		Head = "Evoker's Horn",
		Legs = "Evoker's Spats",
		Ring1 = {
			Name = "Sattva Ring",
			Priority = 100
		},
		Ring2 = "Evoker's Ring",
		Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
		Back = "Astute Cape",
		Body = "Summoner's Doublet",
		Hands = "Summoner's Brcr.",
		Feet = "Nashira Crackows",
		Ammo = "Hedgehog Bomb",
		Waist = {
			Name = "Hierarch Belt",
			Priority = 100
		},
		Neck = "Smn. Torque"
	},
	BP_Magical = {},
	BP_Physical = {},
	BP_Hybrid = {},
	TP = {
		Ring1 = "Jelly Ring"
	},
	TP_Mjollnir_Haste = {},
	TP_HighAcc = {
		Ring1 = {
			Name = "Bomb Queen Ring",
			Priority = 100
		}
	},
	WS = {},
	WS_HighAcc = {},
	Weapon_Loadout_1 = {},
	Weapon_Loadout_2 = {},
	Weapon_Loadout_3 = {},
	ConjurersRingHPDown = {
		Main = "Earth Staff",
		Ammo = "Hedgehog Bomb",
		Head = "Zenith Crown +1",
		Neck = "Jeweled Collar",
		Ear1 = "Novia Earring",
		Ear2 = "Hades Earring +1",
		Body = "Yinyang Robe",
		Hands = "Zenith Mitts +1",
		Ring1 = "Serket Ring",
		Ring2 = "Ether Ring",
		Back = "Umbra Cape",
		Waist = "Penitent's Rope",
		Legs = "Evoker's Spats",
		Feet = "Rostrum Pumps"
	}
};
profile.SetMacroBook = function()
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro book 2");
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro set 2");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind F9 //dia");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind F10 //dia");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 1 down /ja \"Assault\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 2 down /ja \"Retreat\" <me>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 3 down /ja \"Release\" <me>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 4 down /party Shock Strike >> <t> <call21>;/pet \"Shock Strike\" <t>");
end;
gcmage = gFunc.LoadFile("common\\gcmage.lua");
sets.carbuncles_cuffs = carbuncles_cuffs;
sets.evokers_boots = evokers_boots;
sets.warlocks_mantle = warlocks_mantle;
sets.carbuncle_mitts = carbuncle_mitts;
sets.yinyang_robe = yinyang_robe;
sets.summoners_doublet = summoners_doublet;
sets.summoners_horn = summoners_horn;
sets.conjurers_ring = conjurers_ring;
sets.bahamuts_staff = bahamuts_staff;
profile.Sets = gcmage.AppendSets(sets);
local SmnSkill = T({
	"Shining Ruby",
	"Glittering Ruby",
	"Crimson Howl",
	"Inferno Howl",
	"Frost Armor",
	"Crystal Blessing",
	"Aerial Armor",
	"Hastega II",
	"Fleet Wind",
	"Hastega",
	"Earthen Ward",
	"Earthen Armor",
	"Rolling Thunder",
	"Lightning Armor",
	"Soothing Current",
	"Ecliptic Growl",
	"Heavenward Howl",
	"Ecliptic Howl",
	"Noctoshield",
	"Dream Shroud",
	"Altana's Favor",
	"Reraise",
	"Reraise II",
	"Reraise III",
	"Raise",
	"Raise II",
	"Raise III",
	"Wind's Blessing"
});
local SmnHealing = T({
	"Healing Ruby",
	"Healing Ruby II",
	"Whispering Wind",
	"Spring Water"
});
local SmnMagical = T({
	"Searing Light",
	"Meteorite",
	"Holy Mist",
	"Inferno",
	"Fire II",
	"Fire IV",
	"Meteor Strike",
	"Conflag Strike",
	"Diamond Dust",
	"Blizzard II",
	"Blizzard IV",
	"Heavenly Strike",
	"Aerial Blast",
	"Aero II",
	"Aero IV",
	"Wind Blade",
	"Earthen Fury",
	"Stone II",
	"Stone IV",
	"Geocrush",
	"Judgement Bolt",
	"Thunder II",
	"Thunder IV",
	"Thunderstorm",
	"Thunderspark",
	"Tidal Wave",
	"Water II",
	"Water IV",
	"Grand Fall",
	"Howling Moon",
	"Lunar Bay",
	"Ruinous Omen",
	"Somnolence",
	"Nether Blast",
	"Night Terror",
	"Level ? Holy"
});
local SmnEnfeebling = T({
	"Diamond Storm",
	"Sleepga",
	"Shock Squall",
	"Slowga",
	"Tidal Roar",
	"Pavor Nocturnus",
	"Ultimate Terror",
	"Nightmare",
	"Mewing Lullaby",
	"Eerie Eye"
});
local SmnHybrid = T({
	"Flaming Crush",
	"Burning Strike"
});
local nextConjurersRingCheck = 0;
profile.HandleAbility = function()
	gcmage.DoAbility();
	gFunc.EquipSet("BP_Delay");
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
	if gcdisplay.GetCycle("TP") == "HighAcc" then
		gFunc.EquipSet("WS_HighAcc");
	end;
	gcmage.DoFenrirsEarring();
end;
profile.OnLoad = function()
	gcmage.Load();
	profile.SetMacroBook();
end;
profile.OnUnload = function()
	gcmage.Unload();
end;
profile.HandleCommand = function(args)
	gcmage.DoCommands(args, sets);
	if args[1] == "horizonmode" then
		profile.HandleDefault();
	end;
end;
profile.HandleDefault = function()
	local petAction = gData.GetPetAction();
	if petAction ~= nil then
		gFunc.EquipSet("BP");
		if SmnSkill:contains(petAction.Name) then
		elseif SmnMagical:contains(petAction.Name) then
			gFunc.EquipSet(sets.BP_Magical);
		elseif SmnHybrid:contains(petAction.Name) then
			gFunc.EquipSet(sets.BP_Hybrid);
		elseif SmnHealing:contains(petAction.Name) then
		elseif SmnEnfeebling:contains(petAction.Name) then
			gFunc.EquipSet(sets.BP_Magical);
		else
			gFunc.EquipSet(sets.BP_Physical);
		end;
	else
		local player = gData.GetPlayer();
		if conjurersRingForced and player.HP >= conjurersRingMaxHP then
			local time = os.clock();
			if time > nextConjurersRingCheck then
				nextConjurersRingCheck = time + 3;
				gFunc.ForceEquipSet("ConjurersRingHPDown");
				gFunc.ForceEquipSet("Idle");
			end;
		end;
		gcmage.DoDefault(sets, nil, nil, nil, nil, nil);
	end;
	gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()));
end;
profile.HandlePrecast = function()
	local player = gData.GetPlayer();
	if player.SubJob == "RDM" and warlocks_mantle.Back then
		gcmage.DoPrecast(sets, fastCastValue + 0.02);
		gFunc.EquipSet("warlocks_mantle");
	else
		gcmage.DoPrecast(sets, fastCastValue);
	end;
	local action = gData.GetAction();
	if action.Skill == "Summoning" then
		if carbuncles_cuffs.Hands and evokers_boots.Feet and string.match(action.Name, "Spirit") then
			gFunc.EquipSet("carbuncles_cuffs");
		else
			gFunc.EquipSet("carbuncles_cuffs");
			gFunc.EquipSet("evokers_boots");
		end;
	end;
end;
profile.HandleMidcast = function()
	gcmage.DoMidcast(sets, cureMP, cureMP, cureMP, cureMP, cureMP);
end;
return profile;
