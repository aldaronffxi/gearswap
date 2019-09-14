-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_setup()
	-- Options: Override default values
    state.OffenseMode:options('Normal','Acc')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.HybridMode:options('Normal')
    state.PhysicalDefenseMode:options('PDT', 'PDTReraise')
    state.MagicalDefenseMode:options('MDT', 'MDTReraise')
	state.ResistDefenseMode:options('MEVA')
	state.IdleMode:options('Normal', 'PDT','Refresh','Reraise')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None'}
	state.Weapons:options('ShiningOne')
	state.Passive = M{['description'] = 'Passive Mode','None','MP','Twilight'}

    select_default_macro_book()
	
	gear.back_DA = {name="Brigantia's Mantle", augments={'STR+20','Accuracy+20 Attack+20','"Dbl.Atk."+10',}}
	
	-- Additional local binds
	send_command('bind ^` input /ja "Hasso" <me>')
	send_command('bind !` input /ja "Seigan" <me>')
	send_command('bind ^f11 gs c cycle MagicalDefenseMode')
	send_command('bind @f7 gs c toggle AutoJumpMode')
	send_command('bind @` gs c cycle SkillchainMode')
end

-- Define sets and vars used by this job file.
function init_gear_sets()
	--------------------------------------
	-- Start defining the sets
	--------------------------------------
	
	-- Precast Sets
	-- Precast sets to enhance JAs
	sets.precast.JA.Angon = {ammo="Angon"} --hands="Ptero. Fin. G. +1"
	sets.precast.JA.Jump = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Vishap Mail +1",hands="Vishap F. G. +1",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Sulevi. Cuisses +1",feet="Ostro Greaves"}
	sets.precast.JA['High Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Vishap Mail +1",hands="Vishap F. G. +1",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Ptero. Brais +1",feet="Ostro Greaves"}
	sets.precast.JA['Soul Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Vishap Mail +1",hands="Vishap F. G. +1",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Sulevi. Cuisses +1",feet="Ostro Greaves"}
	sets.precast.JA['Spirit Jump'] = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Telos Earring",ear2="Sherida Earring",
		body="Vishap Mail +1",hands="Vishap F. G. +1",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Sulevi. Cuisses +1",feet="Pelt. Schyn. +1"}
	sets.precast.JA['Ancient Circle'] = {}
	sets.precast.JA['Super Jump'] = {}
	sets.precast.JA['Spirit Link'] = {head="Vishap Armet +1",hands="Lncr. Vmbrc. +1",ear1="Pratik Earring",feet="Ptero. Greaves"}
	sets.precast.JA['Call Wyvern'] = {body="Pteroslaver Mail"} 
	sets.precast.JA['Deep Breathing'] = {} 
	sets.precast.JA['Spirit Surge'] = {} 
	sets.precast.JA['Smiting Breath'] = {back=gear.back_DA}
	
	-- Breath sets
	sets.precast.JA['Restoring Breath'] = {head="Ptero. Armet",neck="Lancer's Torque",ear1="Lancer's Earring",hands="Despair Fin. Gaunt.",
		back="Updraft Mantle",waist="Glassblower's Belt",legs="Vishap Brais +1",feet="Ptero. Greaves"}
	sets.precast.JA['Steady Wing'] = {head="Ptero. Armet",neck="Lancer's Torque",ear1="Lancer's Earring",hands="Despair Fin. Gaunt.",
		back="Updraft Mantle",waist="Glassblower's Belt",legs="Vishap Brais +1",feet="Ptero. Greaves"}
	
	sets.HealingBreath = {back=gear.back_DA}
	sets.SmitingBreath = {back=gear.back_DA}

	-- Fast cast sets for spells
	
	sets.precast.FC = {ammo="Impatiens",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Founder's Greaves",feet="Carmine Greaves +1"}
	
	-- Waltz set (chr and vit)
	sets.precast.Waltz = {}
		
	-- Don't need any special gear for Healing Waltz.
	sets.precast.Waltz['Healing Waltz'] = {}

	sets.midcast.Cure = {}
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
	-- Midcast Sets
	sets.midcast.FastRecast = {ammo="Staunch Tathlum",
		head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
		body="Taeon Tabard",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		back="Moonlight Cape",waist="Tempus Fugit",legs="Founder's Greaves",feet="Carmine Greaves +1"}
		
	-- Put HP+ gear and the AF head to make healing breath trigger more easily with this set.
	sets.midcast.HB_Trigger = set_combine(sets.midcast.FastRecast, {head="Vishap Armet +1"})
	
	-- Weaponskill sets

	-- Default set for any weaponskill that isn't any more specifically defined
	
	sets.precast.WS = {ammo="Knobkierrie",
		head="Flam. Zucchetto +2",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Sherida Earring",
		body=gear.valorous_wsd_body,hands="Sulev. Gauntlets +1",ring1="Karieyh Ring +1",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Fotia Belt",legs="Sulevi. Cuisses +1",feet="Flam. Gambieras +2"}
		
	sets.precast.WS.SomeAcc = set_combine(sets.precast.WS, {})
	sets.precast.WS.Acc = set_combine(sets.precast.WS, {neck="Shulmanu Collar"})
	sets.precast.WS.Fodder = set_combine(sets.precast.WS, {})
	
	-- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
	sets.precast.WS['Stardiver'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Stardiver'].Acc = set_combine(sets.precast.WS.Acc, {})
	sets.precast.WS['Stardiver'].Darksday = set_combine(sets.precast.WS, {head="Gavialis Helm"})
	sets.precast.WS['Stardiver'].Earthsday = set_combine(sets.precast.WS, {head="Gavialis Helm"})
	sets.precast.WS['Stardiver'].Lightsday = set_combine(sets.precast.WS, {head="Gavialis Helm"})

	sets.precast.WS['Drakesbane'] = set_combine(sets.precast.WS, {})
	sets.precast.WS['Drakesbane'].Acc = set_combine(sets.precast.WS.Acc, {})
	
	sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {head=gear.valorous_wsd_head,hands="Flam. Manopolas +1",ear1="Ishvara Earring",feet="Sulev. Leggings +1"})
	sets.precast.WS['Impulse Drive'].Acc = set_combine(sets.precast.WS.Acc, {})
	
	
	sets.precast.WS['Cammlanns Torment'] = set_combine(sets.precast.WS['Impulse Drive'], {})
	sets.precast.WS['Cammlanns Torment'].Acc = set_combine(sets.precast.WS['Impulse Drive'], {})
	
	
	sets.precast.WS['Sonic Thrust'] = set_combine(sets.precast.WS['Impulse Drive'], {ear1="Moonshade Earring"})
	sets.precast.WS['Sonic Thrust'].Acc = set_combine(sets.precast.WS['Impulse Drive'], {})


	
	-- Sets to return to when not performing an action.
	
	-- Resting sets
	sets.resting = {}

	-- Idle sets
	sets.idle = {ammo="Staunch Tathlum",
		head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Founder's Breastplate",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Shadow Ring",
		back="",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Sulev. Leggings +1"}
		
	sets.idle.Refresh = {ammo="Staunch Tathlum",
		head="Jumalik Helm",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Jumalik Mail",hands="Sulev. Gauntlets +1",ring1="Defending Ring",ring2="Dark Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Carmine Cuisses +1",feet="Sulev. Leggings +1"}

	sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
	
	-- Defense sets
	sets.defense.PDT = {ammo="Staunch Tathlum",
		head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Shadow Mantle",waist="Flume Belt",legs="Arke Cosciales",feet="Sulev. Leggings +1"}
		
	sets.defense.PDTReraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum",
		head="Flam. Zucchetto +2",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Sulev. Leggings +1"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, {head="Twilight Helm",body="Twilight Mail"})
		
	sets.defense.MEVA = {ammo="Staunch Tathlum",
		head="Flam. Zucchetto +2",neck="Warder's Charm +1",ear1="Genmei Earring",ear2="Etiolation Earring",
		body="Tartarus Platemail",hands="Sulev. Gauntlets +1",ring1="Moonbeam Ring",ring2="Moonbeam Ring",
		back="Moonlight Cape",waist="Flume Belt",legs="Arke Cosciales",feet="Sulev. Leggings +1"}

	sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
	
    -- Extra defense sets.  Apply these on top of melee or defense sets.
    sets.passive.MP = {ear2="Etiolation Earring",waist="Flume Belt"}
    sets.passive.Twilight = {head="Twilight Helm", body="Twilight Mail"}
	sets.TreasureHunter = set_combine(sets.TreasureHunter, {})
	
	-- Weapons sets
	sets.weapons.Trishula = {main="Trishula",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip"}

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Lugra Earring +1",ear2="Sherida Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}
	
	-- Engaged sets

	-- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
	-- sets if more refined versions aren't defined.
	-- If you create a set with both offense and defense modes, the offense mode should be first.
	-- EG: sets.engaged.Dagger.Accuracy.Evasion
	
	-- Normal melee group

	sets.engaged = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Anu Torque",ear1="Brutal Earring",ear2="Sherida Earring",
		body="Founder's Breastplate",hands="Sulev. Gauntlets +1",ring1="Petrov Ring",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Sulevi. Cuisses +1",feet="Flam. Gambieras +2"}
    sets.engaged.Acc = {ammo="Ginsen",
		head="Flam. Zucchetto +2",neck="Shulmanu Collar",ear1="Digni. Earring",ear2="Telos Earring",
		body="Founder's Breastplate",hands="Sulev. Gauntlets +1",ring1="Ramuh Ring +1",ring2="Niqmaddu Ring",
		back=gear.back_DA,waist="Ioskeha Belt",legs="Sulevi. Cuisses +1",feet="Flam. Gambieras +2"}
    
    sets.engaged.AM = {}
    sets.engaged.AM.Acc = {}
    
    sets.engaged.PDT = {}
    sets.engaged.Acc.PDT = {}
    
    sets.engaged.AM.PDT = {}
    sets.engaged.AM.Acc.PDT = {}
    	
	--[[ Melee sets for in Adoulin, which has an extra 2% Haste from Ionis.
	
    sets.engaged.Adoulin = {}
    sets.engaged.Adoulin.SomeAcc = {}
	sets.engaged.Adoulin.Acc = {}
    sets.engaged.Adoulin.FullAcc = {}
    sets.engaged.Adoulin.Fodder = {}

    sets.engaged.Adoulin.AM = {}
    sets.engaged.Adoulin.AM.SomeAcc = {}
	sets.engaged.Adoulin.AM.Acc = {}
    sets.engaged.Adoulin.AM.FullAcc = {}
    sets.engaged.Adoulin.AM.Fodder = {}
	
    sets.engaged.Adoulin.PDT = {}
    sets.engaged.Adoulin.SomeAcc.PDT = {}
	sets.engaged.Adoulin.Acc.PDT = {}
    sets.engaged.Adoulin.FullAcc.PDT = {}
    sets.engaged.Adoulin.Fodder.PDT = {}
	
    sets.engaged.Adoulin.AM.PDT = {}
    sets.engaged.Adoulin.AM.SomeAcc.PDT = {}
	sets.engaged.Adoulin.AM.Acc.PDT = {}
    sets.engaged.Adoulin.AM.FullAcc.PDT = {}
    sets.engaged.Adoulin.AM.Fodder.PDT = {}
	]]

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