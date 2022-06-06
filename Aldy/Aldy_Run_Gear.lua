function user_setup()

	state.OffenseMode:options('Normal','Acc')
	state.HybridMode:options('Normal','DTLite','Tank')
	state.WeaponskillMode:options('Match','Normal','Acc')
	state.CastingMode:options('Normal','SIRD','Resistant')
	state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA','Death','Charm','DTCharm')
	state.IdleMode:options('Tank','KiteTank')
	state.Weapons:options('Epeolatry','Lionheart','Morgelai')
	
	state.ExtraDefenseMode = M{['description']='Extra Defense Mode','None','MP'}

	gear.enmity_jse_back = {name="Ogma's cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Mag. Evasion+10','Enmity+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = {name="Ogma's cape", augments={'DEX+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.da_jse_back = {name="Ogma's cape", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.sird_back = {name="Ogma's Cape", augments={'HP+60','Eva.+20 /Mag. Eva.+20','Enmity+10','Spell interruption rate down-10%',}}

	-- Additional local binds
	send_command('bind !` gs c SubJobEnmity')
	send_command('bind @` gs c cycle RuneElement')
	send_command('bind ^` gs c RuneElement')
	send_command('bind @pause gs c toggle AutoRuneMode')
	send_command('bind ^delete input /ja "Provoke" <stnpc>')
	send_command('bind !delete input /ma "Cure IV" <stal>')
	send_command('bind @delete input /ma "Flash" <stnpc>')
	send_command('bind ^\\\\ input /ma "Protect IV" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Crusade" <me>')
	send_command('bind ^backspace input /ja "Lunge" <t>')
	send_command('bind @backspace input /ja "Gambit" <t>')
	send_command('bind !backspace input /ja "Rayke" <t>')
	send_command('bind @f8 gs c toggle AutoTankMode')
	send_command('bind @f10 gs c toggle TankAutoDefense')
	send_command('bind ^@!` gs c cycle SkillchainMode')
	
	select_default_macro_book()
end

function job_setup()

	state.Buff['Aftermath: Lv.3'] = buffactive['Aftermath: Lv.3'] or false
	state.Buff['Valiance'] = buffactive['Valiance'] or false
	state.Buff['Vallation'] = buffactive['Vallation'] or false
	state.Buff['Embolden'] = buffactive['Embolden'] or false
    state.Buff.Hasso = buffactive.Hasso or false
    state.Buff.Seigan = buffactive.Seigan or false
	state.Stance = M{['description']='Stance','Hasso','Seigan','None'}
	
	autows = 'Resolution'
	autofood = 'Miso Ramen'
	
	update_melee_groups()
	init_job_states({"Capacity","AutoRuneMode","AutoTrustMode","AutoTankMode","AutoWSMode","AutoShadowMode","AutoFoodMode","AutoNukeMode","AutoStunMode","AutoDefenseMode",},{"AutoBuffMode","AutoSambaMode","Weapons","OffenseMode","WeaponskillMode","Stance","IdleMode","Passive","RuneElement","PhysicalDefenseMode","MagicalDefenseMode","ResistDefenseMode","CastingMode","TreasureMode",})
end

function init_gear_sets()

    sets.Enmity = {ammo="Sapience Orb",
	     head="Halitus Helm",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
	     body="Emet Harness +1",hands="Kurys Gloves",ring1="Moonlight Ring",ring2="Defending Ring",
		 back=gear.enmity_jse_back,waist="Goading Belt",legs="Eri. Leg Guards +1",feet="Ahosi Leggings"}


    sets.Enmity.DT = {ammo="Sapience Orb",
	     head="Halitus Helm",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
	     body="Emet Harness +1",hands="Kurys Gloves",ring1="Moonlight Ring",ring2="Defending Ring",
		 back=gear.enmity_jse_back,waist="Goading Belt",legs="Eri. Leg Guards +1",feet="Ahosi Leggings"}	
		 
		 
	--92 in gear needed	
    sets.Enmity.SIRD = {ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Rawhide Gloves",
    legs="Carmine Cuisses +1",
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Halasz Earring",
    right_ear="Magnetic Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
	back=gear.sird_back}

	
	sets.Enmity.SIRDT = {ammo="Staunch Tathlum +1",
    head="Nyame Helm",
    body="Nyame Mail",
    hands="Rawhide Gloves",
    legs="Carmine Cuisses +1",
    feet="Nyame Sollerets",
    neck="Moonlight Necklace",
    waist="Audumbla Sash",
    left_ear="Halasz Earring",
    right_ear="Magnetic Earring",
    left_ring="Defending Ring",
    right_ring="Gelatinous Ring +1",
	back=gear.sird_back}

	--------------------------------------
	-- Precast sets
	--------------------------------------

	-- Item sets.

	-- Precast sets to enhance JAs
    sets.precast.JA['Vallation'] = set_combine(sets.Enmity,{body="Runeist's Coat +3",legs="Futhark Trousers +3",back=gear.enmity_jse_back})
    sets.precast.JA['Valiance'] = sets.precast.JA['Vallation']
    sets.precast.JA['Pflug'] = set_combine(sets.Enmity,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'] = set_combine(sets.Enmity,{head="Fu. Bandeau +2"})
    sets.precast.JA['Liement'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'] = set_combine(sets.Enmity,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'] = set_combine(sets.Enmity,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'] = set_combine(sets.Enmity,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'] = set_combine(sets.Enmity,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'] = set_combine(sets.Enmity,{back="Evasionist's Cape"})
    sets.precast.JA['One For All'] = set_combine(sets.Enmity,{})
    sets.precast.JA['Provoke'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Warcry'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Defender'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Berserk'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Last Resort'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Aggressor'] = set_combine(sets.Enmity, {})
	sets.precast.JA['Animated Flourish'] = set_combine(sets.Enmity, {})

    sets.precast.JA['Vallation'].DT = set_combine(sets.Enmity.DT,{body="Runeist's Coat +3", legs="Futhark Trousers +3",back=gear.enmity_jse_back})
    sets.precast.JA['Valiance'].DT = sets.precast.JA['Vallation'].DT
    sets.precast.JA['Pflug'].DT = set_combine(sets.Enmity.DT,{feet="Runeist's Boots +1"})
    sets.precast.JA['Battuta'].DT = set_combine(sets.Enmity.DT,{head="Fu. Bandeau +2"})
    sets.precast.JA['Liement'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Gambit'].DT = set_combine(sets.Enmity.DT,{hands="Runeist's Mitons +1"})
    sets.precast.JA['Rayke'].DT = set_combine(sets.Enmity.DT,{feet="Futhark Boots +1"})
    sets.precast.JA['Elemental Sforzo'].DT = set_combine(sets.Enmity.DT,{body="Futhark Coat +3"})
    sets.precast.JA['Swordplay'].DT = set_combine(sets.Enmity.DT,{hands="Futhark Mitons +1"})
    sets.precast.JA['Embolden'].DT = set_combine(sets.Enmity.DT,{back="Evasionist's Cape"})
    sets.precast.JA['One For All'].DT = set_combine(sets.Enmity.DT,{})
    sets.precast.JA['Provoke'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Warcry'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Defender'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Berserk'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Last Resort'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Aggressor'].DT = set_combine(sets.Enmity.DT, {})
	sets.precast.JA['Animated Flourish'].DT = set_combine(sets.Enmity.DT, {})

    sets.precast.JA['Lunge'] = {ammo="Seeth. Bomblet +1",
        head="Nyame Helm",neck="",ear1="Friomisi Earring",ear2="Static Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Mujin Band",ring2="Archon Ring",
        back="",waist="Eschan Stone",legs="Nyame Flanchard",feet="Nyame Sollerets"}

	sets.precast.JA['Swipe'] = sets.precast.JA['Lunge']


	-- Pulse sets, different stats for different rune modes, stat aligned.
    sets.precast.JA['Vivacious Pulse'] = {main="Morgelai",head="Erilaz Galea +1",body="Runeist's Coat +3",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Saxnot Earring",ring1="Stikini Ring +1",ring2="Stikini Ring +1",legs="Rune. Trousers +1",waist="Bishop's Sash"}
    sets.precast.JA['Vivacious Pulse']['Ignis'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Gelus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Flabra'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tellus'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Sulpor'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Unda'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Lux'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	sets.precast.JA['Vivacious Pulse']['Tenebrae'] = set_combine(sets.precast.JA['Vivacious Pulse'], {})
	
	
    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Yamarang",
        head="Carmine Mask +1",neck="Unmoving Collar +1",ear1="Enchntr. Earring +1",ear2="Handler's Earring +1",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Chaac Belt",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}
	
    sets.precast.Step = {}
		
	sets.precast.JA['Violent Flourish'] = {}
		
	-- Fast cast sets for spells
    sets.precast.FC = {ammo="Sapience Orb",
        head="Rune. Bandeau +2",neck="Orunmila's Torque",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +3",hands="Nyame Gauntlets",ring1="Moonlight Ring",ring2="Kishar Ring",
        back=gear.sird_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
			
	sets.precast.FC.DT = {ammo="Staunch Tathlum +1",
        head="Rune. Bandeau +2",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +3",hands="Nyame Gauntlets",ring1="Moonlight Ring",ring2="Moonlight Ring",
        back=gear.sird_back,waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.precast.FC['Blue Magic'] = sets.Enmity.SIRD
	
	sets.precast.FC.Poisonga = sets.Enmity.SIRD
	sets.precast.FC.Stun = sets.Enmity.SIRD
			
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {})
    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck='Magoraga beads', back="Mujin Mantle"})
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {})

	-- Weaponskill sets
	sets.precast.WS = {ammo="Knobkierrie",
            head=gear.herculean_wsd_head,neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body=gear.herculean_wsd_body,hands="Regal Gauntlets",ring1="Niqmaddu Ring",ring2="Karieyh Ring +1",
            back=gear.wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_wsd_legs,feet=gear.herculean_ta_feet}
	sets.precast.WS.Acc = {ammo="Seeth. Bomblet +1",
            head="Dampening Tam",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
            body=gear.herculean_wsd_body,hands="Regal Gauntlets",ring1="Niqmaddu Ring",ring2="Karieyh Ring +1",
            back=gear.wsd_jse_back,waist="Fotia Belt",legs=gear.herculean_wsd_legs,feet=gear.herculean_ta_feet}

    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS,{head="Adhemar Bonnet +1",body="Adhemar Jacket +1",hands="Adhemar Wristbands +1",ring2="Epona's Ring",legs="Meg. Chausses +2",back=gear.da_jse_back})
    sets.precast.WS['Resolution'].Acc = set_combine(sets.precast.WS.Acc,{})

    sets.precast.WS['Dimidiation'] = set_combine(sets.precast.WS,{neck="Caro Necklace",waist="Grunfeld Rope",legs="Lustr. Subligar +1",feet="Lustra. Leggings +1"})
    sets.precast.WS['Dimidiation'].Acc = set_combine(sets.precast.WS.Acc,{legs=gear.herculean_wsd_legs,feet=gear.herculean_wsd_feet})
	
    sets.precast.WS['Ground Strike'] = set_combine(sets.precast.WS,{})
    sets.precast.WS['Ground Strike'].Acc = set_combine(sets.precast.WS.Acc,{})
		
    sets.precast.WS['Herculean Slash'] = set_combine(sets.precast['Lunge'], {})
	sets.precast.WS['Sanguine Blade'] = set_combine(sets.precast['Lunge'], {})

	--------------------------------------
	-- Midcast sets
	--------------------------------------
	
    sets.midcast.FastRecast = {ammo="Sapience Orb",
            head="Rune. Bandeau +2",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
            body="Runeist's Coat +3",hands="Regal Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
            back="Moonbeam Cape",waist="Engraved Belt",legs="Aya. Cosciales +2",feet="Carmine Greaves +1"}
			
	--sets.midcast.FastRecast.DT = {ammo="Staunch Tathlum +1",
        --head="Nyame Helm",neck="Futhark Torque +2",ear1="Tuisto Earring",ear2="Eabani Earring",
        --body="Runeist's Coat +3",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonlight Ring",
        --back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Turms Leggings +1"}
		
	sets.midcast.FastRecast.SIRD = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +2",neck="Loricate Torque +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Runeist's Coat +3",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}

    sets.midcast['Enhancing Magic'] = {ammo="Sapience Orb",
            head="Rune. Bandeau +2",neck="Orunmila's Torque",ear1="Odnowa Earring +1",ear2="Etiolation Earring",
            body="Nyame Mail",hands="Regal Gauntlets",ring1="Moonlight Ring",ring2="Kishar Ring",
            back=gear.sird_back,waist="Engraved Belt",legs="Futhark Trousers +3",feet="Nyame Sollerets"}
    
	sets.midcast['Phalanx'] = {ammo="Staunch Tathlum +1",
            head="Fu. Bandeau +2",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
            body={ name="Taeon Tabard", augments={'Spell interruption rate down -8%','Phalanx +3',}},
			hands={ name="Taeon Gloves", augments={'Phalanx +3',}},
			ring1="Moonlight Ring",ring2="Gelatinous Ring +1",
            back="Moonbeam Cape",
			waist="Audumbla Sash",
			neck="Unmoving Collar +1",
			legs={ name="Taeon Tights", augments={'Phalanx +3',}},
			feet={ name="Taeon Boots", augments={'Phalanx +3',}}}
	
	sets.midcast['Phalanx'].DT = sets.midcast['Phalanx']
	
    sets.midcast['Regen'] = set_combine(sets.midcast['Enhancing Magic'], {main="Morgelai",head="Rune. Bandeau +2",neck="Sacro Gorget",ear1="Tuisto Earring",ear2="Odnowa Earring +1",back="Moonbeam Cape",
		hands={ name="Taeon Gloves", augments={'"Regen" potency+3',}},
		legs={ name="Taeon Tights", augments={'"Regen" potency+3',}},
		feet={ name="Taeon Boots", augments={'Spell interruption rate down -9%','"Regen" potency+3',}}})
	
	sets.midcast['Refresh'] = set_combine(sets.midcast['Enhancing Magic'],{head="Erilaz Galea +1"}) 
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {})
	sets.midcast.Flash = set_combine(sets.Enmity, {})
	sets.midcast.Foil = set_combine(sets.Enmity, {})
	sets.midcast.Foil.DT = set_combine(sets.Enmity.DT, {})
    sets.midcast.Stun = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'] = set_combine(sets.Enmity, {})
	sets.midcast['Blue Magic'].DT = set_combine(sets.Enmity.SIRDT, {})
	sets.midcast['Blue Magic'].SIRD = set_combine(sets.Enmity.SIRD, {})
	sets.midcast.Cocoon = set_combine(sets.Enmity.SIRD, {})
	
	sets.midcast.Poisonga = sets.midcast.Cocoon
	sets.midcast.Stun = sets.midcast.Cocoon

    --sets.midcast.Cure = {ammo="Staunch Tathlum +1",
        --head="Carmine Mask +1",neck="Phalaina Locket",ear1="Mendi. Earring",ear2="Roundel Earring",
        --body="Vrikodara Jupon",hands="Buremte Gloves",ring1="Lebeche Ring",ring2="Janniston Ring",
        --back="Tempered Cape +1",waist="Luminary Sash",legs="Carmine Cuisses +1",feet="Skaoi Boots"}
		
	--sets.midcast['Wild Carrot'] = set_combine(sets.midcast.Cure, {})
		
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})

	--------------------------------------
	-- Idle/resting/defense/etc sets
	--------------------------------------

	sets.resting = {}

    sets.idle = {ammo='Homiliary',
		head="Nyame Helm",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
		body="Runeist's Coat +3",hands="Regal Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Nyame Sollerets"}
		
    sets.idle.Sphere = set_combine(sets.idle,{body="Mekosu. Harness"})
			
	sets.idle.Tank = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Futhark Torque +2",ear1="Etiolation Earring",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Gelatinous Ring +1",ring2="Shadow Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.idle.KiteTank = {ammo="Staunch Tathlum +1",
        head="Fu. Bandeau +2",neck="Vim Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back=gear.enmity_jse_back,waist="Flume Belt",legs="Carmine Cuisses +1",feet="Erilaz Greaves +1"}

	sets.idle.Weak = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Futhark Coat +3",hands="Regal Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.idle.Refresh = {ammo='Homiliary',
		head="Rawhide Mask",neck="Bathy Choker +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Futhark Coat +3",hands="Regal Gauntlets",ring1="Defending Ring",ring2="Shadow Ring",
		back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rawhide Trousers",feet="Erilaz Greaves +1"}
		
	sets.idle.Town = set_combine(sets.idle, {range="Troll Gun",ammo=none,waist="Engraved Belt",ring1="Stikini Ring +1",ring2="Stikini Ring +1",legs="Carmine Cuisses +1"})


	sets.Kiting = {legs="Carmine Cuisses +1",feet="Nyame Sollerets"}
	
	sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.MP = {ear2="Etiolation Earring",waist="Flume Belt"}
	
	-- Weapons sets
	sets.weapons.Epeolatry = {main="Epeolatry",sub="Utu Grip"}
	sets.weapons.Lionheart = {main="Lionheart",sub="Utu Grip"}	
	sets.weapons.Morgelai = {main="Morgelai",sub="Utu Grip"}
	
	-- Defense Sets
	
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Futhark Torque +2",ear1="Tuisto Earring",ear2="Eabani Earring",
        body="Runeist's Coat +3",hands="Turms Mittens +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	--sets.defense.PDT_HP = {ammo="Staunch Tathlum +1",
        --head="Fu. Bandeau +2",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        --body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonlight Ring",ring2="Moonlight Ring",
        --back="Moonbeam Cape",waist="Flume Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	sets.defense.MDT = {ammo="Yamarang",
        head="Erilaz Galea +1",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	--sets.defense.MDT_HP = {ammo="Staunch Tathlum +1",
        --head="Erilaz Galea +1",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        --body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonlight Ring",ring2="Moonlight Ring",
        --back="Moonbeam Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	--sets.defense.BDT = {ammo="Staunch Tathlum +1",
        --head="Erilaz Galea +1",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        --body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Defending Ring",ring2="Shadow Ring",
        --back="Moonbeam Cape",waist="Engraved Belt",legs=gear.herculean_dt_legs,feet="Erilaz Greaves +1"}
	--sets.defense.BDT_HP = {ammo="Staunch Tathlum +1",
        --head="Erilaz Galea +1",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        --body="Runeist's Coat +3",hands=gear.herculean_dt_hands,ring1="Moonlight Ring",ring2="Moonlight Ring",
        --back="Moonbeam Cape",waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
	
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Futhark Torque +2",ear1="Tuisto Earring",ear2="Eabani Earring",
        body="Runeist's Coat +3",hands="Turms Mittens +1",ring1="Defending Ring",ring2="Moonlight Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Turms Leggings +1"}
		
	--sets.defense.MEVA_HP = {ammo="Staunch Tathlum +1",
        --head="Erilaz Galea +1",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Sanare Earring",
        --body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Moonlight Ring",ring2="Moonlight Ring",
        --back="Moonbeam Cape",waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
		
	sets.defense.Death = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Futhark Torque +2",ear1="Odnowa Earring +1",ear2="Hearty Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}

	sets.defense.DTCharm = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Hearty Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
		
	sets.defense.Charm = {ammo="Staunch Tathlum +1",
        head="Erilaz Galea +1",neck="Unmoving Collar +1",ear1="Odnowa Earring +1",ear2="Hearty Earring",
        body="Runeist's Coat +3",hands="Erilaz Gauntlets +1",ring1="Purity Ring",ring2="Vengeful Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Rune. Trousers +1",feet="Erilaz Greaves +1"}
	
	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring"}
	sets.AccMaxTP = {ear1="Telos Earring"}

	--------------------------------------
	-- Engaged sets
	--------------------------------------

    sets.engaged = {ammo="Yamarang",
            head="Adhemar Bonnet +1",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
            body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Niqmaddu Ring",ring2="Epona's Ring",
            back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
	
	sets.engaged.DTLite = {ammo="Yamarang",
            head="Aya. Zucchetto +2",neck="Futhark Torque +2",ear1="Brutal Earring",ear2="Sherida Earring",
            body="Ashera Harness",hands="Turms Mittens +1",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
            back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet=gear.herculean_ta_feet}
    
    sets.engaged.Tank = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Futhark Torque +2",ear1="Etiolation Earring",ear2="Tuisto Earring",
        body="Nyame Mail",hands="Turms Mittens +1",ring1="Gelatinous Ring +1",ring2="Shadow Ring",
        back=gear.enmity_jse_back,waist="Engraved Belt",legs="Eri. Leg Guards +1",feet="Erilaz Greaves +1"}
		
	
	--------------------------------------
	-- Custom buff sets
	--------------------------------------
	sets.buff.Battuta = {hands="Turms Mittens +1"}
	sets.buff.Embolden = {back="Evasionist's Cape"}
	
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'RDM' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'SCH' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'BLU' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'WAR' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'SAM' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'DRK' then
		set_macro_page(1, 1)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 1)
	else
		set_macro_page(1, 1)
	end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] < spell_latency and not have_trust("Yoran-Oran") then
					windower.send_command('input /ma "Yoran-Oran (UC)" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[952] < spell_latency and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[979] < spell_latency and not have_trust("Selh'teus") then
					windower.send_command('input /ma "Selh\'teus" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[967] < spell_latency and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = os.clock() + 3
					return true
				elseif spell_recasts[914] < spell_latency and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = os.clock() + 3
					return true
				else
					return false
				end
			end
		end
	end
	return false
end