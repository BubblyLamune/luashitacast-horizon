local profile = {};
local fastCastValue = 0.42;
local ninSJMaxMP = 583;
local whmSJMaxMP = 661;
local blmSJMaxMP = 680;
local drkSJMaxMP = 604;
local verm_cloak = false;
local fencersRingForced = false;
local fencersRingMaxHP = 907;
local blue_cotehardie = {};
local blue_cotehardie_plus_one = {};
local dilation_ring = {
	Ring2 = "Dilation Ring"
};
local tp_fencers_ring = {
--	Ring1 = "Fencer's Ring"
};
local sets = {
	Idle = {
		Main = "Earth Staff",
		Head = {
			Name = "Duelist's Chapeau",
			Priority = 100
		},
		Neck = "Jeweled Collar",
		Ear1 = "Geist Earring",
		Ear2 = "Geist Earring",
		Body = "Duelist's Tabard",
		Hands = "Duelist's Gloves",
		Ring1 = "Tamas Ring",
		Ring2 = "Ether Ring",
		Back = "Prism Cape",
		Waist = "Penitent's Rope",
		Legs = "Nashira Seraweels",
		Feet = "Duelist's Boots"
	},
	IdleALT = {},
	IdleMaxMP = {
		Main = "Earth Staff",
		Range = "displaced",
		Ammo = "Hedgehog Bomb",
		Head = "Duelist's Chapeau",
		-- Neck = "Uggalepih Pendant",
		-- Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
		Body = "Duelist's Tabard",
		-- Hands = "Blood Fng. Gnt.",
		-- Ring1 = "Serket Ring",
		-- Ring2 = "Sattva Ring",
		Back = "Umbra Cape",
		Waist = "Hierarch Belt",
		Legs = "Crimson Cuisses",
		-- Feet = "Blood Greaves"
	},
	Resting = {
		Main = "Dark Staff",
		Head = "Duelist's Chapeau",
		Neck = "Checkered Scarf",
		Ear1 = "Relaxing Earring",
		Ear2 = "Magnetic Earring",
		Body = "Errant Hpl.",
		Hands = "Hydra Gloves",
		Back = "Mahatma Cape",
		Waist = "Duelist's Belt",
		Legs = "Baron's Slops",
		Feet = "Hydra Gaiters"
	},
	Town = {},
	Movement = {
		Head = "Duelist's Chapeau",
		Legs = "Crimson Cuisses"
	},
	Movement_TP = {
        -- Hands = 'Dst. Mittens +1',
        -- Feet = 'Dst. Leggings +1',
    },
	DT = {
		Main = "Earth Staff",
		Head = {
			Name = "Duelist's Chapeau",
			Priority = 100
		},
		Neck = "Jeweled Collar",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Body = "Darksteel Harness",
		Hands = "Dst. Mittens +1",
		Ring1 = "Jelly Ring",
		Ring2 = "Sattva Ring",
		Back = "Umbra Cape",
		Waist = {
			Name = "Hierarch Belt",
			Priority = 100
		},
		Legs = "Dst. Subligar +1",
		Feet = "Dst. Leggings +1"
	},
	DTNight = {
		Main = "Earth Staff",
		Range = "Arco de Velocidad",
		Ammo = "displaced",
		Head = {
			Name = "Duelist's Chapeau",
			Priority = 100
		},
		Neck = "Jeweled Collar",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Body = "Darksteel Harness",
		Hands = "Dst. Mittens +1",
		Ring1 = "Jelly Ring",
		Ring2 = "Sattva Ring",
		Back = "Umbra Cape",
		Waist = {
			Name = "Hierarch Belt",
			Priority = 100
		},
		Legs = "Crimson Cuisses",
		Feet = "Dst. Leggings +1"
	},
	MDT = {
		Main = "Earth Staff",
		Range = "Arco de Velocidad",
		Ammo = "displaced",
		Head = {
			Name = "Duelist's Chapeau",
			Priority = 100
		},
		Neck = "Jeweled Collar",
		Ear1 = "Merman's Earring",
		Ear2 = "Merman's Earring",
		Body = "Cor. Scale Mail +1",
		Hands = "Merman's Bangles",
		Ring1 = "Shadow Ring",
		Ring2 = "Sattva Ring",
		Back = "Hexerei Cape",
		Waist = {
			Name = "Hierarch Belt",
			Priority = 100
		},
		Legs = "Coral Cuisses +1",
		Feet = "Coral Greaves +1"
	},
	FireRes = {
		Main = "Water Staff",
		Range = "Arco de Velocidad",
		Ammo = "displaced",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Ear1 = "Cmn. Earring",
		Ear2 = "Cmn. Earring",
		Body = "Scp. Breastplate",
		Hands = "Tarasque Mitts +1",
		Ring1 = "Triumph Ring",
		Ring2 = "Malflame Ring",
		Back = "Dino Mantle",
		Waist = "Water Belt",
		Legs = "Crimson Cuisses",
		Feet = "Power Sandals"
	},
	IceRes = {
		Main = "Fire Staff",
		Range = "Arco de Velocidad",
		Ammo = "displaced",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Ear1 = "Diamond Earring",
		Ear2 = "Omn. Earring",
		Body = "Northern Jerkin",
		Hands = "Feral Gloves",
		Ring1 = "Omniscient Ring",
		Ring2 = "Malfrost Ring",
		Back = "Aurora Mantle +1",
		Waist = "Fire Belt",
		Legs = "Feral Trousers",
		Feet = "Blood Greaves"
	},
	LightningRes = {
		Main = "Earth Staff",
		Range = "Lightning Bow +1",
		Ammo = "displaced",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Ear1 = "Robust Earring",
		Ear2 = "Robust Earring",
		Body = "Darksteel Harness",
		Hands = "Dst. Mittens +1",
		Ring1 = "Spinel Ring",
		Ring2 = "Malflash Ring",
		Back = "Lightning Mantle",
		Waist = "Earth Belt",
		Legs = "Crimson Cuisses",
		Feet = "Dst. Leggings +1"
	},
	EarthRes = {
		Main = "Wind Staff",
		Range = "Arco de Velocidad",
		Ammo = "displaced",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Ear1 = "Robust Earring",
		Ear2 = "Robust Earring",
		Body = "Gaia Doublet",
		Hands = "Merman's Bangles",
		Ring1 = "Robust Ring",
		Ring2 = "Maldust Ring",
		Back = "Beak Mantle +1",
		Waist = "Wind Belt",
		Legs = "Beak Trousers +1",
		Feet = "Blood Greaves"
	},
	WindRes = {
		Main = "Ice Staff",
		Range = "Arco de Velocidad",
		Ammo = "displaced",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Ear1 = "Diamond Earring",
		Ear2 = "Omn. Earring",
		Body = "Northern Jerkin",
		Hands = "Mage's Cuffs",
		Ring1 = "Emerald Ring",
		Ring2 = "Malgust Ring",
		Back = "Aurora Mantle +1",
		Waist = "Ice Belt",
		Legs = "Coral Cuisses +1",
		Feet = "Blood Greaves"
	},
	WaterRes = {
		Main = "Thunder Staff",
		Range = "Arco de Velocidad",
		Ammo = "displaced",
		Head = "Black Ribbon",
		Neck = "Jeweled Collar",
		Ear1 = "Cmn. Earring",
		Ear2 = "Cmn. Earring",
		Body = "Cor. Scale Mail +1",
		Hands = "Coral Fng. Gnt. +1",
		Ring1 = "Communion Ring",
		Ring2 = "Malflood Ring",
		Back = "Hexerei Cape",
		Waist = "Lightning Belt",
		Legs = "Crimson Cuisses",
		Feet = "Coral Greaves +1"
	},
	Evasion = {},
	Precast = {
		Head = "Warlock's Chapeau",
		Ear1 = "Loquac. Earring",
		Body = "Duelist's Tabard"
	},
	Casting = {
		Main = {
			Name = "Eremite's Wand",
			Priority = 100
		},
		Sub = "Genbu's Shield",
		Range = "displaced",
		Ammo = {
			Name = "Hedgehog Bomb",
			Priority = 100
		},
		Head = "Nashira Turban",
		Neck = "Willpower Torque",
		Ear1 = "Merman's Earring",
		Ear2 = {
			Name = "Magnetic Earring",
			Priority = 100
		},
		Body = {
			Name = "Wlk. Tabard +1",
			Priority = 90
		},
		Hands = "Dst. Mittens +1",
		Ring1 = "Jelly Ring",
		Ring2 = "Sattva Ring",
		Back = "Umbra Cape",
		Waist = "Silver Obi +1",
		Legs = "Dst. Subligar +1",
		Feet = "Mountain Gaiters"
	},
	SIRD = {
		Main = {
			Name = "Eremite's Wand",
			Priority = 100
		},
		Sub = "Genbu's Shield",
		Range = "displaced",
		Ammo = {
			Name = "Hedgehog Bomb",
			Priority = 100
		},
		Head = "Nashira Turban",
		Neck = "Willpower Torque",
		Ear1 = "Merman's Earring",
		Ear2 = {
			Name = "Magnetic Earring",
			Priority = 100
		},
		Body = {
			Name = "Wlk. Tabard +1",
			Priority = 90
		},
		Hands = "Dst. Mittens +1",
		Ring1 = "Jelly Ring",
		Ring2 = "Sattva Ring",
		Back = "Umbra Cape",
		Waist = "Silver Obi +1",
		Legs = "Dst. Subligar +1",
		Feet = "Mountain Gaiters"
	},
	Haste = {
		Head = "Warlock's Chapeau",
		Ear1 = "Loquac. Earring",
		Body = {
			Name = "Duelist's Tabard",
			Priority = -1
		},
		Hands = "Dusk Gloves +1",
		Waist = "Swift Belt",
		Legs = "Nashira Seraweels",
		Feet = "Dusk Ledelsens +1"
	},
	ConserveMP = {
		Ammo = "Dream Sand",
		Ear2 = "Magnetic Earring",
		Back = "Maledictor's Shawl"
	},
	Hate = {
		Ammo = "Phtm. Tathlum",
		Head = "Rival Ribbon",
		Neck = "Harmonia's Torque",
		Ear1 = "Eris' Earring",
		Ear2 = "Hades Earring +1",
		Body = "Duelist's Tabard",
		Hands = "Dusk Gloves +1",
		Ring1 = "Mermaid Ring",
		Ring2 = "Sattva Ring",
		Back = "Toreador's Cape",
		Waist = "Warwolf Belt",
		Legs = "Nashira Seraweels",
		Feet = "Heroic Boots"
	},
	Cheat_C3HPDown = {
		Main = "Eremite's Wand",
		Sub = "Genbu's Shield",
		Ammo = "Tiphia Sting",
		Head = "Nashira Turban",
		Neck = "Willpower Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Magnetic Earring",
		Body = "Wlk. Tabard +1",
		Hands = "Dst. Mittens +1",
		Ring1 = "Serket Ring",
		Ring2 = "Sattva Ring",
		Back = "Umbra Cape",
		Waist = "Silver Obi +1",
		Legs = "Dst. Subligar +1",
		Feet = "Mountain Gaiters"
	},
	Cheat_C4HPDown = {
		Main = "Eremite's Wand",
		Sub = "Genbu's Shield",
		Ammo = "Tiphia Sting",
		Head = "Zenith Crown +1",
		Neck = "Willpower Torque",
		Ear1 = "Merman's Earring",
		Ear2 = "Magnetic Earring",
		Body = "Wlk. Tabard +1",
		Hands = "Zenith Mitts +1",
		Ring1 = "Ether Ring",
		Ring2 = "Serket Ring",
		Back = "Umbra Cape",
		Waist = "Penitent's Rope",
		Legs = "Dst. Subligar +1",
		Feet = "Mahatma Pigaches"
	},
	Cheat_HPUp = {
		Main = "Light Staff",
		Sub = "remove",
		Ammo = "Happy Egg",
		Head = "Rival Ribbon",
		Neck = "Harmonia's Torque",
		Ear1 = "Eris' Earring",
		Ear2 = "Hades Earring +1",
		Body = "Duelist's Tabard",
		Hands = "Blood Fng. Gnt.",
		Ring1 = "Bomb Queen Ring",
		Ring2 = "Sattva Ring",
		Back = "Toreador's Cape",
		Waist = "Warwolf Belt",
		Legs = "Crimson Cuisses",
		Feet = "Heroic Boots"
	},
	Cure = {
		Ammo = "Dream Sand",
		Head = "Hydra Beret",
		Neck = "Benign Necklace",
		Ear1 = "Novia Earring",
		Ear2 = "Magnetic Earring",
		Body = {
			Name = "Hydra Doublet",
			Priority = 100
		},
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
		Body = "Duelist's Tabard",
		Legs = "Wlk. Tights +1",
		Back = "Altruistic Cape"
	},
	Enhancing = {
		Main = "Water Staff",
		Ammo = {
			Name = "Hedgehog Bomb",
			Priority = 100
		},
		Head = {
			Name = "Warlock's Chapeau",
			Priority = 100
		},
		Neck = "Enhancing Torque",
		Ear1 = {
			Name = "Loquac. Earring",
			Priority = 100
		},
		Ear2 = {
			Name = "Magnetic Earring",
			Priority = 100
		},
		Body = "Glamor Jupon",
		Hands = {
			Name = "Dls. Gloves +1",
			Priority = 100
		},
		Ring1 = "Aqua Ring",
		Ring2 = "Communion Ring",
		Back = {
			Name = "Merciful Cape",
			Priority = 100
		},
		Waist = "Swift Belt",
		Legs = {
			Name = "Wlk. Tights +1",
			Priority = 100
		},
		Feet = "Dusk Ledelsens +1"
	},
	Stoneskin = {
		Main = "Eremite's Wand",
		Sub = "Genbu's Shield",
		Ammo = "Dream Sand",
		Neck = "Stone Gorget",
		Body = "Errant Hpl.",
		Hands = "Dusk Gloves +1",
		Back = "Maledictor's Shawl"
	},
	Spikes = {
		Main = "Ice Staff",
		Ammo = "Phtm. Tathlum",
		Head = {
			Name = "Warlock's Chapeau",
			Priority = 100
		},
		Neck = "Enhancing Torque",
		Ear1 = "Novio Earring",
		Ear2 = "Moldavite Earring",
		Body = "Errant Hpl.",
		Hands = "Dls. Gloves +1",
		Ring1 = "Snow Ring",
		Ring2 = "Omniscient Ring",
		Back = {
			Name = "Merciful Cape",
			Priority = 100
		},
		Waist = "Penitent's Rope",
		Legs = {
			Name = "Wlk. Tights +1",
			Priority = 100
		},
		Feet = {
			Name = "Dls. Boots +1",
			Priority = 100
		}
	},
	Enfeebling = {
		Head = "Duelist's Chapeau",
		Body = "Errant Hpl.",
		Back = "Prism Cape",
		Waist = {
			Name = "Penitent's Rope",
			Priority = 100
		},
		Legs = "Errant Slops",
		Hands = "Nashira Gages",
		Feet = "Nashira Crackows"
	},
	EnfeeblingMND = {
		Ammo = {
			Name = "Hedgehog Bomb",
			Priority = 100
		},
		Neck = "Faith Torque",
		Ear1 = "Cmn. Earring",
		Ear2 = "Cmn. Earring",
		Hands = {
			Name = "Dvt. Mitts +1",
			Priority = 100
		},
		Ring1 = "Aqua Ring",
		Ring2 = "Communion Ring",
		Feet = "Mahatma Pigaches"
	},
	EnfeeblingINT = {
		Ammo = "Phtm. Tathlum",
		Neck = "Prudence Torque",
		Ear1 = "Abyssal Earring",
		Ear2 = "Omn. Earring",
		Hands = {
			Name = "Mahatma Cuffs",
			Priority = 100
		},
		Ring1 = "Snow Ring",
		Ring2 = "Omniscient Ring",
		Feet = "Wise Pigaches +1"
	},
	EnfeeblingACC = {
		Neck = "Enfeebling Torque",
		Body = {
			Name = "Wlk. Tabard +1",
			Priority = 100
		},
		Ear2 = "Enfeebling Earring",
		Back = {
			Name = "Altruistic Cape",
			Priority = 100
		},
		Legs = "Nashira Seraweels"
	},
	Divine = {},
	Banish = {},
	Dark = {
		Ammo = "Phtm. Tathlum",
		Head = "Nashira Turban",
		Neck = "Dark Torque",
		Ear1 = "Abyssal Earring",
		Ear2 = "Dark Earring",
		Body = "Nashira Manteel",
		Hands = {
			Name = "Blood Fng. Gnt.",
			Priority = 100
		},
		Ring1 = "Snow Ring",
		Ring2 = "Omniscient Ring",
		Back = {
			Name = "Merciful Cape",
			Priority = 100
		},
		Waist = "Penitent's Rope",
		Legs = "Errant Slops",
		Feet = "Nashira Crackows"
	},
	Nuke = {
		Ammo = "Phtm. Tathlum",
		Head = {
			Name = "Warlock's Chapeau",
			Priority = 100
		},
		Neck = "Elemental Torque",
		Ear1 = "Novio Earring",
		Ear2 = "Moldavite Earring",
		Body = "Errant Hpl.",
		Hands = {
			Name = "Zenith Mitts +1",
			Priority = 100
		},
		Ring1 = "Snow Ring",
		Ring2 = "Omniscient Ring",
		Back = {
			Name = "Prism Cape",
			Priority = 100
		},
		Waist = "Penitent's Rope",
		Legs = "Errant Slops",
		Feet = {
			Name = "Dls. Boots +1",
			Priority = 100
		}
	},
	NukeACC = {
		Back = {
			Name = "Merciful Cape",
			Priority = 100
		},
		Legs = {
			Name = "Dls. Tights +1",
			Priority = 100
		},
		Feet = "Nashira Crackows"
	},
	NukeDOT = {
		Ear1 = "Abyssal Earring",
		Ear2 = "Omn. Earring",
		Hands = {
			Name = "Mahatma Cuffs",
			Priority = 100
		},
		Back = {
			Name = "Merciful Cape",
			Priority = 100
		},
		Legs = {
			Name = "Dls. Tights +1",
			Priority = 100
		},
		Feet = "Nashira Crackows"
	},
	Convert = {
		Main = "Light Staff",
		Ammo = "Hedgehog Bomb",
		Head = "Faerie Hairpin",
		Neck = "Uggalepih Pendant",
		Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
		Body = "Hydra Doublet",
		Hands = "Zenith Mitts +1",
		Ring1 = "Ether Ring",
		Ring2 = "Serket Ring",
		Back = "Mahatma Cape",
		Waist = "Hierarch Belt",
		Legs = "Crimson Cuisses",
		Feet = "Blood Greaves"
	},
	ConvertOOR = {
		Main = "Light Staff",
		Ammo = "Hedgehog Bomb",
		Head = "Faerie Hairpin",
		Neck = "Rep.Gold Medal",
		Ear1 = "Loquac. Earring",
		Ear2 = "Magnetic Earring",
		Body = "Hydra Doublet",
		Hands = "Zenith Mitts +1",
		Ring1 = "Ether Ring",
		Ring2 = "Serket Ring",
		Back = "Mahatma Cape",
		Waist = "Hierarch Belt",
		Legs = "Crimson Cuisses",
		Feet = "Blood Greaves"
	},
	Stun = {
		Main = "Thunder Staff",
		Ammo = "Phtm. Tathlum",
		Head = "Warlock's Chapeau",
		Neck = "Dark Torque",
		Ear1 = "Loquac. Earring",
		Ear2 = "Abyssal Earring",
		Body = "Duelist's Tabard",
		Hands = "Dusk Gloves +1",
		Ring1 = "Snow Ring",
		Ring2 = "Omniscient Ring",
		Back = "Merciful Cape",
		Waist = "Swift Belt",
		Legs = "Nashira Seraweels",
		Feet = "Dusk Ledelsens +1"
	},
	StunACC = {
		Main = "Thunder Staff",
		Ammo = "Phtm. Tathlum",
		Head = "Nashira Turban",
		Neck = "Dark Torque",
		Ear1 = "Abyssal Earring",
		Ear2 = "Dark Earring",
		Body = "Nashira Manteel",
		Hands = "Blood Fng. Gnt.",
		Ring1 = "Snow Ring",
		Ring2 = "Omniscient Ring",
		Back = "Merciful Cape",
		Waist = "Penitent's Rope",
		Legs = "Errant Slops",
		Feet = "Nashira Crackows"
	},
	TP = {
		Head = "Duelist's Chapeau",
		Neck = "Jeweled Collar",
		Ear1 = "Knight's Earring",
		Ear2 = "Merman's Earring",
		Body = "Scp. Harness +1",
		Hands = "Dusk Gloves",
		Ring1 = "Toreador's Ring",
		Ring2 = "Toreador's Ring",
		Back = "Amemet Mantle",
		Waist = "Swift Belt",
		Legs = "Nashira Seraweels",
		Feet = "Dusk Ledelsens"
	},
	TP_Mjollnir_Haste = {},
	TP_HighAcc = {
		Head = "Optical Hat",
		Hands = "Hydra Gloves",
		Waist = "Life Belt",
		Legs = "Hydra Brais",
		Feet = "Hydra Gaiters"
	},
	TP_NIN = {
		Ear1 = "Brutal Earring",
		Ear2 = "Stealth Earring"
	},
	WS = {
		Head = "Optical Hat",
		Ear2 = "Merman's Earring",
		Body = "Assault Jerkin",
		Hands = "Tarasque Mitts +1",
		Waist = "Warwolf Belt",
		Legs = "Hydra Brais",
		Feet = "Rutter Sabatons"
	},
	WS_HighAcc = {
		Body = "Hydra Doublet",
		Hands = "Hydra Gloves",
		Waist = "Life Belt",
		Feet = "Hydra Gaiters"
	},
	WS_Soil = {
		Neck = "Soil Gorget"
	},
	WS_Evisceration = {
		Hands = "Custom F Gloves"
	},
	WS_Spirits = {},
	WS_Energy = {
		Head = "Zenith Crown +1",
		Ear1 = "Cmn. Earring",
		Ear2 = "Cmn. Earring",
		Neck = "Faith Torque",
		Body = "Errant Hpl.",
		Hands = "Dvt. Mitts +1",
		Ring1 = "Aqua Ring",
		Ring2 = "Communion Ring",
		Back = "Prism Cape",
		Waist = "Penitent's Rope",
		Legs = "Errant Slops",
		Feet = "Mahatma Pigaches"
	},
	LockSet1 = {},
	LockSet2 = {},
	LockSet3 = {},
	Weapon_Loadout_1 = {
		Main = "Joyeuse",
		Sub = "Genbu's Shield",
	},
	Weapon_Loadout_2 = {
		Main = "Joyeuse",
		Sub = "Octave Club",
		Range = "Lightning Bow +1",
		Ammo = "displaced"
	},
	Weapon_Loadout_3 = {
		Main = "Joyeuse",
		Sub = "Genbu's Shield",
		Range = "Lightning Bow +1",
		Ammo = "displaced"
	},
	FencersRingHPDown = {
		Range = "Lightning Bow +1",
		Head = "Zenith Crown +1",
		Neck = "Jeweled Collar",
		Ear1 = "Novia Earring",
		Ear2 = "Hades Earring +1",
		Body = "Assault Jerkin",
		Hands = "Zenith Mitts +1",
		Ring1 = "Serket Ring",
		Ring2 = "Ether Ring",
		Back = "Umbra Cape",
		Waist = "Penitent's Rope",
		Legs = "Dst. Subligar +1",
		Feet = "Mahatma Pigaches"
	}
,
    ['fourty'] = {
        Main = 'Earth Staff',
        Ammo = 'Mille. Sachet',
        Head = 'Duelist\'s Chapeau',
        Neck = 'Jeweled Collar',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Duelist\'s Tabard',
        Hands = 'Duelist\'s Gloves',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Ether Ring',
        Back = 'Prism Cape',
        Waist = 'Penitent\'s Rope',
        Legs = 'Nashira Seraweels',
        Feet = 'Duelist\'s Boots',
    },
    ['sixty'] = {
        Main = 'Earth Staff',
        Ammo = 'Mille. Sachet',
        Head = 'Warlock\'s Chapeau',
        Neck = 'Checkered Scarf',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Warlock\'s Tabard',
        Hands = 'Warlock\'s Gloves',
        Ring1 = 'Ether Ring',
        Ring2 = 'Tamas Ring',
        Back = 'Red Cape +1',
        Waist = 'Penitent\'s Rope',
        Legs = 'Warlock\'s Tights',
        Feet = 'Warlock\'s Boots',
    },
    ['forty'] = {
        Main = 'Eremite\'s Wand',
        Sub = 'Hatchling Shield',
        Ammo = 'Mille. Sachet',
        Head = 'Emperor Hairpin',
        Neck = 'Spike Necklace',
        Ear1 = 'Geist Earring',
        Ear2 = 'Geist Earring',
        Body = 'Custom Vest',
        Hands = 'Custom F Gloves',
        Ring1 = 'Tamas Ring',
        Ring2 = 'Ether Ring',
        Waist = 'Warrior\'s Belt +1',
        Legs = 'Custom Pants',
        Feet = 'Custom F Boots',
    }};
