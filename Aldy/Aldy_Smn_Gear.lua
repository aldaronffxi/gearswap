-- Setup vars that are user-dependent.  Can override this function in a sidecar.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.CastingMode:options('Normal','Resistant','OccultAcumen')
    state.IdleMode:options('Normal', 'PDT','TPEat')
	state.Weapons:options('None','Nirvana')

    gear.perp_staff = {name="Nirvana"}
	
	gear.magic_jse_back = {name="Campestres's Cape", augments={'Pet: M.Acc.+20 Pet: M.Dmg.+20','"Fast Cast"+10',}}
	gear.phys_jse_back = {name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+5 Pet: Rng.Atk.+5','Pet: "Regen"+10','Pet: Damage taken -5%',}}
	
    send_command('bind !` input /ja "Release" <me>')
	send_command('bind @` gs c cycle MagicBurst')
	send_command('bind ^` gs c toggle PactSpamMode')
	send_command('bind !pause gs c toggle AutoSubMode') --Automatically uses sublimation.
	send_command('bind ^q gs c weapons Khatvanga;gs c set CastingMode OccultAcumen')
	send_command('bind !q gs c weapons default;gs c reset CastingMode')
	
    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Precast Sets
    --------------------------------------
    
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {feet=gear.merlinic_treasure_feet})
	
    -- Precast sets to enhance JAs
    sets.precast.JA['Astral Flow'] = {head="Glyphic Horn"}
    
    sets.precast.JA['Elemental Siphon'] = {main="Espiritus",sub="Vox Grip",ammo="Esper Stone +1",
        head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
        body="Telchine Chasuble",hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Stikini Ring",
        back="Conveyance Cape",waist="Kobo Obi",legs="Telchine Braconi",feet="Beck. Pigaches +1"}

    sets.precast.JA['Mana Cede'] = {hands="Beck. Bracers +1"}

    -- Pact delay reduction gear
    sets.precast.BloodPactWard = {main="Espiritus",sub="Vox Grip",ammo="Sancus Sachet +1",
		head="Beckoner's Horn +1",neck="Incanter's Torque",ear1="C. Palug Earring",ear2="Evans Earring",
        body="Con. Doublet +3",hands="Convoker's Bracers +1",ring1="Defending Ring",ring2="Evoker's Ring",
        back="Conveyance Cape",waist="Kobo Obi",legs="Glyphic Spats"}

    sets.precast.BloodPactRage = sets.precast.BloodPactWard

    -- Fast cast sets for spells
    
    sets.precast.FC = {main="Grioavolr",sub="Clerisy Strap +1",ammo="Impatiens",
		head="Vanya Hood",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		body="Inyanga Jubbah +1",hands="",ring1="Kishar Ring",ring2="Lebeche Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Regal Pumps +1"}

    --sets.precast.FC.Cure = set_combine(sets.precast.FC, {main="Serenity",sub="Clerisy Strap +1"})
		
    sets.precast.FC['Enhancing Magic'] = set_combine(sets.precast.FC, {waist="Siegel Sash"})
	
    sets.precast.FC.Stoneskin = set_combine(sets.precast.FC['Enhancing Magic'], {})
	
	sets.precast.FC.Impact = set_combine(sets.precast.FC, {head=empty,body="Twilight Cloak"})       
	
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS['Myrkr'] = {ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Sanctity Necklace",ear1="Etiolation Earring",ear2="Gifted Earring",
        body="Con. Doublet +3",hands="Regal Cuffs",ring1="Mephitas's Ring +1",ring2="Mephitas's Ring",
        back="Conveyance Cape",waist="Luminary Sash",legs="Gyve Trousers",feet="Beck. Pigaches +1"}
		
    sets.precast.WS['Garland of Bliss'] = {ammo="Sancus Sachet +1",
        head="Merlinic Hood",neck="Fotia Gorget",ear1="Friomisi Earring",ear2="Malignance Earring",
        body="Vedic Coat",hands="Amalric Gages",ring1="Acumen Ring",ring2="Karieyh Ring +1",
        back="Seshaw Cape",waist="Fotia Belt",legs="Merlinic Shalwar",feet="Merlinic Crackows"}

    
    --------------------------------------
    -- Midcast sets
    --------------------------------------

    sets.midcast.FastRecast = {main="Grioavolr",
		head="Vanya Hood",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		body="Inyanga Jubbah +1",hands="",ring1="Kishar Ring",ring2="Prolix Ring",
		back="Perimede Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Regal Pumps +1"}
	
    sets.midcast.Cure = {main="Gada",sub="Sors Shield",
        head="Vanya Hood",neck="Nodens Gorget",ear1="Mendicant's Earring",
        body="Vrikodara Jupon",hands="Telchine Gloves",ring1="Lebeche Ring",ring2="Ephedra Ring",
        back="Solemnity Cape",waist="Witful Belt",legs="Gyve Trousers",feet="Vanya Clogs"}
		
	sets.Self_Healing = {waist="Gishdubar Sash"}
	sets.Cure_Received = {waist="Gishdubar Sash"}
	sets.Self_Refresh = {back="Grapevine Cape",waist="Gishdubar Sash",feet="Inspirited Boots"}
		
	sets.midcast.Cursna =  set_combine(sets.midcast.Cure, {ring1="Ephedra Ring"})
		
	sets.midcast.StatusRemoval = set_combine(sets.midcast.FastRecast)

	sets.midcast['Elemental Magic'] = {main=gear.grioavolr_nuke_staff,sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
	sets.midcast['Elemental Magic'].Resistant = {main=gear.grioavolr_nuke_staff,sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Elemental Magic'].OccultAcumen = {main="Khatvanga",sub="Bloodrain Strap",ammo="Seraphic Ampulla",
        head=gear.merlinic_nuke_head,neck="Combatant's Torque",ear1="Dedition Earring",ear2="Telos Earring",
        body=gear.merlinic_occult_body,hands=gear.merlinic_occult_hands,ring1="Rajas Ring",ring2="Petrov Ring",
        back="Toro Cape",waist="Oneiros Rope",legs="Perdition Slops",feet=gear.merlinic_occult_feet}
		
	sets.midcast.Impact = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head=empty,neck="Erra Pendant",ear1="Etiolation Earring",ear2="Gwati Earring",
		body="Twilight Cloak",hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Toro Cape",waist="Acuity Belt +1",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
		
	sets.midcast.Impact.OccultAcumen = set_combine(sets.midcast['Elemental Magic'].OccultAcumen, {head=empty,body="Twilight Cloak"})

    sets.midcast['Divine Magic'] = {main="Oranyan",sub="Zuuxowu Grip",ammo="Dosis Tathlum",
        head=gear.merlinic_nuke_head,neck="Baetyl Pendant",ear1="Crematio Earring",ear2="Friomisi Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Shiva Ring +1",ring2="Shiva Ring +1",
		back="Toro Cape",waist="Sekhmet Corset",legs="Merlinic Shalwar",feet=gear.merlinic_nuke_feet}
		
    sets.midcast['Dark Magic'] = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head=gear.merlinic_nuke_head,neck="Incanter's Torque",ear1="Digni. Earring",ear2="Gwati Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Stikini Ring",ring2="Stikini Ring",
        back="Aurist's Cape +1",waist="Yamabuki-no-Obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
	
	sets.midcast.Drain = {main="Rubicundity",sub="Ammurapi Shield",ammo="Pemphredo Tathlum",
        head="Pixie Hairpin +1",neck="Incanter's Torque",ear1="Digni. Earring",ear2="Gwati Earring",
        body=gear.merlinic_nuke_body,hands="Amalric Gages +1",ring1="Archon Ring",ring2="Evanescence Ring",
        back="Aurist's Cape +1",waist="Fucho-no-obi",legs="Merlinic Shalwar",feet=gear.merlinic_aspir_feet}
    
    sets.midcast.Aspir = sets.midcast.Drain
		
    sets.midcast.Stun = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",
		body="Inyanga Jubbah +1",hands="Volte Gloves",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Swith Cape +1",waist="Witful Belt",legs="Gyve Trousers",feet="Regal Pumps +1"}
		
    sets.midcast.Stun.Resistant = {main="Oranyan",sub="Clerisy Strap +1",ammo="Hasty Pinion +1",
		head="Amalric Coif +1",neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Gwati Earring",
		body="Inyanga Jubbah +1",hands="Volte Gloves",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Aurist's Cape +1",waist="Witful Belt",legs="Gyve Trousers",feet=gear.merlinic_aspir_feet}
		
	sets.midcast['Enfeebling Magic'] = {main="Oranyan",sub="Enki Strap",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Digni. Earring",ear2="Gwati Earring",
		body=gear.merlinic_nuke_body,hands="Regal Cuffs",ring1="Kishar Ring",ring2="Stikini Ring",
		back="Aurist's Cape +1",waist="Luminary Sash",legs="Gyve Trousers",feet="Uk'uxkaj Boots"}
		
	sets.midcast['Enfeebling Magic'].Resistant = {main="Oranyan",sub="Clerisy Strap +1",ammo="Pemphredo Tathlum",
		head="Befouled Crown",neck="Erra Pendant",ear1="Digni. Earring",ear2="Gwati Earring",
		body=gear.merlinic_nuke_body,hands="Regal Cuffs",ring1="Stikini Ring",ring2="Stikini Ring",
		back=gear.nuke_jse_back,waist="Luminary Sash",legs="Gyve Trousers",feet="Skaoi Boots"}
		
	sets.midcast.Dia = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Diaga = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Dia II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast.Bio = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
	sets.midcast['Bio II'] = set_combine(sets.midcast['Enfeebling Magic'], sets.TreasureHunter)
		
	sets.midcast['Enhancing Magic'] = {main="Gada",sub="Ammurapi Shield",
		head="Telchine Cap",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="Gifted Earring",
		body="Telchine Chas.",hands="Telchine Gloves",ring1="Stikini Ring",ring2="Stikini Ring",
		back="Perimede Cape",waist="Olympus Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
	sets.midcast.Refresh = set_combine(sets.midcast['Enhancing Magic'], {head="Amalric Coif +1"})
	sets.midcast.Aquaveil = set_combine(sets.midcast['Enhancing Magic'], {main="Vadose Rod",sub="Genmei Shield",head="Amalric Coif +1",hands="Regal Cuffs",waist="Emphatikos Rope",legs="Shedir Seraweels"})
    sets.midcast.Stoneskin = set_combine(sets.midcast['Enhancing Magic'], {neck="Nodens Gorget",ear2="Earthcry Earring",waist="Siegel Sash",legs="Shedir Seraweels"})
	sets.midcast.BarElement = set_combine(sets.precast.FC['Enhancing Magic'], {legs="Shedir Seraweels"})

    -- Avatar pact sets.  All pacts are Ability type.
    
    sets.midcast.Pet.BloodPactWard = {main="Espiritus",sub="Vox Grip",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Incanter's Torque",ear1="Andoaa Earring",ear2="C. Palug Earring",
        body="Beck. Doublet +1",hands="Lamassu Mitts +1",ring1="Evoker's Ring",ring2="Stikini Ring",
        back="Conveyance Cape",waist="Kobo Obi",legs="Baayami Slops",feet="Baayami Sabots"}

    sets.midcast.Pet.DebuffBloodPactWard = {main="Espiritus",sub="Vox Grip",ammo="Sancus Sachet +1",
        head="Convoker's Horn +3",neck="Caller's Pendant",ear1="Andoaa Earring",ear2="Enmerkar Earring",
        body="Beck. Doublet +1",hands="Merlinic Dastanas",ring1="Evoker's Ring",ring2="Stikini Ring",
        back="Campestres's Cape",waist="Kobo Obi",legs="Tali'ah Seraweels",feet="Beck. Pigaches +1"}
        
    sets.midcast.Pet.DebuffBloodPactWard.Acc = sets.midcast.Pet.DebuffBloodPactWard
    
    sets.midcast.Pet.PhysicalBloodPactRage = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
        head="Helios Band",
		neck="Summoner's Collar +1",
		ear1="Gelos Earring",ear2="Lugalbanda Earring",
        body="Con. Doublet +3",
		hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+20 Pet: "Mag.Atk.Bns."+20','Blood Pact Dmg.+7','Pet: DEX+5','Pet: Mag. Acc.+8','Pet: "Mag.Atk.Bns."+3',}},
		ring1="Varar Ring +1",ring2="Varar Ring +1",
        back={name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+5 Pet: Rng.Atk.+5','Pet: "Regen"+10','Pet: Damage taken -5%',}},
		waist="Incarnation Sash",
		legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},
		feet="Helios Boots"}

    sets.midcast.Pet.PhysicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {feet="Convo. Pigaches +2"})

    sets.midcast.Pet.MagicalBloodPactRage = { 
		main="Espiritus",sub="Elan Strap +1",ammo="Sancus Sachet +1",
        head="Helios Band",
		neck="Adad Amulet",ear1="Gelos Earring",ear2="Lugalbanda Earring",
        body="Apo. Dalmatica +1",
		hands={name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+20 Pet: "Mag.Atk.Bns."+20','Blood Pact Dmg.+7','Pet: DEX+5','Pet: Mag. Acc.+8','Pet: "Mag.Atk.Bns."+3',}},
		ring1="Varar Ring +1",ring2="Varar Ring +1",
        back="Campestres's Cape",
		waist="Regal Belt",
		legs={ name="Apogee Slacks +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}},
		feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}
		}
    sets.midcast.Pet.MagicalBloodPactRage.Acc = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {body="Con. Doublet +3",feet="Convo. Pigaches +2"})

    -- Spirits cast magic spells, which can be identified in standard ways.
    
    sets.midcast.Pet.WhiteMagic = {} --legs="Summoner's Spats"
    
    sets.midcast.Pet['Elemental Magic'] = set_combine(sets.midcast.Pet.MagicalBloodPactRage, {}) --legs="Summoner's Spats"

    sets.midcast.Pet['Elemental Magic'].Resistant = {}
    
	sets.midcast.Pet['Flaming Crush'] = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
        head="Helios Band",neck="Summoner's Collar +1",ear1="Gelos Earring",ear2="Lugalbanda Earring",
        body="Con. Doublet +3",hands={ name="Merlinic Dastanas", augments={'Pet: Mag. Acc.+20 Pet: "Mag.Atk.Bns."+20','Blood Pact Dmg.+7','Pet: DEX+5','Pet: Mag. Acc.+8','Pet: "Mag.Atk.Bns."+3',}},ring1="Varar Ring +1",ring2="Varar Ring +1",
        back={name="Campestres's Cape", augments={'Pet: Acc.+20 Pet: R.Acc.+20 Pet: Atk.+20 Pet: R.Atk.+20','Pet: Attack+5 Pet: Rng.Atk.+5','Pet: "Regen"+10','Pet: Damage taken -5%',}},waist="Regal Belt",legs={ name="Apogee Slacks +1", augments={'Pet: STR+20','Blood Pact Dmg.+14','Pet: "Dbl. Atk."+4',}},feet={ name="Apogee Pumps +1", augments={'MP+80','Pet: "Mag.Atk.Bns."+35','Blood Pact Dmg.+8',}}}

