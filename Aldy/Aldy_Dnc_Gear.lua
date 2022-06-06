-- Setup vars that are user-dependent.  Can override this function in a sidecar file.
function user_job_setup()
    state.OffenseMode:options('Normal','Acc')
    state.HybridMode:options('Normal','MidHaste','LowHaste','Hybrid','Crit')
    state.WeaponskillMode:options('Match','Normal','Acc')
	state.IdleMode:options('Normal','Gleti')
    state.PhysicalDefenseMode:options('PDT')
	state.MagicalDefenseMode:options('MDT')
	state.ResistDefenseMode:options('MEVA')
	state.Weapons:options('Twashtar','Terpsichore','TwashCent','Karambit')
    state.ExtraMeleeMode = M{['description']='Extra Melee Mode','None','Suppa','DWEarrings','DWMax'}

	
	gear.da_jse_back = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','"Dbl.Atk."+10','Phys. dmg. taken-10%',}}
	gear.wsd_jse_back = { name="Senuna's Mantle", augments={'DEX+20','Accuracy+20 Attack+20','DEX+10','Weapon skill damage +10%','Phys. dmg. taken-10%',}}
	gear.critwsd_jse_back = 
	
    -- Additional local binds


    send_command('bind !` gs c cycle SkillchainMode')
	send_command('lua load dnc-hud')


    select_default_macro_book()
end