profile.SetMacroBook = function()
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro book 1");
	(AshitaCore:GetChatManager()):QueueCommand(1, "/macro set 1");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind F9 //dia");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind F10 //stun");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 1 down /ma \"Cure II\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 2 down /ma \"Cure III\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 3 down /ma \"Cure IV\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 4 down /ma \"Regen\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 5 down /ma \"Haste\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 6 down /ma 'refresh' <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 7 down /ma \"Dia II\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 8 down /ma \"Paralyze\" <t>");
	(AshitaCore:GetChatManager()):QueueCommand(-1, "/bind 9 down /ma \"Slow\" <t>");
end;
gcmage = gFunc.LoadFile("common\\gcmage.lua");
sets.blue_cotehardie = blue_cotehardie;
sets.blue_cotehardie_plus_one = blue_cotehardie_plus_one;
sets.dilation_ring = dilation_ring;
sets.tp_fencers_ring = tp_fencers_ring;
profile.Sets = gcmage.AppendSets(sets);
local nextFencersRingCheck = 0;
profile.HandleAbility = function()
	gcmage.DoAbility();
end;
profile.HandleItem = function()
	gcinclude.DoItem();
end;
profile.HandlePreshot = function()
end;
profile.HandleMidshot = function()
end;
profile.HandleWeaponskill = function()
	local action = gData.GetAction();
	gFunc.EquipSet(sets.WS);
	if gcdisplay.GetCycle("TP") == "HighAcc" then
		gFunc.EquipSet("WS_HighAcc");
	end;
	gcmage.DoFenrirsEarring();
	if action.Name == "Savage Blade" or action.Name == "Vorpal Blade" or action.Name == "Swift Blade" then
		gFunc.EquipSet(sets.WS_Soil);
	end;
	if action.Name == "Evisceration" then
		gFunc.EquipSet(sets.WS_Soil);
		gFunc.EquipSet(sets.WS_Evisceration);
	end;
	if action.Name == "Energy Drain" or action.Name == "Energy Steal" then
		gFunc.EquipSet(sets.WS_Energy);
	end;
	if action.Name == "Spirits Within" then
		gFunc.EquipSet(sets.WS_Spirits);
	end;
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
	local player = gData.GetPlayer();
	if fencersRingForced and gcdisplay.GetCycle("TP") ~= "Off" and player.HP > fencersRingMaxHP and player.Status == "Engaged" then
		local time = os.clock();
		if time > nextFencersRingCheck then
			nextFencersRingCheck = time + 2;
			gFunc.ForceEquipSet("FencersRingHPDown");
			gFunc.ForceEquipSet("TP");
		end;
	end;
    gcmage.DoDefault(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP)
	if player.MP <= 40 then
		gFunc.EquipSet("blue_cotehardie");
	end;
	if player.MP <= 50 then
		gFunc.EquipSet("blue_cotehardie_plus_one");
	end;
	if verm_cloak and player.MP <= 75 then
		gFunc.Equip("Head", "");
		gFunc.Equip("Body", "Vermillion Cloak");
	end;
	gFunc.EquipSet(gcinclude.BuildLockableSet(gData.GetEquipment()));
end;
profile.HandlePrecast = function()
	gcmage.DoPrecast(sets, fastCastValue);
end;
profile.HandleMidcast = function()
	gcmage.DoMidcast(sets, ninSJMaxMP, whmSJMaxMP, blmSJMaxMP, nil, drkSJMaxMP);
	local action = gData.GetAction();
	if action.Name == "Haste" or action.Name == "Refresh" then
		gFunc.EquipSet("dilation_ring");
	end;
end;
return profile;
