function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal')
    state.WeaponskillMode:options('Match','Normal','Damage')
    state.HybridMode:options('Normal','Hybrid','SubtleBlow','Reraise')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal','Reraise','Refresh')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Crepuscular'}
	state.Weapons:options('Caladbolg','Apocalypse','Loxotic','Lycurgos','Montante','Naegling')

	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
    send_command('bind !f11 gs c cycle ExtraMeleeMode')
	send_command('bind @` gs c cycle SkillchainMode')
	
	select_default_macro_book()
	
	gear.back_DA = {name="Ankou's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.back_WS = {name="Ankou's Mantle", augments={'VIT+20','Accuracy+20 Attack+20','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	
	
end

	-- Weapons sets

	sets.weapons.Caladbolg = {main="Caladbolg",sub="Utu Grip"}
	sets.weapons.Loxotic = {main ="Loxotic Mace +1", sub="Blurred Shield +1"}
	sets.weapons.Apocalypse = {main="Apocalypse",sub="Utu Grip"}
	sets.weapons.Lycurgos = {main="Lycurgos",sub="Utu Grip"}
	sets.weapons.Montante = {main="Montante +1",sub="Utu Grip"}
		sets.weapons.Naegling = {main="Naegling",sub="Blurred Shield +1"}
	sets.weapons.Irradiance = {main="Irradiance Blade",sub="Utu Grip"}

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA['Diabolic Eye'] = {}
	sets.precast.JA['Arcane Circle'] = {}
	sets.precast.JA['Souleater'] = {}
	sets.precast.JA['Weapon Bash'] = {hands="Ig. Gauntlets +2"}
	sets.precast.JA['Nether Void'] = {legs="Heath. Flanchard +1"}
	sets.precast.JA['Blood Weapon'] = {}
	sets.precast.JA['Dark Seal'] = {head="Fall. Burgeonet +3"}
	sets.precast.JA['Last Resort'] = {back="Ankou's Mantle"}


	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Flume Belt",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}

	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})
	
	sets.precast['Dark Magic'] = set_combine(sets.precast.FC, {head="Fall. Burgeonet +3"})
		
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Orunmila's Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Odyss. Chestplate",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Kishar Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs=gear.odyssean_fc_legs,feet="Odyssean Greaves"}
                   
	-- Specific spells
 
	sets.midcast['Dark Magic'] = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Mani Earring",ear2="Digni. Earring",
		body="Carm. Sc. Mail +1",hands="Fall. Fin. Gaunt. +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Niht Mantle",waist="Eschan Stone",legs="Heath. Flanchard +1",feet="Ratri Sollerets +1"}
           
	sets.midcast['Enfeebling Magic'] = {ammo="Pemphredo Tathlum",
		head="Sakpata's Helm",neck="Erra Pendant",ear1="Mani Earring",ear2="Digni. Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Eschan Stone",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
		   
	sets.midcast['Dread Spikes'] = {main="Crepuscular Scythe",ammo="Pemphredo Tathlum",
		head="Hjarrandi Helm",neck="Unmoving Collar +1",ear1="Tuisto Earring",ear2="Odnowa Earring +1",
		body="Heath. Cuirass +1",hands="Sakpata's Gauntlets",ring1="Gelatinous Ring +1",ring2="Moonlight Ring",
		back="Moonbeam Cape",waist="Carrier's Sash",legs="Sakpata's Cuisses",feet="Ratri Sollerets +1"}
	
	sets.midcast.Absorb = set_combine(sets.midcast['Dark Magic'], {back="Ankou Mantle"})
           
	sets.midcast.Stun = {ammo="Pemphredo Tathlum",
		head="Carmine Mask +1",neck="Erra Pendant",ear1="Mani Earring",ear2="Digni. Earring",
		body="Sakpata's Plate",hands="Fall. Fin. Gaunt. +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back="Toro Cape",waist="Eschan Stone",legs="Heath. Flanchard +1",feet="Ratri Sollerets +1"}
                   
	sets.midcast.Drain = set_combine(sets.midcast['Dark Magic'], {head="Fall. Burgeonet +3",ear2="Hirudinea Earring",ring1="Evanescence Ring",ring2="Archon Ring",
									waist="Orpheus's Sash",legs="Heath. Flanchard +1",back="Niht Mantle",feet="Ratri Sollerets +1"})
                   
	sets.midcast.Aspir = sets.midcast.Drain
	
	sets.midcast.Impact = set_combine(sets.midcast['Dark Magic'], {head=empty,body="Twilight Cloak"})
	
	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
						                   
										   
		-- Engaged sets
	sets.engaged = {ammo="Coiste Bodhar",
		head="Flam. Zucchetto +2",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Cessance Earring",
		body="Dagon Breast.",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Ig. Flanchard +3",feet="Flam. Gambieras +2"}
		
	sets.engaged.Hybrid = {ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}	

	sets.engaged.SubtleBlow = {ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Dagon Breast.",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}	
		
	sets.engaged.Reraise = {ammo="Staunch Tathlum +1",
		head="Crepuscular Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Crepuscular Mail",hands="Sakpata's Gauntlets",ring1="Chirich Ring +1",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Sakpata's Leggings"}
										   
	
	-- Weaponskill sets
	-- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Ignominy Cuirass +3",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Regal Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Fall. Flanchard +3",feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Torcleaver'] = {ammo="Crepuscular Pebble",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Ignominy Cuirass +3",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Fall. Flanchard +3",feet="Nyame Sollerets"}
	
	sets.precast.WS['Torcleaver'].Capped = {ammo="Crepuscular Pebble",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Ignominy Cuirass +3",hands="Sakpata's Gauntlets",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Fall. Flanchard +3",feet="Sakpata's Leggings"}
		
	sets.precast.WS['Torcleaver'].Damage = {ammo="Coiste Bodhar",
		head="Nyame Helm",neck="Abyssal Beads +2",ear1="Thrud Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
		back=gear.back_WS,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
    sets.precast.WS['Catastrophe'] = set_combine(sets.precast.WS, {feet="Rat. Sollerets +1"})
	
    sets.precast.WS['Entropy'] = set_combine(sets.precast.WS, {})
     
    sets.precast.WS['Resolution'] = set_combine(sets.precast.WS, {ammo="Coiste Bodhar",ear1="Brutal Earring",back=gear.back_DA,feet="Sakpata's Leggings"})
           
     -- Sets to return to when not performing an action.
           
     -- Resting sets
     sets.resting = {}
           
	-- Swap to these on Moonshade using WS if at 3000 TP

	sets.MaxTP = {ear1="Thrud Earring",ear2="Ishvara Earring"}
	sets.AccMaxTP = {ear1="Thrud Earring",ear2="Ishvara Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Thrud Earring",ear2="Ishvara Earring"}
	sets.DayMaxTPWSEars = {ear1="Thrud Earring",ear2="Ishvara Earring"}
	sets.AccDayWSEars = {ear1="Thrud Earring",ear2="Ishvara Earring"}
	sets.DayWSEars = {ear1="Thrud Earring",ear2="Ishvara Earring"}
     
            -- Idle sets
           
    sets.idle = {
    ammo="Staunch Tathlum +1",
    head="Sakpata's Helm",
    body="Sacro Breastplate",
    hands="Sakpata's Gauntlets",
    legs="Sakpata's Cuisses",
    feet="Sakpata's Leggings",
    neck="Abyssal Beads +2",
    waist="Asklepian Belt",
    left_ear="Tuisto Earring",
    right_ear="Odnowa Earring +1",
    left_ring="Stikini Ring +1",
    right_ring="Stikini Ring +1",
    back="Moonbeam Cape"}
		
	sets.idle.Weak = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
	
	sets.idle.Town = set_combine(sets.idle, {head="Crepuscular Helm",body="Crepuscular Mail"})
           
    -- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Chirich Ring +1",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Crepuscular Helm",body="Crepuscular Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Chirich Ring +1",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Crepuscular Helm",body="Crepuscular Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
		head="Sakpata's Helm",neck="Abyssal Beads +2",ear1="Brutal Earring",ear2="Telos Earring",
		body="Sakpata's Plate",hands="Sakpata's Gauntlets",ring1="Moonlight Ring",ring2="Chirich Ring +1",
		back=gear.back_DA,waist="Sailfi Belt +1",legs="Sakpata's Cuisses",feet="Flam. Gambieras +2"}
     
	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.passive.Reraise = {head="Crepuscular Helm",body="Crepuscular Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

	sets.latent_refresh = {waist="Fucho-no-Obi"}
	sets.TreasureHunter = {head=gear.th_head,hands="Volte Bracers",feet=gear.valorous_th_feet,waist=gear.th_waist}
	
	sets.MaxTP = {}
	
    end
	
-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 18)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 18)
    elseif player.sub_job == 'DNC' then
        set_macro_page(1, 18)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 18)
    else
        set_macro_page(1, 18)
    end
end