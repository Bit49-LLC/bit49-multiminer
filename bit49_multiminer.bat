@ECHO off
SETLOCAL EnableDelayedExpansion

:: ********************************************************************************************************
:: *                                        Bit 49 Multiminer v1.3                                        *
:: *                      Adapted from BBT Multiminer by Cody Nelson and Grant Ayers                      *
:: *                                      Released October 15, 2018                                       *
:: ********************************************************************************************************

CALL config.bat

::Set Global Variables
SET I=20
SET TC=1024
SET Platform=1
:: Environmental Variables
SETX GPU_FORCE_64BIT_PTR 0 >NUL 2>&1
SETX GPU_MAX_HEAP_SIZE 100 >NUL 2>&1
SETX GPU_USE_SYNC_OBJECTS 1 >NUL 2>&1
SETX GPU_MAX_ALLOC_PERCENT 100 >NUL 2>&1
SETX GPU_SINGLE_ALLOC_PERCENT 100 >NUL 2>&1

SET miner=%1
IF NOT "%miner%"=="" (
    SET /A M=%miner%
    GOTO MinerSwitch)

:TITLE
ECHO ********************************************************************************************************
ECHO *                                        Bit 49 Multiminer v1.3                                        *
ECHO *                      Adapted from BBT Multiminer by Cody Nelson and Grant Ayers                      *
ECHO *                                      Released October 15, 2018                                       *
ECHO ********************************************************************************************************
:MENU
ECHO ========================================================================================================
ECHO *                                           Ethash Algorithm                                           *
ECHO ========================================================================================================
ECHO 1.   Ethereum (ETH)                                          (Ethermine)   AMD/NVIDIA Claymore 11.9
ECHO 2.   Ethereum (ETH)                                          (Ethermine)   AMD/NVIDIA PhoenixMiner 3.5d
ECHO 3.   Ethereum (ETH) Decred (DCR)                    (Ethermine/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 4.   Ethereum (ETH) Library Credits (LBC)           (Ethermine/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 5.   Ethereum (ETH) PascalCoin (PASC)               (Ethermine/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 6.   Ethereum (ETH) Siacoin (SIA)                   (Ethermine/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 7.   Ethereum Classic (ETC)                                  (Ethermine)   AMD/NVIDIA Claymore 11.9
ECHO 8.   Ethereum Classic (ETC) Decred (DCR)            (Ethermine/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 9.   Ethereum Classic (ETC) Library Credits (LBC)   (Ethermine/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 10.  Ethereum Classic (ETC) PascalCoin (PASC)       (Ethermine/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 11.  Ethereum Classic (ETC) Siacoin (SIA)           (Ethermine/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 12.  DubaiCoin (DBIX)                                          (Altpool)   AMD/NVIDIA Claymore 11.9
ECHO 13.  DubaiCoin (DBIX) Decred (DCR)                    (Altpool/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 14.  DubaiCoin (DBIX) Library Credits (LBC)           (Altpool/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 15.  DubaiCoin (DBIX) PascalCoin (PASC)               (Altpool/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 16.  DubaiCoin (DBIX) Siacoin (SIA)                   (Altpool/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 17.  Ubiq (UBQ)                                               (Ubiqpool)   AMD/NVIDIA Claymore 11.9
ECHO 18.  Ubiq (UBQ) Decred (DCR)                         (Ubiqpool/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 19.  Ubiq (UBQ) Library Credits (LBC)                (Ubiqpool/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 20.  Ubiq (UBQ) PascalCoin (PASC)                    (Ubiqpool/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 21.  Ubiq (UBQ) Siacoin (SIA)                        (Ubiqpool/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 22.  Musicoin (MUS)                                           (CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 23.  Musicoin (MUS) Decred (DCR)                     (CoinMine/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 24.  Musicoin (MUS) Library Credits (LBC)            (CoinMine/CoinMine)   AMD/NVIDIA Claymore 11.9
ECHO 25.  Musicoin (MUS) PascalCoin (PASC)                (CoinMine/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 26.  Musicoin (MUS) Siacoin (SIA)                    (CoinMine/Nanopool)   AMD/NVIDIA Claymore 11.9
ECHO 27.  Pirl (PIRL)                                           (Cryptopools)   AMD/NVIDIA Claymore 11.9
ECHO 28.  Calisto (CLO)                                             (Altpool)   AMD/NVIDIA Claymore 11.9
ECHO 29.  Expanse (EXP)                                             (Expmine)   AMD/NVIDIA Claymore 11.9
ECHO 30.  Ellaism (ELLA)                                        (Ellaismpool)   AMD/NVIDIA Claymore 11.9
ECHO 31.  Metaverse (ETP)                                           (Altpool)   AMD/NVIDIA Claymore 11.9
ECHO 32.  Akroma (AKA)                                             (Fairpool)   AMD/NVIDIA Claymore 11.9
ECHO 33.  Nekonium (NUKO)                                          (Fairpool)   AMD/NVIDIA Claymore 11.9
ECHO 34.  Pegascoin (PGC)                                          (Fairpool)   AMD/NVIDIA Claymore 11.9
ECHO 35.  Ethereum Social (ETSC)                                    (Altpool)   AMD/NVIDIA Claymore 11.9
ECHO 36.  Aura (ARA)                                              (Minerpool)   AMD/NVIDIA Claymore 11.9
ECHO 37.  Ethergem (EGEM)                                         (Minerpool)   AMD/NVIDIA Claymore 11.9
ECHO 38.  YoCoin (YOC)                                              (2miners)   AMD/NVIDIA Claymore 11.9
ECHO 39.  Victorium (VIC)                                           (Altpool)   AMD/NVIDIA Claymore 11.9
ECHO 40.  Whalecoin (WHL)                                           (Altpool)   AMD/NVIDIA Claymore 11.9
ECHO 41.  Atheios (ATH)                                             (Atheios)   AMD/NVIDIA Claymore 11.9
ECHO 42.  MOAC (MOAC)                                           (Cryptopools)   AMD/NVIDIA Claymore 11.9
ECHO ========================================================================================================
ECHO *                                      Equihash (200,9) Algorithm                                      *
ECHO ========================================================================================================
ECHO 43.  ZCash (ZEC)                                    (Flypool)   AMD Claymore 12.6
ECHO 44.  ZCash (ZEC)                                   (Nanopool)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO 45.  ZClassic (ZCL)                           (Miningpoolhub)   AMD Claymore 12.6
ECHO 46.  ZClassic (ZCL)                             (Miningspeed)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO 47.  HoriZEN (ZEN) - Formerly ZenCash              (Suprnova)   AMD Claymore 12.6
ECHO 48.  HoriZEN (ZEN) - Formerly ZenCash           (Miningspeed)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO 49.  Komodo (KMD)                                  (Suprnova)   AMD Claymore 12.6
ECHO 50.  Komodo (KMD)                               (Miningspeed)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO 51.  Bitcoin Private (BTCP)                        (Suprnova)   AMD Claymore 12.6
ECHO 52.  Bitcoin Private (BTCP)                        (Suprnova)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO 53.  Hush (HUSH)                                   (Suprnova)   AMD Claymore 12.6
ECHO 54.  Hush (HUSH)                                (Miningspeed)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO 55.  VoteCoin (VOT)                                (Equipool)   AMD Claymore 12.6
ECHO 56.  Votecoin (VOT)                                (Equipool)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO 57.  Bitcoin Interest (BCI)                        (Suprnova)   AMD Claymore 12.6
ECHO 58.  Bitcoin Interest (BCI)                        (Suprnova)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO 59.  Commercium (CMM)                           (Miningspeed)   AMD Claymore 12.6
ECHO 60.  Commercium (CMM)                           (Miningspeed)   NVIDIA DSTM Zcash Miner 0.6.1
ECHO ========================================================================================================
ECHO *                                    Equihash-AION (210,9) Algorithm                                   *
ECHO ========================================================================================================
ECHO 61.  Aion (AION)                                 (Luxor.tech)   AMD lolMiner 0.5
ECHO 62.  Aion (AION)                                 (Luxor.tech)   NVIDIA EWBF Miner 0.6
ECHO ========================================================================================================
ECHO *                                    Equihash-ZERO (192,7) Algorithm                                   *
ECHO ========================================================================================================
ECHO 63.  Zero (ZER)                                    (Suprnova)   AMD lolMiner 0.5
ECHO 64.  Zero (ZER)                                (forgetop.com)   NVIDIA EWBF Miner 0.6
ECHO 65.  Genesis (GENX) - Formerly SafeCash            (Suprnova)   AMD lolMiner 0.5
ECHO 66.  Genesis (GENX) - Formerly SafeCash            (Suprnova)   NVIDIA EWBF Miner 0.6
ECHO ========================================================================================================
ECHO *                                   Equihash-ZHash (144,5) Algorithm                                   *
ECHO ========================================================================================================
ECHO 67.  Bitcoin Gold (BTG)                       (Miningpoolhub)   AMD lolMiner 0.5
ECHO 68.  Bitcoin Gold (BTG)                             (Altpool)   NVIDIA EWBF Miner 0.6
ECHO 69.  Snowgem (XSG)                                  (Altpool)   AMD lolMiner 0.5
ECHO 70.  Snowgem (XSG)                                  (Altpool)   NVIDIA EWBF Miner 0.6
ECHO 71.  SafeCoin (SAFE)                            (Miningspeed)   AMD lolMiner 0.5
ECHO 72.  SafeCoin (SAFE)                            (Miningspeed)   NVIDIA EWBF Miner 0.6
ECHO 73.  BitcoinZ (BTCZ)                               (Suprnova)   AMD lolMiner 0.5
ECHO 74.  BitcoinZ (BTCZ)                               (Suprnova)   NVIDIA EWBF Miner 0.6
ECHO 75.  LitecoinZ (LTZ)                               (Equipool)   AMD lolMiner 0.5
ECHO 76.  LitecoinZ (LTZ)                               (Equipool)   NVIDIA EWBF Miner 0.6
ECHO 77.  ZelCash (ZEL)                                  (Altpool)   AMD lolMiner 0.5
ECHO 78.  ZelCash (ZEL)                                  (Altpool)   NVIDIA EWBF Miner 0.6
ECHO 79.  HeptaCoin (HEPTA)                           (Nibirupool)   AMD lolMiner 0.5
ECHO 80.  HeptaCoin (HEPTA)                           (Nibirupool)   NVIDIA EWBF Miner 0.6
ECHO 81.  Bitcoin Candy (CDY)                       (pool.cdy.one)   AMD lolMiner 0.5
ECHO 82.  Bitcoin Candy (CDY)                       (pool.cdy.one)   NVIDIA EWBF Miner 0.6
ECHO 83.  Bitcoin RM (BCRM)                   (pool.bitcoinrm.org)   AMD lolMiner 0.5
ECHO 84.  Bitcoin RM (BCRM)                   (pool.bitcoinrm.org)   NVIDIA EWBF Miner 0.6
ECHO 85.  Asofe (ASF)                              (pool.asofeorg)   AMD lolMiner 0.5
ECHO 86.  Asofe (ASF)                              (pool.asofeorg)   NVIDIA EWBF Miner 0.6
ECHO 87.  Anonymous Bitcoin (ANON)                   (2miners.com)   AMD lolMiner 0.5
ECHO 88.  Anonymous Bitcoin (ANON)                   (2miners.com)   NVIDIA EWBF Miner 0.6
ECHO ##.  Bithereum (BTH)                             COMING SOON!   AMD lolMiner 0.5
ECHO ##.  Bithereum (BTH)                             COMING SOON!   NVIDIA EWBF Miner 0.6
ECHO ========================================================================================================
ECHO *                                       Equihash (96,5) Algorithm                                      *
ECHO ========================================================================================================
ECHO 91.  Minexcoin (MNX)                               (Forgetop)   AMD lolMiner 0.5
ECHO 92.  Minexcoin (MNX)                               (Forgetop)   NVIDIA EWBF Miner 0.6
ECHO ========================================================================================================
ECHO *                                       CryptoNight V8 Algorithm                                       *
ECHO ========================================================================================================
ECHO 93.  Monero (XMR)                                  (Nanopool)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 94.  Wownero (WOW)                             (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO ========================================================================================================
ECHO *                                       CryptoNight V7 Algorithm                                       *
ECHO ========================================================================================================
ECHO 95.  MoneroV (XMV)                                 (Leafpool)   AMD Claymore CryptoNote 11.3
ECHO 96.  MoneroV (XMV)                                 (Leafpool)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 97.  Quantum Resistant Ledger (QRL)        (pool.qrlpool.org)   AMD Claymore CryptoNote 11.3
ECHO 98.  Quantum Resistant Ledger (QRL)        (pool.qrlpool.org)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 99.  GRAFT (GRFT)                              (Cryptoknight)   AMD Claymore CryptoNote 11.3
ECHO 100. GRAFT (GRFT)                              (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 101. Lethean (LTHN) - formerly IntenseCoin       (lethean.io)   AMD Claymore CryptoNote 11.3
ECHO 102. Lethean (LTHN) - formerly IntenseCoin       (lethean.io)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 103. Elya (ELYA)                               (Cryptoknight)   AMD Claymore CryptoNote 11.3
ECHO 104. Elya (ELYA)                               (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 105. Webchain (WEB)                              COMING SOON!   AMD Claymore CryptoNote 11.3
ECHO 107. Webchain (WEB)                              COMING SOON!   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 109. Lines (LNS)                               (Cryptoknight)   AMD Claymore CryptoNote 11.3
ECHO 110. Lines (LNS)                               (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 111. DigitalNote (XDN)                         (Minercountry)   AMD Claymore CryptoNote 11.3
ECHO 112. DigitalNote (XDN)                         (Minercountry)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 113. Electroneum Classic (ETNC)                   (Etnminers)   AMD Claymore CryptoNote 11.3
ECHO 114. Electroneum Classic (ETNC)                   (Etnminers)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 115. Citadel (CTL)                               (Herominers)   AMD Claymore CryptoNote 11.3
ECHO 116. Citadel (CTL)                               (Herominers)   AMD/NVIDIA/CPU XMR-Stak 2.5
ECHO 117. Myztic (MZT)                                (Herominers)   AMD Claymore CryptoNote 11.3
ECHO 118. Myztic (MZT)                                (Herominers)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 119. Safe Exchange Coin (SAFEX)                   (Luckypool)   AMD Claymore CryptoNote 11.3
ECHO 120. Safe Exchange Coin (SAFEX)                   (Luckypool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 121. X-Cash (XCASH)                               (Luckypool)   AMD Claymore CryptoNote 11.3
ECHO 122. X-Cash (XCASH)                               (Luckypool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO ###. SuperiorCoin (SUP)                          COMING SOON!   AMD Claymore CryptoNote 11.3
ECHO ###. SuperiorCoin (SUP)                          COMING SOON!   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO ========================================================================================================
ECHO *                                       CryptoNight V1 Algorithm                                       *
ECHO ========================================================================================================
ECHO 125. Pennykoin (PK)                                 (walpool)   AMD Claymore CryptoNote 11.3
ECHO 126. Pennykoin (PK)                                 (walpool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 127. Electroneum (ETN)                             (nanopool)   AMD Claymore CryptoNote 11.3
ECHO 128. Electroneum (ETN)                             (nanopool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 129. Sumokoin (SUMO)                             (superpools)   AMD Claymore CryptoNote 11.3
ECHO 130. Sumokoin (SUMO)                             (superpools)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 131. Electronic Dollar (EDL)                   (Cryptoknight)   AMD Claymore CryptoNote 11.3
ECHO 132. Electronic Dollar (EDL)                   (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 133. Bytecoin (BCN)                          (bytecoin.party)   AMD Claymore CryptoNote 11.3
ECHO 134. Bytecoin (BCN)                          (bytecoin.party)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 135. Karbowanec (KRB)                          (Cryptoknight)   AMD Claymore CryptoNote 11.3
ECHO 136. Karbowanec (KRB)                          (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 137. Dero (DERO)                           (dero.miner.rocks)   AMD Claymore CryptoNote 11.3
ECHO 138. Dero (DERO)                           (dero.miner.rocks)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 139. B2B (B2B)                                 (Cryptoknight)   AMD Claymore CryptoNote 11.3
ECHO 140. B2B (B2B)                                 (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 141. Monero Original (XMO)                       (Superpools)   AMD Claymore CryptoNote 11.3
ECHO 142. Monero Original (XMO)                       (Superpools)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 143. Monero Classic (XMC)                        (Superpools)   AMD Claymore CryptoNote 11.3
ECHO 144. Monero Classic (XMC)                        (Superpools)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 145. Dinastycoin (DCY)                          (Dinastycoin)   AMD Claymore CryptoNote 11.3
ECHO 146. Dinastycoin (DCY)                          (Dinastycoin)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 147. Newtoncoin (NCP)                            (Superpools)   AMD Claymore CryptoNote 11.3
ECHO 148. Newtoncoin (NCP)                            (Superpools)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO ========================================================================================================
ECHO *                                     CryptoNightLite V1 Algorithm                                     *
ECHO ========================================================================================================
ECHO 149. BitcoiNote (BTCN)                           (Superpools)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 150. UltraNote (XUN)                              (Ultranote)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 151. Aeon (AEON)                               (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 152. IntuCoin (INTU)                               (Intucoin)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 153. ArQmA (ARQ)                               (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 154. Bitsum (BSM)                          (cryptopool.space)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 155. Triton (TRIT)                             (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 156. TurtleCoin (TRTL)                         (cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 157. Iridium (IRD)                             (cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 158. Worktips (WTIP)                           (Worktipspool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 106. BBSCoin (BBS)                         (pool.bbscoin.xyz)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 205. Plenteum (PLE)                         (ple.llama.horse)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO ========================================================================================================
ECHO *                                      CryptoNight Heavy Algorithm                                     *
ECHO ========================================================================================================
ECHO 159. Loki (LOKI)                               (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 160. Ryo (RYO)                                     (Fairpool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 161. Solace (SOLACE)                               (Fairpool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 162. Veronite (XVV)                          (Veronite.space)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 163. Saronite (XRN)                                (Fairpool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 164. Qwertycoin (QWC)                          (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 165. Ombre (OMB)                               (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 166. Niobio Cash (NBR)                         (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 167. Bixbite (BXB)                              (Bixbite.pro)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO ========================================================================================================
ECHO *                                      CryptoNight-Fast Algorithm                                      *
ECHO ========================================================================================================
ECHO 168. Masari (MSR)                              (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 169. PrivatePay (XPP)                              (Fairpool)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 170. KEPL (KEPL)                              (pool.kepl.org)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 171. Electronero (ETNX)                         (Thorshammer)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO ========================================================================================================
ECHO *                                     CryptoNight Custom Algorithm                                     *
ECHO ========================================================================================================
ECHO 172. Stellite Cash (XTL)                       (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 173. BitTube (TUBE)                            (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 174. Arto (RTO)                                (Cryptoknight)   AMD/NVIDIA/CPU Arto-Miner 1.1.2
ECHO 175. Haven (XHV)                               (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 176. Italocoin (ITA)                           (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 177. BLOC.money (BLOC)                           (Herominers)   AMD/NVIDIA/CPU XMR-Stak 2.5.0
ECHO 178. Alloy (XAO)                               (Cryptoknight)   AMD/NVIDIA/CPU XMR-Stak-Alloy 2.4.5
ECHO ========================================================================================================
ECHO *                                            x16r Algorithm                                            *
ECHO ========================================================================================================
ECHO 179. Ravencoin (RVN)                             (Ravenminer)   AMD Avermore 1.4.1
ECHO 180. Ravencoin (RVN)                             (Ravenminer)   NVIDIA Nevermore 0.2.3
ECHO ========================================================================================================
ECHO *                                            x16s Algorithm                                            *
ECHO ========================================================================================================
ECHO 181. Pigeoncoin (PGN)                         (Blockcruncher)   AMD Avermore 1.4.1
ECHO 182. Pigeoncoin (PGN)                         (Blockcruncher)   NVIDIA Nevermore 0.2.3
ECHO ========================================================================================================
ECHO *                                          Lyra2REv2 Algorithm                                         *
ECHO ========================================================================================================
ECHO 183. Vertcoin (VTC)                           (Miningpoolhub)   AMD Avermore 1.4.1
ECHO 184. Vertcoin (VTC)                           (Miningpoolhub)   NVIDIA Nevermore 0.2.3
ECHO 185. MonaCoin (MONA)                          (Miningpoolhub)   AMD Avermore 1.4.1
ECHO 186. MonaCoin (MONA)                          (Miningpoolhub)   NVIDIA Nevermore 0.2.3
ECHO 187. Hanacoin (HANA)                               (Hanacoin)   AMD Avermore 1.4.1
ECHO 188. Hanacoin (HANA)                               (Hanacoin)   NVIDIA Nevermore 0.2.3
ECHO ###. Verge (XVG)                                 COMING SOON!   AMD Avermore 1.4.1
ECHO 190. Verge (XVG)                                   (Zergpool)   NVIDIA Nevermore 0.2.3
ECHO ========================================================================================================
ECHO *                                           Lyra2z Algorithm                                           *
ECHO ========================================================================================================
ECHO ###. Zcoin (XZC)                                 COMING SOON!   AMD Avermore 1.4.1
ECHO 192. Zcoin (XZC)                              (Miningpoolhub)   NVIDIA Nevermore 0.2.3
ECHO ###. GINcoin (GIN)                               COMING SOON!   AMD Avermore 1.4.1
ECHO 194. GINcoin (GIN)                                 (Zergpool)   NVIDIA Nevermore 0.2.3
ECHO ###. Vertical Coin (VTL)                         COMING SOON!   AMD Avermore 1.4.1
ECHO 196. Vertical Coin (VTL)                           (Zergpool)   NVIDIA Nevermore 0.2.3
ECHO ========================================================================================================
ECHO *                                          NeoScrypt Algorithm                                         *
ECHO ========================================================================================================
ECHO 197. Feathercoin (FTC)                        (Miningpoolhub)   AMD Claymore NeoScrypt GPU Miner 1.2
ECHO 198. Feathercoin (FTC)                        (Miningpoolhub)   NVIDIA Nevermore 0.2.3
ECHO ========================================================================================================
ECHO *                                       Myriad-Groestl Algorithm                                       *
ECHO ========================================================================================================
ECHO 199. Digibyte (DGB)                                (Suprnova)   AMD Avermore 1.4.1
ECHO 200. Digibyte (DGB)                                (Suprnova)   NVIDIA Nevermore 0.2.3
ECHO ========================================================================================================
ECHO *                                           SHA224 Algorithm                                           *
ECHO ========================================================================================================
ECHO 201. Bismuth (BIS)                                  (Eggpool)   AMD/NVIDIA EggPool GPU Miner
ECHO ========================================================================================================
ECHO *                                            Quark Algorithm                                           *
ECHO ========================================================================================================
ECHO 202. Alqo (ALQO)                              (pool.alqo.org)   AMD Avermore 1.4.1
ECHO 203. Alqo (ALQO)                              (pool.alqo.org)   NVIDIA Nevermore 0.2.3
ECHO ========================================================================================================
ECHO *                                         Wild Keccak Algorithm                                        *
ECHO ========================================================================================================
ECHO 204. Purk (PURK)                                (purkproject)   AMD/NVIDIA/CPU Miner 1.0.3
ECHO ********************************************************************************************************

:INPUT
SET /P M=Type 1, 2, 3, or 4 then press ENTER:
IF defined var GOTO MinerSwitch

:MinerSwitch
::ETHASH
IF %M%==1 GOTO ETH1
IF %M%==2 GOTO ETH2
IF %M%==3 GOTO ETHDCR
IF %M%==4 GOTO ETHLBC
IF %M%==5 GOTO ETHPASC
IF %M%==6 GOTO ETHSIA
IF %M%==7 GOTO ETC
IF %M%==8 GOTO ETCDCR
IF %M%==9 GOTO ETCLBC
IF %M%==10 GOTO ETCPASC
IF %M%==11 GOTO ETCSIA
IF %M%==12 GOTO DBIX
IF %M%==13 GOTO DBIXDCR
IF %M%==14 GOTO DBIXLBC
IF %M%==15 GOTO DBIXPASC
IF %M%==16 GOTO DBIXSIA
IF %M%==17 GOTO UBQ
IF %M%==18 GOTO UBQDCR
IF %M%==19 GOTO UBQLBC
IF %M%==20 GOTO UBQPASC
IF %M%==21 GOTO UBQSIA
IF %M%==22 GOTO MUS
IF %M%==23 GOTO MUSDCR
IF %M%==24 GOTO MUSLBC
IF %M%==25 GOTO MUSPASC
IF %M%==26 GOTO MUSSIA
IF %M%==27 GOTO PIRL
IF %M%==28 GOTO CLO
IF %M%==29 GOTO EXP
IF %M%==30 GOTO ELLA
IF %M%==31 GOTO ETP
IF %M%==32 GOTO AKA
IF %M%==33 GOTO NUKO
IF %M%==34 GOTO PGC
IF %M%==35 GOTO ETSC
IF %M%==36 GOTO ARA
IF %M%==37 GOTO EGEM
IF %M%==38 GOTO YOC
IF %M%==39 GOTO VIC
IF %M%==40 GOTO WHL
IF %M%==41 GOTO ATH
IF %M%==42 GOTO MOAC
::EQUIHASH (200,9)
IF %M%==43 GOTO ZEC1
IF %M%==44 GOTO ZEC2
IF %M%==45 GOTO ZCL1
IF %M%==46 GOTO ZCL2
IF %M%==47 GOTO ZEN1
IF %M%==48 GOTO ZEN2
IF %M%==49 GOTO KMD1
IF %M%==50 GOTO KMD2
IF %M%==51 GOTO BTCP1
IF %M%==52 GOTO BTCP2
IF %M%==53 GOTO HUSH1
IF %M%==54 GOTO HUSH2
IF %M%==55 GOTO VOT1
IF %M%==56 GOTO VOT2
IF %M%==57 GOTO BCI1
IF %M%==58 GOTO BCI2
IF %M%==59 GOTO CMM1
IF %M%==60 GOTO CMM2
::EQUIHASH (210,9)
IF %M%==61 GOTO AION1
IF %M%==62 GOTO AION2
::EQUIHASH (192,7)
IF %M%==63 GOTO ZER1
IF %M%==64 GOTO ZER2
IF %M%==65 GOTO GENX1
IF %M%==66 GOTO GENX2
::EQUIHASH (144,5)
IF %M%==67 GOTO BTG1
IF %M%==68 GOTO BTG2
IF %M%==69 GOTO XSG1
IF %M%==70 GOTO XSG2
IF %M%==71 GOTO SAFE1
IF %M%==72 GOTO SAFE2
IF %M%==73 GOTO BTCZ1
IF %M%==74 GOTO BTCZ2
IF %M%==75 GOTO LTZ1
IF %M%==76 GOTO LTZ2
IF %M%==77 GOTO ZEL1
IF %M%==78 GOTO ZEL2
IF %M%==79 GOTO HEPTA1
IF %M%==80 GOTO HEPTA2
IF %M%==81 GOTO CDY1
IF %M%==82 GOTO CDY2
IF %M%==83 GOTO BCRM1
IF %M%==84 GOTO BCRM2
IF %M%==85 GOTO ASF1
IF %M%==86 GOTO ASF2
IF %M%==87 GOTO ANON1
IF %M%==88 GOTO ANON2
IF %M%==89 GOTO BTH1
IF %M%==90 GOTO BTH2
::EQUIHASH (96,5)
IF %M%==91 GOTO MNX1
IF %M%==92 GOTO MNX2
::CRYPTONIGHT V8
IF %M%==93 GOTO XMR2
IF %M%==94 GOTO WOW
::CRYPTONIGHT V7
IF %M%==95 GOTO XMV1
IF %M%==96 GOTO XMV2
IF %M%==97 GOTO QRL1
IF %M%==98 GOTO QRL2
IF %M%==99 GOTO GRFT1
IF %M%==100 GOTO GRFT2
IF %M%==101 GOTO LTHN1
IF %M%==102 GOTO LTHN2
IF %M%==103 GOTO ELYA1
IF %M%==104 GOTO ELYA2
IF %M%==105 GOTO WEB1
IF %M%==107 GOTO WEB2
IF %M%==109 GOTO LNS1
IF %M%==110 GOTO LNS2
IF %M%==111 GOTO XDN1
IF %M%==112 GOTO XDN2
IF %M%==113 GOTO ETNC1
IF %M%==114 GOTO ETNC2
IF %M%==115 GOTO CTL1
IF %M%==116 GOTO CTL2
IF %M%==117 GOTO MZT1
IF %M%==118 GOTO MZT2
IF %M%==119 GOTO SAFEX1
IF %M%==120 GOTO SAFEX2
IF %M%==121 GOTO XCASH1
IF %M%==122 GOTO XCASH2
IF %M%==123 GOTO SUP1
IF %M%==124 GOTO SUP2
::CRYPTONIGHT V1
IF %M%==125 GOTO PK1
IF %M%==126 GOTO PK2
IF %M%==127 GOTO ETN1
IF %M%==128 GOTO ETN2
IF %M%==129 GOTO SUMO1
IF %M%==130 GOTO SUMO2
IF %M%==131 GOTO EDL1
IF %M%==132 GOTO EDL2
IF %M%==133 GOTO BCN1
IF %M%==134 GOTO BCN2
IF %M%==135 GOTO KRB1
IF %M%==136 GOTO KRB2
IF %M%==137 GOTO DERO1
IF %M%==138 GOTO DERO2
IF %M%==139 GOTO B2B1
IF %M%==140 GOTO B2B2
IF %M%==141 GOTO XMO1
IF %M%==142 GOTO XMO2
IF %M%==143 GOTO XMC1
IF %M%==144 GOTO XMC2
IF %M%==145 GOTO DCY1
IF %M%==146 GOTO DCY2
IF %M%==147 GOTO NCP1
IF %M%==148 GOTO NCP2
::CRYPTONIGHTLITE V1
IF %M%==149 GOTO BTCN
IF %M%==150 GOTO XUN
IF %M%==151 GOTO AEON
IF %M%==152 GOTO INTU
IF %M%==153 GOTO ARQ
IF %M%==154 GOTO BSM
IF %M%==155 GOTO TRIT
IF %M%==156 GOTO TRTL
IF %M%==157 GOTO IRD
IF %M%==158 GOTO WTIP
IF %M%==106 GOTO BBS
IF %M%==205 GOTO PLE
::CRYPTONIGHT HEAVY
IF %M%==159 GOTO LOKI
IF %M%==160 GOTO RYO
IF %M%==161 GOTO SOLACE
IF %M%==162 GOTO XVV
IF %M%==163 GOTO XRN
IF %M%==164 GOTO QWC
IF %M%==165 GOTO OMB
IF %M%==166 GOTO NBR
IF %M%==167 GOTO BXB
::CRYPTONIGHT FAST
IF %M%==168 GOTO MSR
IF %M%==169 GOTO XPP
IF %M%==170 GOTO KEPL
IF %M%==171 GOTO ETNX
::CRYPTONIGHT CUSTOM
IF %M%==172 GOTO XTL
IF %M%==173 GOTO TUBE
IF %M%==174 GOTO RTO
IF %M%==175 GOTO XHV
IF %M%==176 GOTO ITA
IF %M%==177 GOTO BLOC
IF %M%==178 GOTO XAO
::X16R
IF %M%==179 GOTO RVN1
IF %M%==180 GOTO RVN2
::X16S
IF %M%==181 GOTO PGN1
IF %M%==182 GOTO PGN2
::LYRA2REV2
IF %M%==183 GOTO VTC1
IF %M%==184 GOTO VTC2
IF %M%==185 GOTO MONA1
IF %M%==186 GOTO MONA2
IF %M%==187 GOTO HANA1
IF %M%==188 GOTO HANA2
IF %M%==189 GOTO XVG1
IF %M%==190 GOTO XVG2
::LYRA2Z
IF %M%==191 GOTO XZC1
IF %M%==192 GOTO XZC2
IF %M%==193 GOTO GIN1
IF %M%==194 GOTO GIN2
IF %M%==195 GOTO VTL1
IF %M%==196 GOTO VTL2
::NEOSCRYPT
IF %M%==197 GOTO FTC1
IF %M%==198 GOTO FTC2
::MYRIAD-GROESTL
IF %M%==199 GOTO DGB1
IF %M%==200 GOTO DGB2
::SHA224
IF %M%==201 GOTO BIS
::QUARK
IF %M%==202 GOTO ALQO1
IF %M%==203 GOTO ALQO2
::WILD KECCAK
IF %M%==204 GOTO PURK

::
:INVALID
ECHO INVALID SELECTION, PLEASE TRY AGAIN
GOTO INPUT
::============================================ETHASH============================================::
::
:: Ethereum
::
:ETH1
ECHO Ethereum (ethermine.org, nanopool.org, miningpoolhub.com) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us-east.ethash-hub.miningpoolhub.com:20535 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -esm 2 -mode 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETH2
ECHO Ethereum (ethermine.org) AMD/NVIDIA PhoenixMiner 3.5d
CD Miners\PhoenixMiner_3.5d
PhoenixMiner -pool ssl://us1.ethermine.org:5555 -wal %ETH%.%MINER_NAME% -pass x -worker %MINER_NAME% -coin eth
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETHDCR
ECHO Ethereum (ethermine.org/nanopool.org) Decred (coinmine.pl, f2pool.com, suprnova.cc) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr-us.coinmine.pl:2222 -dwal %DCR% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.f2pool.com:5730 -dwal %DCR% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.suprnova.cc:3252 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr-us.coinmine.pl:2222 -dwal %DCR% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.f2pool.com:5730 -dwal %DCR% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.suprnova.cc:3252 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETHLBC
ECHO Ethereum (ethermine.org/nanopool.org) Library Credits (coinmine.pl) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool lbc-us.coinmine.pl:8787 -dwal %LBC% -dpsw %WORKER_PASSWORD% -dcoin lbc -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool lbc-us.coinmine.pl:8787 -dwal %LBC% -dpsw %WORKER_PASSWORD% -dcoin lbc -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETHPASC
ECHO Ethereum (ethermine.org/nanopool.org) PascalCoin (nanopool.org) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool pasc-us-east1.nanopool.org:15555 -dwal %PASC%.%MINER_NAME%/%EMAIL_ADDRESS% -dpsw %WORKER_PASSWORD% -dcoin pasc -ftime 10 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool pasc-us-east1.nanopool.org:15555 -dwal %PASC%.%MINER_NAME%/%EMAIL_ADDRESS% -dcoin pasc -ftime 10 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETHSIA
ECHO Ethereum (ethermine.org/nanopool.org) Siacoin (nanopool.org, f2pool.com, miningpoolhub.com) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sia-us-east1.nanopool.org:7777 -dwal %SIA%/%MINER_NAME%/%EMAIL_ADDRESS% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sc.f2pool.com:7777 -dwal %SIA%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1.ethermine.org:5555 -ewal %ETH%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool hub.miningpoolhub.com:20550 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sia-us-east1.nanopool.org:7777 -dwal %SIA%/%MINER_NAME%/%EMAIL_ADDRESS% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sc.f2pool.com:7777 -dwal %SIA%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool eth-us-east1.nanopool.org:9999 -ewal %ETH%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool hub.miningpoolhub.com:20550 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Ethereum Classic
::
:ETC
ECHO Ethereum Classic (ethermine.org, nanopool.org) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:19999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETCDCR
ECHO Ethereum Classic (ethermine.org/nanopool.org) Decred (coinmine.pl, f2pool.com, suprnova.cc) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr-us.coinmine.pl:2222 -dwal %DCR% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.f2pool.com:5730 -dwal %DCR% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.suprnova.cc:3252 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:9999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS%  -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr-us.coinmine.pl:2222 -dwal %DCR% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:9999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.f2pool.com:5730 -dwal %DCR% -dpsw %WORKER_PASSWORD% -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:9999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.suprnova.cc:3252 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETCLBC
ECHO Ethereum Classic (ethermine.org/nanopool.org) Library Credits (coinmine.pl) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool lbc-us.coinmine.pl:8787 -dwal %LBC% -dpsw %WORKER_PASSWORD% -dcoin lbc -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:9999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool lbc-us.coinmine.pl:8787 -dwal %LBC% -dpsw %WORKER_PASSWORD% -dcoin lbc -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETCPASC
ECHO Ethereum Classic (ethermine.org/nanopool.org) PascalCoin (nanopool.org) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool pasc-us-east1.nanopool.org:15555 -dwal %PASC%.%MINER_NAME%/%EMAIL_ADDRESS% -dpsw %WORKER_PASSWORD% -dcoin pasc -ftime 10 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:9999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool pasc-us-east1.nanopool.org:15555 -dwal %PASC%.%MINER_NAME%/%EMAIL_ADDRESS% -dcoin pasc -ftime 10 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETCSIA
ECHO Ethereum Classic (ethermine.org/nanopool.org) Siacoin (nanopool.org, f2pool.com, miningpoolhub.com) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sia-us-east1.nanopool.org:7777 -dwal %SIA%/%MINER_NAME%/%EMAIL_ADDRESS% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sc.f2pool.com:7777 -dwal %SIA%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ssl://us1-etc.ethermine.org:5555 -ewal %ETC%.%MINER_NAME% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool hub.miningpoolhub.com:20550 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:9999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sia-us-east1.nanopool.org:7777 -dwal %SIA%/%MINER_NAME%/%EMAIL_ADDRESS% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:9999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sc.f2pool.com:7777 -dwal %SIA%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etc-us-east1.nanopool.org:9999 -ewal %ETC%/%MINER_NAME%/%EMAIL_ADDRESS% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool hub.miningpoolhub.com:20550 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: DubaiCoin
::
:DBIX
ECHO DubaiCoin (altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:DBIXDCR
ECHO DubaiCoin (altpool.pro) Decred (coinmine.pl, f2pool.com, suprnova.cc) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr-us.coinmine.pl:2222 -dwal %DCR% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.f2pool.com:5730 -dwal %DCR% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool dcr.suprnova.cc:3252 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:DBIXLBC
ECHO DubaiCoin (altpool.pro) Library Credits (coinmine.pl) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool lbc-us.coinmine.pl:8787 -dwal %LBC%.%MINER_NAME% -dpsw x -dcoin lbc -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:DBIXPASC
ECHO DubaiCoin (altpool.pro) PascalCoin (nanopool.org) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool pasc-us-east1.nanopool.org:15555 -dwal %PASC%.%MINER_NAME%/%EMAIL_ADDRESS% -dcoin pasc -ftime 10 -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:DBIXSIA
ECHO DubaiCoin (altpool.pro) Siacoin (nanopool.org, f2pool.com, miningpoolhub.com) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sia-us-east1.nanopool.org:7777 -dwal %SIA%/%MINER_NAME%/%EMAIL_ADDRESS% -dcoin sia -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool sc.f2pool.com:7777 -dwal %SIA%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool dbix.altpool.pro:3249 -ewal %DBIX% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -dpool hub.miningpoolhub.com:20550 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Ubiq
::
:UBQ
ECHO Ubiq (ubiqpool.io, hodlpool.com, altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ubiq.hodlpool.com:8009 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ubq.altpool.pro:8247 -ewal %UBQ% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:UBQDCR
ECHO Ubiq (ubiqpool.io) Decred (coinmine.pl, f2pool.com, suprnova.cc) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -eworker %MINER_NAME% -dpool dcr-us.coinmine.pl:2222 -dwal %DCR% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -eworker %MINER_NAME% -dpool dcr.f2pool.com:5730 -dwal %DCR% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -eworker %MINER_NAME% -dpool dcr.suprnova.cc:3252 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:UBQLBC
ECHO Ubiq (ubiqpool.io) Library Credits (coinmine.pl) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -eworker %MINER_NAME% -dpool lbc-us.coinmine.pl:8787 -dwal %LBC%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin lbc -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:UBQPASC
ECHO Ubiq (ubiqpool.io) PascalCoin (nanopool.org) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -eworker %MINER_NAME% -dpool pasc-us-east1.nanopool.org:15555 -dwal %PASC%.%MINER_NAME%/%EMAIL_ADDRESS% -dcoin pasc -ftime 10 -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:UBQSIA
ECHO Ubiq (ubiqpool.io) Siacoin (nanopool.org, f2pool.com, miningpoolhub.com) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -eworker %MINER_NAME% -dpool sia-us-east1.nanopool.org:7777 -dwal %SIA%/%MINER_NAME%/%EMAIL_ADDRESS% -dcoin sia -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -eworker %MINER_NAME% -dpool sc.f2pool.com:7777 -dwal %SIA%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.ubiqpool.io:8008 -ewal %UBQ% -eworker %MINER_NAME% -epsw x -eworker %MINER_NAME% -dpool hub.miningpoolhub.com:20550 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Musicoin
::
:MUS
ECHO Musicoin (coinmine.pl) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:MUSDCR
ECHO Musicoin (coinmine.pl) Decred (coinmine.pl, f2pool.com, suprnova.cc) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -dpool dcr-us.coinmine.pl:2222 -dwal %DCR% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -dpool dcr.f2pool.com:5730 -dwal %DCR% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -dpool dcr.suprnova.cc:3252 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:MUSLBC
ECHO Musicoin (coinmine.pl) Library Credits (coinmine.pl) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -dpool lbc-us.coinmine.pl:8787 -dwal %LBC%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin lbc -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:MUSPASC
ECHO Musicoin (coinmine.pl) PascalCoin (nanopool.org) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -dpool pasc-us-east1.nanopool.org:15555 -dwal %PASC%.%MINER_NAME%/%EMAIL_ADDRESS% -dcoin pasc -ftime 10 -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:MUSSIA
ECHO Musicoin (coinmine.pl) Siacoin (nanopool.org, f2pool.com, miningpoolhub.com) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -dpool sia-us-east1.nanopool.org:7777 -dwal %SIA%/%MINER_NAME%/%EMAIL_ADDRESS% -dcoin sia -allpools 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -dpool sc.f2pool.com:7777 -dwal %SIA%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -allpools 1 -dcri 10
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool music.coinmine.pl:2020 -ewal %MUS%.%MINER_NAME% -eworker %MINER_NAME% -dpsw %WORKER_PASSWORD% -dpool hub.miningpoolhub.com:20550 -dwal %MINER_WEBLOGIN%.%MINER_NAME% -dpsw %WORKER_PASSWORD% -dcoin sia -allpools 1 -dcri 10
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Pirl
::
:PIRL
ECHO Pirl (cryptopools.info, pirlpool.eu, altpool.pro) AMD/NVIDIA Claymore 11.9
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool lb.geo.pirlpool.eu:8002 -ewal %PIRL% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1 -allpools 1
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool pirl.cryptopools.info:8004 -ewal %PIRL% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1 -allpools 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool pirl.altpool.pro:7477 -ewal %PIRL% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Callisto
::
:CLO
ECHO Callisto (clo.altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool clopool.pro:2561 -ewal %CLO% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Expanse
::
:EXP
ECHO Expanse (expmine.pro, coinmine.pl, exp.altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool us.expmine.pro:9009 -ewal %EXP% -epsw %WORKER_PASSWORD% -esm 0 -mode 1 -allpools 1 
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool exp.coinmine.pl:1500 -ewal %EXP% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD%  -mode 1 -allpools 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool exp.altpool.pro:3972 -ewal %EXP% -eworker %MINER_NAME% -epsw %WORKER_PASSWORD% -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Ellaism
::
:ELLA
ECHO Ellaism (ella.altpool.pro, ellaismpool.com) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ella.altpool.pro:7007 -ewal %ELLA% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool ellaismpool.com:8008 -ewal %ELLA% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Metaverse
::
:ETP
ECHO Metaverse (etp.altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etp.altpool.pro:8008 -ewal %ETP% -eworker %MINER_NAME% -epsw x -mode 1 -esm 0 -allpools 1 
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Akroma
::
:AKA
ECHO Akroma (fairpool.pw) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool mine.aka.fairpool.pw:2222 -ewal %AKA%.%MINER_NAME% -eworker %MINER_NAME% -epsw x -mode 1 -esm 3 -allpools 1 
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Nekonium
::
:NUKO
ECHO Nekonium (fairpool.pw) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool mine.nuko.fairpool.pw:7777 -ewal %NUKO%.%MINER_NAME% -eworker %MINER_NAME% -epsw x -mode 1 -esm 3 -allpools 1 
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Pegascoin
::
:PGC
ECHO Pegascoin (fairpool.pw) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool mine.pgc.fairpool.pw:1111 -ewal %PGC%.%MINER_NAME% -eworker %MINER_NAME% -epsw x -mode 1 -esm 3 -allpools 1 
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Ethereum Social
::
:ETSC
ECHO Ethereum Social (altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool etsc.altpool.pro:3872 -ewal %ETSC% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Aura
::
:ARA
ECHO Aura (aura.minerpool.net) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool aura.minerpool.net:8001 -ewal %ARA% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Ethergem
::
:EGEM
ECHO Ethergem (minerpool.net) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool lb.geo.egempool.eu:8001 -ewal %EGEM% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: YoCoin
::
:YOC
ECHO YoCoin (2miners.com, yoc.altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool yoc.2miners.com:4040 -ewal %YOC% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool yoc.altpool.pro:9621 -ewal %YOC% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Victorium
::
:VIC
ECHO Victorium (altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool vic.altpool.pro:4888 -ewal %VIC% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Whalecoin
::
:WHL
ECHO Whalecoin (whl.altpool.pro) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool whl.altpool.pro:9451 -ewal %WHL% -eworker %MINER_NAME% -epsw x -mode 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Atheios
::
:ATH
ECHO Atheios (cryptomena.io) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool pool.atheios.com:8007 -ewal %ATH% -eworker %MINER_NAME% -allpools 1
::Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool atheios.cryptopools.info:8004 -ewal %ATH% -eworker %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: MOAC
::
:MOAC
ECHO MOAC (cryptopools.info) AMD/NVIDIA Claymore 11.9
Miners\Claymore_ETH_Miner_v11.9\EthDcrMiner64 -epool moac.cryptopools.info:8004 -ewal %MOAC% -eworker %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=======================================EQUIHASH (200,9)======================================::
::
:: ZCash
::
:ZEC1
ECHO ZCash (flypool.org, nanopool.org, miningpoolhub.com, altpool.pro) AMD Claymore 12.6
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us1-zcash.flypool.org:3443 -zwal %ZEC%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://zec-us-east1.nanopool.org:6633 -zwal %ZEC%.%MINER_NAME%/%EMAIL_ADDRESS% -zpsw z -ftime 1 -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us-east.equihash-hub.miningpoolhub.com:20570 -zwal %MINER_WEBLOGIN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool zec.altpool.pro:2142 -zwal %ZEC%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ZEC2
ECHO ZCash (nanopool.org) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm --server zec-us-east1.nanopool.org --port 16666 --user %ZEC% --pass %WORKER_PASSWORD% --color 
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: ZClassic
::
:ZCL1
ECHO ZClassic (miningpoolhub.com, suprnova.cc, miningspeed.com, altpool.pro) AMD Claymore 12.6
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us-east.equihash-hub.miningpoolhub.com:20575 -zwal %MINER_WEBLOGIN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://zcl.suprnova.cc:4142 -zwal %ZCL%.%MINER_NAME% -zpsw %EMAIL_ADDRESS% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us.miningspeed.com:3054 -zwal %ZCL%.%MINER_NAME% -zpsw %EMAIL_ADDRESS% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool zcl.altpool.pro:4042 -zwal %ZCL%.%MINER_NAME% -zpsw %EMAIL_ADDRESS% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ZCL2
ECHO ZClassic (miningspeed.com) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm --server us.miningspeed.com --port 3052 --user %ZCL%.%MINER_NAME% --pass %EMAIL_ADDRESS% --color 
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: HoriZEN (Formerly Zencash)
::
:ZEN1
ECHO HoriZEN (suprnova.cc, miningpoolhub.com, miningspeed.com) AMD Claymore 12.6
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://zen.suprnova.cc:3621 -zwal %MINER_WEBLOGIN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us-east.equihash-hub.miningpoolhub.com:20594 -zwal %MINER_WEBLOGIN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us.miningspeed.com:3064 -zwal %ZEN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ZEN2
ECHO HoriZEN (miningspeed.com) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm --dev --server us.miningspeed.com --port 3062 --user %ZEN%.%MINER_NAME% --pass %EMAIL_ADDRESS% --color
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Komodo
::
:KMD1
ECHO Komodo (suprnova.cc, miningspeed.com, altpool.pro) AMD Claymore 12.6
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool kmd.suprnova.cc:6250 -zwal %MINER_WEBLOGIN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us.miningspeed.com:3034 -zwal %KMD%.%MINER_NAME% -zpsw %EMAIL_ADDRESS% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool kmd.altpool.pro:6250 -zwal %KMD%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:KMD2
ECHO Komodo (miningspeed.com) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm --server us.miningspeed.com  --port 3032 --user %KMD%.%MINER_NAME% --pass %EMAIL_ADDRESS% --color
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Bitcoin Private
::
:BTCP1
ECHO Bitcoin Private (suprnova.cc, miningspeed.com, btcprivate.pro) AMD Claymore 12.6
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://btcp.suprnova.cc:6825 -zwal %MINER_WEBLOGIN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us.miningspeed.com:2064 -zwal %BTCP% -zpsw %EMAIL_ADDRESS% -ftime 1 -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool us.btcprivate.pro:2827 -zwal %BTCP%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:BTCP2
ECHO Bitcoin Private (suprnova.cc, miningspeed.com) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm --server btcp.suprnova.cc --port 6824 --user %MINER_WEBLOGIN%.%MINER_NAME% -pass %WORKER_PASSWORD%
::Miners\DSTM_zm_0.6.1_win\zm --server us.miningspeed.com --port 2064 --user %BTCP% --pass %EMAIL_ADDRESS%  --color 
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Hush
::
:HUSH1
ECHO Hush (suprnova.cc, miningspeed.com, altpool.pro) AMD Claymore 12.6
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://hush.suprnova.cc:4050 -zwal %MINER_WEBLOGIN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us.miningspeed.com:3094 -zwal %HUSH%.%MINER_NAME% -zpsw %EMAIL_ADDRESS% -allpools 1
::Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool hush.altpool.pro:9005 -zwal %HUSH%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:HUSH2
ECHO Hush (miningspeed.com) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm --server us.miningspeed.com --port 3092 --user %HUSH%.%MINER_NAME% --pass %EMAIL_ADDRESS% --color
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Votecoin
::
:VOT1
ECHO Votecoin (equipool.1ds.us) AMD Claymore 12.6
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://mine-vot-na.equipool.1ds.us:50076 -zwal %VOT%.%MINER_NAME% -zpsw %EMAIL_ADDRESS% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:VOT2
ECHO Votecoin (equipool.1ds.us) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm.exe --server mine-vot-na.equipool.1ds.us --port 50073 --user %VOT%.%MINER_NAME% --pass x --color
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Bitcoin Interest
::
:BCI1
ECHO Bitcoin Interest (suprnova.cc) AMD Claymore 12.6
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://bci.suprnova.cc:8168 -zwal %MINER_WEBLOGIN%.%MINER_NAME% -zpsw %WORKER_PASSWORD% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:BCI2
ECHO Bitcoin Interest (suprnova.cc) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm --server ssl://bci.suprnova.cc --port 8168 --user %MINER_WEBLOGIN%.%MINER_NAME% --pass %WORKER_PASSWORD% --color
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Commercium
::
:CMM1
ECHO Commercium (miningspeed.com) AMD Claymore 12.6
Miners\Claymore_ZCash_AMD_GPU_Miner_v12.6\ZecMiner64 -zpool ssl://us.miningspeed.com:2074 -zwal %CMM%.%MINER_NAME% -zpsw %EMAIL_ADDRESS% -allpools 1
::us.miningspeed.com:2072
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:CMM2
ECHO Commercium (miningspeed.com) NVIDIA DSTM Zcash Miner 0.6.1
Miners\DSTM_zm_0.6.1_win\zm --server us.miningspeed.com --port 2072 --user %CMM%.%MINER_NAME% --pass %EMAIL_ADDRESS% --color
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::====================================EQUIHASH-AION (210,9)====================================::
::
:: Aion
::
:AION1
ECHO Aion (Aionmine.org, Luxor.tech) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64
lolMiner --coin AION --pool stratum.aionmine.org --port 9999 --user %AION%.%MINER_NAME% --pass x --logs 1
::lolMiner --coin AION --pool aion-us.luxor.tech --port 3366 --user %AION% --rigname %MINER_NAME% --pass x --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:AION2
ECHO Aion (Aionmine.org, Luxor.tech) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server aion-us.luxor.tech --port 3366 --user %AION% --pass x --algo aion --pers AION0PoW --color 1 --fee 0
::Miners\EWBF_Equihash_miner_v0.6\miner --server na.aionmine.org --port 6666 --user %AION%.%MINER_NAME% --pass x --algo aion --pers AION0PoW --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::====================================EQUIHASH-ZERO (192,7)====================================::
::
::ZERO
::
:ZER1
ECHO Zero (suprnova.cc, zergpool.com, forgetop.com) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin ZER --pool zero.suprnova.cc --port 6568 --user %MINER_WEBLOGIN%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
::lolMiner --coin ZER --pool equihash192.mine.zergpool.com --port 2144 --user %ZER% --pass c=ZER,mc=ZER --logs 1
::lolMiner --coin ZER --pool zer.forgetop.com --port 2053 --user %ZER%.%MINER_NAME% --pass x --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ZER2
ECHO Zero (forgetop.com) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server zer.forgetop.com --port 2053 --user %ZER%.%MINER_NAME% -pass x --algo 192_7 --pers ZERO_PoW --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
::Genesis (Formerly SafeCash)
::
:GENX1
ECHO Genesis - Formerly SafeCash (suprnova.cc, nibirupool.com) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin GENX --pool genx.suprnova.cc --port 9983 --user %MINER_WEBLOGIN%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
::lolMiner --coin GENX --pool genx-us.nibirupool.com --port 8120 --user %GENX%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:GENX2
ECHO Genesis - Formerly SafeCash (suprnova.cc, nibirupool.com) NVIDIA EWBF Miner v0.6
::Miners\EWBF_Equihash_miner_v0.6\miner --server genx.suprnova.cc --port 9983 --user %MINER_WEBLOGIN%.%MINER_NAME% -pass %WORKER_PASSWORD% --algo 192_7 --pers GENX_PoW --color 1 --fee 0
Miners\EWBF_Equihash_miner_v0.6\miner --server genx-us.nibirupool.com --port 8120 --user %GENX%.%MINER_NAME% -pass %WORKER_PASSWORD% --algo 192_7 --pers GENX_PoW --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::========================================ZHASH (144,5)========================================::
::
:: Bitcoin Gold
::
:BTG1
ECHO Bitcoin Gold (miningpoolhub.com, suprnova.cc, altpool.pro) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin BTG --pool us-east.equihash-hub.miningpoolhub.com --port 20595 --user %MINER_WEBLOGIN%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
::lolMiner --coin BTG --pool btg.suprnova.cc --port 8866 --user %MINER_WEBLOGIN%.%MINER_NAME% --rigname %MINER_NAME% --pass=x --logs 1
::lolMiner --coin BTG --pool us.btgpool.pro --port 3857 --user %BTG%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:BTG2
ECHO Bitcoin Gold (altpool.pro) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server us.btgpool.pro --port 3857 --user %BTG%.%MINER_NAME% --pass %WORKER_PASSWORD% --algo 144_5 --pers BgoldPoW --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Snowgem
::
:XSG1
ECHO Snowgem (altpool.pro) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin XSG --pool us.miningspeed.com --port 3022 --user %XSG%.%MINER_NAME% --rigname %MINER_NAME% --pass %EMAIL_ADDRESS% --logs 1
::lolMiner --coin XSG --pool xsg.altpool.pro --port 9741 --user %XSG%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:XSG2
ECHO Snowgem (altpool.pro) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server xsg.altpool.pro --port 9741 --user %XSG%.%MINER_NAME% --pass x --algo 144_5 --pers sngemPoW --color 1 --fee 0
::Miners\EWBF_Equihash_miner_v0.6\miner --server us.miningspeed.com --port 3022 --user %XSG%.%MINER_NAME% --pass %EMAIL_ADDRESS% --algo 144_5 --pers sngemPoW --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: SafeCoin
::
:SAFE1
ECHO SafeCoin (miningspeed.com) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin SAFE --pool us.miningspeed.com --port 2052 --user %SAFE%.%MINER_NAME% --rigname %MINER_NAME% --pass %EMAIL_ADDRESS% --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:SAFE2
ECHO SafeCoin (altpool.pro) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server us.miningspeed.com --port 2052 --user %SAFE%.%MINER_NAME% --pass %EMAIL_ADDRESS% --algo 144_5 --pers Safecoin --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: BitcoinZ
::
:BTCZ1
ECHO BitcoinZ (equipool.1ds.us, miningspeed.com, suprnova.cc) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin BTCZ --pool mine-btcz-na.equipool.1ds.us --port 50063 --user %BTCZ%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
::lolMiner --coin BTCZ --pool btcz.suprnova.cc --port 6586 --user %MINER_WEBLOGIN%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
::lolMiner --coin BTCZ --pool us.miningspeed.com --port 3072 --user %BTCZ%.%MINER_NAME% --rigname %MINER_NAME% --pass %EMAIL_ADDRESS% --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:BTCZ2
ECHO BitcoinZ (equipool.1ds.us, miningspeed.com, suprnova.cc) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server mine-btcz-na.equipool.1ds.us --port 50063 --user %BTCZ%.%MINER_NAME% --pass x --algo 144_5 --pers BitcoinZ --color 1 --fee 0
::Miners\EWBF_Equihash_miner_v0.6\miner --server us.miningspeed.com --port 3072 --user %BTCZ%.%MINER_NAME% --pass %EMAIL_ADDRESS% --algo 144_5 --pers BitcoinZ --color 1 --fee 0
::Miners\EWBF_Equihash_miner_v0.6\miner --server btcz.suprnova.cc --port 6586 --user %MINER_WEBLOGIN%.%MINER_NAME% --pass %WORKER_PASSWORD% --algo 144_5 --pers BitcoinZ --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: LitecoinZ
::
:LTZ1
ECHO LitecoinZ (equipool.1ds.us) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin LTZ --pool mine-ltz-na.equipool.1ds.us --port 50093 --user %LTZ%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:LTZ2
ECHO LitecoinZ (equipool.1ds.us) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server mine-ltz-na.equipool.1ds.us --port 50093 --user %LTZ%.%MINER_NAME% --pass x --algo 144_5 --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: ZelCash
::
:ZEL1
ECHO ZelCash (altpool.pro) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin ZEL --pool zel.altpool.pro --port 9351 --user %ZEL%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ZEL2
ECHO ZelCash (altpool.pro) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server zel.altpool.pro --port 9351 --user %BTCZ%.%MINER_NAME% --pass x --algo 144_5 --pers ZelProof --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: HeptaCoin
::
:HEPTA1
ECHO HeptaCoin (nibirupool.com, dragonpool.xyz, equigems.online) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin HEPTA --pool hepta.nibirupool.com --port 8138 --user %HEPTA%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
::lolMiner --coin HEPTA --pool hepta.dragonpool.xyz --port 6334 --user %HEPTA%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
::lolMiner --coin HEPTA --pool equigems.online --port 3000 --user %HEPTA%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:HEPTA2
ECHO HeptaCoin (nibirupool.com) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server hepta.nibirupool.com --port 8138 --user %HEPTA%.%MINER_NAME% --pass x --algo 144_5 --pers HeptaPoW --color 1 --fee 0 --eexit 3
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Bitcoin Candy
::
:CDY1
ECHO Bitcoin Candy (pool.cdy.one) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin CDY --pool pool.cdy.one --port 3856 --user %CDY%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:CDY2
ECHO Bitcoin Candy (pool.cdy.one) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server pool.cdy.one --port 3856 --user %CDY% --pass %WORKER_PASSWORD%.%MINER_NAME% --algo 144_5 --pers CandyPoW --color 1 --fee 0 --eexit 3
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Bitcoin RM
::
:BCRM1
ECHO Bitcoin Candy (pool.bitcoinrm.org) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --profile BCRM --pool pool.bitcoinrm.org --port 2000 --user %BCRM%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:BCRM2
ECHO Bitcoin Candy (pool.bitcoinrm.org) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server pool.bitcoinrm.org --port 2000 --user %BCRM%.%MINER_NAME% --pass %WORKER_PASSWORD% --algo 144_5 --pers BCRMcoin --color 1 --fee 0 --eexit 3
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Asofe
::
:ASF1
ECHO Asofe (pool.asofe.org) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin ASF --pool pool.asofe.org --port 3032 --user %ASF%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ASF2
ECHO Asofe (pool.asofe.org) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server pool.asofe.org --port 3032 --user %ASF%.%MINER_NAME% --pass %WORKER_PASSWORD% --algo 144_5 --pers AsofePow --color 1 --fee 0 --eexit 3
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Anonymous Bitcoin
::
:ANON1
ECHO Anon (altpool.pro, 2miners.com) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin ANON --pool anon.2miners.com --port 9090 --user %ANON%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
::lolMiner --coin ANON --pool anon.altpool.pro --port 2667 --user %ANON%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ANON2
ECHO Anon (altpool.pro, 2miners.com) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server anon.2miners.com --port 9090 --user %ANON%.%MINER_NAME% --pass %WORKER_PASSWORD% --algo 144_5 --pers AnonyPoW --color 1 --fee 0 --eexit 3
::Miners\EWBF_Equihash_miner_v0.6\miner --server anon.altpool.pro --port 2667 --user %ANON%.%MINER_NAME% --pass %WORKER_PASSWORD% --algo 144_5 --pers AnonyPoW --color 1 --fee 0 --eexit 3
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Bithereum
::
:BTH1
ECHO Bithereum () AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin BTH --pool  --port  --user %BTH%.%MINER_NAME% --rigname %MINER_NAME% --pass %WORKER_PASSWORD% --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:BTH2
ECHO Bithereum () NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server  --port  --user %BTH%.%MINER_NAME% --pass %WORKER_PASSWORD% --algo 144_5 --pers  --color 1 --fee 0 --eexit 3
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE

::=======================================EQUIHASH (96,5)=======================================::
::
::Minexcoin
::
:MNX1
ECHO Minexcoin (forgetop.com) AMD lolMiner v0.5
cd Miners\lolMiner_v05_Win64\
lolMiner --coin MNX --pool mnx-eu.forgetop.com --port 5052 --user %MNX%.%MINER_NAME% --rigname %MINER_NAME% --pass x --logs 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:MNX2
ECHO Minexcoin (forgetop.com) NVIDIA EWBF Miner v0.6
Miners\EWBF_Equihash_miner_v0.6\miner --server mnx-eu.forgetop.com --port 5052 --user %MNX%.%MINER_NAME% --pass x --algo 96_5 --pers ZcashPoW --color 1 --fee 0
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=======================================CRYPTONIGHT V8========================================::
::
:: Monero
::
:XMR2
DEL Miners\xmr-stak-2.5.0\XMR-pools.txt
DEL Miners\xmr-stak-2.5.0\XMR-cpu.txt
DEL Miners\xmr-stak-2.5.0\XMR-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XMR-amd.txt
CLS
ECHO Monero (nanopool.org) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O xmr-us-east1.nanopool.org:14433 -u %XMR%.%MINER_NAME%/%EMAIL_ADDRESS% -p x -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\XMR-config.txt -C Miners\xmr-stak-2.5.0\XMR-pools.txt --amd Miners\xmr-stak-2.5.0\XMR-amd.txt --nvidia Miners\xmr-stak-2.5.0\XMR-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XMR-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Wownero
::
:WOW
DEL Miners\xmr-stak-2.5.0\WOW-pools.txt
DEL Miners\xmr-stak-2.5.0\WOW-cpu.txt
DEL Miners\xmr-stak-2.5.0\WOW-nvidia.txt
DEL Miners\xmr-stak-2.5.0\WOW-amd.txt
CLS
ECHO Wownero (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o wownero.ingest.cryptoknight.cc:50902 -u %WOW% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v8 -c Miners\xmr-stak-2.5.0\WOW-config.txt -C Miners\xmr-stak-2.5.0\WOW-pools.txt --amd Miners\xmr-stak-2.5.0\WOW-amd.txt --nvidia Miners\xmr-stak-2.5.0\WOW-nvidia.txt --cpu Miners\xmr-stak-2.5.0\WOW-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=======================================CRYPTONIGHT V7========================================::
::
:: Monero
::
:XMR1
ECHO Monero (nanopool.org) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://xmr-us-east1.nanopool.org:14433 -xwal %XMR%.%MINER_NAME%/%EMAIL_ADDRESS% -xpsw x -allpools 1 -pow7 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: MoneroV
::
:XMV1
ECHO MoneroV (leafpool.com, cryptoknight.cc) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool xmv-us-east.leafpool.com:9992 -xwal %XMV%.%MINER_NAME% -xpsw x -allpools 1 -pow7 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool monerov.ingest.cryptoknight.cc:9222 -xwal %XMV% -xpsw %MINER_NAME% -allpools 1 -pow7 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:XMV2
DEL Miners\xmr-stak-2.5.0\XMV-pools.txt
DEL Miners\xmr-stak-2.5.0\XMV-cpu.txt
DEL Miners\xmr-stak-2.5.0\XMV-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XMV-amd.txt
CLS
ECHO MoneroV (leafpool.com, cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o xmv-us-east.leafpool.com:9992 -u %XMV%.%MINER_NAME% -p x -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\XMV-config.txt -C Miners\xmr-stak-2.5.0\XMV-pools.txt --amd Miners\xmr-stak-2.5.0\XMV-amd.txt --nvidia Miners\xmr-stak-2.5.0\XMV-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XMV-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o monerov.ingest.cryptoknight.cc:9222 -u %XMV% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\XMV-config.txt -C Miners\xmr-stak-2.5.0\XMV-pools.txt --amd Miners\xmr-stak-2.5.0\XMV-amd.txt --nvidia Miners\xmr-stak-2.5.0\XMV-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XMV-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Quantum Resistant Ledger
::
:QRL1
ECHO Quantum Resistant Ledger (qrlpool.org) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://pool.qrlpool.org:9999 -xwal %QRL% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:QRL2
DEL Miners\xmr-stak-2.5.0\QRL-pools.txt
DEL Miners\xmr-stak-2.5.0\QRL-cpu.txt
DEL Miners\xmr-stak-2.5.0\QRL-nvidia.txt
DEL Miners\xmr-stak-2.5.0\QRL-amd.txt
CLS
ECHO Quantum Resistant Ledger (qrlpool.org) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O pool.qrlpool.org:9999 -u %QRL% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\QRL-config.txt -C Miners\xmr-stak-2.5.0\QRL-pools.txt --amd Miners\xmr-stak-2.5.0\QRL-amd.txt --nvidia Miners\xmr-stak-2.5.0\QRL-nvidia.txt --cpu Miners\xmr-stak-2.5.0\QRL-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Graft
::
:GRFT1
ECHO GRAFT (cryptoknight.cc) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool graft.ingest.cryptoknight.cc:9112 -xwal %GRFT% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:GRFT2
DEL Miners\xmr-stak-2.5.0\GRFT-pools.txt
DEL Miners\xmr-stak-2.5.0\GRFT-cpu.txt
DEL Miners\xmr-stak-2.5.0\GRFT-nvidia.txt
DEL Miners\xmr-stak-2.5.0\GRFT-amd.txt
CLS
ECHO GRAFT (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o graft.ingest.cryptoknight.cc:9112 -u %GRFT% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\GRFT-config.txt -C Miners\xmr-stak-2.5.0\GRFT-pools.txt --amd Miners\xmr-stak-2.5.0\GRFT-amd.txt --nvidia Miners\xmr-stak-2.5.0\GRFT-nvidia.txt --cpu Miners\xmr-stak-2.5.0\GRFT-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: IntenseCoin
::
:LTHN1
ECHO Lethean formerly IntenseCoin (lethean.io, hashvault.pro, cryptoknight.cc) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://pool.intensecoin.com:9000 -xwal %ITNS% -xpsw %MINER_NAME%:%EMAIL_ADDRESS% -pow7 1 -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://pool.lethean.hashvault.pro:443 -xwal %ITNS% -xpsw %MINER_NAME% -pow7 1 -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool intense.ingest.cryptoknight.cc:8882 -xwal %ITNS% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:LTHN2
DEL Miners\xmr-stak-2.5.0\ITNS-pools.txt
DEL Miners\xmr-stak-2.5.0\ITNS-cpu.txt
DEL Miners\xmr-stak-2.5.0\ITNS-nvidia.txt
DEL Miners\xmr-stak-2.5.0\ITNS-amd.txt
CLS
ECHO Lethean formerly IntenseCoin (lethean.io, hashvault.pro, cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O pool.intensecoin.com:9000 -u %ITNS% -p %MINER_NAME%:%EMAIL_ADDRESS% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\ITNS-config.txt -C Miners\xmr-stak-2.5.0\ITNS-pools.txt --amd Miners\xmr-stak-2.5.0\ITNS-amd.txt --nvidia Miners\xmr-stak-2.5.0\ITNS-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ITNS-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -O pool.lethean.hashvault.pro:443 -u %ITNS% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\ITNS-config.txt -C Miners\xmr-stak-2.5.0\ITNS-pools.txt --amd Miners\xmr-stak-2.5.0\ITNS-amd.txt --nvidia Miners\xmr-stak-2.5.0\ITNS-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ITNS-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o intense.ingest.cryptoknight.cc:8882 -u %ITNS% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\ITNS-config.txt -C Miners\xmr-stak-2.5.0\ITNS-pools.txt --amd Miners\xmr-stak-2.5.0\ITNS-amd.txt --nvidia Miners\xmr-stak-2.5.0\ITNS-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ITNS-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Elya Coin
::
:ELYA1
ECHO Elya Coin (cryptoknight.cc) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool elya.ingest.cryptoknight.cc:50202 -xwal %ELYA% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ELYA2
DEL Miners\xmr-stak-2.5.0\ELYA-pools.txt
DEL Miners\xmr-stak-2.5.0\ELYA-cpu.txt
DEL Miners\xmr-stak-2.5.0\ELYA-nvidia.txt
DEL Miners\xmr-stak-2.5.0\ELYA-amd.txt
CLS
ECHO Elya (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o elya.ingest.cryptoknight.cc:50202 -u %ELYA% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\ELYA-config.txt -C Miners\xmr-stak-2.5.0\ELYA-pools.txt --amd Miners\xmr-stak-2.5.0\ELYA-amd.txt --nvidia Miners\xmr-stak-2.5.0\ELYA-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ELYA-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Webchain
::
:WEB1
ECHO Webchain (loudmining.com) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool webcn.loudmining.com:5555 -xwal %WEB% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:WEB2
DEL Miners\xmr-stak-2.5.0\WEB-pools.txt
DEL Miners\xmr-stak-2.5.0\WEB-cpu.txt
DEL Miners\xmr-stak-2.5.0\WEB-nvidia.txt
DEL Miners\xmr-stak-2.5.0\WEB-amd.txt
CLS
ECHO Webchain (loudmining.com) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o webcn.loudmining.com:5555 -u %WEB% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\WEB-config.txt -C Miners\xmr-stak-2.5.0\WEB-pools.txt --amd Miners\xmr-stak-2.5.0\WEB-amd.txt --nvidia Miners\xmr-stak-2.5.0\WEB-nvidia.txt --cpu Miners\xmr-stak-2.5.0\WEB-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Lines
::
:LNS1
ECHO Lines (cryptoknight.cc) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool lines.ingest.cryptoknight.cc:50402 -xwal %LNS% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:LNS2
DEL Miners\xmr-stak-2.5.0\LNS-pools.txt
DEL Miners\xmr-stak-2.5.0\LNS-cpu.txt
DEL Miners\xmr-stak-2.5.0\LNS-nvidia.txt
DEL Miners\xmr-stak-2.5.0\LNS-amd.txt
CLS
ECHO Lines (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o lines.ingest.cryptoknight.cc:50402 -u %LNS% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\LNS-config.txt -C Miners\xmr-stak-2.5.0\LNS-pools.txt --amd Miners\xmr-stak-2.5.0\LNS-amd.txt --nvidia Miners\xmr-stak-2.5.0\LNS-nvidia.txt --cpu Miners\xmr-stak-2.5.0\LNS-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: DigitalNote
::
:XDN1
ECHO DigitalNote (minercountry.com) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool xdn.minercountry.com:4444 -xwal %XDN% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:XDN2
DEL Miners\xmr-stak-2.5.0\XDN-pools.txt
DEL Miners\xmr-stak-2.5.0\XDN-cpu.txt
DEL Miners\xmr-stak-2.5.0\XDN-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XDN-amd.txt
CLS
ECHO DigitalNote (minercountry.com) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o xdn.minercountry.com:4444 -u %XDN% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\XDN-config.txt -C Miners\xmr-stak-2.5.0\XDN-pools.txt --amd Miners\xmr-stak-2.5.0\XDN-amd.txt --nvidia Miners\xmr-stak-2.5.0\XDN-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XDN-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Electroneum Classic
::
:ETNC1
ECHO Electroneum Classic (etnminers.com) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://classic.etnminers.com:6668 -xwal %ETNC% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETNC2
DEL Miners\xmr-stak-2.5.0\ETNC-pools.txt
DEL Miners\xmr-stak-2.5.0\ETNC-cpu.txt
DEL Miners\xmr-stak-2.5.0\ETNC-nvidia.txt
DEL Miners\xmr-stak-2.5.0\ETNC-amd.txt
CLS
ECHO Electroneum Classic (etnminers.com) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o classic.etnminers.com:7779 -u %ETNC% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\ETNC-config.txt -C Miners\xmr-stak-2.5.0\ETNC-pools.txt --amd Miners\xmr-stak-2.5.0\ETNC-amd.txt --nvidia Miners\xmr-stak-2.5.0\ETNC-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ETNC-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Citadel
::
:CTL1
ECHO Citadel (herominers.com) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://citadel.herominers.com:11429 -xwal %CTL% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:CTL2
DEL Miners\xmr-stak-2.5.0\CTL-pools.txt
DEL Miners\xmr-stak-2.5.0\CTL-cpu.txt
DEL Miners\xmr-stak-2.5.0\CTL-nvidia.txt
DEL Miners\xmr-stak-2.5.0\CTL-amd.txt
CLS
ECHO Citadel (herominers.com) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O citadel.herominers.com:11429 -u %CTL% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\CTL-config.txt -C Miners\xmr-stak-2.5.0\CTL-pools.txt --amd Miners\xmr-stak-2.5.0\CTL-amd.txt --nvidia Miners\xmr-stak-2.5.0\CTL-nvidia.txt --cpu Miners\xmr-stak-2.5.0\CTL-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Myztic
::
:MZT1
ECHO Myztic (myztic.cash) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool nypool.myztic.cash:7777 -xwal %MZT% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:MZT2
DEL Miners\xmr-stak-2.5.0\MZT-pools.txt
DEL Miners\xmr-stak-2.5.0\MZT-cpu.txt
DEL Miners\xmr-stak-2.5.0\MZT-nvidia.txt
DEL Miners\xmr-stak-2.5.0\MZT-amd.txt
CLS
ECHO Myztic (myztic.cash) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o nypool.myztic.cash:7777 -u %MZT%+%MINER_NAME% -p x -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\MZT-config.txt -C Miners\xmr-stak-2.5.0\MZT-pools.txt --amd Miners\xmr-stak-2.5.0\MZT-amd.txt --nvidia Miners\xmr-stak-2.5.0\MZT-nvidia.txt --cpu Miners\xmr-stak-2.5.0\MZT-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Safe Exchange Coin
::
:SAFEX1
ECHO Safe Exchange Coin (safex.mining.pro, eu.pool.safexnews.net) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://eu.pool.safexnews.net:9999 -xwal %SAFEX% -xpsw %MINER_NAME% -pow7 1 -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool safex.xmining.pro:5555 -xwal %SAFEX% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:SAFEX2
DEL Miners\xmr-stak-2.5.0\SAFEX-pools.txt
DEL Miners\xmr-stak-2.5.0\SAFEX-cpu.txt
DEL Miners\xmr-stak-2.5.0\SAFEX-nvidia.txt
DEL Miners\xmr-stak-2.5.0\SAFEX-amd.txt
CLS
ECHO Safe Exchange Coin (safex.mining.pro, eu.pool.safexnews.net) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O eu.pool.safexnews.net:9999 -u %SAFEX% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\SAFEX-config.txt -C Miners\xmr-stak-2.5.0\SAFEX-pools.txt --amd Miners\xmr-stak-2.5.0\SAFEX-amd.txt --nvidia Miners\xmr-stak-2.5.0\SAFEX-nvidia.txt --cpu Miners\xmr-stak-2.5.0\SAFEX-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o safex.xmining.pro:5555 -u %SAFEX% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\SAFEX-config.txt -C Miners\xmr-stak-2.5.0\SAFEX-pools.txt --amd Miners\xmr-stak-2.5.0\SAFEX-amd.txt --nvidia Miners\xmr-stak-2.5.0\SAFEX-nvidia.txt --cpu Miners\xmr-stak-2.5.0\SAFEX-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: X-Cash
::
:XCASH1
ECHO X-Cash (arhash.xyz, luckypool.io) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool xcash.arhash.xyz:7777 -xwal %XCA% -xpsw %MINER_NAME% -pow7 1 -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool xcash.luckypool.io:4488 -xwal %XCA% -xpsw %MINER_NAME% -pow7 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:XCASH2
DEL Miners\xmr-stak-2.5.0\XCA-pools.txt
DEL Miners\xmr-stak-2.5.0\XCA-cpu.txt
DEL Miners\xmr-stak-2.5.0\XCA-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XCA-amd.txt
CLS
ECHO X-Cash (arhash.xyz, luckypool.io) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o xcash.arhash.xyz:7777 -u %XCA% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\XCA-config.txt -C Miners\xmr-stak-2.5.0\XCA-pools.txt --amd Miners\xmr-stak-2.5.0\XCA-amd.txt --nvidia Miners\xmr-stak-2.5.0\XCA-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XCA-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o xcash.luckypool.io:4488 -u %XCA% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7 -c Miners\xmr-stak-2.5.0\XCA-config.txt -C Miners\xmr-stak-2.5.0\XCA-pools.txt --amd Miners\xmr-stak-2.5.0\XCA-amd.txt --nvidia Miners\xmr-stak-2.5.0\XCA-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XCA-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=======================================CRYPTONIGHT V1========================================::
::
:: Pennykoin
::
:PK1
ECHO Pennykoin (walpool.com) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool pk-us.walpool.com:5035 -xwal %PK% -xpsw %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:PK2
DEL Miners\xmr-stak-2.5.0\PK-pools.txt
DEL Miners\xmr-stak-2.5.0\PK-cpu.txt
DEL Miners\xmr-stak-2.5.0\PK-nvidia.txt
DEL Miners\xmr-stak-2.5.0\PK-amd.txt
CLS
ECHO Pennykoin (walpool.com) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o pk-us.walpool.com:5035 -u %PK% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\PK-config.txt -C Miners\xmr-stak-2.5.0\PK-pools.txt --amd Miners\xmr-stak-2.5.0\PK-amd.txt --nvidia Miners\xmr-stak-2.5.0\PK-nvidia.txt --cpu Miners\xmr-stak-2.5.0\PK-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Electroneum
::
:ETN1
ECHO Electroneum (nanopool.org) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://etn-us-east1.nanopool.org:13433 -xwal %ETN%.%MINER_NAME%/%EMAIL_ADDRESS% -xpsw x -di 0123456789 -ftime 1 -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://us-east.cryptonight-hub.miningpoolhub.com:20596 -xwal %MINER_WEBLOGIN%.%MINER_NAME% -xpsw x -di 0123456789 -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool etn.ingest.cryptoknight.cc:5202 -xwal %ETN% -xpsw %MINER_NAME% -di 0123456789 -ftime 1 -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ETN2
DEL Miners\xmr-stak-2.5.0\ETN-pools.txt
DEL Miners\xmr-stak-2.5.0\ETN-cpu.txt
DEL Miners\xmr-stak-2.5.0\ETN-nvidia.txt
DEL Miners\xmr-stak-2.5.0\ETN-amd.txt
CLS
ECHO Electroneum (nanopool.org) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O etn-us-east1.nanopool.org:13433 -u %ETN%.%MINER_NAME%/%EMAIL_ADDRESS% -p x -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\ETN-config.txt -C Miners\xmr-stak-2.5.0\ETN-pools.txt --amd Miners\xmr-stak-2.5.0\ETN-amd.txt --nvidia Miners\xmr-stak-2.5.0\ETN-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ETN-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Sumokoin
::
:SUMO1
ECHO Sumokoin (superpools.online, sumokoin.com, cryptoknight.cc) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool sumo.superpools.online:4777 -xwal %SUMO% -xpsw %MINER_NAME% -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool pool.sumokoin.com:4444 -xwal %SUMO% -xpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool sumo.ingest.cryptoknight.cc:5581 -xwal %SUMO% -xpsw %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:SUMO2
DEL Miners\xmr-stak-2.5.0\SUMO-pools.txt
DEL Miners\xmr-stak-2.5.0\SUMO-cpu.txt
DEL Miners\xmr-stak-2.5.0\SUMO-nvidia.txt
DEL Miners\xmr-stak-2.5.0\SUMO-amd.txt
CLS
ECHO Sumokoin (superpools.online) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o sumo.superpools.online:4777 -u %SUMO% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\SUMO-config.txt -C Miners\xmr-stak-2.5.0\SUMO-pools.txt --amd Miners\xmr-stak-2.5.0\SUMO-amd.txt --nvidia Miners\xmr-stak-2.5.0\SUMO-nvidia.txt --cpu Miners\xmr-stak-2.5.0\SUMO-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Electronic Dollar
::
:EDL1
ECHO Electronic Dollar (cryptoknight.cc) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool edl.ingest.cryptoknight.cc:50302 -xwal %EDL% -xpsw %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:EDL2
DEL Miners\xmr-stak-2.5.0\EDL-pools.txt
DEL Miners\xmr-stak-2.5.0\EDL-cpu.txt
DEL Miners\xmr-stak-2.5.0\EDL-nvidia.txt
DEL Miners\xmr-stak-2.5.0\EDL-amd.txt
CLS
ECHO Electronic Dollar (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o edl.ingest.cryptoknight.cc:50302 -u %EDL% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\EDL-config.txt -C Miners\xmr-stak-2.5.0\EDL-pools.txt --amd Miners\xmr-stak-2.5.0\EDL-amd.txt --nvidia Miners\xmr-stak-2.5.0\EDL-nvidia.txt --cpu Miners\xmr-stak-2.5.0\EDL-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Bytecoin
::
:BCN1
ECHO Bytecoin (byptecoin-pool.org, bytecoin.uk, bytecoin.party) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool pool.bytecoin.party:7777 -xwal %BCN% -xpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool us.bytecoin-pool.org:7777 -xwal %BCN% -xpsw %WORKER_PASSWORD% -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://bytecoin.uk:2222 -xwal %BCN% -xpsw x -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:BCN2
DEL Miners\xmr-stak-2.5.0\BCN-pools.txt
DEL Miners\xmr-stak-2.5.0\BCN-cpu.txt
DEL Miners\xmr-stak-2.5.0\BCN-nvidia.txt
DEL Miners\xmr-stak-2.5.0\BCN-amd.txt
CLS
ECHO Bytecoin (byptecoin-pool.org, bytecoin.uk, bytecoin.party) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o pool.bytecoin.party:7777 -u %BCN% -p %WORKER_PASSWORD% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\BCN-config.txt -C Miners\xmr-stak-2.5.0\BCN-pools.txt --amd Miners\xmr-stak-2.5.0\BCN-amd.txt --nvidia Miners\xmr-stak-2.5.0\BCN-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BCN-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o us.bytecoin-pool.org:7777 -u %BCN% -p %WORKER_PASSWORD% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\BCN-config.txt -C Miners\xmr-stak-2.5.0\BCN-pools.txt --amd Miners\xmr-stak-2.5.0\BCN-amd.txt --nvidia Miners\xmr-stak-2.5.0\BCN-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BCN-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -O bytecoin.uk:2222 -u %BCN% -p x -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\BCN-config.txt -C Miners\xmr-stak-2.5.0\BCN-pools.txt --amd Miners\xmr-stak-2.5.0\BCN-amd.txt --nvidia Miners\xmr-stak-2.5.0\BCN-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BCN-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Karbowanec
::
:KRB1
ECHO Karbowanec (cryptoknight.cc, hashvault.pro, hashgang.io) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool karbo.ingest.cryptoknight.cc:29992 -xwal %KRB% -xpsw %MINER_NAME% -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool pool.karbo.hashvault.pro:7777 -xwal %KRB% -xpsw %MINER_NAME%:%EMAIL_ADDRESS% -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool eu1.krb.hashgang.io:6666 -xwal %KRB% -xpsw %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:KRB2
DEL Miners\xmr-stak-2.5.0\KRB-pools.txt
DEL Miners\xmr-stak-2.5.0\KRB-cpu.txt
DEL Miners\xmr-stak-2.5.0\KRB-nvidia.txt
DEL Miners\xmr-stak-2.5.0\KRB-amd.txt
CLS
ECHO Karbowanec (cryptoknight.cc, hashvault.pro, hashgang.io) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o karbo.ingest.cryptoknight.cc:29992 -u %KRB% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\KRB-config.txt -C Miners\xmr-stak-2.5.0\KRB-pools.txt --amd Miners\xmr-stak-2.5.0\KRB-amd.txt --nvidia Miners\xmr-stak-2.5.0\KRB-nvidia.txt --cpu Miners\xmr-stak-2.5.0\KRB-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o pool.karbo.hashvault.pro:7777 -u %KRB% -p %MINER_NAME%:%EMAIL_ADDRESS% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\KRB-config.txt -C Miners\xmr-stak-2.5.0\KRB-pools.txt --amd Miners\xmr-stak-2.5.0\KRB-amd.txt --nvidia Miners\xmr-stak-2.5.0\KRB-nvidia.txt --cpu Miners\xmr-stak-2.5.0\KRB-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o eu1.krb.hashgang.io:6666 -u %KRB% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\KRB-config.txt -C Miners\xmr-stak-2.5.0\KRB-pools.txt --amd Miners\xmr-stak-2.5.0\KRB-amd.txt --nvidia Miners\xmr-stak-2.5.0\KRB-nvidia.txt --cpu Miners\xmr-stak-2.5.0\KRB-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Dero
::
:DERO1
ECHO Dero (dero.miner.rocks, fairhash.org) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://dero.miner.rocks:5555 -xwal %DERO% -xpsw %MINER_NAME% -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ssl://pool.dero.fairhash.org:7778 -xwal %DERO%.%MINER_NAME% -xpsw x -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:DERO2
DEL Miners\xmr-stak-2.5.0\DERO-pools.txt
DEL Miners\xmr-stak-2.5.0\DERO-cpu.txt
DEL Miners\xmr-stak-2.5.0\DERO-nvidia.txt
DEL Miners\xmr-stak-2.5.0\DERO-amd.txt
CLS
ECHO Dero (dero.miner.rocks, fairhash.org) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O dero.miner.rocks:5555 -u %DERO% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\DERO-config.txt -C Miners\xmr-stak-2.5.0\DERO-pools.txt --amd Miners\xmr-stak-2.5.0\DERO-amd.txt --nvidia Miners\xmr-stak-2.5.0\DERO-nvidia.txt --cpu Miners\xmr-stak-2.5.0\DERO-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -O pool.dero.fairhash.org:7778 -u %DERO%.%MINER_NAME% -p x -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\DERO-config.txt -C Miners\xmr-stak-2.5.0\DERO-pools.txt --amd Miners\xmr-stak-2.5.0\DERO-amd.txt --nvidia Miners\xmr-stak-2.5.0\DERO-nvidia.txt --cpu Miners\xmr-stak-2.5.0\DERO-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: B2B
::
:B2B1
ECHO B2B (cryptoknight.cc, superpools) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool b2b.ingest.cryptoknight.cc:4492 -xwal %B2B% -xpsw %MINER_NAME% -allpools 1
::Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool b2b.superpools.online:4444 -xwal %B2B% -xpsw %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:B2B2
DEL Miners\xmr-stak-2.5.0\B2B-pools.txt
DEL Miners\xmr-stak-2.5.0\B2B-cpu.txt
DEL Miners\xmr-stak-2.5.0\B2B-nvidia.txt
DEL Miners\xmr-stak-2.5.0\B2B-amd.txt
CLS
ECHO B2B (cryptoknight.cc, superpools) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o b2b.ingest.cryptoknight.cc:4492 -u %B2B% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\B2B-config.txt -C Miners\xmr-stak-2.5.0\B2B-pools.txt --amd Miners\xmr-stak-2.5.0\B2B-amd.txt --nvidia Miners\xmr-stak-2.5.0\B2B-nvidia.txt --cpu Miners\xmr-stak-2.5.0\B2B-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o b2b.superpools.online:4444 -u %B2B% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\B2B-config.txt -C Miners\xmr-stak-2.5.0\B2B-pools.txt --amd Miners\xmr-stak-2.5.0\B2B-amd.txt --nvidia Miners\xmr-stak-2.5.0\B2B-nvidia.txt --cpu Miners\xmr-stak-2.5.0\B2B-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Monero Original
::
:XMO1
ECHO Monero Original (superpools.online) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool xmo.superpools.online:4444 -xwal %XMO% -xpsw %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:XMO2
DEL Miners\xmr-stak-2.5.0\XMO-pools.txt
DEL Miners\xmr-stak-2.5.0\XMO-cpu.txt
DEL Miners\xmr-stak-2.5.0\XMO-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XMO-amd.txt
CLS
ECHO Monero Original (superpools.online) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o xmo.superpools.online:4444 -u %XMO% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\XMO-config.txt -C Miners\xmr-stak-2.5.0\XMO-pools.txt --amd Miners\xmr-stak-2.5.0\XMO-amd.txt --nvidia Miners\xmr-stak-2.5.0\XMO-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XMO-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Monero Classic
::
:XMC1
ECHO Monero Classic (superpools.online) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool xmc.superpools.online:2444 -xwal %XMC% -xpsw %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:XMC2
DEL Miners\xmr-stak-2.5.0\XMC-pools.txt
DEL Miners\xmr-stak-2.5.0\XMC-cpu.txt
DEL Miners\xmr-stak-2.5.0\XMC-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XMC-amd.txt
CLS
ECHO Monero Classic (superpools.online) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o xmc.superpools.online:2444 -u %XMC% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\XMC-config.txt -C Miners\xmr-stak-2.5.0\XMC-pools.txt --amd Miners\xmr-stak-2.5.0\XMC-amd.txt --nvidia Miners\xmr-stak-2.5.0\XMC-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XMC-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Dinastycoin
::
:DCY1
ECHO Dinastycoin (dinastycoin.com) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool poolmining2.dinastycoin.com:5555 -xwal %DCY% -xpsw x -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:DCY2
DEL Miners\xmr-stak-2.5.0\DCY-pools.txt
DEL Miners\xmr-stak-2.5.0\DCY-cpu.txt
DEL Miners\xmr-stak-2.5.0\DCY-nvidia.txt
DEL Miners\xmr-stak-2.5.0\DCY-amd.txt
CLS
ECHO Dinastycoin (dinastycoin.com) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o poolmining2.dinastycoin.com:5555 -u %DCY% -p x -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\DCY-config.txt -C Miners\xmr-stak-2.5.0\DCY-pools.txt --amd Miners\xmr-stak-2.5.0\DCY-amd.txt --nvidia Miners\xmr-stak-2.5.0\DCY-nvidia.txt --cpu Miners\xmr-stak-2.5.0\DCY-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Newtoncoin
::
:NCP1
ECHO Newtoncoin (superpools.online) AMD Claymore CryptoNote 11.3
Miners\Claymore_CryptoNote_AMD_v11.3\NsGpuCNMiner -xpool ncp.superpools.online:5555 -xwal %NCP% -xpsw %MINER_NAME% -allpools 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:NCP2
DEL Miners\xmr-stak-2.5.0\NCP-pools.txt
DEL Miners\xmr-stak-2.5.0\NCP-cpu.txt
DEL Miners\xmr-stak-2.5.0\NCP-nvidia.txt
DEL Miners\xmr-stak-2.5.0\NCP-amd.txt
CLS
ECHO Newtoncoin (superpools.online) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o ncp.superpools.online:5555 -u %NCP% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight -c Miners\xmr-stak-2.5.0\NCP-config.txt -C Miners\xmr-stak-2.5.0\NCP-pools.txt --amd Miners\xmr-stak-2.5.0\NCP-amd.txt --nvidia Miners\xmr-stak-2.5.0\NCP-nvidia.txt --cpu Miners\xmr-stak-2.5.0\NCP-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=====================================CRYPTONIGHT V7 LITE=====================================::
::
:: BitcoiNote
::
:BTCN
DEL Miners\xmr-stak-2.5.0\BTCN-pools.txt
DEL Miners\xmr-stak-2.5.0\BTCN-cpu.txt
DEL Miners\xmr-stak-2.5.0\BTCN-nvidia.txt
DEL Miners\xmr-stak-2.5.0\BTCN-amd.txt
CLS
ECHO BitcoiNote (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o pool.bitcoinote.org:7708 -u %BTCN% -p x -r %MINER_NAME% --currency cryptonight_lite_v7 -c Miners\xmr-stak-2.5.0\BTCN-config.txt -C Miners\xmr-stak-2.5.0\BTCN-pools.txt --amd Miners\xmr-stak-2.5.0\BTCN-amd.txt --nvidia Miners\xmr-stak-2.5.0\BTCN-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BTCN-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: UltraNote
::
:XUN
DEL Miners\xmr-stak-2.5.0\XUN-pools.txt
DEL Miners\xmr-stak-2.5.0\XUN-cpu.txt
DEL Miners\xmr-stak-2.5.0\XUN-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XUN-amd.txt
CLS
ECHO UltraNote (ultranote.org) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o alpha.ultranote.org:7777 -u %XUN% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 -c Miners\xmr-stak-2.5.0\XUN-config.txt -C Miners\xmr-stak-2.5.0\XUN-pools.txt --amd Miners\xmr-stak-2.5.0\XUN-amd.txt --nvidia Miners\xmr-stak-2.5.0\XUN-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XUN-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Aeon
::
:AEON
DEL Miners\xmr-stak-2.5.0\AEON-pools.txt
DEL Miners\xmr-stak-2.5.0\AEON-cpu.txt
DEL Miners\xmr-stak-2.5.0\AEON-nvidia.txt
DEL Miners\xmr-stak-2.5.0\AEON-amd.txt
CLS
ECHO Aeon (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o aeon.ingest.cryptoknight.cc:5542 -u %AEON% -p %MINER_NAME% -r %MINER_NAME% --currency aeon7 --noUAC -c Miners\xmr-stak-2.5.0\AEON-config.txt -C Miners\xmr-stak-2.5.0\AEON-pools.txt --amd Miners\xmr-stak-2.5.0\AEON-amd.txt --nvidia Miners\xmr-stak-2.5.0\AEON-nvidia.txt --cpu Miners\xmr-stak-2.5.0\AEON-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: IntuCoin
::
:INTU
DEL Miners\xmr-stak-2.5.0\INTU-pools.txt
DEL Miners\xmr-stak-2.5.0\INTU-cpu.txt
DEL Miners\xmr-stak-2.5.0\INTU-nvidia.txt
DEL Miners\xmr-stak-2.5.0\INTU-amd.txt
CLS
ECHO IntuCoin (superpools.online) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o intu.superpools.online:6555 -u %INTU% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 -c Miners\xmr-stak-2.5.0\INTU-config.txt -C Miners\xmr-stak-2.5.0\INTU-pools.txt --amd Miners\xmr-stak-2.5.0\INTU-amd.txt --nvidia Miners\xmr-stak-2.5.0\INTU-nvidia.txt --cpu Miners\xmr-stak-2.5.0\INTU-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: ArQmA
::
:ARQ
DEL Miners\xmr-stak-2.5.0\ARQ-pools.txt
DEL Miners\xmr-stak-2.5.0\ARQ-cpu.txt
DEL Miners\xmr-stak-2.5.0\ARQ-nvidia.txt
DEL Miners\xmr-stak-2.5.0\ARQ-amd.txt
CLS
ECHO Arqma (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o arq.ingest.cryptoknight.cc:3732 -u %ARQ% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\ARQ-config.txt -C Miners\xmr-stak-2.5.0\ARQ-pools.txt --amd Miners\xmr-stak-2.5.0\ARQ-amd.txt --nvidia Miners\xmr-stak-2.5.0\ARQ-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ARQ-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Bitsum
::
:BSM
DEL Miners\xmr-stak-2.5.0\BSM-pools.txt
DEL Miners\xmr-stak-2.5.0\BSM-cpu.txt
DEL Miners\xmr-stak-2.5.0\BSM-nvidia.txt
DEL Miners\xmr-stak-2.5.0\BSM-amd.txt
CLS
ECHO Bitsum (cryptopool.space) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o pool.bsm.cryptopool.space:7777 -u %BSM% -p %MINER_NAME%:%EMAIL_ADDRESS% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\BSM-config.txt -C Miners\xmr-stak-2.5.0\BSM-pools.txt --amd Miners\xmr-stak-2.5.0\BSM-amd.txt --nvidia Miners\xmr-stak-2.5.0\BSM-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BSM-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Triton
::
:TRIT
DEL Miners\xmr-stak-2.5.0\TRIT-pools.txt
DEL Miners\xmr-stak-2.5.0\TRIT-cpu.txt
DEL Miners\xmr-stak-2.5.0\TRIT-nvidia.txt
DEL Miners\xmr-stak-2.5.0\TRIT-amd.txt
CLS
ECHO Triton (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o triton.ingest.cryptoknight.cc:6632 -u %TRIT% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\TRIT-config.txt -C Miners\xmr-stak-2.5.0\TRIT-pools.txt --amd Miners\xmr-stak-2.5.0\TRIT-amd.txt --nvidia Miners\xmr-stak-2.5.0\TRIT-nvidia.txt --cpu Miners\xmr-stak-2.5.0\TRIT-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: TurtleCoin
::
:TRTL
DEL Miners\xmr-stak-2.5.0\TRTL-pools.txt
DEL Miners\xmr-stak-2.5.0\TRTL-cpu.txt
DEL Miners\xmr-stak-2.5.0\TRTL-nvidia.txt
DEL Miners\xmr-stak-2.5.0\TRTL-amd.txt
CLS
ECHO TurtleCoin (min2gether.com, cryptopool.space) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o trtl.pool.mine2gether.com:5555 -u %TRTL% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\TRTL-config.txt -C Miners\xmr-stak-2.5.0\TRTL-pools.txt --amd Miners\xmr-stak-2.5.0\TRTL-amd.txt --nvidia Miners\xmr-stak-2.5.0\TRTL-nvidia.txt --cpu Miners\xmr-stak-2.5.0\TRTL-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -O pool.trtl.cryptopool.space:443 -u %TRTL% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\TRTL-config.txt -C Miners\xmr-stak-2.5.0\TRTL-pools.txt --amd Miners\xmr-stak-2.5.0\TRTL-amd.txt --nvidia Miners\xmr-stak-2.5.0\TRTL-nvidia.txt --cpu Miners\xmr-stak-2.5.0\TRTL-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Iridium
::
:IRD
DEL Miners\xmr-stak-2.5.0\IRD-pools.txt
DEL Miners\xmr-stak-2.5.0\IRD-cpu.txt
DEL Miners\xmr-stak-2.5.0\IRD-nvidia.txt
DEL Miners\xmr-stak-2.5.0\IRD-amd.txt
CLS
ECHO Iridium (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o iridium.ingest.cryptoknight.cc:50502 -u %IRD% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\IRD-config.txt -C Miners\xmr-stak-2.5.0\IRD-pools.txt --amd Miners\xmr-stak-2.5.0\IRD-amd.txt --nvidia Miners\xmr-stak-2.5.0\IRD-nvidia.txt --cpu Miners\xmr-stak-2.5.0\IRD-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Worktips
::
:WTIP
DEL Miners\xmr-stak-2.5.0\WTIP-pools.txt
DEL Miners\xmr-stak-2.5.0\WTIP-cpu.txt
DEL Miners\xmr-stak-2.5.0\WTIP-nvidia.txt
DEL Miners\xmr-stak-2.5.0\WTIP-amd.txt
CLS
ECHO Worktips (worktipspool.xyz, worktips.work) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O worktipspool.xyz:6666 -u %WTIP% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\WTIP-config.txt -C Miners\xmr-stak-2.5.0\WTIP-pools.txt --amd Miners\xmr-stak-2.5.0\WTIP-amd.txt --nvidia Miners\xmr-stak-2.5.0\WTIP-nvidia.txt --cpu Miners\xmr-stak-2.5.0\WTIP-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o worktips.work:5555 -u %WTIP% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\WTIP-config.txt -C Miners\xmr-stak-2.5.0\WTIP-pools.txt --amd Miners\xmr-stak-2.5.0\WTIP-amd.txt --nvidia Miners\xmr-stak-2.5.0\WTIP-nvidia.txt --cpu Miners\xmr-stak-2.5.0\WTIP-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: BBS Coin
::
:BBS
DEL Miners\xmr-stak-2.5.0\BBS-pools.txt
DEL Miners\xmr-stak-2.5.0\BBS-cpu.txt
DEL Miners\xmr-stak-2.5.0\BBS-nvidia.txt
DEL Miners\xmr-stak-2.5.0\BBS-amd.txt
CLS
ECHO BBSCoin (pool.bbscoin.xyz, cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o pool.bbscoin.xyz:7777 -u %BBS% -p %MINER_NAME% -r %MINER_NAME% --currency bbscoin -c Miners\xmr-stak-2.5.0\BBS-config.txt -C Miners\xmr-stak-2.5.0\BBS-pools.txt --amd Miners\xmr-stak-2.5.0\BBS-amd.txt --nvidia Miners\xmr-stak-2.5.0\BBS-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BBS-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o bbs.ingest.cryptoknight.cc:19932 -u %BBS% -p %MINER_NAME% -r %MINER_NAME% --currency bbscoin -c Miners\xmr-stak-2.5.0\BBS-config.txt -C Miners\xmr-stak-2.5.0\BBS-pools.txt --amd Miners\xmr-stak-2.5.0\BBS-amd.txt --nvidia Miners\xmr-stak-2.5.0\BBS-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BBS-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Plenteum
::
:PLE
DEL Miners\xmr-stak-2.5.0\PLE-pools.txt
DEL Miners\xmr-stak-2.5.0\PLE-cpu.txt
DEL Miners\xmr-stak-2.5.0\PLE-nvidia.txt
DEL Miners\xmr-stak-2.5.0\PLE-amd.txt
CLS
ECHO Plenteum (ple.llama.horse, ple.cnhub.de) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o pool.llama.horse:10013 -u %PLE% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\PLE-config.txt -C Miners\xmr-stak-2.5.0\PLE-pools.txt --amd Miners\xmr-stak-2.5.0\PLE-amd.txt --nvidia Miners\xmr-stak-2.5.0\PLE-nvidia.txt --cpu Miners\xmr-stak-2.5.0\PLE-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -O ple.cnhub.de:4441 -u %PLE% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_lite_v7 --noUAC -c Miners\xmr-stak-2.5.0\PLE-config.txt -C Miners\xmr-stak-2.5.0\PLE-pools.txt --amd Miners\xmr-stak-2.5.0\PLE-amd.txt --nvidia Miners\xmr-stak-2.5.0\PLE-nvidia.txt --cpu Miners\xmr-stak-2.5.0\PLE-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=====================================CRYPTONIGHT HEAVY======================================::
::
:: Loki
::
:LOKI
DEL Miners\xmr-stak-2.5.0\LOKI-pools.txt
DEL Miners\xmr-stak-2.5.0\LOKI-cpu.txt
DEL Miners\xmr-stak-2.5.0\LOKI-nvidia.txt
DEL Miners\xmr-stak-2.5.0\LOKI-amd.txt
CLS
ECHO Loki (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o loki.ingest.cryptoknight.cc:7732 -u %LOKI% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\LOKI-config.txt -C Miners\xmr-stak-2.5.0\LOKI-pools.txt --amd Miners\xmr-stak-2.5.0\LOKI-amd.txt --nvidia Miners\xmr-stak-2.5.0\LOKI-nvidia.txt --cpu Miners\xmr-stak-2.5.0\LOKI-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Ryo
::
:RYO
DEL Miners\xmr-stak-2.5.0\RYO-pools.txt
DEL Miners\xmr-stak-2.5.0\RYO-cpu.txt
DEL Miners\xmr-stak-2.5.0\RYO-nvidia.txt
DEL Miners\xmr-stak-2.5.0\RYO-amd.txt
CLS
ECHO Ryo (fairpool.pw, miner.rocks) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o mine.ryo.fairpool.pw:5555 -u %RYO%+%MINER_NAME% -p x -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\RYO-config.txt -C Miners\xmr-stak-2.5.0\RYO-pools.txt --amd Miners\xmr-stak-2.5.0\RYO-amd.txt --nvidia Miners\xmr-stak-2.5.0\RYO-nvidia.txt --cpu Miners\xmr-stak-2.5.0\RYO-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o ryo.miner.rocks:5555 -u %RYO% -p w=%MINER_NAME% -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\RYO-config.txt -C Miners\xmr-stak-2.5.0\RYO-pools.txt --amd Miners\xmr-stak-2.5.0\RYO-amd.txt --nvidia Miners\xmr-stak-2.5.0\RYO-nvidia.txt --cpu Miners\xmr-stak-2.5.0\RYO-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Veronite
::
:XVV
DEL Miners\xmr-stak-2.5.0\XVV-pools.txt
DEL Miners\xmr-stak-2.5.0\XVV-cpu.txt
DEL Miners\xmr-stak-2.5.0\XVV-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XVV-amd.txt
CLS
ECHO Veronite (pool.veronite.space) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O pool.veronite.space:9999 -u %XVV% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\XVV-config.txt -C Miners\xmr-stak-2.5.0\XVV-pools.txt --amd Miners\xmr-stak-2.5.0\XVV-amd.txt --nvidia Miners\xmr-stak-2.5.0\XVV-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XVV-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: SolaceCoin
::
:SOLACE
DEL Miners\xmr-stak-2.5.0\SOLACE-pools.txt
DEL Miners\xmr-stak-2.5.0\SOLACE-cpu.txt
DEL Miners\xmr-stak-2.5.0\SOLACE-nvidia.txt
DEL Miners\xmr-stak-2.5.0\SOLACE-amd.txt
CLS
ECHO Solace (fairpool.pw) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o mine.solace.fairpool.pw:5588 -u %SOLACE%+%MINER_NAME% -p x -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\SOLACE-config.txt -C Miners\xmr-stak-2.5.0\SOLACE-pools.txt --amd Miners\xmr-stak-2.5.0\SOLACE-amd.txt --nvidia Miners\xmr-stak-2.5.0\SOLACE-nvidia.txt --cpu Miners\xmr-stak-2.5.0\SOLACE-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Saronite
::
:XRN
DEL Miners\xmr-stak-2.5.0\XRN-pools.txt
DEL Miners\xmr-stak-2.5.0\XRN-cpu.txt
DEL Miners\xmr-stak-2.5.0\XRN-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XRN-amd.txt
CLS
ECHO Saronite (fairpool.pw) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o mine.xrn.fairpool.pw:5599 -u %XRN%+%MINER_NAME% -p x -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\XRN-config.txt -C Miners\xmr-stak-2.5.0\XRN-pools.txt --amd Miners\xmr-stak-2.5.0\XRN-amd.txt --nvidia Miners\xmr-stak-2.5.0\XRN-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XRN-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Qwertycoin
::
:QWC
DEL Miners\xmr-stak-2.5.0\QWC-pools.txt
DEL Miners\xmr-stak-2.5.0\QWC-cpu.txt
DEL Miners\xmr-stak-2.5.0\QWC-nvidia.txt
DEL Miners\xmr-stak-2.5.0\QWC-amd.txt
CLS
ECHO Qwertycoin (fairpool.pw) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o qwerty.ingest.cryptoknight.cc:8262 -u %QWC% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\QWC-config.txt -C Miners\xmr-stak-2.5.0\QWC-pools.txt --amd Miners\xmr-stak-2.5.0\QWC-amd.txt --nvidia Miners\xmr-stak-2.5.0\QWC-nvidia.txt --cpu Miners\xmr-stak-2.5.0\QWC-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Ombre
::
:OMB
DEL Miners\xmr-stak-2.5.0\OMB-pools.txt
DEL Miners\xmr-stak-2.5.0\OMB-cpu.txt
DEL Miners\xmr-stak-2.5.0\OMB-nvidia.txt
DEL Miners\xmr-stak-2.5.0\OMB-amd.txt
CLS
ECHO Ombre (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o ombre.ingest.cryptoknight.cc:5572 -u %OMB% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\OMB-config.txt -C Miners\xmr-stak-2.5.0\OMB-pools.txt --amd Miners\xmr-stak-2.5.0\OMB-amd.txt --nvidia Miners\xmr-stak-2.5.0\OMB-nvidia.txt --cpu Miners\xmr-stak-2.5.0\OMB-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Niobio Cash
::
:NBR
DEL Miners\xmr-stak-2.5.0\NBR-pools.txt
DEL Miners\xmr-stak-2.5.0\NBR-cpu.txt
DEL Miners\xmr-stak-2.5.0\NBR-nvidia.txt
DEL Miners\xmr-stak-2.5.0\NBR-amd.txt
CLS
ECHO Niobio Cash (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o niobio.ingest.cryptoknight.cc:5802 -u %NBR% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\NBR-config.txt -C Miners\xmr-stak-2.5.0\NBR-pools.txt --amd Miners\xmr-stak-2.5.0\NBR-amd.txt --nvidia Miners\xmr-stak-2.5.0\NBR-nvidia.txt --cpu Miners\xmr-stak-2.5.0\NBR-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Bixbite
::
:BXB
DEL Miners\xmr-stak-2.5.0\BXB-pools.txt
DEL Miners\xmr-stak-2.5.0\BXB-cpu.txt
DEL Miners\xmr-stak-2.5.0\BXB-nvidia.txt
DEL Miners\xmr-stak-2.5.0\BXB-amd.txt
CLS
ECHO Bixbite (pool.bixbite.pro) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O pool.bixbite.pro:4444 -u %BXB% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_heavy --noUAC -c Miners\xmr-stak-2.5.0\BXB-config.txt -C Miners\xmr-stak-2.5.0\BXB-pools.txt --amd Miners\xmr-stak-2.5.0\BXB-amd.txt --nvidia Miners\xmr-stak-2.5.0\BXB-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BXB-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::======================================CRYPTONIGHT FAST======================================::
::
:: Masari
::
:MSR
DEL Miners\xmr-stak-2.5.0\MSR-pools.txt
DEL Miners\xmr-stak-2.5.0\MSR-cpu.txt
DEL Miners\xmr-stak-2.5.0\MSR-nvidia.txt
DEL Miners\xmr-stak-2.5.0\MSR-amd.txt
CLS
ECHO Masari (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o masari.ingest.cryptoknight.cc:7777 -u %MSR% -p %MINER_NAME% -r %MINER_NAME% --currency masari --noUAC -c Miners\xmr-stak-2.5.0\MSR-config.txt -C Miners\xmr-stak-2.5.0\MSR-pools.txt --amd Miners\xmr-stak-2.5.0\MSR-amd.txt --nvidia Miners\xmr-stak-2.5.0\MSR-nvidia.txt --cpu Miners\xmr-stak-2.5.0\MSR-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: PrivatePay
::
:XPP
DEL Miners\xmr-stak-2.5.0\XPP-pools.txt
DEL Miners\xmr-stak-2.5.0\XPP-cpu.txt
DEL Miners\xmr-stak-2.5.0\XPP-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XPP-amd.txt
CLS
ECHO PrivatePay (fairpool.pw, herominers.com) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o mine.xpp.fairpool.pw:6050 -u %XPP%+%MINER_NAME% -p x -r %MINER_NAME% --currency masari --noUAC -c Miners\xmr-stak-2.5.0\XPP-config.txt -C Miners\xmr-stak-2.5.0\XPP-pools.txt --amd Miners\xmr-stak-2.5.0\XPP-amd.txt --nvidia Miners\xmr-stak-2.5.0\XPP-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XPP-cpu.txt
::Miners\xmr-stak-2.5.0\xmr-stak -o privatepay.herominers.com:10331 -u %XPP% -p %MINER_NAME% -r %MINER_NAME% --currency masari --noUAC -c Miners\xmr-stak-2.5.0\XPP-config.txt -C Miners\xmr-stak-2.5.0\XPP-pools.txt --amd Miners\xmr-stak-2.5.0\XPP-amd.txt --nvidia Miners\xmr-stak-2.5.0\XPP-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XPP-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: KEPL
::
:KEPL
DEL Miners\xmr-stak-2.5.0\KEPL-pools.txt
DEL Miners\xmr-stak-2.5.0\KEPL-cpu.txt
DEL Miners\xmr-stak-2.5.0\KEPL-nvidia.txt
DEL Miners\xmr-stak-2.5.0\KEPL-amd.txt
CLS
ECHO KEPL (pool.kepl.org) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o pool.kepl.org:7777 -u %KEPL% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_masari --noUAC -c Miners\xmr-stak-2.5.0\KEPL-config.txt -C Miners\xmr-stak-2.5.0\KEPL-pools.txt --amd Miners\xmr-stak-2.5.0\KEPL-amd.txt --nvidia Miners\xmr-stak-2.5.0\KEPL-nvidia.txt --cpu Miners\xmr-stak-2.5.0\KEPL-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Electronero
::
:ETNX
DEL Miners\xmr-stak-2.5.0\ETNX-pools.txt
DEL Miners\xmr-stak-2.5.0\ETNX-cpu.txt
DEL Miners\xmr-stak-2.5.0\ETNX-nvidia.txt
DEL Miners\xmr-stak-2.5.0\ETNX-amd.txt
CLS
ECHO Electronero (etnx.thorshammer.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o mine-etnx.thorshammer.cc:4444 -u %ETNX% -p %MINER_NAME% -r %MINER_NAME% --currency masari --noUAC -c Miners\xmr-stak-2.5.0\ETNX-config.txt -C Miners\xmr-stak-2.5.0\ETNX-pools.txt --amd Miners\xmr-stak-2.5.0\ETNX-amd.txt --nvidia Miners\xmr-stak-2.5.0\ETNX-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ETNX-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=====================================CRYPTONIGHT CUSTOM=====================================::
::
:: Stellite Cash
::
:XTL
DEL Miners\xmr-stak-2.5.0\XTL-pools.txt
DEL Miners\xmr-stak-2.5.0\XTL-cpu.txt
DEL Miners\xmr-stak-2.5.0\XTL-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XTL-amd.txt
CLS
ECHO Stellite (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o stellite.ingest.cryptoknight.cc:16222 -u %XTL% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_v7_stellite --noUAC -c Miners\xmr-stak-2.5.0\XTL-config.txt -C Miners\xmr-stak-2.5.0\XTL-pools.txt --amd Miners\xmr-stak-2.5.0\XTL-amd.txt --nvidia Miners\xmr-stak-2.5.0\XTL-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XTL-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: BitTube
::
:TUBE
DEL Miners\xmr-stak-2.5.0\TUBE-pools.txt
DEL Miners\xmr-stak-2.5.0\TUBE-cpu.txt
DEL Miners\xmr-stak-2.5.0\TUBE-nvidia.txt
DEL Miners\xmr-stak-2.5.0\TUBE-amd.txt
CLS
ECHO BitTube (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o tube.ingest.cryptoknight.cc:5631 -u %TUBE% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_bittube2 --noUAC -c Miners\xmr-stak-2.5.0\TUBE-config.txt -C Miners\xmr-stak-2.5.0\TUBE-pools.txt --amd Miners\xmr-stak-2.5.0\TUBE-amd.txt --nvidia Miners\xmr-stak-2.5.0\TUBE-nvidia.txt --cpu Miners\xmr-stak-2.5.0\TUBE-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Arto
::
:RTO
DEL Miners\arto-miner-win64-v1.1.0\RTO-pools.txt
DEL Miners\arto-miner-win64-v1.1.0\RTO-cpu.txt
DEL Miners\arto-miner-win64-v1.1.0\RTO-nvidia.txt
DEL Miners\arto-miner-win64-v1.1.0\RTO-amd.txt
CLS
ECHO Arto (cryptoknight.cc) AMD/NVIDIA/CPU Arto-Miner 1.1.2
Miners\arto-miner-win64-v1.1.0\arto-miner -o arto.ingest.cryptoknight.cc:51202 -u %RTO% -p %MINER_NAME% -r %MINER_NAME% --noUAC -c Miners\arto-miner-win64-v1.1.0\RTO-config.txt -C Miners\arto-miner-win64-v1.1.0\RTO-pools.txt --amd Miners\arto-miner-win64-v1.1.0\RTO-amd.txt --nvidia Miners\arto-miner-win64-v1.1.0\RTO-nvidia.txt --cpu Miners\arto-miner-win64-v1.1.0\RTO-cpu.txt
::Miners\arto-miner-win64-v1.1.0\arto-miner -o arto.cryptoisme.com:5556 -u -p %MINER_NAME% -r %MINER_NAME% --noUAC -c Miners\arto-miner-win64-v1.1.0\RTO-config.txt -C Miners\arto-miner-win64-v1.1.0\RTO-pools.txt --amd Miners\arto-miner-win64-v1.1.0\RTO-amd.txt --nvidia Miners\arto-miner-win64-v1.1.0\RTO-nvidia.txt --cpu Miners\arto-miner-win64-v1.1.0\RTO-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Haven
::
:XHV
DEL Miners\xmr-stak-2.5.0\XHV-pools.txt
DEL Miners\xmr-stak-2.5.0\XHV-cpu.txt
DEL Miners\xmr-stak-2.5.0\XHV-nvidia.txt
DEL Miners\xmr-stak-2.5.0\XHV-amd.txt
CLS
ECHO Haven (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o haven.ingest.cryptoknight.cc:5832 -u %XHV% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_haven --noUAC -c Miners\xmr-stak-2.5.0\XHV-config.txt -C Miners\xmr-stak-2.5.0\XHV-pools.txt --amd Miners\xmr-stak-2.5.0\XHV-amd.txt --nvidia Miners\xmr-stak-2.5.0\XHV-nvidia.txt --cpu Miners\xmr-stak-2.5.0\XHV-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Italocoin
::
:ITA
DEL Miners\xmr-stak-2.5.0\ITA-pools.txt
DEL Miners\xmr-stak-2.5.0\ITA-cpu.txt
DEL Miners\xmr-stak-2.5.0\ITA-nvidia.txt
DEL Miners\xmr-stak-2.5.0\ITA-amd.txt
CLS
ECHO Italocoin (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -o italo.ingest.cryptoknight.cc:50702 -u %ITA% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_haven --noUAC -c Miners\xmr-stak-2.5.0\ITA-config.txt -C Miners\xmr-stak-2.5.0\ITA-pools.txt --amd Miners\xmr-stak-2.5.0\ITA-amd.txt --nvidia Miners\xmr-stak-2.5.0\ITA-nvidia.txt --cpu Miners\xmr-stak-2.5.0\ITA-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: BLOC.money
::
:BLOC
DEL Miners\xmr-stak-2.5.0\BLOC-pools.txt
DEL Miners\xmr-stak-2.5.0\BLOC-cpu.txt
DEL Miners\xmr-stak-2.5.0\BLOC-nvidia.txt
DEL Miners\xmr-stak-2.5.0\BLOC-amd.txt
CLS
ECHO BLOC.money (herominers.com) AMD/NVIDIA/CPU XMR-Stak 2.5.0
Miners\xmr-stak-2.5.0\xmr-stak -O bloc.herominers.com:11249 -u %BLOC% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_haven --noUAC -c Miners\xmr-stak-2.5.0\BLOC-config.txt -C Miners\xmr-stak-2.5.0\BLOC-pools.txt --amd Miners\xmr-stak-2.5.0\BLOC-amd.txt --nvidia Miners\xmr-stak-2.5.0\BLOC-nvidia.txt --cpu Miners\xmr-stak-2.5.0\BLOC-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Alloy
::
:XAO
DEL Miners\xmr_stak_alloy_2.4.5_Win64\XAO-pools.txt
DEL Miners\xmr_stak_alloy_2.4.5_Win64\XAO-cpu.txt
DEL Miners\xmr_stak_alloy_2.4.5_Win64\XAO-nvidia.txt
DEL Miners\xmr_stak_alloy_2.4.5_Win64\XAO-amd.txt
CLS
ECHO Alloy (cryptoknight.cc) AMD/NVIDIA/CPU XMR-Stak-Alloy 2.4.5
Miners\xmr_stak_alloy_2.4.5_Win64\xmr-stak -o alloy.ingest.cryptoknight.cc:5662 -u %XAO% -p %MINER_NAME% -r %MINER_NAME% --currency cryptonight_alloy --noNVIDIA --noUAC -c Miners\xmr_stak_alloy_2.4.5_Win64\XAO-config.txt -C Miners\xmr_stak_alloy_2.4.5_Win64\XAO-pools.txt --amd Miners\xmr_stak_alloy_2.4.5_Win64\XAO-amd.txt --nvidia Miners\xmr_stak_alloy_2.4.5_Win64\XAO-nvidia.txt --cpu Miners\xmr_stak_alloy_2.4.5_Win64\XAO-cpu.txt
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::============================================X16R============================================::
::
:: RavenCoin
::
:RVN1
ECHO RavenCoin (ravenminer.com, suprnova.cc) AMD Avermore 1.4.1
CD Miners\avermore-v1.4.1-windows
sgminer -o us.ravenminer.com:4567 -u %RVN% -p %MINER_NAME% -k x16r --no-submit-stale --donate 1
::sgminer -o rvn.suprnova.cc:6667 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% -k x16r --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:RVN2
ECHO RavenCoin (ravenminer.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a x16r -o stratum+tcp://us.ravenminer.com:4567 -u %RVN% -p %WORKER_PASSWORD% -i %I% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::============================================X16S============================================::
::
:: Pigeoncoin
::
:PGN1
ECHO Pigeoncoin (blockcruncher.com) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o blockcruncher.com:3636 -u %PGN% -p %MINER_NAME% -k x16s --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:PGN2
ECHO Pigeoncoin (blockcruncher.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a x16s -o stratum+tcp://blockcruncher.com:3636 -u %PGN% -p %WORKER_PASSWORD% -i %I% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::==========================================LYRA2REV2=========================================::
::
:: Vertcoin
::
:VTC1
ECHO Vertcoin (suprnova.cc, miningpoolhub.com) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o vtc.suprnova.cc:5678 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% -k lyra2rev2 --no-submit-stale --donate 1
::sgminer -o hub.miningpoolhub.com:20507 -u %MINER_WEBLOGIN%.%MINER_NAME% -p x -k lyra2rev2 --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:VTC2
ECHO Vertcoin (miningpoolhub.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a Lyra2rev2 -o stratum+tcp://hub.miningpoolhub.com:20507 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% -i %I% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: MonaCoin
::
:MONA1
ECHO MonaCoin (miningpoolhub.com) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o hub.miningpoolhub.com:20593 -u %MINER_WEBLOGIN%.%MINER_NAME% -p x -k lyra2rev2 --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:MONA2
ECHO MonaCoin (Miningpoolhub.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a Lyra2rev2 -o stratum+tcp://hub.miningpoolhub.com:20593 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% -i %I% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Hanacoin
::
:HANA1
ECHO Hanacoin (hanacoin.com, weekendpool.net, gpuhot.com) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o pool-node.hanacoin.com:3032 -u %HANA% -p c=HANA -k lyra2rev2 --no-submit-stale --donate 1
::sgminer -o weekendpool.net:4533 -u %HANA% -p c=HANA -k lyra2rev2 --no-submit-stale --donate 1
::sgminer -o gpuhot.com:4533 -u %HANA% -p c=HANA -k lyra2rev2 --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:HANA2
ECHO Hanacoin (hanacoin.com, weekendpool.net, gpuhot.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a Lyra2rev2 -o stratum+tcp://pool-node.hanacoin.com:3032 -u %HANA% -p c=HANA --donate=1
::Miners\nevermore-v0.2.3-win64\ccminer -a Lyra2rev2 -o stratum+tcp://weekendpool.net:4533 -u %HANA% -p c=HANA --donate=1
::Miners\nevermore-v0.2.3-win64\ccminer -a Lyra2rev2 -o stratum+tcp://gpuhot.com:4533 -u %HANA% -p c=HANA --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Verge
::
:XVG1
ECHO Verge (zergpool.com) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o lyra2v2.mine.zergpool.com:4533 -u %XVG% -p c=XVG,mc=XVG -k lyra2rev2 --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:XVG2
ECHO Verge (zergpool.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a Lyra2rev2 -o stratum+tcp://lyra2v2.mine.zergpool.com:4533 -u %XVG% -p c=XVG,mc=XVG --donate=1
::Miners\nevermore-v0.2.3-win64\ccminer -a Lyra2rev2 -o stratum+tcp://xvg-lyra.suprnova.cc:2596 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::===========================================LYRA2Z==========================================::
::
:: Zcoin
::
:XZC1
ECHO Zcoin (miningpoolhub.com) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o us-east.lyra2z-hub.miningpoolhub.com:20581 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% -k lyra2z --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:XZC2
ECHO Zcoin (miningpoolhub.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a lyra2z -o stratum+tcp://us-east.lyra2z-hub.miningpoolhub.com:20581 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% -i %I% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: GINcoin
::
:GIN1
ECHO GINcoin (zergpool.com) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o lyra2z.mine.zergpool.com:4553 -u %GIN% -p c=GIN,mc=GIN -k lyra2z --no-submit-stale --donate 1
::sgminer -o us.bsod.pw:2159 -u %GIN%.%MINER_NAME% -p C=gin -R 5
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:GIN2
ECHO GINcoin (zergpool.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -o stratum+tcp://lyra2z.mine.zergpool.com:4553 -u %GIN% -p c=GIN,mc=GIN -a lyra2z -i %I% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::
:: Vertical Coin
::
:VTL1
ECHO Vertical Coin (zergpool.com) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o lyra2z.mine.zergpool.com:4553 -u %VTL% -p c=VTL,mc=VTL -k lyra2z --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:VTL2
ECHO Vertical Coin (zergpool.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -o stratum+tcp://lyra2z.mine.zergpool.com:4553 -u %VTL% -p c=VTL,mc=VTL -a lyra2z -i %I% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=========================================NEOSCRYPT==========================================::
::
:: Feathercoin
::
:FTC1
ECHO Feathercoin (miningpoolhub.com, coinotron.com) AMD Claymore NeoScrypt GPU Miner 1.2
Miners\Claymore_NeoScrypt_AMD_GPU_Miner_v1.2\NeoScryptMiner -pool hub.miningpoolhub.com:20510 -wal %MINER_WEBLOGIN%.%MINER_NAME% -psw x
::cd Miners\sgminer-x16r
::sgminer -k neoscrypt -o hub.miningpoolhub.com:20510 -u %MINER_WEBLOGIN%.%MINER_NAME% -p x
::sgminer -o coinotron.com:3337 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% -k neoscrypt --no-submit-stale
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:FTC2
ECHO Feathercoin (miningpoolhub.com) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a neoscrypt -o stratum+tcp://hub.miningpoolhub.com:20510 -u %MINER_WEBLOGIN%.%MINER_NAME% -p x --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=======================================MYRIAD-GROESTL=======================================::
::
:: Digibyte
::
:DGB1
ECHO Digibyte (suprnova.cc) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o dgbg.suprnova.cc:7978 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% -I %I% -k myriadcoin-groestl --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:DGB2
ECHO Digibyte (suprnova.cc) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a myr-gr -o stratum+tcp://dgbg.suprnova.cc:7978 -u %MINER_WEBLOGIN%.%MINER_NAME% -p %WORKER_PASSWORD% --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::===========================================SHA224===========================================::
::
:: Bismuth
::
:BIS
ECHO Bismuth (eggpool.net) AMD/NVIDIA EggPool GPU Miner
cd Miners\EggMinerGpuWin3012
EggMinerGpuWin3 -a %BIS% -n %MINER_NAME% -v
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::===========================================QUARK============================================::
::
:: Alqo
::
:ALQO1
ECHO Alqo (pool.alqo.org) AMD Avermore 1.4.1
cd Miners\avermore-v1.4.1-windows
sgminer -o us.mining.alqo.org:4033 -u %ALQO% -p x -k quarkcoin --no-submit-stale --donate 1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
:ALQO2
ECHO Alqo (pool.alqo.org) NVIDIA Nevermore 0.2.3
Miners\nevermore-v0.2.3-win64\ccminer -a quark -o stratum+tcp://mining.alqo.org:4033 -u %ALQO% -p x --donate=1
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE
::=========================================WILD KECCAK========================================::
::
:: Purk
::
:PURK
ECHO Purk (Purkproject.com, fairpool.pw) AMD/NVIDIA/GPU Miner 1.0.3
cd Miners\cpuminer-multi-opencl
::minerd -o pool.purkproject.com:5555 -u %PURK% -p x -a wildkeccak_ocl -k http://pool.purkproject.com/scratchpad.bin -l scratchpad.bin
minerd -o mine.purk.fairpool.pw:2244 -u %PURK% -p x -a wildkeccak_ocl -i 15 -k http://purk.fairpool.xyz/static/scratchpad.bin -l scratchpad.bin
IF %ERRORLEVEL% NEQ 0 GOTO exit
PAUSE

:EOF
