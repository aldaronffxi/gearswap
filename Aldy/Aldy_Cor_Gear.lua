-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.RangedMode:options('Normal', 'Crit')
    state.WeaponskillMode:options('Match','Normal', 'Acc','Proc')
    state.CastingMode:options('Normal', 'Resistant')
    state.IdleMode:options('Normal', 'PDT', 'Refresh')
	state.HybridMode:options('Normal','Hybrid')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'DWMax'}
	state.Weapons:options('Default','DualSavageWeapons','DualLeadenMelee','DualLeadenRanged','FomalMelee','DualFomalRanged','FomalRanged','DualArmaMelee','DualArmaRanged','ArmaRanged','SavageMelee')
	state.CompensatorMode:options('Never','300','1000','Always')


    gear.RAbullet = "Chrono Bullet"
    gear.WSbullet = "Chrono Bullet"
    gear.MAbullet = "Living Bullet" --For MAB WS, do not put single-use bullets here.
    gear.QDbullet = "Hauksbok Bullet"
    options.ammo_warning_limit = 15
	ammostock = 35

	gear.RostamA = { name="Rostam", augments={'Path: A',}}
	gear.RostamB = { name="Rostam", augments={'Path: B',}}
	gear.RostamC = { name="Rostam", augments={'Path: C',}}	

	gear.tp_jse_back = {name="Camulus's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+5','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.magic_wsd_jse_back = {name="Camulus's Mantle",augments={'AGI+20','Mag. Acc+20 /Mag. Dmg.+20','AGI+10','Weapon skill damage +10%',}}
	gear.str_wsd_jse_back = {name="Camulus's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+5','Weapon skill damage +10%',}}
	gear.rangedtp_jse_back = { name="Camulus's Mantle", augments={'AGI+20','Rng.Acc.+20 Rng.Atk.+20','Rng.Acc.+10','"Store TP"+10',}}
	gear.snapshot_jse_back = 
	--gear.agi_wsd_jse_back =

    -- Additional local binds
	send_command('bind ^` gs c cycle ElementalMode')
	send_command('bind !` gs c elemental quickdraw')
	
	send_command('bind ^backspace input /ja "Double-up" <me>')
	send_command('bind @backspace input /ja "Snake Eye" <me>')
	send_command('bind !backspace input /ja "Fold" <me>')
	send_command('bind ^@!backspace input /ja "Crooked Cards" <me>')
	
	send_command('bind ^\\\\ input /ja "Random Deal" <me>')
    send_command('bind !\\\\ input /ja "Bolter\'s Roll" <me>')
	send_command('bind ^@!\\\\ gs c toggle LuzafRing')
	send_command('bind @f7 gs c toggle RngHelper')

	send_command('bind !r gs c weapons DualSavageWeapons;gs c update')
	send_command('bind @q gs c weapons MaccWeapons;gs c update')
	send_command('bind ^q gs c weapons DualKustawi;gs c update')
	send_command('bind !q gs c weapons DualLeadenRanged;gs c update')
	send_command('bind @pause roller roll')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
	
	-- Weapons sets
	sets.weapons.Default = {main=gear.RostamA,sub=gear.RostamC,range="Armageddon"}
	sets.weapons.DualSavageWeapons = {main="Naegling",sub="Gleti's Knife",range="Anarchy +2"}
	sets.weapons.FomalRanged = {main=gear.RostamA,sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.DualLeadenRanged = {main=gear.RostamA,sub="Nusku Shield",range="Death Penalty"}
	sets.weapons.DualLeadenMelee = {main=gear.RostamB,sub="Gleti's Knife",range="Death Penalty"}
	sets.weapons.FomalMelee = {main=gear.RostamB,sub="Nusku Shield",range="Fomalhaut"}
	sets.weapons.DualFomalRanged = {main="Naegling",sub="NUsku Shield",range="Fomalhaut"}
	sets.weapons.DualArmaMelee = {main=gear.RostamB,sub="Gleti's Knife",range="Armageddon"}
	sets.weapons.DualArmaRanged = {main=gear.RostamA,sub="Gleti's Knife",range="Armageddon"}
	sets.weapons.ArmaRanged = {main=gear.RostamA,sub="Nusku Shield",range="Armageddon"}
	sets.weapons.SavageMelee = {main="Naegling",sub="Nusku Shield",range="Anarchy +2"}

    -- Precast Sets

    -- Precast sets to enhance JAs

	sets.precast.JA['Triple Shot'] = {body="Chasseur's Frac"}
    sets.precast.JA['Snake Eye'] = {legs="Lanun Trews"}
    sets.precast.JA['Wild Card'] = {feet="Lanun Bottes +3"}
    sets.precast.JA['Random Deal'] = {body="Lanun Frac +3"}
    sets.precast.FoldDoubleBust = {hands="Lanun Gants +3"}

    sets.precast.CorsairRoll = {main=gear.RostamC,range="Compensator",
        head="Lanun Tricorne",neck="Regal Necklace",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Malignance Tabard",hands="Chasseur's Gants +1",ring1="Defending Ring",ring2="Shadow Ring",
        back="Camulus's Mantle",waist="Flume Belt +1",legs="Desultor Tassets",feet="Malignance Boots"}

    sets.precast.LuzafRing = {ring2="Luzaf's Ring"}
    
    sets.precast.CorsairRoll["Caster's Roll"] = set_combine(sets.precast.CorsairRoll, {legs="Chas. Culottes"})
    sets.precast.CorsairRoll["Courser's Roll"] = set_combine(sets.precast.CorsairRoll, {feet="Chass. Bottes"})
    sets.precast.CorsairRoll["Blitzer's Roll"] = set_combine(sets.precast.CorsairRoll, {head="Chass. Tricorne"})
    sets.precast.CorsairRoll["Tactician's Roll"] = set_combine(sets.precast.CorsairRoll, {body="Chasseur's Frac +1"})
    sets.precast.CorsairRoll["Allies' Roll"] = set_combine(sets.precast.CorsairRoll, {hands="Chasseur's Gants"})
    
    sets.precast.CorsairShot = {ammo=gear.QDbullet,
        head="Laksa. Tricorne +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Friomisi Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Dingir Ring",ring2="Stikini Ring +1",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Chass. Bottes +1"}
		
	sets.precast.CorsairShot.Damage = {ammo=gear.QDbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Digni. Earring",ear2="Friomisi Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Malignance Boots"}
	
    sets.precast.CorsairShot.Proc = {ammo=gear.QDbullet,
        head="Laksa. Tricorne +2",neck="Iskur Gorget",ear1="Telos Earring",ear2="Crepuscular Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Dingir Ring",ring2="Stikini Ring +1",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Chass. Bottes +1"}

    sets.precast.CorsairShot['Light Shot'] = {ammo=gear.QDbullet,
        head="Carmine Mask +1",neck="Sanctity Necklace",ear1="Digni. Earring",ear2="Telos Earring",
        body="Mummu Jacket +2",hands="Leyline Gloves",ring1="Metamor. Ring +1",ring2="Stikini Ring +1",
        back=gear.ranger_wsd_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Mummu Gamash. +2"}

    sets.precast.CorsairShot['Dark Shot'] = set_combine(sets.precast.CorsairShot['Light Shot'], {feet="Chass. Bottes +1"})

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {
        head="Carmine Mask +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Tuisto Earring",
        body=gear.herculean_waltz_body,hands=gear.herculean_waltz_hands,ring1="Defending Ring",ring2="Valseur's Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Dashing Subligar",feet=gear.herculean_waltz_feet}
		
	sets.Self_Waltz = {head="Mummu Bonnet +2",body="Passion Jacket",ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {
        head="Carmine Mask +1",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Carmine Greaves +1"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads",body="Passion Jacket"})
	
	sets.precast.FC.Cure = set_combine(sets.precast.FC, {ear2="Mendi. Earring"})

    sets.precast.RA = {ammo=gear.RAbullet,
        head="Chass. Tricorne +1",neck="Comm. Charm +2",
        body="Laksa. Frac +3",hands="Carmine Fin. Ga. +1",ring1="Crepuscular Ring",
        back=gear.magic_wsd_jse_back,waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Pursuer's Gaiters"}
		
	sets.precast.RA.Flurry = set_combine(sets.precast.RA, {})
	
	sets.precast.RA.Flurry2 = {ammo=gear.RAbullet,
        head="Chass. Tricorne +1",neck="Comm. Charm +2",
        body="Laksa. Frac +3",hands="Carmine Fin. Ga. +1",ring1="Crepuscular Ring",
        back=gear.snapshot_jse_back,waist="Yemaya Belt",legs="Adhemar Kecks +1",feet="Pursuer's Gaiters"}

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Rin",
        back=gear.str_wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Lanun Bottes +3"}
		
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

	sets.precast.WS['Savage Blade'] = {ammo=gear.WSbullet,
        head="Nyame Helm",neck="Comm. Charm +2",ear1="Moonshade Earring",ear2="Ishvara Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.str_wsd_jse_back,waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Lanun Bottes +3"}
	
	sets.precast.WS['Hot Shot'] = {ammo=gear.WSbullet,
        head="Malignance Chapeau",neck="Fotia Necklace",ear1="Moonshade Earring",ear2="Telos Earring",
        body="Nyame Mail",hands="Malignance Gloves",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.magic_wsd_jse_back,waist="Fotia Belt",legs="Malignance Tights",feet="Malignance Boots"}
			
    sets.precast.WS['Leaden Salute'] = {ammo=gear.MAbullet,
        head="Pixie Hairpin +1",neck="Comm. Charm +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Nyame Gauntlets",ring1="Archon Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +3"}

    sets.precast.WS['Aeolian Edge'] = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Comm. Charm +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Dingir Ring",ring2="Epaminondas's Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +3"}

    sets.precast.WS['Wildfire'] = {ammo=gear.MAbullet,
        head="Nyame Helm",neck="Comm. Charm +2",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Lanun Frac +3",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Dingir Ring",
        back=gear.magic_wsd_jse_back,waist="Eschan Stone",legs="Nyame Flanchard",feet="Lanun Bottes +3"}
		
	sets.precast.WS['Last Stand'] = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring",
        body="Laksa. Frac +3",hands="Nyame Gauntlets",ring1="Regal Ring",ring2="Epaminondas's Ring",
        back=gear.magic_wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Lanun Bottes +3"}


	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {}
	sets.AccMaxTP = {}
        
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Malignance Chapeau",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Malignance Gloves",ring1="Kishar Ring",ring2="Lebeche Ring",
        back="Moonbeam Cape",waist="Flume Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
        
	
	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}
	
    sets.midcast.Utsusemi = sets.midcast.FastRecast

    -- Ranged gear
    sets.midcast.RA = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Crep. Earring",ear2="Telos Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
        back=gear.rangedtp_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.midcast.RA.Crit = {ammo=gear.RAbullet,
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Crep. Earring",ear2="Telos Earring",
        body="Nisroch Jerkin",hands="Mummu Wrists +2",ring1="Crepuscular Ring",ring2="Mummu Ring",
        back=gear.rangedtp_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Oshosi Leggings"}
		
	sets.buff['Triple Shot'] = {
        head="Oshosi Mask",neck="Iskur Gorget",ear1="Crep. Earring",ear2="Telos Earring",
        body="Chasseur's Frac +1",hands="Lanun Gants +3",ring1="Crepuscular Ring",ring2="Ilabrat Ring",
        back=gear.rangedtp_jse_back,waist="Yemaya Belt",legs="Malignance Tights",feet="Oshosi Leggings"}
    
    -- Sets to return to when not performing an action.
	
	sets.DayIdle = {}
	sets.NightIdle = {}
	
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
    
    -- Resting sets
    sets.resting = {}
    

    -- Idle sets
    sets.idle = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    
    -- Defense sets
    sets.defense.PDT = sets.defense.MEVA

    sets.defense.MDT = sets.defense.MEVA
		
    sets.defense.MEVA = {ammo=gear.RAbullet,
        head="Nyame Helm",neck="Warder's Charm +1",ear1="Odnowa Earring +1",ear2="Eabani Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Shadow Ring",
        back="Moonbeam Cape",waist="Carrier's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.Kiting = {legs="Carmine Cuisses +1"}
	sets.TreasureHunter = {ammo=gear.th_ammo,head=gear.th_head,waist=gear.th_waist,hands=gear.th_hands}
	
	sets.idle.Town = set_combine(sets.idle, {neck="Comm. Charm +2",waist="Orpheus's Sash",legs="Carmine Cuisses +1"})


    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {
		head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Brutal Earring",
		body="Meg. Cuirie +2",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}

    sets.engaged.DW = {
		head="Adhemar Bonnet +1",neck="Iskur Gorget",ear1="Telos Earring",ear2="Suppanomimi",
		body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Epona's Ring",ring2="Petrov Ring",
		back=gear.tp_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
	sets.engaged.DW.Hybrid = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back=gear.tp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}
		
		
				
	sets.engaged.Hybrid = {
        head="Malignance Chapeau",neck="Iskur Gorget",ear1="Telos Earring",ear2="Eabani Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back=gear.tp_jse_back,waist="Reiki Yotai",legs="Malignance Tights",feet="Malignance Boots"}

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    if player.sub_job == 'NIN' then
        set_macro_page(1, 14)
    elseif player.sub_job == 'DNC' then
		set_macro_page(1, 14)
    elseif player.sub_job == 'RNG' then
        set_macro_page(9, 14)
    elseif player.sub_job == 'DRG' then
        set_macro_page(5, 14)
    else
        set_macro_page(10, 14)
    end
end

function user_job_lockstyle()
	if player.equipment.main == nil or player.equipment.main == 'empty' then
		windower.chat.input('/lockstyleset 001')
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 3 then --Sword in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Sword/Nothing.
				windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Sword/Shield
				windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Sword/Sword.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Sword/Dagger.
			windower.chat.input('/lockstyleset 001')
		else
			windower.chat.input('/lockstyleset 001') --Catchall just in case something's weird.
		end
	elseif res.items[item_name_to_id(player.equipment.main)].skill == 2 then --Dagger in main hand.
		if player.equipment.sub == nil or player.equipment.sub == 'empty' then --Dagger/Nothing.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].shield_size then --Dagger/Shield
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 3 then --Dagger/Sword.
			windower.chat.input('/lockstyleset 001')
		elseif res.items[item_name_to_id(player.equipment.sub)].skill == 2 then --Dagger/Dagger.
			windower.chat.input('/lockstyleset 001')
		else
			windower.chat.input('/lockstyleset 001') --Catchall just in case something's weird.
		end
	end
end