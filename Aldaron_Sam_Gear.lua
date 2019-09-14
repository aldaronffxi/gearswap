-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','Hybrid')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.RangedMode:options('Normal','Acc')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal','DT','Reraise')
	state.Weapons:options('Masamune','Dojikiri','Kogarasumaru','ShiningOne','Soboro','Quint','Sword')

	gear.ws_jse_back = {name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%',}}
	gear.stp_jse_back = {name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Damage taken-5%',}}
	
	
    -- Additional local binds
--  send_command('bind ^` input /ja "Hasso" <me>')
--  send_command('bind !` input /ja "Seigan" <me>')
--  send_command('bind !backspace input /ja "Third Eye" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
--	send_command('bind ` gs c cycle Stance')
--	send_command('bind !r gs c weapons MultiWeapon;gs c set WeaponskillMode Proc;gs c update')
--	send_command('bind ^r gs c weapons;gs c set WeaponskillMode Normal;gs c update')
--	send_command('bind ^q gs c weapons Bow;gs c update')

    select_default_macro_book()
end

-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +2",hands="Sakonji Kote +2",back=gear.stp_jse_back}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +2"}
    sets.precast.JA['Blade Bash'] = {hands="Sakonji Kote +2"}
	sets.precast.JA['Sekkanoki'] = {hands="Kasuga Kote +1"}
	sets.precast.JA['Sengikori'] = {feet="Kas. Sune-Ate +1"}
	
    -- Fast cast sets for spells
    sets.precast.FC = {neck="Orunmila's Torque",ear1="Etiolation Earring",ear2="Loquacious Earring",ring1="Lebeche Ring",ring2="Prolix Ring"}
	   
    -- Ranged snapshot gear
    sets.precast.RA = {}
	   
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Knobkierrie",
	    head=gear.valorous_wsd_head,neck="Sam. Nodowa +1",ear1="Lugra Earring +1",ear2="Moonshade Earring",
        body="Sakonji Domaru +3",hands=gear.valorous_wsd_hands,ring1="Niqmaddu Ring",ring2="Karieyh Ring +1",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Hiza. Hizayoroi +2",feet=gear.valorous_wsd_feet}
    sets.precast.WS.Acc = set_combine(sets.precast.WS, 
		{head="Flam. Zucchetto +2",ear1="Digni. Earring",ear2="Cessance Earring",
        hands="Wakido Kote +2",ring1="Niqmaddu Ring",
        waist="Grunfeld Belt",legs="Wakido Haidate +2",feet="Ken. Sune-Ate +1"})
	
	
    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.

    sets.precast.WS['Impulse Drive'] = set_combine(sets.precast.WS, {hands="Flam. Manopolas +1",neck="Fotia Gorget",ear1="Ishvara Earring",ear2="Moonshade Earring"})	
	
    sets.precast.WS['Tachi: Shoha'] = set_combine(sets.precast.WS, {head="Flam. Zucchetto +2",feet="Ken. Sune-Ate +1"})
    sets.precast.WS['Tachi: Shoha'].Acc = set_combine(sets.precast.WS.Acc, {head="Flam. Zucchetto +2",feet="Ken. Sune-Ate +1"})

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Lugra Earring +1",}
	sets.AccMaxTP = {ear1="Ishvara Earring",ear2="Cessance Earring"}
	sets.AccDayMaxTPWSEars = {ear1="Cessance Earring",ear2="Digni. Earring"}
	sets.DayMaxTPWSEars = {ear1="Ishvara Earring",ear2="Brutal Earring",}
	sets.AccDayWSEars = {ear1="Moonshade Earring",ear2="Cessance Earring"}
	sets.DayWSEars = {ear1="Ishvara Earring",ear2="Moonshade Earring",}
	
    -- Midcast Sets
    sets.midcast.FastRecast = {
        head="Loess Barbuta +1",neck="Orunmila's Torque",ear2="Loquacious Earring",
        body="Wakido Domaru +2",ring1="Defending Ring",ring2="Prolix Ring",
        back=gear.stp_jse_back,waist="",legs="Wakido Haidate +2",feet="Valorous Greaves"}
		
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
    
    -- Resting sets
    sets.resting = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Chozor. Coselete",hands="Sakonji Kote +2",ring1="Defending Ring",ring2="Sheltered Ring",
        back=gear.stp_jse_back,waist="Flume Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	
    sets.idle = {ammo="Staunch Tathlum",
        head="Wakido Kabuto +2",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Genmei Earring",
        body="Ken. Samue +1",hands="Sakonji Kote +2",ring1="Defending Ring",ring2="Karieyh Ring +1",
        back=gear.stp_jse_back,waist="Flume Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}
		
    sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)

    sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	
	sets.idle.Town = set_combine(sets.idle, {head="Flam. Zucchetto +2",feet="Ken. Sune-Ate +1"})
	
	sets.DayIdle = {}
	sets.NightIdle = {}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Digni. Earring",
        body="Wakido Domaru +2",hands="Wakido Kote +2",ring1="Defending Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Flume Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}

    sets.defense.PDTReraise = set_combine(sets.defense.PDT, sets.Reraise)
		
    sets.defense.MDT = {ammo="Staunch Tathlum",
        head="Ken. Jinpachi",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Digni. Earring",
        body="Wakido Domaru +2",hands="Wakido Kote +2",ring1="Defending Ring",ring2="Shadow Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama +1",feet="Ken. Sune-ate +1"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, sets.Reraise)
	
    sets.defense.MEVA = {ammo="Staunch Tathlum",
        head="Ken. Jinpachi",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Digni. Earring",
        body="Ken. Samue +1 +1",hands="Wakido Kote +2",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama +1",feet="Ken. Sune-ate +1"}


    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

	--1186 ACC
    sets.engaged = {ammo="Paeapua",
        head="Flam. Zucchetto +2",neck="Sam. Nodowa +1",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Ken. Samue +1",hands="Wakido Kote +2",ring1="Niqmaddu Ring",ring2="Hetairoi Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}
    sets.engaged.Acc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Sam. Nodowa +1",ear1="Brutal Earring",ear2="Cessance Earring",
        body="Ken. Samue +1",hands="Wakido Kote +2",ring1="Niqmaddu Ring",ring2="Flamma Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}
	--1240 ACC	
	sets.engaged.Hybrid = {ammo="Staunch Tathlum",
		head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
        body="Wakido Domaru +2",hands="Wakido Kote +2",ring1="Defending Ring",ring2="Hetairoi Ring",
        back=gear.stp_jse_back,waist="Flume Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}

    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)		
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)		
        
	sets.Cure_Received = {hands="Buremte Gloves",waist="Gishdubar Sash",ring2="Asklepian Ring"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {waist="Gishdubar Sash"})
	sets.buff.Sleep = {}
	sets.buff.Hasso = {hands="Wakido Kote +2"}
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +1"}
    sets.buff['Meikyo Shisui'] = ""
	sets.buff['Third Eye'] = {legs="Sakonji Haidate +1"}
	
	sets.TreasureHunter = {head=gear.th_head,hands=gear.valorous_th_hands,feet=gear.valorous_th_feet}
	sets.Skillchain = {}
	
		-- Weapons sets
	sets.weapons.Kogarasumaru = {main="Kogarasumaru",sub="Utu Grip"}
	sets.weapons.Masamune = {main="Masamune",sub="Utu Grip"}
	sets.weapons.Dojikiri = {main="Dojikiri Yasutsuna",sub="Utu Grip"}
	sets.weapons.Soboro = {main="Soboro Sukehiro",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip"}
	sets.weapons.Quint = {main="Quint Spear",sub="Utu Grip"}
	sets.weapons.Sword = {main="Firetongue +1",sub=""}
	
	sets.engaged.Quint = set_combine(sets.engaged.Acc)
	sets.engaged.Sword = set_combine(sets.engaged.Acc)
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'DNC' then
        set_macro_page(3, 3)
    elseif player.sub_job == 'WAR' then
        set_macro_page(1, 3)
    elseif player.sub_job == 'NIN' then
        set_macro_page(10, 3)
    elseif player.sub_job == 'THF' then
        set_macro_page(2, 3)
    else
        set_macro_page(1, 3)
    end
end

--Job Specific Trust Overwrite
function check_trust()
	if not moving then
		if state.AutoTrustMode.value and not areas.Cities:contains(world.area) and (buffactive['Elvorseal'] or buffactive['Reive Mark'] or not player.in_combat) then
			local party = windower.ffxi.get_party()
			if party.p5 == nil then
				local spell_recasts = windower.ffxi.get_spell_recasts()
			
				if spell_recasts[980] == 0 and not have_trust("Sylvie") then
					windower.send_command('input /ma "Sylvie (UC)" <me>')
					tickdelay = 250
					return true
				elseif spell_recasts[952] == 0 and not have_trust("Koru-Moru") then
					windower.send_command('input /ma "Koru-Moru" <me>')
					tickdelay = 250
					return true
				elseif spell_recasts[967] == 0 and not have_trust("Qultada") then
					windower.send_command('input /ma "Qultada" <me>')
					tickdelay = 250
					return true
				elseif spell_recasts[914] == 0 and not have_trust("Ulmia") then
					windower.send_command('input /ma "Ulmia" <me>')
					tickdelay = 250
					return true
				elseif spell_recasts[979] == 0 and not have_trust("Ygnas") then
					windower.send_command('input /ma "Ygnas" <me>')
					tickdelay = 250
					return true
				else
					return false
				end
			end
		end
	end
	return false
end