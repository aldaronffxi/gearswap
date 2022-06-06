function user_setup()
	state.OffenseMode:options('Normal', 'SomeAcc', 'Acc', 'FullAcc', 'Fodder')
	state.HybridMode:options('Normal', 'PDT')
	state.WeaponskillMode:options('Match','Normal')
	state.CastingMode:options('Normal')
	state.IdleMode:options('Normal', 'Refresh', 'Reraise')
	state.RestingMode:options('Normal')
	state.PhysicalDefenseMode:options('PetPDT', 'PDT', 'Reraise', 'PKiller')
	state.MagicalDefenseMode:options('PetMDT','MDT', 'MKiller')
	state.ResistDefenseMode:options('PetMEVA', 'MEVA')
	state.ExtraMeleeMode = M{['description']='Extra Melee Mode', 'None', 'Knockback', 'Suppa', 'DWEarrings'}
	state.Weapons:options('None','Naegling','Aymur','Dolichenus')

--	state.Weapons:options('Dolichenus', 'Axe')

	send_command('bind !f11 gs c cycle ExtraMeleeMode')


	-- Set up Jug Pet cycling and keybind Ctrl+F7
	-- INPUT PREFERRED JUG PETS HERE
	state.JugMode = M{['description']='Jug Mode', 'BouncingBertha','FunguarFamiliar','WarlikePatrick','BlackbeardRandy','SwoopingZhivago','VivaciousVickie'}
	send_command('bind ^f7 gs c cycle JugMode')

	-- Set up Monster Correlation Modes and keybind Alt+F7
	state.CorrelationMode = M{['description']='Correlation Mode', 'Neutral', 'Favorable'}
	send_command('bind !f7 gs c cycle CorrelationMode')

	-- Set up Pet Modes for Hybrid sets and keybind 'Windows Key'+F7
	state.PetMode = M{['description']='PetOnly', 'Pet Mode', 'PetTank', 'PetStance',  'Normal'}
	send_command('bind @f7 gs c cycle PetMode')

	-- Set up Reward Modes and keybind Ctrl+Backspace
	state.RewardMode = M{['description']='Reward Mode', 'Theta', 'Zeta', 'Eta','Epsilon'}
	send_command('bind ^backspace gs c cycle RewardMode')

	send_command('bind @f8 gs c toggle AutoReadyMode')
	send_command('bind !` gs c ready default')

	--Example of how to change default ready moves.
	--ready_moves.default.WarlikePatrick = 'Tail Blow'

	select_default_macro_book()
end

