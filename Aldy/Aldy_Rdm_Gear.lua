

function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc','Ullr','Tolba')
    state.HybridMode:options('Normal','Hybrid')
	state.CastingMode:options('Normal', 'Resistant','Fodder')
    state.IdleMode:options('Normal', 'PDT','Reraise')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Crocea Mors','Murgleis','Naegling','CroceaThib','CroceaDay','Aeolian','TPClubs','Excalibur','Karambit')
	
	
	gear.back_macc = { name="Sucellos's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10',}}
	gear.back_idle = { name="Sucellos's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}}
	gear.back_wsd = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.back_tp = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}
	gear.back_dw = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Dual Wield"+10','Phys. dmg. taken-10%',}}
	gear.back_crit = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Crit.hit rate+10','Phys. dmg. taken-10%',}}
	gear.back_nuke = { name="Sucellos's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','INT+10','"Mag.Atk.Bns."+10','Phys. dmg. taken-10%',}}

		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c cycle MagicBurstMode')
	send_command('bind ^@!` input /ja "Accession" <me>')
	send_command('bind ^backspace input /ja "Saboteur" <me>')
	send_command('bind !backspace input /ja "Spontaneity" <t>')
	send_command('bind @backspace input /ja "Composure" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind != input /ja "Penury" <me>')
	send_command('bind @= input /ja "Parsimony" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise" <me>')
	send_command('bind @f10 gs c cycle RecoverMode')
	
	select_default_macro_book()
end

function job_setup()

    state.Buff.Saboteur = buffactive.Saboteur or false
	state.Buff.Stymie = buffactive.Stymie or false
	state.Buff.Chainspell = buffactive.Chainspell or false
	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	
    LowTierNukes = S{'Stone', 'Water', 'Aero', 'Fire', 'Blizzard', 'Thunder',
        'Stone II', 'Water II', 'Aero II', 'Fire II', 'Blizzard II', 'Thunder II',
        'Stonega', 'Waterga', 'Aeroga', 'Firaga', 'Blizzaga', 'Thundaga'}
	
	state.RecoverMode = M('35%', '60%', 'Always', 'Never')
	
	autows = "Knights of Round"
	autofood = 'Pear Crepe'
	enspell = ''
	
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoNukeMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","IdleMode","Passive","RuneElement","ElementalMode","CastingMode","TreasureMode",})
end

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.weapons.Naegling = {main="Naegling",sub="Machaera +3"}
	sets.weapons.Murgleis = {main="Murgleis",sub="Machaera +3",range="Ullr",ammo="Beetle Arrow"}
	sets.weapons.DualWeapons = {main="Naegling",sub="Tauret"}
	sets.weapons.TPClubs = {main="Maxentius"}
	sets.weapons['Crocea Mors'] = {main="Crocea Mors",sub="Gleti's Knife"}
	sets.weapons.CroceaThib = {main="Crocea Mors",sub="Machaera +3"}
	sets.weapons.CroceaDay = {main="Crocea Mors",sub="Daybreak",ammo="Beetle Arrow"}
	sets.weapons.Daggers = {main="Tauret",sub="Gleti's Knife"}
	sets.weapons.Aeolian = {main="Tauret",sub="Machaera +3"}
	sets.weapons.Excalibur = {main="Excalibur",sub="Aern Sword"}
	sets.weapons.Karambit = {main="Karambit"}
	
	sets.TreasureHunter = {ammo=gear.th_ammo,head=gear.th_head,waist=gear.th_waist,hands=gear.th_hands}
	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	sets.precast.JA['Convert'] = {main="Murgleis"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	-- Need 42 FC on RDM, 32 /SCH and arts
	
	sets.precast.FC = {ammo="Impatiens",
		head="Atrophy Chapeau +2",
		body={ name="Viti. Tabard +3", augments={'Enhances "Chainspell" effect',}},
		hands="Malignance Gloves",
		legs="Malignance Tights",
		feet="Malignance Boots",
		neck="Orunmila's Torque",
		waist="Witful Belt",
		left_ear="Etiolation Earring",
		right_ear="Malignance Earring",
		left_ring="Defending Ring",
		right_ring="Lebeche Ring",
		back="Perimede Cape"}
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	--sets.precast['Elemental Magic'] = set_combine(sets.precast.FC, {main="Contemplator +1",sub="Niobid Strap"})
       
	-- Weaponskill sets
	-- Default set is for Savage Blade
	sets.precast.WS = {ammo="Regal Gem",
		head="Nyame Helm",neck="Dls. Torque +2",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Rufescent Ring",
		back=gear.back_wsd,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	
	sets.precast.WS['Savage Blade'] = {ammo="Regal Gem",
		head="Nyame Helm",neck="Dls. Torque +2",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Rufescent Ring",
		back=gear.back_wsd,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	sets.precast.WS['Aeolian Edge'] = {ammo="Pemphredo Tathlum",
		head="Nyame Helm",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Freke Ring",
		back=gear.back_wsd,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Empyreal Arrow'] = {
		head="Nyame Helm",neck="Dls. Torque +2",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Rufescent Ring",
		back=gear.back_wsd,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Sanguine Blade'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Archon Ring",
		back=gear.back_nuke,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Red Lotus Blade'] = {ammo="Pemphredo Tathlum",
		head="Pixie Hairpin +1",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Archon Ring",
		back=gear.back_nuke,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Seraph Blade'] = {ammo="Pemphredo Tathlum",
		head="Nyame Mail",neck="Sibyl Scarf",ear1="Malignance Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Archon Ring",
		back=gear.back_nuke,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Black Halo'] =  {ammo="Regal Gem",
		head="Nyame Helm",neck="Dls. Torque +2",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Rufescent Ring",
		back=gear.back_wsd,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.precast.WS['Chant Du Cygne'] = {ammo="Regal Gem",
		head="Malignance Chapeau",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Mache Earring +1",
		body="Nyame Mail",hands="Malignance Gloves",ring1="Epaminondas's Ring",ring2="Chirich Ring +1",
		back=gear.back_crit,waist="Fotia Belt",legs="Viti. Tights +3",feet="Thereoid Greaves"}
		
	sets.precast.WS['Evisceration'] = sets.precast.WS['Chant Du Cygne']
	
	sets.precast.WS['Asuran Fists'] = {ammo="Volupsa Tathlum",
		head="Viti. Chapeau +3",neck="Caro Necklace",ear1="Mache Earring +1",ear2="Mache Earring +1",
		body="Nyame Mail",hands="Atrophy Gloves +3",ring1="Epaminondas's Ring",ring2="Rufescent Ring",
		back=gear.back_wsd,waist="Sailfi Belt +1",legs="Vitiation Tights +3",feet="Malignance Boots"}
	
	-- Midcast Sets
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Ea Hat +1",neck="Mizu. Kubikazari",ear1="Regal Earring",ear2="Malignance Earring",
		body="Ea Houppe. +1",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Freke Ring",
		back=gear.back_nuke,waist="Sacro Cord",legs="Ea Slops",feet="Amalric Nails +1"}
	
	-- Overcap on FC here since it's just a base midcast set for every spell.
	sets.midcast.FastRecast = {ammo="Pemphredo Tathlum",
		head="Atrophy Chapeau +2",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Malignance Earring",
		body="Viti. Tabard +3",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.back_idle,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Kaykaus Boots +1"}

    sets.midcast.Cure = {ammo="Regal Gem",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Ephedra Ring",ring2="Stikini Ring +1",
        back=gear.back_idle,waist="Luminary Sash",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Regal Gem",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Ephedra Ring",ring2="Ephedra Stikini Ring +1",
        back=gear.back_idle,waist="Hachirin-no-Obi",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Chatoyant Staff",sub="Achaq Grip",ammo="Regal Gem",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Ephedra Ring",ring2="Stikini Ring +1",
        back=gear.back_idle,waist="Hachirin-no-Obi",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Malison Medallion",ear2="Melei Earring",
		ring1="Ephedra Ring",ring2="Ephedra Ring",waist="Bishop's Sash",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.LightWeatherCuraga = sets.midcast.LightWeatherCure
	sets.midcast.LightDayCuraga = sets.midcast.LightDayCure
	
	sets.Self_Healing = {ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {main="Colada",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		head="Telchine Cap",neck="Dls. Torque +2",ear1="Andoaa Earring",ear2="Malignance Earring",
		body="Viti. Tabard +3",hands="Atrophy Gloves +3",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Ghostfyre Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Leth. Houseaux +1"}
		
	sets.midcast['Blue Magic'] = sets.midcast['Enhancing Magic']

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = set_combine(sets.midcast['Enhancing Magic'], {head="Leth. Chappel +1",
		body="Lethargy Sayon +1",hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"})
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +1"}
	sets.midcast.Aquaveil = {head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",
		head="Telchine Cap",
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Taeon Gloves", augments={'"Regen" potency+3',}},
		legs={ name="Taeon Tights", augments={'"Regen" potency+3',}},
		feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','"Regen" potency+3',}}})
	
	sets.midcast.Enspell = set_combine(sets.midcast['Enhancing Magic'], {main="Pukulatmuj +1",sub="Forfend +1",head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Mimir Earring",
        body="Vitiation Tabard +3",hands="Viti. Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +3",feet="Lethargy Houseaux +1"})
		
	sets.midcast.Phalanx = {main="Sakpata's Sword",sub="Egeking",ammo="Staunch Tathlum +1",
		head="Taeon Chapeau",neck="Dls. Torque +2",ear1="Mimir Earring",ear2="Malignance Earring",
		body="Taeon Tabard",hands="Taeon Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Ghostfyre Cape",waist="Embla Sash",legs="Taeon Tights",feet="Taeon Boots"}
		
	sets.midcast['Phalanx II'] = {main="Colada",sub="Ammurapi Shield",ammo="Staunch Tathlum +1",
		head="Leth. Chappel +1",neck="Dls. Torque +2",ear1="Mimir Earring",ear2="Malignance Earring",
		body="Lethargy Sayon +1",hands="Atrophy Gloves +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Ghostfyre Cape",waist="Embla Sash",legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}
		
	sets.midcast['Temper II'] = sets.midcast.Enspell
	
	sets.midcast['Gain-STR'] = {hands="Viti. Gloves +3"}
	sets.midcast['Gain-MND'] = {hands="Viti. Gloves +3"}
	sets.midcast['Gain-INT'] = {hands="Viti. Gloves +3"}
	sets.midcast['Gain-DEX'] = {hands="Viti. Gloves +3"}
	sets.midcast['Gain-VIT'] = {hands="Viti. Gloves +3"}
	sets.midcast['Gain-AGI'] = {hands="Viti. Gloves +3"}
	
	sets.midcast['Enfeebling Magic'] = {main="Murgleis",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		body="Lethargy Sayon +1",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
		
	sets.midcast['Enfeebling Magic'].DW = set_combine(sets.midcast['Enfeebling Magic'], {sub="Crocea Mors"})
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Murgleis",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		body="Atrophy Tabard +3",hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
		
	sets.midcast['Enfeebling Magic'].DW.Resistant = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {sub="Crocea Mors"})
	
	--Pure skill/macc to land
	sets.midcast['Frazzle II'] = {main="Murgleis",sub="Ammurapi Shield",range="Ullr",ammo="Beetle Arrow",
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		body="Atrophy Tabard +3",hands="Kaykaus Cuffs +2",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
	
	--Enfeebling Skill to boost Distract/Frazzle3/Addle2/Poison
	
	--Distract III caps at 610 Enf. Skill 610/610
	sets.midcast['Distract III'] = set_combine(sets.midcast['Enfeebling Magic'], {main="Contemplator +1",sub="Enki Strap",
		ear1="Malignance Earring",ear2="Snotra Earring",hands="Leth. Gantherots +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		waist="Obstin. Sash",legs="Chironic Hose"})
	
	--Frazzle III caps at 625 Enf. Skill - 625/625
	sets.midcast['Frazzle III'] = set_combine(sets.midcast['Enfeebling Magic'], {main="Contemplator +1",sub="Enki Strap",
		ear1="Vor Earring",ear2="Snotra Earring",hands="Leth. Gantherots +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		waist="Obstin. Sash",legs="Psylocth Lappas"})
	
	sets.midcast['Addle II'] = sets.midcast['Frazzle III']
	
	sets.midcast['Poison II'] = sets.midcast['Frazzle III']
	
	sets.midcast.Silence = {main="Murgleis",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		body="Atrophy Tabard +3",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
		
	sets.midcast.Silence.Resistant = set_combine(sets.midcast.Silence, {sub="Crocea Mors",ring1="Stikini Ring +1",range="Ullr",ammo="Beetle Arrow"})
	sets.midcast.Silence.DW = set_combine(sets.midcast.Silence, {sub="Crocea Mors",ring1="Stikini Ring +1",range="Ullr",ammo="Beetle Arrow"})
		
	sets.midcast.Sleep = {main="Murgleis",sub="Ammurapi Shield",range="Ullr",ammo="Beetle Arrow",
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		body="Atrophy Tabard +3",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}
		
	sets.midcast['Sleep II']= sets.midcast.Sleep
	sets.midcast.Bind = sets.midcast.Sleep
	sets.midcast.Gravity = sets.midcast.Sleep
	
	sets.midcast.Inundation = {ammo="Regal Gem",
		head="Leth. Chappel +1",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Snotra Earring",
		body="Lethargy Sayon +1",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"}
	
	sets.midcast.Dispel = sets.midcast['Frazzle III']
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast.Inundation, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.Inundation, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.Inundation, sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast.Inundation, sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast.Inundation, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.Inundation, sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast.Inundation, sets.TreasureHunter)
	
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="C. Palug Crown",neck="Mizu. Kubikazari",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
		back=gear.back_nuke,waist="Sacro Cord",legs="Amalric Slops +1",feet="Amalric Nails +1"}
		
    sets.midcast['Elemental Magic'].Resistant = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Viti. Chapeau +3",neck="Incanter's Torque",ear1=none,ear2=none,
		body="Malignance Tabard",hands="Regal Cuffs",ring1=none,ring2=none,
		back=gear.back_nuke,waist="Sacro Cord",legs="Amalric Slops +1",feet="Vitiation Boots +3"}

    sets.midcast['Elemental Magic'].Fodder = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Malignance Chapeau",neck="Incanter's Torque",ear1=none,ear2=none,
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Mujin Band",ring2=none,
		back=gear.back_nuke,waist="Obstin. Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.midcast['Elemental Magic'].HighTierNuke = sets.midcast['Elemental Magic']
		
	sets.midcast.Impact = {main="Murgleis",sub="Ammurapi Shield",range="Ullr",ammo="Regal Gem",
		head=empty,neck="Dls. Torque +2",ear1="Snotra Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}

	sets.midcast['Dark Magic'] = {main="Naegling",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Atrophy Chapeau +2",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		body="Atrophy Tabard +3",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}

    sets.midcast.Drain = {main="Naegling",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Atrophy Chapeau +2",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Malignance Earring",
		body="Lethargy Sayon +1",hands="Regal Cuffs",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
		back=gear.back_macc,waist="Obstin. Sash",legs="Chironic Hose",feet="Vitiation Boots +3"}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = set_combine(sets.midcast['Frazzle II'], {head="Atrophy Chapeau +2",hands="Malignance Gloves",legs="Malignance Tights",feet="Malignance Boots",waist="Sailfi Belt",ring1="Stikini Ring +1",ring2="Stikini Ring +1"})
		
	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Enki Strap",ammo="Regal Gem",
		head="Amalric Coif",neck="Dls. Torque +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Viti. Tabard +3",hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Nyame Gauntlets",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom =  {neck="Nicander's Necklace",ring1="Purity Ring",ring2="Blenmot's Ring +1"}

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Shamash Robe",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Sheltered Ring",
		back=gear.back_idle,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
	

	-- Idle sets
	sets.idle = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Shamash Robe",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.back_idle,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.PDT = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Viti. Chapeau +3",neck="Dls. Torque +2",ear1="Etiolation Earring",ear2="Odnowa Earring +1",
		body="Shamash Robe",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.Refresh = {main="Daybreak",sub="Sacro Bulwark",ammo="Homiliary",
		head="Viti. Chapeau +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Shamash Robe",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.Reraise = set_combine(sets.midcast.idle, {body="Annoint. Kalasiris"})
	sets.idle.Town = set_combine(sets.midcast.idle, {main="Murgleis",neck="Dls. Torque +2",waist="Orpheus's Sash"})
	
	
	-- Defense sets
	sets.defense.PDT = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Dls. Torque +2",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.defense.MEVA = {main="Daybreak",sub="Sacro Bulwark",ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	sets.Kiting = {legs="Carmine Cuisses +1"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.precast.FC['Dispelga'] = set_combine(sets.precast.FC, {main="Daybreak",sub="Sors Shield"})
	sets.midcast['Dispelga'] = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak",sub="Ammurapi Shield"})

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group
--	sets.engaged = {ammo="Coiste Bodhar",
--		head="Aya. Zucchetto +2",neck="Anu Torque",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Chirich Ring +1",
--		back=gear.back_tp,waist="Windbuffet Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {sub="Sacro Bulwark",ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Hetairoi Ring",ring2="Petrov Ring",
		back=gear.back_tp,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.Tolba = {ammo="Staunch Tathlum +1",
		head="Malignance Chapeau",neck="Dls. Torque +2",ear1="Odnowa Earring +1",ear2="Malignance Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Stikini +1",
		back="Moonbeam Cape",waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}		
		
	sets.engaged.DW = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Hetairoi Ring",ring2="Chirich Ring +1",
		back=gear.back_tp,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Hybrid = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back=gear.back_tp,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.Enspell = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Digni. Earring",ear2="Sherida Earring",
		body="Viti. Tabard +3",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.back_tp,waist="Windbuffet Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Enspell = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Eabani Earring",
		body="Ayanmo Corazza +2",hands="Bunzi's Gloves",ring1="Hetairoi Ring",ring2="Chirich Ring +1",
		back=gear.back_tp,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.engaged.DW.Enspell.Hybrid = {ammo="Coiste Bodhar",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Eabani Earring",
		body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Chirich Ring +1",
		back=gear.back_tp,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'DNC' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 5)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 5)
	else
		set_macro_page(1, 5)
	end
end

function user_job_self_command(commandArgs, eventArgs)
	if commandArgs[1]:lower() == 'buffup' then
		
		if check_arts() then return end
		
		if buffactive.Composure and buffactive.Refresh and buffactive.Haste and buffactive.Regen and buffactive.Aquaveil and buffactive.Phalanx and buffactive.Stoneskin and buffactive.Blink and buffactive['INT Boost'] and buffactive.Shell and buffactive.Protect and buffactive['Shock Spikes'] and buffactive['Enthunder II'] and buffactive['Multi Strikes'] and buffactive.Barfire and buffactive.Barparalyze then
			buffup = false
			add_to_chat(217, 'All buffs are currently up!')
			return
		elseif not (player.status == 'Idle' or player.status == 'Engaged') then
			buffup = false
			return
		end
		
		buffup = true
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if not buffactive.Composure then
			local abil_recasts = windower.ffxi.get_ability_recasts()
			if abil_recasts[50] == 0 then
				windower.chat.input('/ja "Composure" <me>')
			else
				buffup = false
				add_to_chat(123,'Abort: Composure not ready.')
			end
			return
		elseif not buffactive.Refresh and spell_recasts[894] == 0 then
			windower.chat.input('/ma "Refresh III" <me>')
		elseif not buffactive.Haste and spell_recasts[511] == 0 then
			windower.chat.input('/ma "Haste II" <me>')
		elseif not buffactive.Regen and spell_recasts[110] == 0 then
			windower.chat.input('/ma "Regen II" <me>')
		elseif not buffactive.Aquaveil and spell_recasts[55] == 0 then
			windower.chat.input('/ma "Aquaveil" <me>')
		elseif not buffactive.Phalanx and spell_recasts[106] == 0 then
			windower.chat.input('/ma "Phalanx" <me>')
		elseif not buffactive.Stoneskin and spell_recasts[54] == 0 then
			windower.chat.input('/ma "Stoneskin" <me>')
		elseif not buffactive.Blink and spell_recasts[53] == 0 then
			windower.chat.input('/ma "Blink" <me>')
		elseif not buffactive['INT Boost'] and spell_recasts[490] == 0 then
			windower.chat.input('/ma "Gain-INT" <me>')
		elseif not buffactive.Shell and spell_recasts[52] == 0 then
			windower.chat.input('/ma "Shell V" <me>')
		elseif not buffactive.Protect and spell_recasts[47] == 0 then
			windower.chat.input('/ma "Protect V" <me>')
		elseif not buffactive['Shock Spikes'] and spell_recasts[251] == 0 then
			windower.chat.input('/ma "Shock Spikes" <me>')
		elseif not buffactive['Enthunder II'] and spell_recasts[316] == 0 then
			windower.chat.input('/ma "Enthunder II" <me>')
		elseif not buffactive['Multi Strikes'] and spell_recasts[895] == 0 then
			windower.chat.input('/ma "Temper II" <me>')
		elseif not buffactive.Barfire and spell_recasts[60] == 0 then
			windower.chat.input('/ma "Barfire" <me>')
		elseif not buffactive.Barparalyze and spell_recasts[74] == 0 then
			windower.chat.input('/ma "Barparalyze" <me>')
		end
	end
end