-- Define sets and vars used by this job file.
function init_gear_sets()
    --------------------------------------
    -- Start defining the sets
    --------------------------------------
    
	sets.TreasureHunter = {ammo=gear.th_ammo,head=gear.th_head,waist=gear.th_waist,hands=gear.th_hands,}
	
	
    -- Extra Melee sets.  Apply these on top of melee sets.
	sets.Suppa = {ear1="Suppanomimi", ear2="Sherida Earring"}
	
	-- Weapons sets
	sets.weapons.Twashtar = {main="Twashtar",sub="Gleti's Knife"}
	sets.weapons.Terpsichore = {main="Terpsichore",sub="Twashtar"}
	sets.weapons.TwashCent = {main="Twashtar",sub="Fusetto +3"}
	sets.weapons.LowBuff = {main="Karambit"}
	
    -- Precast Sets
    
    -- Precast sets to enhance JAs

    sets.precast.JA['No Foot Rise'] = {body="Horos Casaque +3"}

    sets.precast.JA['Trance'] = {} --head="Horos Tiara +1"
    

    -- Waltz set (chr and vit)
    sets.precast.Waltz = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Etoile Gorget +2",ear1="Odnowa Earring +1",ear2="Sjofn Earring",
        body="Maxixi Casaque +3",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonbeam Cape",waist="Engraved Belt",legs="Dashing Subligar",feet="Nyame Sollerets"}
		
	sets.Self_Waltz = {ring1="Asklepian Ring"}
        
    -- Don't need any special gear for Healing Waltz.
    sets.precast.Waltz['Healing Waltz'] = sets.precast.Waltz
    
    sets.precast.Samba = {ammo="Staunch Tathlum +1",
        head="Maxixi Tiara +2",neck="Etoile Gorget +2",ear1="Odnowa Earring +1",ear2="Sjofn Earring",
        body="Maxixi Casaque +3",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
        back=gear.da_jse_back,waist="Engraved Belt",legs="Dashing Subligar",feet="Nyame Sollerets"}

    sets.precast.Jig = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Etoile Gorget +2",ear1="Odnowa Earring +1",ear2="Sjofn Earring",
        body="Maxixi Casaque +3",hands="Nyame Gauntlets",ring1="Defending Ring",ring2="Moonlight Ring",
        back="Moonbeam Cape",waist="Engraved Belt",legs="Horos Tights +3",feet="Maxixi Toe Shoes +2"}

    sets.precast.Step = {ammo="Yamarang",
        head="Maxixi Tiara +2",neck="Etoile Gorget +2",ear1="Mache Earring +1",ear2="Mache Earring +1",
        body="Maxixi Casaque +2",hands="Maxixi Bangles +3",ring1="Defending Ring",ring2="Moonlight Ring",
        back=gear.da_jse_back,waist="Olseni Belt",legs="Malignance Tights",feet="Horos T. Shoes +3"}
		
    sets.Enmity = {ammo="Paeapua",
        head="Genmei Kabuto",neck="Unmoving Collar +1",ear1="Friomisi Earring",ear2="Trux Earring",
        body="Emet Harness +1",hands="Malignance Gloves",ring1="Petrov Ring",ring2="Vengeful Ring",
        back="Solemnity Cape",waist="Goading Belt",legs=gear.herculean_dt_legs,feet="Malignance Boots"}
		
    sets.precast.JA.Provoke = sets.Enmity

    sets.precast.Flourish1 = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.da_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Malignance Boots"}
	
    sets.precast.Flourish1['Violent Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.da_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.precast.Flourish1['Animated Flourish'] = sets.Enmity
		
    sets.precast.Flourish1['Desperate Flourish'] = {ammo="C. Palug Stone",
        head="Malignance Chapeau",neck="Combatant's Torque",ear1="Telos Earring",ear2="Digni. Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Stikini Ring +1",ring2="Stikini Ring +1",
        back=gear.da_jse_back,waist="Eschan Stone",legs="Malignance Tights",feet="Malignance Boots"}

    sets.precast.Flourish2 = {}
    sets.precast.Flourish2['Reverse Flourish'] = {hands="Macu. Bangles +1",back="Toetapper Mantle"}

    sets.precast.Flourish3 = {}
    sets.precast.Flourish3['Striking Flourish'] = {} --body="Charis Casaque +2"
    sets.precast.Flourish3['Climactic Flourish'] = {}

    -- Fast cast sets for spells
    
    sets.precast.FC = {ammo="Impatiens",
		head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
		body="Dread Jupon",hands="Leyline Gloves",ring1="Lebeche Ring",ring2="Prolix Ring",
		legs="Rawhide Trousers"}

    sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {body="Passion Jacket",neck="Magoraga Beads"})

       
    -- Weaponskill sets
    -- Default set for any weaponskill that isn't any more specifically defined
    sets.precast.WS = {ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Etoile Gorget +2",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Nyame Mail",hands="Maxixi Bangles +3",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Horos Tights +3",feet="Nyame Sollerets"}

    -- Specific weaponskill sets.  Uses the base set if an appropriate WSMod version isn't found.
    sets.precast.WS["Rudra's Storm"] = {ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Etoile Gorget +2",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Nyame Mail",hands="Maxixi Bangles +3",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Horos Tights +3",feet="Nyame Sollerets"}
		
    sets.precast.WS['Shark Bite'] = {ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Etoile Gorget +2",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Nyame Mail",hands="Maxixi Bangles +3",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Horos Tights +3",feet="Nyame Sollerets"}
		
    sets.precast.WS['Evisceration'] = {ammo="Charis Feather",
        head="Gleti's Mask",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Odr Earring",
        body="Meg. Cuirie +2",hands="Gleti's Gauntlets",ring1="Moonlight Ring",ring2="Regal Ring",
        back=gear.critwsd_jse_back,waist="Fotia Belt",legs="Gleti's Breeches",feet="Gleti's Boots"}
		
    sets.precast.WS['Pyrrhic Kleos'] = {ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Etoile Gorget +2",ear1="Moonshade Earring",ear2="Sherida Earring",
        body="Nyame Mail",hands="Maxixi Bangles +3",ring1="Ilabrat Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Horos Tights +3",feet="Nyame Sollerets"}
		
    sets.precast.WS['Aeolian Edge'] = {ammo="Coiste Bodhar",
        head="Nyame Helm",neck="Fotia Gorget",ear1="Moonshade Earring",ear2="Friomisi Earring",
        body="Nyame Mail",hands="Nyame Gauntlets",ring1="Epaminondas's Ring",ring2="Regal Ring",
        back=gear.wsd_jse_back,waist="Fotia Belt",legs="Nyame Flanchard",feet="Nyame Sollerets"}

    sets.precast.WS['Aeolian Edge'].TH = set_combine(sets.precast.WS['Aeolian Edge'], sets.TreasureHunter)

	-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Ishvara Earring",ear2="Sherida Earring"}
	sets.AccMaxTP = {ear1="Mache Earring +1",ear2="Sherida Earring"}
	
    sets.Skillchain = {back="Sacro Mantle"} --hands="Charis Bangles +2"
    
    
    -- Midcast Sets
    
    sets.midcast.FastRecast = {
        head=gear.herculean_fc_head,neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquac. Earring",
        body="Dread Jupon",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
        back="Moonlight Cape",waist="Flume Belt +1",legs="Rawhide Trousers",feet="Malignance Boots"}
        
    -- Specific spells
	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

    
    -- Sets to return to when not performing an action.
    
    -- Resting sets
    sets.resting = {}
    sets.ExtraRegen = {}
    

    -- Idle sets

    sets.idle = {ammo="Staunch Tathlum +1",
        head="Nyame Helm",neck="Etoile Gorget +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Ashera Harness",hands="Turms Mittens +1",ring1="Moonlight Ring",ring2="Defending Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Nyame Flanchard",feet="Turms Leggings +1"}
		
    sets.idle.Gleti = set_combine(sets.idle, {head="Gleti's Mask",body="Gleti's Cuirass",hands="Gleti's Gauntlets",legs="Gleti's Breeches",feet="Gleti's Boots"})
    
    -- Defense sets

    sets.defense.PDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.defense.MDT = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}
		
	sets.defense.MEVA = {ammo="Staunch Tathlum +1",
        head="Malignance Chapeau",neck="Bathy Choker +1",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Defending Ring",ring2="Shadow Ring",
        back="Moonlight Cape",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}

    sets.Kiting = {feet="Skd. Jambeaux +1"}

    -- Engaged sets

    -- Variations for TP weapon and (optional) offense/defense modes.  Code will fall back on previous
    -- sets if more refined versions aren't defined.
    -- If you create a set with both offense and defense modes, the offense mode should be first.
    -- EG: sets.engaged.Dagger.Accuracy.Evasion
    
    -- Normal melee group
    sets.engaged = {ammo="Coiste Bodhar",
        head="Adhemar Bonnet +1",neck="Etoile Gorget +2",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Horos Casaque +3",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Windbuffet Belt +1",legs="Samnuha Tights",feet="Horos T. Shoes +3"}
		
    sets.engaged.MidHaste = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Etoile Gorget +2",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Ashera Harness",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.LowHaste = {ammo="Yamarang",
        head="Adhemar Bonnet +1",neck="Etoile Gorget +2",ear1="Brutal Earring",ear2="Sherida Earring",
        body="Adhemar Jacket +1",hands="Adhemar Wrist. +1",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Reiki Yotai",legs="Samnuha Tights",feet=gear.herculean_ta_feet}
		
    sets.engaged.Hybrid = {ammo="Yamarang",
        head="Malignance Chapeau",neck="Etoile Gorget +2",ear1="Crepuscular Earring",ear2="Sherida Earring",
        body="Malignance Tabard",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
        back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Malignance Tights",feet="Malignance Boots"}
		
    sets.engaged.Crit = {ammo="Coiste Bodhar",
        head="Gleti's Mask",neck="Etoile Gorget +2",ear1="Odr Earring",ear2="Sherida Earring",
        body="Gleti's Cuirass",hands="Gleti's Gauntlets",ring1="Hetairoi Ring",ring2="Gere Ring",
        back=gear.da_jse_back,waist="Sailfi Belt +1",legs="Gleti's Breeches",feet="Gleti's Boots"}
		
		
    -- Buff sets: Gear that needs to be worn to actively enhance a current player buff.
    sets.buff['Saber Dance'] = {} --legs="Horos Tights"
    sets.buff['Climactic Flourish'] = {ammo="Charis Feather",head="Maculele Tiara +1",ear1="Ishvara Earring",ring1="Epaminondas's Ring",ring2="Regal Ring"}
	sets.buff.Doom = set_combine(sets.buff.Doom, {})
	sets.buff.Sleep = {head="Frenzy Sallet"}
end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
    -- Default macro set/book
    if player.sub_job == 'WAR' then
        set_macro_page(1, 15)
    elseif player.sub_job == 'NIN' then
        set_macro_page(1, 15)
    elseif player.sub_job == 'SAM' then
        set_macro_page(1, 15)
    elseif player.sub_job == 'THF' then
        set_macro_page(1, 15)
    else
        set_macro_page(1, 15)
    end
end