-- BST gearsets
function init_gear_sets()

		sets.weapons.Dolichenus = {main="Dolichenus",sub="Sacro Bulwark"}
		sets.weapons.Naegling = {main="Naegling",sub="Sacro Bulwark"}
		sets.weapons.Aymur = {main="Aymur",sub="Tauret"}

		-- PRECAST SETS
		sets.precast.JA['Killer Instinct'] = {head="Ankusa Helm +1"}
		sets.precast.JA['Bestial Loyalty'] = {body="Mirke Wardecors",hands="Ankusa Gloves +1"}
		sets.precast.JA['Call Beast'] = sets.precast.JA['Bestial Loyalty']
		sets.precast.JA.Familiar = {legs="Ankusa Trousers +1"}
		sets.precast.JA.Tame = {head="Tali'ah Turban"}
		sets.precast.JA.Spur = {back="Artio's Mantle",feet="Nukumi Ocreae +1"}
	--sets.SpurAxe = {main="Skullrender"}
	--sets.SpurAxesDW = {main="Skullrender",sub="Skullrender"}

	sets.precast.JA['Feral Howl'] = {}

	sets.precast.JA.Reward = {body="Tot. Jackcoat +1",hands="Ogre Gloves",ring2="Sirona's Ring",
								legs="Monster Trousers +2",feet="Monster Gaiters +2"}

	sets.precast.JA.Reward.Theta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Theta"})
	sets.precast.JA.Reward.Zeta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Zeta"})
	sets.precast.JA.Reward.Eta = set_combine(sets.precast.JA.Reward, {ammo="Pet Food Eta"})

	sets.precast.JA.Charm = {}

	-- CURING WALTZ
	sets.precast.Waltz = {}

		-- HEALING WALTZ
	sets.precast.Waltz['Healing Waltz'] = {}

		-- STEPS
	sets.precast.Step = {}

		-- VIOLENT FLOURISH
	sets.precast.Flourish1 = {}
	sets.precast.Flourish1['Violent Flourish'] = {}

	sets.precast.FC = {ammo="Impatiens",
								neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
								body="Tali'ah Manteel +1",hands="Leyline Gloves",ring1="Kishar Ring",ring2="Prolix Ring"}
								sets.precast.FC.Utsusemi = set_combine(sets.precast.FC, {neck="Magoraga Beads"})

		-- MIDCAST SETS
	sets.midcast.FastRecast = {
								head="Gavialis Helm",neck="Voltsurge Torque",ear1="Enchntr. Earring +1",ear2="Loquacious Earring",
								body="Taeon Tabard",hands="Leyline Gloves",ring1="Defending Ring",ring2="Prolix Ring",
								back="Moonlight Cape",waist="Kuku Stone",legs="Tali'ah Sera. +1",feet="Despair Greaves"}

	sets.midcast.Utsusemi = set_combine(sets.midcast.FastRecast, {back="Mujin Mantle"})

	sets.midcast.Cure = {
								head="Gavialis Helm",neck="Phalaina Locket",ear1="Handler's Earring",ear2="Handler's Earring +1",
								body="Tali'ah Manteel +1",hands="Ankusa Gloves +1",ring1="Lebeche Ring",ring2="Janniston Ring",
								back="Artio's Mantle",waist="Kuku Stone",legs="Tali'ah Sera. +1",feet="Despair Greaves"}

	sets.midcast.Curaga = sets.midcast.Cure

	sets.Self_Healing = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Cure_Received = {neck="Phalaina Locket",hands="Buremte Gloves",ring2="Kunaji Ring",waist="Gishdubar Sash"}
	sets.Self_Refresh = {waist="Gishdubar Sash"}

	sets.midcast.Stoneskin = sets.midcast.FastRecast

	sets.midcast.Cursna = set_combine(sets.midcast.FastRecast, {neck="Debilis Medallion",ring1="Haoma's Ring",ring2="Haoma's Ring"})

	sets.midcast.Protect = set_combine(sets.midcast.FastRecast, {ring2="Paguroidea Ring"})
	sets.midcast.Protectra = sets.midcast.Protect

	sets.midcast.Shell = set_combine(sets.midcast.FastRecast, {ring2="Paguroidea Ring"})
	sets.midcast.Shellra = sets.midcast.Shell

	sets.midcast['Enfeebling Magic'] = sets.midcast.FastRecast

	sets.midcast['Elemental Magic'] = sets.midcast.FastRecast

	sets.midcast.Helix = sets.midcast['Elemental Magic']
	sets.midcast.Helix.Resistant = sets.midcast['Elemental Magic']

		-- WEAPONSKILLS
		-- Default weaponskill sets.
	sets.precast.WS = {ammo="Paeapua",
		head="Nyame Helm",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Moonshade Earring",
		body="Nyame Mail",hands="Nyame Gauntlets",ring1="Karieyh Ring +1",ring2="Epaminondas's Ring",
		back="Sacro Mantle",waist="Sailfi Belt +1",legs="Nyame Flanchard",feet="Nyame Sollerets"}
	
	sets.precast.WS['Decimation'] = {ammo="Paeapua",
								head="Skormoth Mask",neck="Fotia Gorget",ear1="Sherida Earring",ear2="Brutal Earring",
								body="Tali'ah Manteel +2",hands="Leyline Gloves",ring1="Gere Ring",ring2="Epona's Ring",
								back="Sacro Mantle",waist="Fotia Belt",legs="Meg. Chausses +2",feet="Despair Greaves"}
								
	sets.precast.WS['Primal Rend'] = set_combine(sets.precast.WS, {ear1="Friomisi Earring"})

		-- Specific weaponskill sets.
	
		-- Swap to these on Moonshade using WS if at 3000 TP
	sets.MaxTP = {ear1="Brutal Earring",ear2="Ishvara Earring",}
	sets.AccMaxTP = {ear1="Zennaroi Earring",ear2="Telos Earring"}

				-- PET SIC & READY MOVES
	sets.midcast.Pet.WS = {ammo="",
		head="Tali'ah Turban",neck="Shulmanu Collar",ear1="Enmerkar Earring",ear2="",
				body="Tali'ah Manteel +1",hands="Nukumi Manoplas +1",ring1="C. Palug Ring",ring2="Tali'ah Ring",
				back="Artio's Mantle",waist="Incarnation Sash",legs="Despair Cuisses",feet="Tali'ah Crackows +1"}

	 sets.midcast.Pet.MagicReady = {ammo="",
		head="Tali'ah Turban",neck="Adad Amulet",ear1="Handler's Earring",ear2="Enmerkar Earring",
				body="Tali'ah Manteel +1",hands="Nukumi Manoplas +1",ring1="C. Palug Ring",ring2="",
				back="Artio's Mantle",waist="Incarnation Sash",legs="Tali'ah Sera. +1",feet="Tali'ah Crackows"}

	sets.midcast.Pet.Acc = set_combine(sets.midcast.Pet.WS, {head="Tali'ah Turban",hands="Tali'ah Gages"}) --legs="Wisent Kecks"

	sets.midcast.Pet.ReadyRecast = {legs="Gleti's Breeches"}
	sets.midcast.Pet.ReadyRecastDW = {legs="Gleti's Breeches"}
	sets.midcast.Pet.Neutral = {head="Tali'ah Turban"}
	sets.midcast.Pet.Favorable = {head="Nukumi Cabasset"}
	sets.midcast.Pet.TPBonus = {hands="Nukumi Manoplas +1"}

	-- PET-ONLY SETS THAT SWAP WEAPONS FOR READY AND IDLE
	sets.midcast.Pet.ReadyRecastNE = {legs="Gleti's Breeches"}
	sets.midcast.Pet.ReadyNE = set_combine(sets.midcast.Pet.WS, {main=gear.PHYKumbha1,sub=gear.PHYKumbha2})
	sets.midcast.Pet.ReadyNE.MedAcc = set_combine(sets.midcast.Pet.WS, {main="Kerehcatl",sub=gear.PHYKumbha2})
	sets.midcast.Pet.ReadyNE.FullAcc = set_combine(sets.midcast.Pet.WS, {main="Kerehcatl",sub="Hunahpu"})

	sets.midcast.Pet.MagicReadyNE = set_combine(sets.midcast.Pet.MagicReady, {main=gear.MABKumbha,sub=gear.PDTMABKumbha})

	sets.IdleAxesNE = {}
	sets.RewardAxe = {}
	sets.RewardAxesDW = {}

	-- RESTING
	sets.resting = {}

	sets.idle = {ammo="Staunch Tathlum +1",
			head="Malignance Chapeau",neck="Bst. Collar +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
			body="Sacro Breastplate",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
			back="Solemnity Cape",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.Refresh = set_combine(sets.idle, {})
	sets.idle.Reraise = set_combine(sets.idle, {head="Twilight Helm",body="Twilight Mail"})

	sets.idle.Pet = {ammo="Staunch Tathlum +1",
			head="Malignance Chapeau",neck="Bst. Collar +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
			body="Sacro Breastplate",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
			back="Solemnity Cape",waist="Engraved Belt",legs="Malignance Tights",feet="Malignance Boots"}

	sets.idle.Pet.Engaged = {ammo="Staunch Tathlum +1",
			head="Malignance Chapeau",neck="Bst. Collar +2",ear1="Odnowa Earring +1",ear2="Tuisto Earring",
			body="Sacro Breastplate",hands="Malignance Gloves",ring1="Defending Ring",ring2="Moonlight Ring",
			back="Solemnity Cape",waist="Flume Belt",legs="Malignance Tights",feet="Malignance Boots"}
			
	sets.idle.Pet.Reraise = {ammo="Staunch Tathlum +1",
			head="Tali'ah Turban",neck="Loricate Torque +1",ear1="Genmei Earring",ear2="Etiolation Earring",
			body="Sacro Breastplate",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="Moonlight Ring",
			back="Artio's Mantle",waist="Flume Belt",legs="Tali'ah Sera. +1",feet="Skd. Jambeaux +1"}

	-- DEFENSE SETS
	sets.defense.PDT = {ammo="Staunch Tathlum +1",
			head="Genmei Kabuto",neck="Sanctity Necklace",ear1="Handler's Earring",ear2="Handler's Earring +1",
			body="Tali'ah Manteel +1",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="Paguroidea Ring",
			back="Artio's Mantle",waist="Ioskeha Belt",legs="Tali'ah Sera. +1"}

	sets.defense.PetPDT = {ammo="Demonry Core",
			head="Anwig Salade",neck="Sanctity Necklace",ear1="Handler's Earring",ear2="Handler's Earring +1",
			body="Tali'ah Manteel +1",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="Paguroidea Ring",
			back="Artio's Mantle",waist="Isa Belt",legs="Tali'ah Sera. +1",feet="Despair Greaves"}

	sets.defense.PetMDT = {ammo="Demonry Core",
			head="Anwig Salade",neck="Sanctity Necklace",ear1="Handler's Earring",ear2="Handler's Earring +1",
			body="Tali'ah Manteel +1",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="Paguroidea Ring",
			back="Artio's Mantle",waist="Isa Belt",legs="Tali'ah Sera. +1",feet="Despair Greaves"}

	sets.defense.PetMEVA = sets.defense.PetMDT

	sets.defense.PKiller = set_combine(sets.defense.PDT, {body="Nukumi Gausape +1"})
	sets.defense.Reraise = set_combine(sets.defense.PDT, {head="Twilight Helm",body="Twilight Mail"})

	sets.defense.MDT = {ammo="Staunch Tathlum +1",
			head="Genmei Kabuto",neck="Warder's Charm +1",ear1="Handler's Earring +1",ear2="Etiolation Earring",
			body="Tali'ah Manteel +1",hands="Ankusa Gloves +1",ring1="Defending Ring",ring2="Shadow Ring",
			back="Engulfer Cape +1",waist="Engraved Belt",legs="Tali'ah Sera. +1",feet="Nukumi Ocreae +1"}

	sets.defense.MEVA = {
		head="Gavialis Helm",neck="Warder's Charm +1",ear1="Handler's Earring +1",ear2="Etiolation Earring",
		body="Tali'ah Manteel +1",hands="Leyline Gloves",ring1="Vengeful Ring",ring2="Purity Ring",
		back="Toro Cape",waist="Engraved Belt",legs="Flamma Dirs +1",feet="Valorous Greaves"}

	sets.defense.MKiller = set_combine(sets.defense.MDT, {body="Nukumi Gausape +1"})

	sets.Kiting = {feet="Skd. Jambeaux +1"}
	sets.DayIdle = {}
	sets.NightIdle = {}

				-- MELEE (SINGLE-WIELD) SETS
	sets.engaged = {ammo="Coiste Bodhar",
				head="Skormoth Mask",neck="Anu Torque",ear1="Sherida Earring",ear2="Suppanomimi",
				body="Tali'ah Manteel +2",hands="Tali'ah Gages",ring1="Gere Ring",ring2="Epona's Ring",
				back="Sacro Mantle",waist="Windbuffet Belt +1",legs="Meg. Chausses +2",feet="Malignance Boots"}

				-- MELEE (DUAL-WIELD) SETS FOR DNC AND NIN SUBJOB
	sets.engaged.DW = {ammo="Coiste Bodhar",
				head="Skormoth Mask",neck="Anu Torque",ear1="Sherida Earring",ear2="Suppanomimi",
				body="Tali'ah Manteel +2",hands="Malignance Gloves",ring1="Gere Ring",ring2="Epona's Ring",
				back="Sacro Mantle",waist="Reiki Yotai",legs="Meg. Chausses +2",feet="Malignance Boots"}

				-- MELEE (DUAL-WIELD) HYBRID SETS
		sets.engaged.DW.PDT = set_combine(sets.engaged.PDT, {ear1="Sherida Earring",ear2="Eabani Earring",})

				-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET ENGAGED
		sets.engaged.PetStance = set_combine(sets.engaged,{})

				-- GEARSETS FOR MASTER ENGAGED (SINGLE-WIELD) & PET TANKING
		sets.engaged.PetTank = set_combine(sets.engaged,{})

				-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET ENGAGED
		sets.engaged.DW.PetStance = set_combine(sets.engaged.DW,{})

				-- GEARSETS FOR MASTER ENGAGED (DUAL-WIELD) & PET TANKING
		sets.engaged.DW.PetTank = set_combine(sets.engaged.DW,{})

		sets.buff['Killer Instinct'] = {body="Nukumi Gausape +1"}
		sets.buff.Doom = {}
		sets.buff.Sleep = {}
		sets.TreasureHunter = {head=gear.th_head,hands=gear.valorous_th_hands,feet=gear.valorous_th_feet,waist=gear.th_waist}
		sets.Knockback = {}
		sets.SuppaBrutal = {ear1="Suppanomimi", ear2="Brutal Earring"}
		sets.DWEarrings = {ear1="Sherida Earring",ear2="Suppanomimi"}
		sets.Weapons = {main =""}

-------------------------------------------------------------------------------------------------------------------
-- Complete Lvl 76-99 Jug Pet Precast List +Funguar +Courier +Amigo
-------------------------------------------------------------------------------------------------------------------

				sets.precast.JA['Bestial Loyalty'].FunguarFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Seedbed Soil"})
				sets.precast.JA['Bestial Loyalty'].CourierCarrie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fish Oil Broth"})
				sets.precast.JA['Bestial Loyalty'].AmigoSabotender = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sun Water"})
				sets.precast.JA['Bestial Loyalty'].NurseryNazuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="D. Herbal Broth"})
				sets.precast.JA['Bestial Loyalty'].CraftyClyvonne = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cng. Brain Broth"})
				sets.precast.JA['Bestial Loyalty'].PrestoJulio = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Grass. Broth"})
				sets.precast.JA['Bestial Loyalty'].SwiftSieghard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Mlw. Bird Broth"})
				sets.precast.JA['Bestial Loyalty'].MailbusterCetas = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Gob. Bug Broth"})
				sets.precast.JA['Bestial Loyalty'].AudaciousAnna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
				sets.precast.JA['Bestial Loyalty'].TurbidToloi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Auroral Broth"})
				sets.precast.JA['Bestial Loyalty'].LuckyLulush = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="L. Carrot Broth"})
				sets.precast.JA['Bestial Loyalty'].DipperYuly = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wool Grease"})
				sets.precast.JA['Bestial Loyalty'].FlowerpotMerle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vermihumus"})
				sets.precast.JA['Bestial Loyalty'].DapperMac = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Briny Broth"})
				sets.precast.JA['Bestial Loyalty'].DiscreetLouise = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepbed Soil"})
				sets.precast.JA['Bestial Loyalty'].FatsoFargann = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="C. Plasma Broth"})
				sets.precast.JA['Bestial Loyalty'].FaithfulFalcorr = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lucky Broth"})
				sets.precast.JA['Bestial Loyalty'].BugeyedBroncha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Svg. Mole Broth"})
				sets.precast.JA['Bestial Loyalty'].BloodclawShasra = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rzr. Brain Broth"})
				sets.precast.JA['Bestial Loyalty'].GorefangHobs = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="B. Carrion Broth"})
				sets.precast.JA['Bestial Loyalty'].GooeyGerard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Cl. Wheat Broth"})
				sets.precast.JA['Bestial Loyalty'].CrudeRaphie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shadowy Broth"})

