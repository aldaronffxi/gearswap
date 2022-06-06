-- Setup vars that are user-dependent.
function user_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','Hybrid')
    state.WeaponskillMode:options('Match','Normal','Acc')
    state.RangedMode:options('Normal','Acc')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
    state.IdleMode:options('Normal','DT','Regen','Glow')
	state.Weapons:options('Masamune','Dojikiri','Kogarasumaru','Amano','ShiningOne','Soboro','Quint','Sword')

	gear.ws_jse_back = {name="Smertrios's Mantle", augments={'STR+20','Accuracy+20 Attack+20','STR+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.stp_jse_back = {name="Smertrios's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','Accuracy+10','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}

	send_command('lua unload partybuffs')
	send_command('lua unload aecho')
	
    -- Additional local binds
--  send_command('bind ^` input /ja "Hasso" <me>')
--  send_command('bind !` input /ja "Seigan" <me>')
--  send_command('bind !backspace input /ja "Third Eye" <me>')
	send_command('bind @` gs c cycle SkillchainMode')
	send_command('bind ` gs c cycle Stance')
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
	
			-- Weapons sets

	sets.weapons.Masamune = {main="Masamune",sub="Utu Grip"}
	sets.weapons.Dojikiri = {main="Dojikiri Yasutsuna",sub="Utu Grip"}
	sets.weapons.Kogarasumaru = {main="Kogarasumaru",sub="Utu Grip"}
	sets.weapons.Amano = {main="Amanomurakumo",sub="Utu Grip"}
	sets.weapons.Soboro = {main="Soboro Sukehiro",sub="Utu Grip"}
	sets.weapons.ShiningOne = {main="Shining One",sub="Utu Grip"}
	sets.weapons.Quint = {main="Quint Spear",sub="Utu Grip"}
	sets.weapons.Sword = {main="Firetongue +1",sub=""}
    
    -- Precast Sets
    -- Precast sets to enhance JAs
    sets.precast.JA.Meditate = {head="Wakido Kabuto +3",hands="Sakonji Kote +2",back=gear.stp_jse_back}
    sets.precast.JA['Warding Circle'] = {head="Wakido Kabuto +3"}
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
	    head="Mpaca's Cap",neck="Sam. Nodowa +2",ear1="Thrud Earring",ear2="Moonshade Earring",
        body="Sakonji Domaru +3",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
        back=gear.ws_jse_back,waist="Sailfi Belt +1",legs="Wakido Haidate +3",feet="Nyame Sollerets"}
		
    sets.precast.WS.Acc = sets.precast.WS
	
	sets.precast.WS['Stardiver'] = {ammo="Coiste Bodhar",
	    head="Mpaca's Cap",neck="Sam. Nodowa +2",ear1="Schere Earring",ear2="Moonshade Earring",
        body="Tatena. Harama. +1",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Regal Ring",
        back=gear.ws_jse_back,waist="Fotia Belt",legs="Mpaca's Hose",feet="Ken. Sune-Ate +1"}
	
    sets.precast.WS['Tachi: Shoha'] = sets.precast.WS
	
	sets.precast.WS['Tachi: Jinpu'] = {ammo="Knobkierrie",
	    head="Nyame Helm",neck="Sam. Nodowa +2",ear1="Friomisi Earring Earring",ear2="Moonshade Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Niqmaddu Ring",ring2="Epaminondas's Ring",
        back=gear.ws_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.precast.WS['Tachi: Ageha'] = sets.precast.WS

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
        body="Wakido Domaru +3",ring1="Defending Ring",ring2="Prolix Ring",
        back=gear.stp_jse_back,waist="",legs="Wakido Haidate +3",feet="Valorous Greaves"}
		
    -- Specific spells
    sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})
	
    
    -- Resting sets
    sets.resting = {ammo="Staunch Tathlum +1",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Infused Earring",
        body="Sacro Breastplate",hands="Sakonji Kote +2",ring1="Defending Ring",ring2="Sheltered Ring",
        back=gear.stp_jse_back,waist="Flume Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}
    

    -- Idle sets (default idle set not needed since the other three are defined, but leaving for testing purposes)
	
	sets.Kiting = {feet="Danzo Sune-ate"}

    sets.Reraise = {head="Twilight Helm",body="Twilight Mail"}
	
    sets.idle = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Sam. Nodowa +2",ear1="Eabani Earring",ear2="Tuisto Earring",
        body="Sacro Breastplate",hands="Nyame Gauntlets",ring1="Chirich Ring +1",ring2="Chirich Ring +1",
        back=gear.stp_jse_back,waist="Orpheus's Sash",legs="Nyame Flanchard",feet="Nyame Sollerets"}
		
    sets.idle.Reraise = set_combine(sets.idle, sets.Reraise)

    sets.idle.Weak = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})
		
    sets.idle.Weak.Reraise = set_combine(sets.idle.Weak, sets.Reraise)
	
	--sets.idle.Town = set_combine(sets.idle, {head="Flam. Zucchetto +2"})
	
	sets.idle.Regen = set_combine(sets.idle, {body="Sacro Breastplate",neck="Bathy Choker +1"})
	
	sets.DayIdle = {}
	sets.NightIdle = {}
    
    -- Defense sets
    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Loess Barbuta +1",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Digni. Earring",
        body="Wakido Domaru +3",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Flume Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}

    sets.defense.PDTReraise = set_combine(sets.defense.PDT, sets.Reraise)
		
    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Ken. Jinpachi",neck="Loricate Torque +1",ear1="Etiolation Earring",ear2="Digni. Earring",
        body="Wakido Domaru +3",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Shadow Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama +1",feet="Ken. Sune-ate +1"}
		
	sets.defense.MDTReraise = set_combine(sets.defense.MDT, sets.Reraise)
	
    sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Ken. Jinpachi",neck="Loricate Torque +1",ear1="Cessance Earring",ear2="Digni. Earring",
        body="Ken. Samue +1 +1",hands="Wakido Kote +3",ring1="Niqmaddu Ring",ring2="Ilabrat Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama +1",feet="Ken. Sune-ate +1"}


    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion

	--1186 ACC
    sets.engaged = {ammo="Coiste Bodhar",
        head="Flam. Zucchetto +2",neck="Sam. Nodowa +2",ear1="Telos Earring",ear2="Cessance Earring",
        body="Tatena. Harama. +1",hands="Tatena. Gote +1",ring1="Niqmaddu Ring",ring2="Chirich Ring +1",
        back=gear.stp_jse_back,waist="Sailfi Belt +1",legs="Tatena. Haidate +1",feet="Tatena. Sune. +1"}
    sets.engaged.Acc = {ammo="Ginsen",
        head="Flam. Zucchetto +2",neck="Sam. Nodowa +2",ear1="Telos Earring",ear2="Cessance Earring",
        body="Ken. Samue +1",hands="Wakido Kote +3",ring1="Niqmaddu Ring",ring2="Flamma Ring",
        back=gear.stp_jse_back,waist="Ioskeha Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}
	--1240 ACC	
	sets.engaged.Hybrid = {ammo="Staunch Tathlum +1",
		head="Flam. Zucchetto +2",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Telos Earring",
        body="Wakido Domaru +3",hands="Wakido Kote +3",ring1="Defending Ring",ring2="Hetairoi Ring",
        back=gear.stp_jse_back,waist="Flume Belt",legs="Ken. Hakama +1",feet="Ken. Sune-Ate +1"}

    sets.engaged.Reraise = set_combine(sets.engaged, sets.Reraise)		
    sets.engaged.Acc.Reraise = set_combine(sets.engaged.Acc, sets.Reraise)		
        
	sets.Cure_Received = {hands="Buremte Gloves",waist="Gishdubar Sash",ring2="Asklepian Ring"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {waist="Gishdubar Sash"})
	sets.buff.Sleep = {}
	sets.buff.Hasso = {hands="Wakido Kote +3"}
    sets.buff.Sekkanoki = {hands="Kasuga Kote +1"}
    sets.buff.Sengikori = {feet="Kas. Sune-Ate +1"}
    sets.buff['Meikyo Shisui'] = {}
	sets.buff['Third Eye'] = {legs="Sakonji Haidate +1"}
	
	sets.TreasureHunter = {}
	sets.Skillchain = {}
	

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