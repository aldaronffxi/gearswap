function user_job_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','AoE')
    state.IdleMode:options('Normal','NoRefresh','DT')
	state.Weapons:options('None','Carnwenhan','Aeneas','Savage','DualWeapons','DualNaegling','DualTauret','DualNukeWeapons')
	
	gear.back_Idle = {name="Intarabus's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Mag. Evasion+15',}}
	gear.back_Macc = {name="Intarabus's Cape", augments={'CHR+20','Mag. Acc+20 /Mag. Dmg.+20','Mag. Acc.+10','"Fast Cast"+10','Phys. dmg. taken-10%',}}
	gear.back_WS = {}

	-- Adjust this if using the Terpander (new +song instrument)
    info.ExtraSongInstrument = 'Daurdabla'
	-- How many extra songs we can keep from Daurdabla/Terpander
    info.ExtraSongs = 2
	
	-- Set this to false if you don't want to use custom timers.
    state.UseCustomTimers = M(false, 'Use Custom Timers')
	
	-- Additional local binds
    send_command('bind ^` gs c cycle ExtraSongsMode')
	send_command('bind !` input /ma "Chocobo Mazurka" <me>')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !q gs c weapons NukeWeapons;gs c update')
	send_command('bind ^q gs c weapons Swords;gs c update')

	select_default_macro_book()
end

function init_gear_sets()

	--------------------------------------
	-- Start defining the sets
	--------------------------------------

	-- Weapons sets
	sets.weapons.Aeneas = {main="Aeneas",sub="Genmei Shield"}
	sets.weapons.Carnwenhan = {main="Carnwenhan",sub="Genmei Shield"}
	sets.weapons.DualWeapons = {main="Carnwenhan",sub="Blurred Knife +1"}
	sets.weapons.DualNaegling = {main="Naegling",sub="Blurred Knife +1"}
	sets.weapons.DualTauret = {main="Tauret",sub="Blurred Knife +1"}
	sets.weapons.DualNukeWeapons = {main="Malevolence",sub="Malevolence"}
	sets.weapons.Savage = {main="Naegling",sub="Genmei's Shield"}

    sets.buff.Sublimation = {waist="Embla Sash"}
    sets.buff.DTSublimation = {waist="Embla Sash"}
	
	-- Precast Sets

	-- Fast cast sets for spells
	sets.precast.FC = {main="Carnwenhan",sub="Genmei Shield",ammo="Impatiens",
		head="Vanya Hood",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Nyame Gauntlets",ring1="Kishar Ring",ring2="Naji's Loop",
		back=gear.back_Macc,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Vanya Clogs"}

	sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
	sets.precast.FC.Dispelga = set_combine(sets.precast.FC, {main="Daybreak",sub="Ammurapi Shield"})
	
	sets.precast.FC.BardSong = {main="Carnwenhan",sub="Genmei Shield",range="Daurdabla",ammo=empty,
		head="Fili Calot +1",neck="Loricate Torque +1",ear1="Enchntr. Earring +1",ear2="Etiolation Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Gelatinous Ring +1",
		back=gear.back_Macc,waist="Embla Sash",legs="Aya. Cosciales +2",feet="Telchine Pigaches"}

	sets.precast.FC.SongDebuff = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	
	sets.precast.FC.Lullaby = {range="Daurdabla"}
	
	sets.precast.FC['Horde Lullaby'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby'].AoE = {range="Daurdabla"}
	sets.precast.FC['Horde Lullaby II'] = {range="Marsyas"}
	sets.precast.FC['Horde Lullaby II'].AoE = {range="Daurdabla"}
		
	sets.precast.FC.Mazurka = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})
	
	sets.precast.FC['Honor March'] = set_combine(sets.precast.FC.BardSong,{range="Marsyas"})

	sets.precast.FC.Daurdabla = set_combine(sets.precast.FC.BardSong, {range=info.ExtraSongInstrument})
	sets.precast.DaurdablaDummy = sets.precast.FC.Daurdabla
		
	
	-- Precast sets to enhance JAs
	
	sets.precast.JA.Nightingale = {feet="Bihu Slippers +1"}
	sets.precast.JA.Troubadour = {body="Bihu Jstcorps +1"}
	sets.precast.JA['Soul Voice'] = {legs="Bihu Cannions +1"}

	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}

	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
	sets.precast.WS = {ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Bard's Charm +1",ear1="Moonshade Earring",ear2="Ishvara Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Ramuh Ring +1",ring2="Ilabrat Ring",
		back=gear.back_wsd,waist="Grunfeld Rope",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Telos Earring",}

	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	-- Midcast Sets

	-- General set for recast times.
	sets.midcast.FastRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Vanya Hood",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
		back=gear.back_Macc,waist="Witful Belt",legs="Aya. Cosciales +2",feet="Nyame Sollerets"}

	-- Gear to enhance certain classes of songs
	sets.midcast.Ballad = {legs="Inyanga Shalwar +2"}
	sets.midcast.Lullaby = {hands="Brioso Cuffs +3"}
	sets.midcast['Horde Lullaby'] = {hands="Brioso Cuffs +3",range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby'].AoE = {hands="Brioso Cuffs +3",range="Blurred Harp +1",head="Chironic Hat",waist="Chaac Belt",legs="Chironic Hose"}
	sets.midcast['Horde Lullaby II'] = {head="Brioso Roundlet +3",hands="Brioso Cuffs +3",range="Blurred Harp +1"}
	sets.midcast['Horde Lullaby II'].AoE = {hands="Brioso Cuffs +3",range="Blurred Harp +1",head="Chironic Hat",waist="Chaac Belt",legs="Chironic Hose"}
	sets.midcast.Madrigal = {head="Fili Calot +1",feet="Fili Cothurnes +1"}
	sets.midcast.Paeon = {head="Brioso Roundlet +3"}
	sets.midcast.March = {hands="Fili Manchettes +1"}
	sets.midcast['Honor March'] = set_combine(sets.midcast.March,{range="Marsyas"})
	sets.midcast.Minuet = {body="Fili Hongreline +1"}
	sets.midcast.Minne = {hands="Mousai Gages +1"}
	sets.midcast.Carol = {hands="Mousai Gages +1"}
	sets.midcast.Etude = {head="Mousai Turban +1"}
	sets.midcast.Threnody = {body="Mousai Manteel +1"}
	sets.midcast["Sentinel's Scherzo"] = {feet="Fili Cothurnes +1"}
	sets.midcast['Magic Finale'] = {}
	sets.midcast.Mazurka = {}
	sets.midcast.Prelude = {feet="Fili Cothurnes +1"}
	sets.midcast.Mambo = {feet="Mousai Crackows +1"}
	
	sets.midcast['Dia II'] = set_combine(sets.midcast.FastRecast, {ammo="Per. Lucky Egg",head="Chironic Hat",hands="Chironic Gloves",waist="Chaac Belt",})
	

	-- For song buffs (duration and AF3 set bonus)
	sets.midcast.SongEffect = {main="Carnwenhan",sub="Genmei Shield",range="Gjallarhorn",ammo=empty,
		head="Fili Calot +1",neck="Mnbw. Whistle +1",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Fili Hongreline +1",hands="Fili Manchettes +1",ring1="Kishar Ring",ring2="Stikini Ring +1",
		back=gear.back_Macc,waist="Witful Belt",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}
		
	sets.midcast.SongEffect.DW = {main="Carnwenhan",sub="Carnwenhan"}

	-- For song defbuffs (duration primary, accuracy secondary)
	sets.midcast.SongDebuff = {main="Carnwenhan",sub="Ammurapi Shield",range="Gjallarhorn",ammo=empty,
		head="Brioso Roundlet +3",neck="Mnbw. Whistle +1",ear1="Regal Earring",ear2="Crep. Earring",
		body="Fili Hongreline +1",hands="Brioso Cuffs +3",ring1="Stikini Ring +1",ring2="Crepuscular Ring",
		back=gear.back_Macc,waist="Luminary Sash",legs="Inyanga Shalwar +2",feet="Brioso Slippers +3"}
		
	--sets.midcast.SongDebuff.DW = {main="Carnwenhan",sub="Carnwenhan"}

	-- Song-specific recast reduction
	sets.midcast.SongRecast = {main=gear.grioavolr_fc_staff,sub="Clerisy Strap +1",range="Daurdabla",ammo=empty,
		head="Vanya Hood",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Inyanga Jubbah +2",hands="Gendewitha Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
		back=gear.back_Macc,waist="Witful Belt",legs="Fili Rhingrave +1",feet="Aya. Gambieras +2"}
		
	sets.midcast.SongDebuff.DW = {}

	-- Cast spell with normal gear, except using Daurdabla instead
    sets.midcast.Daurdabla = {range=info.ExtraSongInstrument}

	-- Dummy song with Daurdabla; minimize duration to make it easy to overwrite.
    sets.midcast.DaurdablaDummy = set_combine(sets.midcast.SongRecast, {range=info.ExtraSongInstrument})

	-- Other general spells and classes.
	sets.midcast.Cure = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Vanya Hood",neck="Loricate Torque +1",ear1="Meili Earring",ear2="Mendi. Earring",
        body="Vanya Robe",hands="Vanya Cuffs",ring1="Janniston Ring",ring2="Naji's Loop",
        back="Tempered Cape +1",waist="Luminary Sash",legs="Vanya Slops",feet="Vanya Clogs"}
		
	sets.midcast.Curaga = sets.midcast.Cure
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash"}
		
	sets.midcast['Enhancing Magic'] = {main="Serenity",sub="Fulcio Grip",ammo="Hasty Pinion +1",
		head="Telchine Cap",neck="Voltsurge Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.back_Macc,waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.BarElement = set_combine(sets.midcast['Enhancing Magic'], {})
		
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {neck="Nicander's Necklace",hands="Hieros Mittens",
		back="Oretan. Cape +1",ring1="Haoma's Ring",ring2="Menelaus's Ring",waist="Witful Belt",feet="Vanya Clogs"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast, {main=gear.grioavolr_fc_staff,sub="Clemency Grip"})

	-- Resting sets
	sets.resting = sets.idle
	
	sets.idle = {main="Carnwenhan",sub="Genmei Shield",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Gelatinous Ring +1",
		back=gear.back_Idle,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Nyame Sollerets"}
		
	sets.idle.NoRefresh = {main="Daybreak",sub="Genmei Shield",ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Gelatinous Ring +1",
		back=gear.back_Idle,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Nyame Sollerets"}

	sets.idle.DT = {main="Daybreak",sub="Genmei Shield",ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Eabani Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Gelatinous Ring +1",
		back=gear.back_Idle,waist="Fucho-no-obi",legs="Assid. Pants +1",feet="Nyame Sollerets"}
		
	sets.idle.Town = set_combine(sets.idle, {main="Carnwenhan",body="Ashera Harness",legs="Nyame Flanchard",range="Daurdabla",ammo=none})
	
	-- Defense sets

	sets.defense.PDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt +1",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.defense.MDT = {main="Terra's Staff", sub="Umbra Strap",ammo="Staunch Tathlum +1",
		head=empty,neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Respite Cloak",hands=gear.chironic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Flume Belt +1",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}

	sets.Kiting = {feet="Fili Cothurnes +1"}
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.latent_refresh_grip = {sub="Oneiros Grip"}
	sets.TPEat = {neck="Chrys. Torque"}

	sets.TreasureHunter = {head="Chironic Hat",waist="Chaac Belt",legs="Chironic Hose"}

	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	sets.engaged = {main="Aeneas",sub="Genmei Shield",ammo="",
		head="Nyame Helm",neck="Bard's Charm +1",ear1="Telos Earring",ear2="Crep. Earring",
		body="Ashera Harness",hands="Nyame Gauntlets",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
		back="Bleating Mantle",waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
	sets.engaged.DW = {main="Aeneas",ammo="",
		head="Nyame Helm",neck="Bard's Charm +1",ear1="Suppanomimi",ear2="Crep. Earring",
		body="Ashera Harness",hands="Nyame Gauntlets",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
		back="Bleating Mantle",waist="Reiki Yotai",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	set_macro_page(1, 1)
end