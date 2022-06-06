-- Setup vars that are user-dependent.  Can override this in a sidecar file.
-- Setup vars that are user-dependent.  Can override this in a sidecar file.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant')
    state.IdleMode:options('Normal','MEVA','DamageTaken')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Yagrush','Maxentius','DualWeapons')

	gear.obi_cure_waist = "Hachirin-no-Obi"
	gear.obi_cure_back = "Alaunus's Cape"
	
	gear.back_FC = {name="Alaunus's Cape", augments={'MND+20','Eva.+20 /Mag. Eva.+20','MND+10','"Fast Cast"+10',}}
	gear.back_idle = {name="Alaunus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Occ. inc. resist. to stat. ailments+10',}}

	send_command('lua load partybuffs')

		-- Additional local binds
	send_command('bind ^` input /ma "Arise" <t>')
	send_command('bind !` input /ja "Penury" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind ^@!` gs c toggle AutoCaress')
	send_command('bind ^backspace input /ja "Sacrosanctity" <me>')
	send_command('bind @backspace input /ma "Aurora Storm" <me>')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind !backspace input /ja "Accession" <me>')
	send_command('bind != input /ja "Sublimation" <me>')
	send_command('bind ^delete input /ja "Dark Arts" <me>')
	send_command('bind !delete input /ja "Addendum: Black" <me>')
	send_command('bind @delete input /ja "Manifestation" <me>')
	send_command('bind ^\\\\ input /ma "Protectra V" <me>')
	send_command('bind @\\\\ input /ma "Shellra V" <me>')
	send_command('bind !\\\\ input /ma "Reraise IV" <me>')

    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------

	-- Weapons sets
	sets.weapons.Maxentius = {main="Maxentius",sub="Genmei Shield"}
    -- Precast Sets

    -- Fast cast sets for spells
    sets.precast.FC = {ammo="Impatiens",
    head="Vanya Hood",
    body="Zendik Robe",
    hands="Jhakri Cuffs",
    legs="Aya. Cosciales +2",
    feet="Merlinic Crackows",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="",
    back="Perimede Cape"}
		

    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist=""})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {head="Umuthi Hat","Doyen Pants"})

    sets.precast.FC['Healing Magic'] = set_combine(sets.precast.FC, {main="Queller Rod",sub="Sors Shield",
		head="Kaykaus Mitra +1",ear1="Mendi. Earring",legs="Ebers Pant. +1",feet="Hygieia Clogs"})

    sets.precast.FC.StatusRemoval = set_combine(sets.precast.FC['Healing Magic'], {main="Yagrush"})
	
    sets.precast.FC.Cure = set_combine(sets.precast.FC['Healing Magic'], {feet="Hygieia Clogs"})
	
