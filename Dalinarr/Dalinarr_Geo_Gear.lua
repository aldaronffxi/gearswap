function user_setup()

	-- Options: Override default values
    state.OffenseMode:options('Normal')
	state.CastingMode:options('Normal', 'Resistant', 'Fodder', 'Proc')
    state.IdleMode:options('Normal', 'PDT', 'TPEat')
	state.PhysicalDefenseMode:options('PDT', 'NukeLock', 'GeoLock', 'PetPDT')
	state.MagicalDefenseMode:options('MDT', 'NukeLock')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Maxentius','Idris')

	gear.nuke_jse_back = { name="Nantosuelta's Cape", augments={'INT+1','Mag. Acc+20 /Mag. Dmg.+20','INT+9','"Mag.Atk.Bns."+10',}}
	gear.idle_jse_back = {name="Nantosuelta's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Pet: "Regen"+10','Pet: "Regen"+5',}}
	gear.fc_jse_back = { name="Nantosuelta's Cape", augments={'MND+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10',}}
	gear.tp_back = { name="Nantosuelta's Cape", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Pet: Damage taken -5%',}}
	gear.wsd_back = { name="Nantosuelta's Cape", augments={'MND+20','Accuracy+20 Attack+20','MND+10','Weapon skill damage +10%','Pet: Damage taken -5%',}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	gear.obi_low_nuke_back = gear.nuke_jse_back
	gear.obi_low_nuke_waist = "Sekhmet Corset"

	gear.obi_high_nuke_back = gear.nuke_jse_back
	gear.obi_high_nuke_waist = "Refoccilation Stone"
	
	autoindi = 'Fury'
	autoentrust = 'Haste'
	autogeo = 'Frailty'
	
	-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` input /ja "Full Circle" <me>')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind ^backspace input /ja "Entrust" <me>')
	send_command('bind !backspace input /ja "Life Cycle" <me>')
	send_command('bind @backspace input /ma "Sleep II" <t>')
	send_command('bind ^delete input /ma "Aspir III" <t>')
	send_command('bind @delete input /ma "Sleep" <t>')
	
	indi_duration = 290
	
	select_default_macro_book()
end

function init_gear_sets()
	
	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Precast sets to enhance JAs
	sets.precast.JA.Bolster = {body="Bagua Tunic +1"}
	sets.precast.JA['Life Cycle'] = {body="Geomancy Tunic +2",back=gear.idle_jse_back}
	sets.precast.JA['Radial Arcana'] = {feet="Bagua Sandals"}
	sets.precast.JA['Mending Halation'] = {legs="Bagua Pants"}
	sets.precast.JA['Full Circle'] = {head="Azimuth Hood +1"}
	
	-- Indi Duration in slots that would normally have skill here to make entrust more efficient.
	sets.buff.Entrust = {}
	
	-- Relic hat for Blaze of Glory HP increase.
	sets.buff['Blaze of Glory'] = {}
	
	-- Fast cast sets for spells
	-- Need 65 with /RDM 33

	sets.precast.FC = {main="Idris",ammo="Impatiens",
		head="Nahtirah Hat",neck="",ear1="",ear2="",
		body="Zendik Robe",hands="",ring1="Kishar Ring",ring2="",
		back="Lifestream Cape",waist="Witful Belt",legs="Geomancy Pants +2",feet="Navon Crackows"}

	sets.precast.FC.Geomancy = set_combine(sets.precast.FC, {range="Dunna",ammo=empty})
	
    sets.precast.FC['Elemental Magic'] = set_combine(sets.precast.FC, {hands="Mallquis Cuffs +1"})

	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})
		
	sets.precast.FC.Curaga = sets.precast.FC.Cure
	
	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})

	sets.precast.FC.Impact = {ammo="Impatiens",
		head=empty,neck="",ear1="",ear2="",
		body="Twilight Cloak",hands="",ring1="Kishar Ring",ring2="",
		back="",waist="Witful Belt",legs="Geomancy Pants +2",feet="Regal Pumps +1"}
		
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Genmei Shield"})
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined like Black Halo
	
	sets.precast.WS = {ammo="Hasty Pinion +1",
		head="Nyame Helm",neck="Shadow Gorget",ear1="Malignance Earring",ear2="Regal Earring",
		body="Nyame Mail",hands="Jhakri Cuffs +2",ring1="Karieyh Ring",ring2="Chirich Ring",
		back=gear.wsd_back,waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}


	--------------------------------------
	-- Midcast sets
	--------------------------------------

    sets.midcast.FastRecast = {main="Idris",
		head="Nahtirah Hat",neck="",ear1="",ear2="",
		body="Zendik Robe",hands="",ring1="Kishar Ring",ring2="",
		back="Lifestream Cape",waist="Embla Sash",legs="Geomancy Pants +2",feet="Navon Crackows"}

	sets.midcast.Geomancy = {main="Idris",sub="Genmei Shield",range="Dunna",
		head="Azimuth Hood +1",neck="Bagua Charm +2",
		body="Bagua Tunic +1",hands="Geo. Mitaines +3",
		back="Lifestream Cape"}


	--Extra Indi duration as long as you can keep your 900 skill cap.
	sets.midcast.Geomancy.Indi = set_combine(sets.midcast.Geomancy, {legs="Bagua Pants +1",feet="Azimuth Gaiters +1",back="Lifestream Cape"})
		
		
	-- 	
    sets.midcast.Cure = {main="Gada",sub="Sors Shield",ammo="Hasty Pinion +1",
        head="Vanya Hood",neck="Loricate Torque +1",ear1="Meili Earring",ear2="Novia Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Kishar Ring",ring2="Naji's Loop",
        back=gear.fc_jse_back,waist="Witful Belt",legs="Vanya Slops",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Curatio Grip",ammo="Hasty Pinion +1",
       head="Amalric Coif +1",neck="Phalaina Locket",ear1="Meili Earring",ear2="Etiolation Earring",
       body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Janniston Ring",ring2="Naji's Loop",
       back="Twilight Cape",waist="Hachirin-no-Obi",legs="Geomancy Pants +2",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = sets.midcast.Cure

    sets.midcast.Curaga = sets.midcast.Cure

	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Menelaus's Ring"})
	
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})
	
    sets.midcast['Elemental Magic'] = {main="Kaja Club",sub="Ammurapi Shield",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Saevus Pendant +1",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist=gear.ElementalObi,legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}

    sets.midcast['Elemental Magic'].Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Mallquis Cuffs +2",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic'].Proc = {main=empty,sub=empty,ammo="Impatiens",
        head="Nahtirah Hat",neck="Loricate Torque +1",ear1="Meili Earring",ear2="Loquacious Earring",
        body="Seidr Cotehardie",hands="Hagondes Cuffs +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back="Swith Cape +1",waist="Witful Belt",legs="Assid. Pants +1",feet="Regal Pumps +1"}
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
    sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Malignance Earring",
		body="Zendik Robe",hands="Volte Gloves",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Lifestream Cape",waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Amalric Coif +1",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Zendik Robe",hands="Amalric Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Impact = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast.Dispelga = set_combine(sets.midcast.Dispel, {main="Daybreak",sub="Ammurapi Shield"})
		
	sets.midcast['Enfeebling Magic'] = {main="Maxentius",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=gear.merlinic_refresh_head,neck="Bagua Charm +2",ear1="Regal Earring",ear2="Digni. Earring",
		body="Geomancy Tunic +2 +2",hands="Geo. Mitaines +3",ring1="Kishar Ring",ring2="Stikini Ring",
		back=gear.fc_jse_back,waist="Luminary Sash",legs="Psycloth Lappas",feet="Geo. Sandals +3"}
		
	sets.midcast.Dispel = sets.midcast['Enfeebling Magic']
	
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'], {ring1="Stikini Ring +1"})
		
	sets.midcast['Enhancing Magic'] = {main=gear.gada_enhancing_club,sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Meili Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Perimede Cape",waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Meili Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Meili Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Meili Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring",ear1="Meili Earring",ear2="Malignance Earring",waist="Sekhmet Corset"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	-- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",
		head=gear.merlinic_refresh_head,neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Shamash Robe",hands=gear.merlinic_refresh_hands,ring1="Gelatinous Ring",ring2="Dark Ring",
		back="Umbra Cape",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}

	-- Idle sets

	sets.idle = {main="Idris",sub="Genmei Shield",ammo="Staunch Tathlum",
		head=gear.merlinic_refresh_head,neck="Bagua Charm +2",ear1="Moonshade Earring",ear2="Tuisto Earring",
		body="Shamash Robe",hands="Geo. Mitaines +3",ring1="Gelatinous Ring",ring2="Gelatinous Ring +1",
		back=gear.idle_jse_back,waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.merlinic_refresh_feet}
		
	sets.idle.PDT = {main="Idris",sub="Genmei Shield",range="Dunna",
		head="Nyame Helm",neck="Bagua Charm +2",ear1="Moonshade Earring",ear2="Tuisto Earring",
		body="Shamash Robe",hands="Geo. Mitaines +3",ring1="Mallquis Ring",ring2="Gelatinous Ring +1",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})

	-- .Pet sets are for when Luopan is present.
	sets.idle.Pet = {main="Idris",sub="Genmei Shield",range="Dunna",
		head="Azimuth Hood +1",neck="Bagua Charm +2",ear1="Moonshade Earring",ear2="Tuisto Earring",
		body="Shamash Robe",hands="Geo. Mitaines +3",ring1="Gelatinous Ring",ring2="Gelatinous Ring +1",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Assid. Pants +1",feet="Bagua Sandals"}

	sets.idle.PDT.Pet = {main="Idris",sub="Genmei Shield",range="Dunna",
		head="Nyame Helm",neck="Bagua Charm +2",ear1="Etiolation Earring",ear2="Tuisto Earring",
		body="Shamash Robe",hands="Geo. Mitaines +3",ring1="Mallquis Ring",ring2="Gelatinous Ring +1",
		back=gear.idle_jse_back,waist="Isa Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	-- .Indi sets are for when an Indi-spell is active.
	sets.idle.Indi = set_combine(sets.idle, {})
	sets.idle.Pet.Indi = set_combine(sets.idle.Pet, {}) 
	sets.idle.PDT.Indi = set_combine(sets.idle.PDT, {}) 
	sets.idle.PDT.Pet.Indi = set_combine(sets.idle.PDT.Pet, {})
	
	-- Defense sets
	
	sets.defense.PDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Handler's Earring +1",
		body="Mallquis Saio +2",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet="Azimuth Gaiters +1"}

	sets.defense.MDT = {main="Malignance Pole",sub="Umbra Strap",ammo="Staunch Tathlum",
		head="Azimuth Hood +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Handler's Earring +1",
		body="Mallquis Saio +2",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet="Azimuth Gaiters +1"}
		
    sets.defense.MEVA = {main="Malignance Pole",sub="Enki Strap",ammo="Staunch Tathlum",
        head="Azimuth Hood +1",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body=gear.merlinic_nuke_body,hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back=gear.idle_jse_back,waist="Luminary Sash",legs="Telchine Braconi",feet="Azimuth Gaiters +1"}
		
		
	sets.defense.NukeLock = sets.midcast['Elemental Magic']
	
	sets.defense.GeoLock = sets.midcast.Geomancy.Indi

	sets.Kiting = {feet="Geo. Sandals +3"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = {head=gear.th_head,feet=gear.th_feet}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Shamash Robe",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	--------------------------------------
	-- Engaged sets
	--------------------------------------

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion

	-- Normal melee group
	sets.engaged = {ammo="Hasty Pinion +1",
		head="Nyame Helm",neck="Bagua Charm +2",ear1="Cessance Earring",ear2="Telos Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring",ring2="Chirich Ring",
		back=gear.tp_back,waist="Witful Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.engaged.DW = {ammo="Hasty Pinion +1",
		head=gear.merlinic_refresh_head,neck="Asperity Necklace",ear1="Dudgeon Earring",ear2="Heartseeker Earring",
		body="Shamash Robe",hands="Regal Cuffs",ring1="Ramuh Ring +1",ring2="Ramuh Ring +1",
		back="Rancorous Mantle",waist="Witful Belt",legs="Assid. Pants +1",feet="Battlecast Gaiters"}

	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
	head="Ea Hat",neck="Bagua Charm +2",ear1="Regal Earring",ear2="Malignance Earring",
	body="Ea Houppelande",hands="Ea Cuffs",ring1="Mujin Band",ring2="Shiva Ring",
	back=gear.nuke_jse_back,waist="Dorin Obi",legs="Agwu's Slops",feet="Jhakri Pigaches +2"}
	
	sets.ResistantMagicBurst = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",head="Ea Hat",neck="Mizu. Kubikazari",body="Ea Houppelande",ring1="Mujin Band",legs="Ea Slops",feet="Jhakri Pigaches +2"}
	
	-- Weapons sets
	sets.weapons.Maxentius = {main='Maxentius',sub='Genmei Shield'}
	sets.weapons.Idris = {main="Idris"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 10)
end