sets.midcast.Pet['Flaming Crush'].Acc = {feet="Convo. Pigaches +3"}
	
	sets.midcast.Pet['Burning Strike'] = sets.midcast.Pet['Flaming Crush']
	sets.midcast.Pet['Burning Strike'].Acc = sets.midcast.Pet['Flaming Crush']
	
	sets.midcast.Pet['Mountain Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Mountain Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Rock Buster'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Crescent Fang'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Eclipse Bite'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'] = set_combine(sets.midcast.Pet.PhysicalBloodPactRage, {legs="Enticer's Pants"})
	sets.midcast.Pet['Blindside'].Acc = set_combine(sets.midcast.Pet.PhysicalBloodPactRage.Acc, {legs="Enticer's Pants"})

    --------------------------------------
    -- Idle/resting/defense/etc sets
    --------------------------------------
    
    -- Resting sets
    sets.resting = {main="Chatoyant Staff",
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Defending Ring",ring2="Sheltered Ring",
        back="Umbra Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Baayami Sabots"}
    
    -- Idle sets
    sets.idle = {main="Nirvana",sub="Elan Strap +1",ammo="Staunch Tathlum",
        head="Convoker's Horn +3",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="C. Palug Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Defending Ring",ring2="Inyanga Ring",
        back="Solemnity Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}

    sets.idle.PDT = {main="Terra's Staff",sub="Oneiros Grip",ammo="Staunch Tathlum",
        head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Ethereal Earring",
        body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Varar Ring +1",
        back="Umbra Cape",waist="Regal Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}
		
	sets.idle.TPEat = set_combine(sets.idle, {neck="Chrys. Torque"})
	
	sets.idle.Town = set_combine(sets.idle, {main="Nirvana", sub="Elan Strap +1",ammo="Sancus Sachet +1"})

    -- perp costs:
    -- spirits: 7
    -- carby: 11 (5 with mitts)
    -- fenrir: 13
    -- others: 15
    -- avatar's favor: -4/tick
    
    -- Max useful -perp gear is 1 less than the perp cost (can't be reduced below 1)
    -- Aim for -14 perp, and refresh in other slots.
    
    -- -perp gear:
    -- Nirvana: -5
    -- Evoker's Ring: -1
    -- Assid. Pants +1: -3
	-- Evans Earring: -2
	-- Lucidity Sash: -2
    -- total: -18
    
    -- Can make due without either the head or the body, and use +refresh items in those slots.
    
    sets.idle.Avatar = {main="Nirvana",sub="Oneiros Grip",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Caller's Pendant",ear1="C. Palug Earring",ear2="Evans Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Evoker's Ring",ring2="Inyanga Ring",
        back=gear.phys_jse_back,waist="Regal Belt",legs="Assid. Pants +1",feet="Inyan. Crackows +2"}
		
    sets.idle.PDT.Avatar = {main="Terra's Staff",sub="Oneiros Grip",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Defending Ring",ring2="Varar Ring +1",
        back="Umbra Cape",waist="Regal Belt",legs="Assid. Pants +1",feet="Convo. Pigaches +3"}

    sets.idle.Spirit = sets.idle.Avatar
		
    sets.idle.PDT.Spirit = {main="Terra's Staff",sub="Oneiros Grip",ammo="Sancus Sachet +1",
        head="Beckoner's Horn +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Evans Earring",
        body="Apo. Dalmatica +1",hands="Asteria Mitts +1",ring1="Defending Ring",ring2="Varar Ring +1",
        back="Umbra Cape",waist="Lucidity Sash",legs="Assid. Pants +1",feet="Battlecast Gaiters"}
		
	sets.idle.TPEat.Avatar = set_combine(sets.idle.Avatar, {neck="Chrys. Torque"})
		
	--Favor always up and head is best in slot idle so no specific items here at the moment.
    sets.idle.Avatar.Favor = {}
    sets.idle.Avatar.Engaged = {}
	
	sets.idle.Avatar.Engaged.Carbuncle = {}
	sets.idle.Avatar.Engaged['Cait Sith'] = {}
        
    sets.perp = {}
    -- Caller's Bracer's halve the perp cost after other costs are accounted for.
    -- Using -10 (Nirvana, ring, Conv.feet), standard avatars would then cost 5, halved to 2.
    -- We can then use Hagondes Coat and end up with the same net MP cost, but significantly better defense.
    -- Weather is the same, but we can also use the latent on the pendant to negate the last point lost.
    sets.perp.Day = {}
    sets.perp.Weather = {}
	
	sets.perp.Carbuncle = {}
    sets.perp.Diabolos = {}
    sets.perp.Alexander = sets.midcast.Pet.BloodPactWard

	-- Not really used anymore, was for the days of specific staves for specific avatars.
    sets.perp.staff_and_grip = {}
    
    -- Defense sets
    sets.defense.PDT = {main="Terra's Staff",sub="Umbra Strap",ammo="Sancus Sachet +1",
        head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Handler's Earring +1",ear2="Enmerkar Earring",
        body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Varar Ring +1",
        back="Umbra Cape",waist="Regal Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}

    sets.defense.MDT = {main="Terra's Staff",sub="Umbra Strap",ammo="Sancus Sachet +1",
        head="Hagondes Hat +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Lugalbanda Earring",
        body="Vrikodara Jupon",hands="Hagondes Cuffs +1",ring1="Defending Ring",ring2="Varar Ring +1",
        back="Umbra Cape",waist="Regal Belt",legs="Hagondes Pants +1",feet="Battlecast Gaiters"}

    sets.defense.MEVA = {main="Terra's Staff",sub="Enki Strap",ammo="Sancus Sachet +1",
        head="Amalric Coif +1",neck="Warder's Charm +1",ear1="Sanare Earring",ear2="Lugalbanda Earring",
		body="Inyanga Jubbah +1",hands="Telchine Gloves",ring1="Vengeful Ring",Ring2="Purity Ring",
        back="Aurist's Cape +1",waist="Luminary Sash",legs="Telchine Braconi",feet="Telchine Pigaches"}
		
    sets.Kiting = {feet="Crier's Gaiters"}
    sets.latent_refresh = {waist="Fucho-no-obi"}
	sets.DayIdle = {}
	sets.NightIdle = {}

	sets.HPDown = {head="Apogee Crown +1",ear1="Mendicant's Earring",ear2="Evans Earring",
		body="Apo. Dalmatica +1",
		legs="Apogee Slacks +1",feet="Apogee Pumps +1"}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {neck="Sacrifice Torque"}

	-- Weapons sets
	sets.weapons.Nirvana = {main="Nirvana", sub="Elan Strap +1"}
	sets.weapons.Khatvanga = {main="Khatvanga",sub="Bloodrain Strap"}
    --------------------------------------
    -- Engaged sets
    --------------------------------------
    
    -- Normal melee group
    sets.engaged = {main="Nirvana",sub="Elan Strap +1",ammo="Sancus Sachet +1",
        head="Tali'ah Turban",neck="Summoner's Collar +1",ear1="Cessance Earring",ear2="Telos Earring",
        body="Tali'ah Manteel +1",hands="Tali'ah Gages",ring1="Hetairoi Ring",ring2="Petrov Ring",
        back=gear.phys_jse_back,waist="Grunfeld Rope",legs="Telchine Braconi",feet="Tali'ah Crackows +1"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book(reset)
    if reset == 'reset' then
        -- lost pet, or tried to use pact when pet is gone
    end
    
    -- Default macro set/book
    set_macro_page(1, 11)
end