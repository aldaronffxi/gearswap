-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
    state.OffenseMode:options('None','Normal')
    state.CastingMode:options('Normal','Potency','Duration')
    state.IdleMode:options('Normal','PDT','TPEat')
	state.HybridMode:options('Normal','PDT')
	state.Weapons:options('None','Musa')

	gear.nuke_jse_back = {name="Lugh's Cape", augments={'INT+20','Mag. Acc+20 /Mag. Dmg.+20','"Mag.Atk.Bns."+10',}}
	gear.fc_jse_back = {name="Lugh's Cape", augments={'"Fast Cast"+10',}}
	
	gear.obi_cure_back = "Tempered Cape +1"
	gear.obi_cure_waist = "Witful Belt"

	--gear.obi_low_nuke_waist = "Refoccilation Stone"
	--gear.obi_high_nuke_waist = "Refoccilation Stone"
	
		-- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c scholar power')
	send_command('bind @` gs c cycle MagicBurstMode')
	send_command('bind @f10 gs c cycle RecoverMode')
	send_command('bind @f8 gs c toggle AutoNukeMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation and Myrkr.
	send_command('bind @^` input /ja "Parsimony" <me>')
	send_command('bind ^backspace input /ma "Stun" <t>')
	send_command('bind !backspace gs c scholar speed')
	send_command('bind @backspace gs c scholar aoe')
	send_command('bind ^= input /ja "Dark Arts" <me>')
	send_command('bind != input /ja "Light Arts" <me>')
	send_command('bind ^\\\\ input /ma "Protect V" <t>')
	send_command('bind @\\\\ input /ma "Shell V" <t>')
	send_command('bind !\\\\ input /ma "Reraise III" <me>')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()


    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	sets.weapons.Musa = {main="Musa",}

    -- Precast Sets

    -- Precast sets to enhance JAs

    sets.precast.JA['Tabula Rasa'] = {legs="Pedagogy Pants"}
	sets.precast.JA['Enlightenment'] = {body="Peda. Gown +3"} 

    -- Fast cast sets for spells

    sets.precast.FC = {main="Musa",sub="Clerisy Strap +1",ammo="Incantor Stone",
        head="Peda. M.Board +2",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Malignance Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Prolix Ring",
        back=gear.fc_jse_back,waist="Embla Sash",legs="Psycloth Lappas",feet="Peda. Loafers +1"}

    --sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})

    --sets.precast.FC.Curaga = sets.precast.FC.Cure

    sets.precast.FC.Impact = set_combine(sets.precast.FC['Elemental Magic'], {head=empty,body="Twilight Cloak"})

    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS['Myrkr'] = {ammo="Staunch Tathlum",
		head="Pixie Hairpin +1",neck="Sanctity Necklace",ear1="Gifted Earring",ear2="Etiolation Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Freke Ring",ring2="Mephitas's Ring +1",
		back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    -- Midcast Sets

	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.chironic_treasure_feet})
	
	-- Gear that converts elemental damage done to recover MP.	
	sets.RecoverMP = {body="Seidr Cotehardie"}	
	
	-- Gear for specific elemental nukes.
	sets.element.Wind = {main="Marin Staff +1"}
	sets.element.Ice = {main="Ngqoqwanb"}
	sets.element.Earth = {neck="Quanpur Necklace"}

    sets.midcast.FastRecast = {main="Musa",sub="Clerisy Strap +1",ammo="Impatiens",
        head="Vanya Hood",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Malignance Earring",
        body="Zendik Robe",hands="Gende. Gages +1",ring1="Kishar Ring",ring2="Defending Ring",
        back=gear.fc_jse_back,waist="Embla Sash",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		
    sets.midcast.Cure = {main="Musa",sub="Enki Grip",ammo="Hasty Pinion +1",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Meili Earring",
        body="Kaykaus Bliaut +1",hands="Peda. Bracers +3",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.fc_jse_back,waist="Luminary Sash",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}

    sets.midcast.LightWeatherCure = {main="Chatoyant Staff",sub="Enki Grip",ammo="Hasty Pinion +1",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Meili Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Kaykaus Tights +1",feet="Kaykaus Boots +1"}
		
    sets.midcast.LightDayCure = {main="Chatoyant Staff",sub="Enki Grip",ammo="Hasty Pinion +1",
        head="Kaykaus Mitra +1",neck="Incanter's Torque",ear1="Mendi. Earring",ear2="Meili Earring",
        body="Kaykaus Bliaut +1",hands="Kaykaus Cuffs +1",ring1="Stikini Ring +1",ring2="Sirona's Ring",
        back="Twilight Cape",waist="Hachirin-no-Obi",legs="Kaykaus Tights +1 ",feet="Kaykaus Boots +1"}

    sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",ring1="Kunaji Ring",ring2="Asklepian Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
	
	sets.midcast.Cursna = {main="Oranyan",sub="Clemency Grip",ammo="Incantor Stone",
		head="Vanya Hood",neck="Malison Medallion",ear1="Mendi. Earring",ear2="Meili Earring",
		body="Peda. Gown +3",hands="Hieros Mittens",ring1="Menelaus's Ring",ring2="Ephedra Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Psycloth Lappas",feet="Vanya Clogs"}
		
	sets.midcast['Enhancing Magic'] = {main="Musa",sub="Enki Strap",ammo="Incantor Stone",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Mimir Earring",ear2="Malignance Earring",
		body="Peda. Gown +3",hands="Telchine Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.fc_jse_back,waist="Embla Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}

    sets.midcast.Regen = set_combine(sets.midcast['Enhancing Magic'], {main="Musa",sub="Enki Strap",head="Arbatel Bonnet +1"})
	
	sets.midcast.Regen.Potency = set_combine(sets.midcast['Enhancing Magic'], {main="Musa",sub="Enki Strap",head="Arbatel Bonnet +1",back="Bookworm's Cape"})
	
	sets.midcast.Regen.Duration = set_combine(sets.midcast['Enhancing Magic'], {main="Musa",sub="Enki Strap"})

    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
	
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    sets.midcast.Storm = set_combine(sets.midcast['Enhancing Magic'], {feet="Peda. Loafers +1"})

    sets.midcast.Protect = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Protectra = sets.midcast.Protect

    sets.midcast.Shell = set_combine(sets.midcast['Enhancing Magic'], {ring2="Sheltered Ring"})
    sets.midcast.Shellra = sets.midcast.Shell


    -- Custom spell classes

	sets.midcast['Enfeebling Magic'] = {main="Contemplator +1",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=none,neck="Argute Stole +2",ear1="Crepuscular Earring",ear2="Malignance Earring",
        body="Cohort Cloak +1",hands="Regal Cuffs",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Obstin. Sash",legs="Chironic Hose",feet="Nyame Sollerets"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	
	sets.midcast['Divine Magic'] = sets.midcast['Enfeebling Magic']

    sets.midcast['Dark Magic'] = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Amalric Coif",neck="Incanter's Torque",ear1="Regal Earring",ear2="Mani Earring",
        body="Chironic Doublet",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Chironic Hose",feet=gear.merlinic_aspir_feet}

    sets.midcast.Kaustra = {main="Akademos",sub="Enki Strap",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Freke Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Orpheus's Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}

    sets.midcast.Drain = {main="Daybreak",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Argute Stole +2",ear1="Hirudinea Earring",ear2="Mani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Evanescence Ring",ring2="Archon Ring",
        back=gear.nuke_jse_back,waist="Fucho-no-obi",legs="Chironic Hose",feet="Agwu's Pigaches"}

    sets.midcast.Aspir = sets.midcast.Drain

    sets.midcast.Stun = {main="Musa",sub="Khonsu",ammo="Pemphredo Tathlum",
        head=none,neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
        body="Cohort Cloak +1",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.nuke_jse_back,waist="Witful Belt",legs="Psycloth Lappas",feet="Regal Pumps +1"}
		

    -- Elemental Magic sets are default for handling low-tier nukes.
    sets.midcast['Elemental Magic'] = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Agwu's Cap",neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
        body="Amalric Doublet +1",hands="Amalric Gages +1",ring1="Metamor. Ring +1",ring2="Freke Ring",
        back=gear.nuke_jse_back,waist="Orpheus's Sash",legs="Amalric Slops +1",feet="Amalric Nails +1"}

	
	--sets.midcast['Elemental Magic'].HighTierNuke = set_combine(sets.midcast['Elemental Magic'], {main="Akademos",sub="Niobid Strap",ammo="Pemphredo Tathlum",ear1="Regal Earring",ear2="Barkaro. Earring",hands="Amalric Gages"})

	sets.midcast.Helix = {main="Bunzi's Rod",sub="Culminus",ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
        body="Agwu's Robe",hands="Amalric Gages +1",ring1="Freke Ring",ring2="Mallquis Ring",
        back=gear.nuke_jse_back,waist="Orpheus's Sash",legs="Agwu's Slops",feet="Amalric Nails +1"}	


	sets.midcast.Impact = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
		head=empty,neck="Argute Stole +2",ear1="Regal Earring",ear2="Barkaro. Earring",
		body="Twilight Cloak",hands="Amalric Gages +1",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
		back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Agwu's Slops",feet="Agwu's Pigaches"}
		
	-- Gear for Magic Burst mode.
    sets.MagicBurst = {main="Bunzi's Rod",sub="Ammurapi Shield",ammo="Ghastly Tathlum +1",body="Agwu's Robe",legs="Agwu's Slops",feet="Agwu's Pigaches",ring1="Mujin Band"}		
	
	sets.HelixBurst = {main="Bunzi's Rod",sub="Culminus",ammo="Ghastly Tathlum +1",
        head="Agwu's Cap",neck="Argute Stole +2",ear1="Regal Earring",ear2="Malignance Earring",
        body="Agwu's Robe",hands="Amalric Gages +1",ring1="Mujin Band",ring2="Mallquis Ring",
        back=gear.nuke_jse_back,waist="Orpheus's Sash",legs="Agwu's Slops",feet="Amalric Nails +1"}


    -- Sets to return to when not performing an action.

     -- Resting sets
    sets.resting = {main="Chatoyant Staff",sub="Oneiros Grip",ammo="Homiliary",
		head="Befouled Crown",neck="Chrys. Torque",ear1="Etiolation Earring",ear2="Ethereal Earring",
		body="Amalric Doublet",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Dark Ring",
		back="Umbra Cape",waist="Fucho-no-obi",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}


    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)

    sets.idle = {main="Daybreak",sub="Genmei Shield",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Regal Earring",
        body="Shamash Robe",hands="Nyame Gauntlets",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Assid. Pants +1",feet="Nyame Sollerets"}
		
	sets.idle.Town = set_combine(sets.idle, {main="Musa",sub="Enki Strap",neck="Argute Stole +2",waist="Orpheus's Sash"})

    -- Defense sets
		
    sets.defense.MEVA = {main="Oranyan",sub="Umbra Strap",ammo="Staunch Tathlum",
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Etiolation Earring",ear2="Sanare Earring",
        body=gear.merlinic_nuke_body,hands="Gende. Gages +1",ring1="Vengeful Ring",ring2="Purity Ring",
        back=gear.nuke_jse_back,waist="Acuity Belt +1",legs="Amalric Slops +1",feet="Nyame Sollerets"}
		
    sets.Kiting = {feet="Crier's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

    -- Normal melee group
    sets.engaged = {main="Musa",sub="Enki Strap",ammo="Homiliary",
        head="Befouled Crown",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Shamash Robe",hands=gear.merlinic_refresh_hands,ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Assid. Pants +1",feet=gear.chironic_refresh_feet}
		
	sets.engaged.PDT = {main="Terra's Staff", sub="Oneiros Grip",ammo="Staunch Tathlum",
        head="Kaykaus Mitra +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Gende. Gages +1",ring1="Defending Ring",ring2="Dark Ring",
        back="Umbra Cape",waist="Flax Sash",legs="Hagondes Pants +1",feet=gear.chironic_refresh_feet}

    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Ebullience'] = {head="Arbatel Bonnet +1"}
    sets.buff['Rapture'] = {head="Arbatel Bonnet +1"}
    sets.buff['Perpetuance'] = {hands="Arbatel Bracers +1"}
    sets.buff['Immanence'] = {hands="Arbatel Bracers +1"}
    sets.buff['Penury'] = {legs="Arbatel Pants +1"}
    sets.buff['Parsimony'] = {legs="Arbatel Pants +1"}
    sets.buff['Celerity'] = {feet="Peda. Loafers +1"}
    sets.buff['Alacrity'] = {feet="Peda. Loafers +1"}
    sets.buff['Klimaform'] = {feet="Arbatel Loafers +1"}
	
	sets.HPDown = {head="Pixie Hairpin +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Zendik Robe",hands="Hieros Mittens",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
		back="Swith Cape +1",waist="Flax Sash",legs="Shedir Seraweels",feet=""}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})

    sets.buff.FullSublimation = {}
    sets.buff.PDTSublimation = {}
	
end

-- Select default macro book on initial load or subjob change.
-- Default macro set/book
function select_default_macro_book()
	if player.sub_job == 'RDM' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'BLM' then
		set_macro_page(1, 10)
	elseif player.sub_job == 'WHM' then
		set_macro_page(1, 10)
	else
		set_macro_page(1, 10)
	end
end