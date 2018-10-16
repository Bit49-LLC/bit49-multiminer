********************************************************************************************************
*                                        Bit 49 Multiminer v1.3                                        *
*                      Adapted from BBT Multiminer by Cody Nelson and Grant Ayers                      *
*                                      Released October 15, 2018                                       *
********************************************************************************************************

OVERVIEW:
	The Bit 49 Multiminer is a project based off of BBT Multiminer, and is a conglomeration of
	mining programs accessed through command line instructions located in a main batch file and a
	supplemental batch file that contains wallet addresses and miner information.

FEATURES:
	Supports 100+ coins in single and dual-mining modes
	Supports dozens of the most popular pools around the world
	Full support for local wallet addresses
	Quick access shortcuts with icons set as the coin's logo
	Command prompt opacity for background watermark effect

DONATION:
	This multiminer is free to use, however, it does require time to keep it up to date.
	Help us keep this project going by donating.
		BTC: 1B49B49M9A3NcUK4TphTh2wVcbnbknNBB4
		ETH: 0xb49b49d65d7674061cdf807d138653560ca23e78
	Also, please follow us on Twitter and subscribe to our YouTube channel
		Twitter: twitter.com/bit49
		YouTube: youtube.com/bit49

KNOWN ISSUES:
	- XMR-Stak-Alloy v2.4.5 throws a CUDA error when nVidia GPUs present - Disabled nVidia for now to prevent
    miner from stopping
	- Avermore miner v1.4.1 AMD for ALQO Quark kernal issue
  - Avermore miner v1.4.1 AMD for DGB Myriad-Groestl kernal issue
	- Avermore miner v1.4.1 AMD for XZC Lyra2z kernal issue
	- Avermore miner v1.4.1 AMD for GIN Lyra2z kernal issue
	- Avermore miner v1.4.1 AMD for VTL Lyra2z kernal issue
	- Avermore miner v1.4.1 AMD for MONA - not finding shares
	- AMD/NVIDIA/CPU Miner 1.0.3 for Purk - CPU mining issues
	- lolMiner v0.5 AMD for BTCZ - crash on startup