--	sets.precast.FC.Cure.DT = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Impatiens",
--		head="Nahtirah Hat",neck="Loricate Torque +1",ear1="Enchntr. Earring +1",ear2="Genmei Earring",
--		body="Inyanga Jubbah +2 +2",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Lebeche Ring",
--		back="Perimede Cape",waist="Witful Belt",legs="Ebers Pant. +1",feet="Hygieia Clogs"}

    sets.precast.FC.Curaga = sets.precast.FC.Cure

	sets.precast.FC.CureSolace = sets.precast.FC.Cure

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	sets.precast.FC['Dispelga'] = set_combine(sets.precast.FC, {main="Daybreak",sub="Sors Shield"})
	sets.midcast['Dispelga'] = set_combine(sets.midcast['Enfeebling Magic'], {main="Daybreak"})
	


    -- Precast sets to enhance JAs
    sets.precast.JA.Benediction = {body="Piety Bliaut +3"}



    -- Midcast Sets

    sets.Kiting = {feet="Crier's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}
	sets.TreasureHunter = {head=gear.th_head}
	
	--Situational sets: Gear that is equipped on certain targets
	sets.Self_Healing = {}
	sets.Cure_Received = {}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}

	-- Conserve Mp set for spells that don't need anything else, for set_combine.
	
	sets.ConserveMP = {ammo="Hasty Pinion +1"}
		
	sets.midcast.Teleport = sets.ConserveMP
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {neck="Mizu. Kubikazari",ring1="Mujin Band",ring2="Locus Ring"}
	
    sets.midcast.FastRecast = {ammo="Impatiens",
    head="Vanya Hood",
    body="Zendik Robe",
    hands="Jhakri Cuffs",
    legs="Aya. Cosciales +2",
    feet="Merlinic Crackows",
    neck="Loricate Torque +1",
    waist="Witful Belt",
    left_ear="Etiolation Earring",
    right_ear="Malignance Earring",
    left_ring="Kishar Ring",
    right_ring="",
    back="Perimede Cape"}
		
    -- Cure sets

	sets.midcast['Full Cure'] = sets.midcast.CureSolace
	
	
	--JUST SOLACE	
	sets.midcast.CureSolace = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
	
	--SOLACE AND WEATHER
	sets.midcast.LightWeatherCureSolace = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
	
	--SOLACE AND DAY		
	sets.midcast.LightDayCureSolace = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
		
	---
	--CURAGA
	---
	
	sets.midcast.Curaga = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
	
	--WEATHER CURAGA		
	sets.midcast.LightWeatherCuraga = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
	
	--DAY CURAGA		
	sets.midcast.LightDayCuraga = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
	
	---
	--VANILLA CURE
	---
	
	sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
	
	--VANILLA DAY
	sets.midcast.LightDayCure = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
		
	--VANILLA WEATHER
	sets.midcast.LightWeatherCure = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
	
	---
		
		
	sets.midcast.MeleeCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1"})
	sets.midcast.MeleeLightWeatherCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightWeatherCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCureSolace = set_combine(sets.midcast.MeleeCure, {body="Ebers Bliaud +1",waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCure = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeCuraga = set_combine(sets.midcast.MeleeCure, {})
	sets.midcast.MeleeLightWeatherCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})
	sets.midcast.MeleeLightDayCuraga = set_combine(sets.midcast.MeleeCure, {waist="Hachirin-no-Obi"})

	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main="Yagrush",sub="Thuellaic Ecu +1",back=gear.back_FC})
	
	sets.midcast.Erase = set_combine(sets.midcast.StatusRemoval, {neck="Clr. Torque +2"})
	
	sets.midcast.Cursna = set_combine(sets.midcast.StatusRemoval, {head="Kaykaus Mitra +1",hands="Fanatic Gloves",neck="Malison Medallion",body="Ebers Bliaud +1",ring1="Ephedra Ring",ring2="Ephedra Ring",
		back="Mending Cape",legs="Th. Pant. +3",feet="Vanya Clogs"})

    -- 110 total Enhancing Magic Skill; caps even without Light Arts
	
	sets.midcast['Enhancing Magic'] = set_combine(sets.midcast.FastRecast, {main="Daybreak",sub="Ammurapi Shield",ear1="Andoaa Earring",neck="Incanter's Torque",
		head="Telchine Cap",body="Telchine Chas.",hands="Telchine Gloves",waist="Embla Sash",legs="Telchine Braconi",feet="Nyame Sollerets"})
	
	sets.midcast.Reraise = set_combine(sets.midcast['Enhancing Magic'], {sub="Thuellaic Ecu +1"})
	
	sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",legs="Haven Hose",waist="Siegel Sash"})

	sets.midcast.Auspice = set_combine(sets.midcast['Enhancing Magic'], {feet="Ebers Duckbills +1"})

	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",head="Chironic Hat",hands="Nyame Cuffs"})

	sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Bolelabunga",head="Inyanga Tiara +2",body="Piety Bliaut +3",hands="Ebers Mitts +1",
		legs="Th. Pant. +3"})
	
	sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Protectra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	sets.midcast.Shellra = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
	
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {main="Beneficus",sub="Thuellaic Ecu +1",
		head="Ebers Cap +1",neck="Incanter's Torque",ear2="Mimir Earring",
		body="Ebers Bliaud +1",hands="Ebers Mitts +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		legs="Piety Pantaln. +3",feet="Ebers Duckbills +1"})

	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Regal Earring",ear2="Digni. Earring",
		body="Twilight Cloak",hands=gear.chironic_enfeeble_hands,ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Acuity Belt +1",legs="Nyame Flanchard",feet=gear.chironic_nuke_feet}
			
	sets.midcast['Elemental Magic'] = {main="Maxentius",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
		head="Buremte Hat",neck="Baetyl Pendant",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Witching Robe",hands=gear.chironic_enfeeble_hands,ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist=gear.ElementalObi,legs="Nyame Flanchard",feet=gear.chironic_nuke_feet}

	--sets.midcast['Divine Magic'] = 
		
	--sets.midcast.Holy = 

	--sets.midcast['Dark Magic'] = 

    --sets.midcast.Drain = 

    --sets.midcast.Aspir = sets.midcast.Drain

	--sets.midcast.Stun = 

	sets.midcast['Enfeebling Magic'] = {main="Yagrush",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Nyame Helm",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Nyame Mail",hands="Nyame Cuffs",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back="Mending Cape",waist="Obstin. Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Yagrush",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head="Nyame Helm",neck="Erra Pendant",ear1="Regal Earring",ear2="Malignance Earring",
		body="Nyame Mail",hands="Kaykaus Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Mending Cape",waist="Rumination Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}		
		
	sets.midcast.Dia = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast.FastRecast, sets.TreasureHunter)
	
	sets.midcast.Repose = set_combine(sets.midcast['Enfeebling Magic'])

    sets.midcast.ElementalEnfeeble = set_combine(sets.midcast['Enfeebling Magic'], {})

	sets.midcast.IntEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {waist="Acuity Belt +1"})

	sets.midcast.MndEnfeebles = set_combine(sets.midcast['Enfeebling Magic'], {back=gear.back_FC})

    -- Sets to return to when not performing an action.

    -- Resting sets
	sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Inyanga Tiara +2",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Shamash Robe",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	sets.idle = {main="Daybreak",sub="Genmei Shield",ammo="Homiliary",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Shamash Robe",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.MEVA = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Eabani Earring",ear2="Etiolation Earring",
		body="Shamash Robe",hands="Nyame Gauntlets",ring1="Defending Ring",Ring2="Inyanga Ring",
        back=gear.back_idle,waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyanga Crackows +2"}		
		
	sets.idle.DamageTaken = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Ayanmo Corazza +2",hands="Inyan. Dastanas +2",ring1="Defending Ring",ring2="Ayanmo Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
		
	sets.idle.DamageTaken = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum +1",
		head="Aya. Zucchetto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Ayanmo Corazza +2",hands="Inyan. Dastanas +2",ring1="Defending Ring",ring2="Ayanmo Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

	sets.defense.MDT = {main="Bolelabunga",sub="Genmei Shield",ammo="Homiliary",
        head="Inyanga Tiara +2",neck="Loricate Torque +1",ear1="Hearty Earring",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Nyame Gauntlets",ring1="Defending Ring",Ring2="Inyanga Ring",
        back=gear.back_idle,waist="Carrier's Sash",legs="Inyanga Shalwar +2",feet="Inyanga Crackows +2"}	
	
	sets.idle.Town = set_combine(sets.idle, {main="Yagrush",sub="Genmei Shield",neck="Clr. Torque +2"})			
		
	--sets.idle.Weak = 



		-- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Basic set for if no TP weapon is defined.
    sets.engaged = {ammo="Staunch Tathlum +1",
        head="Aya. Zucchetto +2",neck="Lissome Necklace",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Chirich Ring +1",Ring2="Chirich Ring +1",
        back="Kayapa Cape",waist="Windbuffet Belt +1",legs="Aya. Cosciales +2",feet="Aya. Gambieras +2"}

    sets.engaged.Acc = {ammo="Hasty Pinion +1",
        head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Olseni Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}

	sets.engaged.DW = {ammo="Staunch Tathlum +1",
        head="Aya. Zucchetto +2",neck="Lissome Necklace",ear1="Suppanomimi",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Sailfi Belt +1",legs="Aya. Cosciales +2",feet="Nyame Sollerets"}

    sets.engaged.DW.Acc = {ammo="Hasty Pinion +1",
        head="Aya. Zucchetto +2",neck="Combatant's Torque",ear1="Telos Earring",ear2="Suppanomimi",
		body="Ayanmo Corazza +2",hands="Aya. Manopolas +1",ring1="Petrov Ring",Ring2="Ilabrat Ring",
        back="Kayapa Cape",waist="Shetal Stone",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
		
		
    -- Weaponskill sets

    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="",
		head="Piety Cap +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Piety Bliaut +3",hands="Piety Mitts +3",ring1="Ilabrat Ring",ring2="Karieyh Ring +1",
		back=gear.back_FC,waist="Fotia Belt",legs="Piety Pantaln. +3",feet="Piety Duckbills +3"}
		
    sets.precast.WS['Hexa Strike'] = {ammo="",
		head="Piety Cap +3",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Telos Earring",
		body="Piety Bliaut +3",hands="Piety Mitts +3",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		back=gear.back_FC,waist="Fotia Belt",legs="Piety Pantaln. +3",feet="Piety Duckbills +3"}
	
	sets.precast.WS['Mystic Boon'] = {ammo="",
		head="Piety Cap +3",neck="Clr. Torque +2",ear1="Moonshade Earring",ear2="Regal Earring",
		body="Piety Bliaut +3",hands="Piety Mitts +3",ring1="Epaminondas's Ring",ring2="Ilabrat Ring",
		back=gear.back_FC,waist="Sailfi Belt +1",legs="Piety Pantaln. +3",feet="Piety Duckbills +3"}
	
	sets.precast.WS['Black Halo'] = {ammo="",
		head="Piety Cap +3",neck="Clr. Torque +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Piety Bliaut +3",hands="Piety Mitts +3",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		back=gear.back_FC,waist="Luminary Sash",legs="Piety Pantaln. +3",feet="Piety Duckbills +3"}
		
    sets.precast.WS.Realmrazer = {ammo="",
		head="Piety Cap +3",neck="Fotia Gorget",ear1="Regal Earring",ear2="Telos Earring",
		body="Piety Bliaut +3",hands="Piety Mitts +3",ring1="Ilabrat Ring",ring2="Epaminondas's Ring",
		back=gear.back_FC,waist="Fotia Belt",legs="Piety Pantaln. +3",feet="Piety Duckbills +3"}
		
	sets.MaxTP = {ear1="Telos Earring"}
	sets.MaxTP.Dagan = {ear1="Etiolation Earring",ear2="Evans Earring"}

    --sets.precast.WS['Flash Nova'] = {}

    --sets.precast.WS['Mystic Boon'] = {}		
		
		
		-- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Divine Caress'] = {hands="Ebers Mitts +1",back="Mending Cape"}

	--sets.buff.Doom = set_combine(sets.buff.Doom, {})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 9)
end