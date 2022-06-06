function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('None', 'Normal', 'Enspell')
    state.HybridMode:options('Normal', 'PhysicalDef', 'MagicalDef')
	state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'MDT', 'TPEat','Reraise')
    state.PhysicalDefenseMode:options('PDT', 'NukeLock')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('None','Maxentius','Weak','DualWeapons','DualClubs')
	
	gear.back_macc = { name="Sucellos's Cape", augments={'Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10',}}
	gear.back_idle = { name="Sucellos's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','"Fast Cast"+10','Mag. Evasion+15',}}
	gear.back_wsd = { name="Sucellos's Cape", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.back_tp = { name="Sucellos's Cape", augments={'DEX+20','Accuracy+20 Attack+20','"Store TP"+10',}}


		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind @` gs c cycle MagicBurstMode')
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

function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	sets.weapons.Maxentius = {main="Maxentius",sub="Genmei Shield"}
	sets.weapons.Weak = {main="Wind Knife",sub="Wind Knife"}
	sets.weapons.DualWeapons = {main="Maxentius",sub="Tauret"}
	sets.weapons.DualClubs = {main="Maxentius",sub="Tauret"}
	

	
	-- Precast Sets
	
	-- Precast sets to enhance JAs
	sets.precast.JA['Chainspell'] = {body="Viti. Tabard +3"}
	

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	-- Fast cast sets for spells
	-- Need 42 FC on RDM, 32 /SCH and arts
	
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
		
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	       
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Regal Gem",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Karieyh Ring",ring2="Ilabrat Ring",
		back=gear.back_wsd,waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	-- Midcast Sets
	
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head="Ea Hat",neck="Mizu. Kubikazari",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Ea Houppelande",hands="Amalric Gages",ring1="Mujin Band",ring2="Acumen Ring",
		back=gear.back_macc,waist="Eschan Stone",legs="Merlinic Shalwar",feet="Jhakri Pigaches +1"}
	
	-- Overcap on FC here since it's just a base midcast set for every spell.
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

    sets.midcast.Cure = {main="Daybreak",sub="Sors Shield",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back=gear.back_idle,waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
		
    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back="Twilight Cape",waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
		
		--Cureset for if it's not light weather but is light day.
    sets.midcast.LightDayCure = {main="Chatoyant Staff",ammo="Regal Gem",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Haoma's Ring",ring2="Naji's Loop",
        back="Twilight Cape",waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Malison Medallion",
		ring1="Haoma's Ring",ring2="Ephedra Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {})
		
	sets.midcast.Curaga = sets.midcast.Cure
	sets.midcast.LightWeatherCuraga = sets.midcast.LightWeatherCure
	sets.midcast.LightDayCuraga = sets.midcast.LightDayCure
	
	sets.Self_Healing = {ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}

	sets.midcast['Enhancing Magic'] = {main="Colada",sub="Ammurapi Shield",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Dls. Torque +1",ear1="Andoaa Earring",ear2="Malignance Earring",
		body="Viti. Tabard +3",hands="Atrophy Gloves +3",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.back_idle,waist="Witful Belt",legs="Telchine Braconi",feet="Leth. Houseaux +1"}

	--Atrophy Gloves are better than Lethargy for me despite the set bonus for duration on others.		
	sets.buff.ComposureOther = set_combine(sets.midcast['Enhancing Magic'], {head="Leth. Chappel +1",
		body="Lethargy Sayon +1",hands="Atrophy Gloves +3",
		legs="Leth. Fuseau +1",feet="Leth. Houseaux +1"})
		
	--Red Mage enhancing sets are handled in a different way from most, layered on due to the way Composure works
	--Don't set combine a full set with these spells, they should layer on Enhancing Set > Composure (If Applicable) > Spell
	sets.midcast.Refresh = {head="Amalric Coif +1",body="Atrophy Tabard +3",legs="Leth. Fuseau +1"}
	sets.midcast.Aquaveil = {head="Chironic Hat",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"}
	sets.midcast.BarElement = {legs="Shedir Seraweels"}
	sets.midcast.Stoneskin = {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"}
	sets.midcast.Protect = {ring2="Sheltered Ring"}
	sets.midcast.Shell = {ring2="Sheltered Ring"}
	
	sets.midcast.Enspell = set_combine(sets.midcast['Enhancing Magic'], {head="Befouled Crown",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Augmenting Earring",
        body="Vitiation Tabard +3",hands="Vitiation Gloves +2",ring1="",ring2="",
        back="Ghostfyre Cape",waist="Olympus Sash",legs="Atrophy Tights +2",feet="Lethargy Houseaux +1"})
	
	sets.midcast.Regen = {main="Daybreak",
		head="Telchine Cap",
		body={ name="Telchine Chas.", augments={'Enh. Mag. eff. dur. +10',}},
		hands={ name="Taeon Gloves", augments={'"Regen" potency+3',}},
		legs={ name="Taeon Tights", augments={'"Regen" potency+3',}},
		feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','"Regen" potency+3',}}}
		
	sets.midcast.Phalanx = {
		body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
		hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
		legs={ name="Taeon Tights", augments={'Phalanx +3',}},
		feet={ name="Taeon Boots", augments={'Phalanx +3',}},
		}
	
	sets.midcast['Gain-STR'] = {hands="Viti. Gloves +2"}
	sets.midcast['Gain-MND'] = {hands="Viti. Gloves +2"}
	sets.midcast['Gain-INT'] = {hands="Viti. Gloves +2"}
	sets.midcast['Gain-DEX'] = {hands="Viti. Gloves +2"}
	sets.midcast['Gain-VIT'] = {hands="Viti. Gloves +2"}
	sets.midcast['Gain-AGI'] = {hands="Viti. Gloves +2"}
	
	sets.midcast['Enfeebling Magic'] = {main="Maxentius",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Nyame Helm",neck="Dls. Torque +1",ear1="Regal Earring",ear2="Malignance Earring",
		body="Lethargy Sayon +1",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Globidonta Ring",
		back=gear.back_macc,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +2"}
	
	--Pure skill/macc to land
	sets.midcast['Frazzle II'] = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3",hands="Nyame Gauntlets"})
	
	--Enfeebling Skill to boost Distract/Frazzle3/Addle2/Poison
	sets.midcast['Distract III'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Frazzle III'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	sets.midcast['Addle II'] = set_combine(sets.midcast['Enfeebling Magic'], {})
	
	sets.midcast.Silence = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	sets.midcast.Sleep = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	sets.midcast['Sleep II']= set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	sets.midcast.Inundation = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	sets.midcast.Gravity = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	sets.midcast.Dispel = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	sets.midcast.Bind = set_combine(sets.midcast['Enfeebling Magic'], {body="Atrophy Tabard +3"})
	
	sets.midcast['Divine Magic'] = set_combine(sets.midcast['Enfeebling Magic'].Resistant, {})

	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio III'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
    sets.midcast['Elemental Magic'] = {main="Grioavolr",sub="Niobid Strap",ammo="Pemphredo Tathlum",
		head="Ea Hat",neck="Mizu. Kubikazari",ear1="Regal Earring",ear2="Friomisi Earring",
		body="Ea Houppelande",hands="Amalric Gages",ring1="Mujin Band",ring2="Acumen Ring",
		back=gear.back_macc,waist="Eschan Stone",legs="Merlinic Shalwar",feet="Jhakri Pigaches +1"}
		
    sets.midcast['Elemental Magic'].Resistant = {main=gear.grioavolr_nuke_staff,sub="Enki Strap",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Sanctity Necklace",ear1="Regal Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
        back="Sucellos's Cape",waist="Yamabuki-no-Obi",legs="Chironic Hose",feet=gear.merlinic_nuke_feet}

		
	sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring"})
		
	sets.midcast.Impact = {main="Maxentius",sub="Ammurapi Shield",ammo="Regal Gem",
		head=empty,neck="Dls. Torque +1",ear1="Regal Earring",ear2="Malignance Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Globidonta Ring",
		back=gear.back_macc,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +2"}

	sets.midcast['Dark Magic'] = {main="Maxentius",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Atrophy Chapeau +2",neck="Dls. Torque +1",ear1="Regal Earring",ear2="Malignance Earring",
		body="Atrophy Tabard +3",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Globidonta Ring",
		back=gear.back_macc,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +2"}

    sets.midcast.Drain = {main="Maxentius",sub="Ammurapi Shield",ammo="Regal Gem",
		head="Atrophy Chapeau +2",neck="Dls. Torque +1",ear1="Regal Earring",ear2="Malignance Earring",
		body="Lethargy Sayon +1",hands="Regal Cuffs",ring1="Kishar Ring",ring2="Globidonta Ring",
		back=gear.back_macc,waist="Luminary Sash",legs="Chironic Hose",feet="Vitiation Boots +2"}

	sets.midcast.Aspir = sets.midcast.Drain
		
	sets.midcast.Stun = set_combine(sets.midcast['Frazzle II'], {head="Atrophy Chapeau +2",ring2="Ayanmo Ring",hands="Nyame Gauntlets",feet="Nyame Sollerets",ring2="Evanescence Ring"})
		
	sets.midcast.Stun.Resistant = {main="Daybreak",sub="Enki Strap",ammo="Regal Gem",
		head="Amalric Coif",neck="Dls. Torque +1",ear1="Regal Earring",ear2="Digni. Earring",
		body="Viti. Tabard +3",hands="Gende. Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Sucellos's Cape",waist="Acuity Belt +1",legs="Psycloth Lappas",feet=gear.merlinic_aspir_feet}

	-- Sets for special buff conditions on spells.
		
	sets.buff.Saboteur = {hands="Leth. Gantherots +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Jhakri Robe +2",hands="Jhakri Cuffs +2",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",legs="Shedir Seraweels",feet="Jhakri Pigaches +2"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {main="Daybreak",sub="Genmei Shield",ammo="Homiliary",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Jhakri Robe +2",hands="Aya. Manopolas +2",ring1="Defending Ring",ring2="Sheltered Ring",
		back=gear.back_idle,waist="Flume Belt",legs="Aya. Cosciales +2",feet="Aya. Gambieras +1"}
	

	-- Idle sets
	sets.idle = {main="Daybreak",sub="Genmei Shield",ammo="Homiliary",
		head=gear.merlinic_refresh_head,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Jhakri Robe +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Nyame Flanchard",feet=gear.merlinic_refresh_feet}
		
	sets.idle.PDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Flume Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.MDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.Weak = {main="Daybreak",sub="Genmei Shield",ammo="Homiliary",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Jhakri Robe +2",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Flume Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.idle.Reraise = set_combine(sets.midcast.idle, {body="Annoint. Kalasiris"})
	
	
	-- Defense sets
	sets.defense.PDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Genmei Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Flume Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.defense.NukeLock = sets.midcast['Elemental Magic']
		
	sets.defense.MDT = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.defense.MEVA = {main="Daybreak",sub="Genmei Shield",ammo="Staunch Tathlum",
		head="Malignance Chapeau",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
		body="Malignance Tabard",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_idle,waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
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
--	sets.engaged = {ammo="Ginsen",
--		head="Aya. Zucchetto +2",neck="Anu Torque",ear1="Cessance Earring",ear2="Brutal Earring",
--		body="Ayanmo Corazza +2",hands="Aya. Manopolas +2",ring1="Petrov Ring",ring2="Ilabrat Ring",
--		back=gear.back_tp,waist="Windbuffet Belt",legs="Carmine Cuisses +1",feet="Carmine Greaves +1"}

	sets.engaged = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Sherida Earring",ear2="Brutal Earring",
		body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
		back=gear.back_tp,waist="Kentarch Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.engaged.Enspell = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Aya. Manopolas +2",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
		back=gear.back_tp,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.engaged.DW = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		body="Ayanmo Corazza +2",hands="Nyame Gauntlets",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
		back=gear.back_tp,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.engaged.DW.Enspell = {ammo="Ginsen",
		head="Malignance Chapeau",neck="Anu Torque",ear1="Suppanomimi",ear2="Sherida Earring",
		body="Malignance Tabard",hands="Aya. Manopolas +2",ring1="Hetairoi Ring",ring2="Ilabrat Ring",
		back=gear.back_tp,waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
						
	sets.engaged.PhysicalDef = {ammo="Ginsen",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Emet Harness +1",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_tp,waist="Flume Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.engaged.MagicalDef = {ammo="Ginsen",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Brutal Earring",
		body="Vrikodara Jupon",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.back_tp,waist="Flume Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}

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