-------------------------------------------------------------------------------------------------------------------
-- Complete iLvl Jug Pet Precast List
-------------------------------------------------------------------------------------------------------------------

				sets.precast.JA['Bestial Loyalty'].DroopyDortwin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Swirling Broth"})
				sets.precast.JA['Bestial Loyalty'].PonderingPeter = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Vis. Broth"})
				sets.precast.JA['Bestial Loyalty'].SunburstMalfik = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Shimmering Broth"})
				sets.precast.JA['Bestial Loyalty'].AgedAngus = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Ferm. Broth"})
				sets.precast.JA['Bestial Loyalty'].WarlikePatrick = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Livid Broth"})
				sets.precast.JA['Bestial Loyalty'].ScissorlegXerin = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Spicy Broth"})
				sets.precast.JA['Bestial Loyalty'].BouncingBertha = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bubbly Broth"})
				sets.precast.JA['Bestial Loyalty'].RhymingShizuna = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Lyrical Broth"})
				sets.precast.JA['Bestial Loyalty'].AttentiveIbuki = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Salubrious Broth"})
				sets.precast.JA['Bestial Loyalty'].SwoopingZhivago = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Windy Greens"})
				sets.precast.JA['Bestial Loyalty'].AmiableRoche = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Airy Broth"})
				sets.precast.JA['Bestial Loyalty'].HeraldHenry = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Trans. Broth"})
				sets.precast.JA['Bestial Loyalty'].BrainyWaluis = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crumbly Soil"})
				sets.precast.JA['Bestial Loyalty'].HeadbreakerKen = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Blackwater Broth"})
				sets.precast.JA['Bestial Loyalty'].SuspiciousAlice = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Furious Broth"})
				sets.precast.JA['Bestial Loyalty'].AnklebiterJedd = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Crackling Broth"})
				sets.precast.JA['Bestial Loyalty'].FleetReinhard = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Rapid Broth"})
				sets.precast.JA['Bestial Loyalty'].CursedAnnabelle = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Creepy Broth"})
				sets.precast.JA['Bestial Loyalty'].SurgingStorm = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Insipid Broth"})
				sets.precast.JA['Bestial Loyalty'].SubmergedIyo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Deepwater Broth"})
				sets.precast.JA['Bestial Loyalty'].RedolentCandi = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Electrified Broth"})
				sets.precast.JA['Bestial Loyalty'].AlluringHoney = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Bug-Ridden Broth"})
				sets.precast.JA['Bestial Loyalty'].CaringKiyomaro = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Fizzy Broth"})
				sets.precast.JA['Bestial Loyalty'].VivaciousVickie = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Tant. Broth"})
				sets.precast.JA['Bestial Loyalty'].HurlerPercival = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Pale Sap"})
				sets.precast.JA['Bestial Loyalty'].BlackbeardRandy = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Meaty Broth"})
				sets.precast.JA['Bestial Loyalty'].GenerousArthur = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Dire Broth"})
				sets.precast.JA['Bestial Loyalty'].ThreestarLynn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Muddy Broth"})
				sets.precast.JA['Bestial Loyalty'].MosquitoFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wetlands Broth"})
				sets.precast.JA['Bestial Loyalty']['Left-HandedYoko'] = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Heavenly Broth"})
				sets.precast.JA['Bestial Loyalty'].BraveHeroGlenn = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Wispy Broth"})
				sets.precast.JA['Bestial Loyalty'].SharpwitHermes = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Saline Broth"})
				sets.precast.JA['Bestial Loyalty'].ColibriFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sugary Broth"})
				sets.precast.JA['Bestial Loyalty'].ChoralLeera = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Glazed Broth"})
				sets.precast.JA['Bestial Loyalty'].SpiderFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Sticky Webbing"})
				sets.precast.JA['Bestial Loyalty'].GussyHachirobe = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Slimy Webbing"})
				sets.precast.JA['Bestial Loyalty'].AcuexFamiliar = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Poisonous Broth"})
				sets.precast.JA['Bestial Loyalty'].FluffyBredo = set_combine(sets.precast.JA['Bestial Loyalty'], {ammo="Venomous Broth"})

end

-- Select default macro book on initial load or subjob change.
function select_default_macro_book()
	-- Default macro set/book
	if player.sub_job == 'DNC' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'NIN' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'THF' then
		set_macro_page(1, 4)
	elseif player.sub_job == 'RUN' then
		set_macro_page(1, 4)
	else
		set_macro_page(1, 4)
	end
end

function user_job_tick()
	if state.AutoReadyMode.value and player.sub_job == 'NIN' and not moving and not (buffactive['Copy Image (2)'] or buffactive['Copy Image (3)'] or buffactive['Copy Image (4+)']) then
		local spell_recasts = windower.ffxi.get_spell_recasts()

		if spell_recasts[339] == 0 then
			send_command('input /ma "Utsusemi: Ni" <me>')
			tickdelay = 250
			return true
		end

	end
	return false
end
