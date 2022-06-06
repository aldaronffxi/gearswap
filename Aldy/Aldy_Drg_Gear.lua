-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Capped','Acc')
    state.WeaponskillMode:options('Match','Capped','Normal')
    state.HybridMode:options('Normal','Hybrid')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','Regain')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('Trishula','ShiningOne','Naegling','Gungnir','Pole','Quint')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    select_default_macro_book()
	
	gear.back_DA = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.back_WS = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
end

	-- Weapons sets

	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip"}
	sets.weapons.Naegling = {main="Naegling"}
	sets.weapons.Gungnir = {main="Gungnir",sub="Utu Grip"}
	sets.weapons.Pole = {main="Malignance Pole",sub="Utu Grip"}
	sets.weapons.Quint = {main="Quint Spear",sub="Utu Grip"}
		
-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon", hands="Ptero. Fin. G. +1"} 
	
	sets.precast.JA.Jump = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ptero. Mail +3",hands="Vis. Fng. Gaunt. +2",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Windbuffet Belt +1",legs="Ptero. Brais +2",feet="Ostro Greaves"}
	
	sets.precast.JA['High Jump'] = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Ptero. Mail +3",hands="Vis. Fng. Gaunt. +2",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Ptero. Brais +2",feet="Ostro Greaves"}
	
	sets.precast.JA['Soul Jump'] = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Vishap Mail +1",hands="Vis. Fng. Gaunt. +2",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Ptero. Brais +2",feet="Ostro Greaves"}
	
	sets.precast.JA['Spirit Jump'] = {ammo="Aurgelmir Orb",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Vishap Mail +1",hands="Vis. Fng. Gaunt. +2",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Windbuffet Belt +1",legs="Ptero. Brais +2",feet="Ostro Greaves"}
	
	sets.precast.JA['Ancient Circle'] = {legs="Vishap Brais +3"}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {head="Vishap Armet +1",hands="Lncr. Vmbrc. +1",ear1="Pratik Earring",feet="Ptero. Greaves +3"}
	sets.precast.JA['Call Wyvern'] = {body="Ptero. Mail +3"} 
	sets.precast.JA['Deep Breathing'] = {} 
	sets.precast.JA['Spirit Surge'] = {} 
	sets.precast.JA['Smiting Breath'] = {back=gear.back_DA}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {head="Ptero. Armet +3",neck="Dgn. Collar +2",
		body={ name="Acro Surcoat", augments={'Pet: Breath+8',}},hands={ name="Acro Gauntlets", augments={'Pet: Breath+8',}},
		back="Updraft Mantle",legs="Vishap Brais +3",feet="Ptero. Greaves +3"}
	
	sets.precast.JA['Steady Wing'] = {head="Ptero. Armet +3",neck="Dgn. Collar +2",ear1="Lancer's Earring",hands="Despair Fin. Gaunt.",
		back="Updraft Mantle",waist="Glassblower's Belt",legs="Vishap Brais +3",feet="Ptero. Greaves +3"}
	
	sets.HealingBreath = sets.precast.JA['Restoring Breath']
	
	sets.SmitingBreath = {back=gear.back_DA}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Founder's Greaves",feet="Carmine Greaves +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Despair Fin. Gaunt.",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum +1",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Sacro Breastplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Founder's Greaves",feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +1"})
	
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Vim Torque +1",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Dagon Breast.",hands={name="Acro Gauntlets", augments={'Accuracy+18 Attack+18','"Store TP"+6','STR+7 DEX+7',}},ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Ptero. Brais +2",feet="Flam. Gambieras +2"}
		
	sets.engaged.Capped = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Dgn. Collar +2",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Dagon Breast.",hands="Sulev. Gauntlets +2",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
		
	sets.engaged.Hybrid = {ammo="Coiste Bodhar",
		head="Nyame Helm",neck="Dgn. Collar +2",ear1="Sherida Earring",ear2="Crepuscular Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Moonbeam Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Dgn. Collar +2",ear1="Sherida Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Ptero. Fin. G. +3",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=gear.back_WS,waist="Sailfi Belt +1",legs="Vishap Brais +3",feet="Nyame Sollerets"}
		
	sets.precast.WS.Capped = {ammo="Knobkierrie",
		head="Gleti's Mask",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Fotia Belt",legs="Gleti's Breeches",feet="Gleti's Boots"}
		
		
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = {ammo="Coiste Bodhar",
		head="Ptero. Armet +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Dagon Breast.",hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Fotia Belt",legs="Sulev. Cuisses +2",feet="Flam. Gambieras +2"}
	
	sets.precast.WS['Stardiver'].Capped = {ammo="Crepuscular Pebble",
		head="Flam. Zucchetto +2",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Fotia Belt",legs="Gleti's Breeches",feet="Flam. Gambieras +2"}

	sets.precast.WS['Drakesbane'] = {ammo="Knobkierrie",
		head="Gleti's Mask",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Hjarrandi Breast.",hands="Gleti's Gauntlets",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.back_WS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Gleti's Boots"}
	
	sets.precast.WS['Impulse Drive'] = {ammo="Knobkierrie",
		head="Ptero. Armet +3",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Dagon Breast.",hands="Ptero. Fin. G. +3",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.back_WS,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Impulse Drive'].Capped = {ammo="Knobkierrie",
		head="Gleti's Mask",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Sherida Earring",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Epaminondas's Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}
		
	sets.precast.WS["Camlann's Torment"] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Dgn. Collar +2",ear1="Ishvara Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Ptero. Fin. G. +3",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Vishap Brais +3",feet="Nyame Sollerets"}
			
	sets.precast.WS["Camlann's Torment"].Capped = {ammo="Knobkierrie",
		head="Gleti's Mask",neck="Dgn. Collar +2",ear1="Ishvara Earring",ear2="Thrud Earring",
		body="Gleti's Cuirass",hands="Ptero. Fin. G. +3",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Gleti's Breeches",feet="Nyame Sollerets"}
	
	sets.precast.WS['Sonic Thrust'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Ptero. Fin. G. +3",ring1="Regal Ring",ring2="Niqmaddu Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Sonic Thrust'].Capped = {ammo="Knobkierrie",
		head="Gleti's Mask",neck="Dgn. Collar +2",ear1="Ishvara Earring",ear2="Thrud Earring",
		body="Gleti's Cuirass",hands="Ptero. Fin. G. +3",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Gleti's Breeches",feet="Nyame Sollerets"}
		
	sets.precast.WS['Savage Blade'] = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Nyame Mail",hands="Ptero. Fin. G. +3",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Vishap Brais +3",feet="Nyame Sollerets"}
		
	sets.precast.WS['Savage Blade'].Capped = {ammo="Knobkierrie",
		head="Gleti's Mask",neck="Dgn. Collar +2",ear1="Moonshade Earring",ear2="Thrud Earring",
		body="Gleti's Cuirass",hands="Sulev. Gauntlets +2",ring1="Regal Ring",ring2="Epaminondas's Ring",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Vishap Brais +3",feet="Gleti's Boots"}


	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Dgn. Collar +2",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Sacro Breastplate",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.back_DA,waist="Asklepian Belt",legs="Nyame Flanchard",feet="Ptero. Greaves +3"}
		
	sets.idle.RR = {ammo="Staunch Tathlum +1",
		head="Nyame Helm",neck="Dgn. Collar +2",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Crepuscular Mail",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.back_DA,waist="Asklepian Belt",legs="Nyame Flanchard",feet="Ptero. Greaves +3"}
		
	sets.idle.Regain = {ammo="Staunch Tathlum +1",
		head="Gleti's Mask",neck="Dgn. Collar +2",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
		back=gear.back_DA,waist="Asklepian Belt",legs="Gleti's Breeches",feet="Gleti's Boots"}

	
	-- Defense sets
	sets.defense.PDT = {}
		
	sets.defense.MDT = {}
				
	sets.defense.MEVA = {}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Etiolation Earring",waist="Flume Belt"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = {head=gear.th_head,hands="Volte Bracers",feet=gear.valorous_th_feet,waist=gear.th_waist}
	
 

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 6)
    elseif player.sub_job == 'BLU' then
        set_macro_page(1, 6)
    else
        set_macro_page(1, 6)
    end
end