GETTING STARTED:
  0. Are you missing the icons and miner executables? You probably cloned the git repository
     which doesn't contain binary files. Please download the release package!
	1. Create an exception in Windows Defender for the desktop so the antivirus doesn't identify the mining
     programs as false flags
	2. Extract the Bit 49 Multiminer folder onto your desktop. All of the shortcuts point to the desktop;
     putting the folder somewhere else will cause the shortcuts to not work.
	3. Open config.bat in a script editor like Notepad++ (https://notepad-plus-plus.org/download/v7.5.8.html)
	4. Add wallet address to corresponding coin location
	5. Click save
	6. Locate desired coin's shortcut (...\Desktop\bit49_multiminer\Shortcuts\) and open.
	   Shortcuts may be copied onto the desktop for quick access or the Windows StartUp folder so it
     automatically launches when the mining rig boots up
     (...\ProgramData\Microsoft\Windows\Start Menu\Programs\StartUp)

SUPPORTED COINS:
1	Aeon		AEON
2	Aion		AION
3	Akroma		AKA
4	Alloy		XAO
5	Alqo		ALQO
6	Anon		ANON
7	ArQmA		ARQ
8	Arto		RTO
9	Asofe		ASF
10	Atheios		ATH
11	Aura		ARA
12	B2B			B2B
13	BBSCoin		BBS
14	Bismuth		BIS
15	Bitcoin Candy	CDY
16	Bitcoin Gold	BTG
17	Bitcoin Interest	BCI
18	Bitcoin Private	BTCP
19	Bitcoin RM	BCRM
20	BitcoiNote	BTCN
21	BitcoinZ	BTCZ
22	BitSum		BSM
23	BitTube		TUBE
24	Bixbite		BXB
25	Bloc.money	BLOC
26	Bytecoin	BCN
27	Callisto	CLO
28	Citadel		CTL
29	Commercium	CMM
30	Decred		DCR
31	Dero		DERO
32	Digibyte	DGB
33	DigitalNote	XDN
34	Dinastycoin	DCY
35	DubaiCoin	DBIX
36	Electronero	ETNX
37	Electroneum	ETN
38	Electroneum Classic	ETNC
39	Electronic Dollar "eDollar"	EDL
40	Ellaism		ELLA
41	Elya		ELYA
42	Ethereum	ETH
43	Ethereum Classic	ETC
44	Ethereum Social	ETSC
45	Ethergem	EGEM
46	Expanse		EXP
47	Feathercoin	FTC
48	Genesis		GENX
49	GINcoin		GIN
50	Graft		GRFT
51	Hanacoin	HANA
52	Haven Protocol	XHV
53	HeptaCoin	HEPTA
54	Horizen		ZEN
55	Hush		HUSH
56	Intense Coin	ITNS
57	intuCoin	INTU
58	Iridium		IRD
59	Italocoin	ITA
60	Karbowanec	KRB
61	KEPL		KEPL
62	Komodo		KMD
63	Library Credits	LBC
64	Lines		LNS
65	LitecoinZ	LTZ
66	Loki		LOKI
67	Masari		MSR
68	Metaverse	ETP
69	Minexcoin	MNX
70	MOAC		MOAC
71	MonaCoin	MONA
72	Monero		XMR
73	Monero Classic	XMC
74	Monero Original	XMO
75	MoneroV		XMV
76	Musicoin	MUS
77	Myztic		MZT
78	Nekonium	NUKO
79	Newtoncoin	NCP
80	Niobio Cash	NBR
81	Ombre		OMB
82	Pascalcoin	PASC
83	Pegascoin	PGC
84	Pennykoin	PK
85	Pigeoncoin	PGN
86	Pirl		PIRL
87	PrivatePay	XPP
88	Purk		PURK
89	Quantum Resistant Ledger	QRL
90	Qwertycoin	QWC
91	Ravencoin	RVN
92	Ryo			RYO
93	Safe Exchange Coin	SAFEX
94	SafeCoin	SAFE
95	Saronite	XRN
96	Siacoin		SC
97	Snowgem		XSG
98	SolaceCoin	SOLACE
99	Stellite	XTL
100	Sumokoin	SUMO
101	Triton		TRIT
102	TurtleCoin	TRTL
103	Ubiq		UBQ
104	Ultranote	XUN
105	Verge		XVG
106	Veronite	XVV
107	Vertcoin	VTC
108	Vertical Coin	VTL
109	Victorium	VIC
110	Votecoin	VOT
111	Whalecoin	WHL
112	Worktips	WTIP
113	Wownero		WOW
114	X-cash		XCASH
115	YoCoin		YOC
116	Zcash		ZEC
117	Zclassic	ZCL
118	Zcoin		XZC
119	ZelCash		ZEL
120	Zero		ZER

MINER FEES *Miner fees go to developers of the individual mining programs, not to us. This multiminer platform is free!
	Arto miner v1.1.0:              2%
	Avermore miner v1.4.1			1%
	Claymore CryptoNote v11.3		0%
	Claymore ETH Miner v11.9		1% (1.5% in dual-mining mode, 0% for 2/3GB GPUs)
	Claymore ZEC Miner v12.6		2% with SSL connection (2.5% with non-SSL connection)
	Claymore NeoScrypt Miner v1.2	2%
	CPUminer-multi-opencl v1.0.3	0%
	DSTM ZEC Miner v0.6.1			2%
	EggMiner v3.012					0%
	EWBF Equihash miner v0.6		0%
	lolMiner v0.5					2% (1% for MNX)
	Nevermore miner v0.2.3			1%
	PhoenixMiner v3.5d				0.65%
	XMR-Stak Alloy v2.4.5			2%
	XMR-Stak v2.5.0	(fireice-uk)	2%

POOL FEES (as of 8/20/18):
	2miners.com				1%
	Aionmine.org			1%
	pool.Alqo.org			5%
	Altpool.pro				1% (ANON/BCI/BTCP/BTCZ/BTG/CLO/ETSC/GIN/MANO/XSG/ZCL/ZEL/ZEN)
							0.5% (DBIX/ELLA/ETC/ETP/EXP/HUSH/KMD/MUS/PIRL/UBQ/VIC/WHL/YOC/ZEC)
	Arhash.xyz				0.5%
	Atheios.com				0%
	pool.bbscoin.xyz		0.5%
	pool.Bitcoinrm.org		?
	pool.Bixbite.pro		0.1%
	Blockcruncher.com		0.25%
	Bytecoin.party			0.6%
	Bytecoin-pool.org		0%
	pool.Cdy.one			2%
	Coinmine.pl				1%
	Coinotron.com			1.5%
	Cryptoknight.cc			0%
	Cryptopool.space		0%
	Cryptopools.info		1%
	Dinastycoin.com			0.7%
	us.Egempool.eu			1%
	Eggpool.net				10%
	Ellaismpool.com			1%
	Equigems.online			0.9%
	Equipool.1ds.us			1%
	Ethermine.org			1%
	Etnminers.com			0.5%
	Expmine.pro				0%
	Fairhash.org			1%
	Fairpool.pw				1%, (PASL 2%)
	Flypool.org				1%
	Forgetop.com			1%, (ZEL/MNX 0.5%)
	pool-node.hanacoin.com	1%
	Hashgang.io				0.5%
	Hashvault.pro			0.9%
	Herominers.com			0%
	Intucoin.com			1%
	pool.Kepl.org			1%
	Leafpool.com			1%, (ITA 0.8%)
	Lethean.io (intenscoin.com)	1%
	Loudmining.com			0.5%
	Aion-us.luxor.tech		3%
	Mine2gether.com			0.1%
	Minercountry.com		0% (TRIT), 0.5% (XDN), 0.25% (MCN)
	Miningpoolhub.com		0.9%
	Miningspeed.com			0.8%
	Minerpool.net			1%
	Myztic.cash				0.1%
	Nanopool.org			1% (ETC/ETH/XMR/ZEC), 2% (ETN/PASC/SIA)
	Nibirupool.com			1%
	pool.Purkproject.com	2%
	Ravenminer.com			0.5%
	pool.Safexnews.net		0.7%
	Safex.xmining.pro		1%
	Suprnova.cc				1%
	Superpools.online		0.5%
	etnx.Thorshammer.cc		0.25%
	Ultranote.org			1%
	pool.veronite.space		1%
	Walpool.com				0%
	Weekendpool.net			1%
	Worktipspool.xyz		0.3%
