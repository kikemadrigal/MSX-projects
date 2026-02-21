10 'Inicialize screen-Inicializamos pantalla'
20 COLOR 15,1,1:SCREEN 5,2,0: OPEN"grp:"AS#1
30 preset (0,70):print #1,"   MSX Murcia presents:"
40 preset (0,80):print #1,"   Merry Christmas 2020"
50 preset (0,90):print #1,"   Loading music and graphics"
60 preset (0,100):print #1,"   Trabajo artesanal"
70 preset (0,110):print #1,"   Wait, craft work... "
80 preset (0,120):print #1,"   Free: "fre(0)
100 gosub 10000
110 'Pintamos con el mapa los tiles en la página 0 (la que se ve)-We paint with the map the tiles on page 0'
120 gosub 20000
130 'Definimos los sprites-We define the sprites'
140 gosub 22000
150 'Song definition'
160 gosub 500
170 'Interval definition
180 on interval=500 gosub 500:interval on
200 COLOR 15,0:PRESET(17,23),,TPSET:PRINT#1,"MURCIA"
210 COLOR 8,0:PRESET(17,24),,TPSET:PRINT#1,"MURCIA"
220 COLOR 15,0:PRESET(0,40),,TPSET:PRINT#1,"WISHES YOU"
230 COLOR 8,0:PRESET(0,41),,TPSET:PRINT#1,"WISHES YOU"
240 COLOR 15,0:PRESET(20,60),,TPSET:PRINT#1,"MERRY"
250 COLOR 8,0:PRESET(20,61),,TPSET:PRINT#1,"MERRY"
260 COLOR 15,0:PRESET(0,80),,TPSET:PRINT#1,"CHRISTMAS!!"
270 COLOR 8,0:PRESET(0,81),,TPSET:PRINT#1,"CHRISTMAS!"
300 H=0:J=0:K=0:L=0:V1=4:V2=6:V3=3:V4=5:H1=30:J1=80:K1=160:L1=220:M=0:M1=15:'INTERVALON
    310 PUT SPRITE 0,(H1,H),15,0:H=H+V1:IF H>190 THEN H1=RND(1)*50+50:H=0:PUT SPRITE 0,(1,215):COLOR=(14,5,5,0):COLOR=(2,7,0,0)
    320 PUT SPRITE 1,(J1,J),15,0:J=J+V2:IF J>190 THEN J1=RND(1)*30+120:J=0:PUT SPRITE 1,(1,215):COLOR=(14,0,6,6):COLOR=(2,0,0,7)
    330 PUT SPRITE 2,(K1,K),15,0:K=K+V3:IF K>190 THEN K1=RND(1)*30+160:K=0:PUT SPRITE 2,(1,215):COLOR=(14,6,0,0):COLOR=(2,7,7,0)
    340 PUT SPRITE 3,(L1,L),15,0:L=L+V4:IF L>190 THEN L1=RND(1)*30+200:L=0:PUT SPRITE 3,(1,215):COLOR=(14,7,7,7):COLOR=(2,0,7,0)
    350 PUT SPRITE 4,(M1,M),15,0:M=M+V3:IF M>190 THEN M1=RND(1)*30+10:M=0:PUT SPRITE 4,(1,215):COLOR=(2,7,0,0)
    360 'COLOR=(2,RND(1)*7,RND(1)*7,RND(1)*7)
    370 'COLOR=(10,RND(1)*7,RND(1)*7,RND(1)*7)
    400 rem 'update words, son los sprites 5,6,7,8 y 9'
    410 x=x+8:if x>256 then x=0:y=rnd(1)*50:x=0
    420 for i=5 to 9
        430 put sprite i,(x+16*i,y),,i
    440 next i
490 GOTO 310
500 'Song on array block'
    505 restore 555
    510 c$(0)=""
    515 FOR I=1 TO 4
    520 READ a$:c$(0)=c$(0)+a$
    525 NEXT I
    530 PLAY "xc$(0);"
    555 DATA "t250eere"
    560 DATA "eeregcde"
    565 DATA "erffeere"
    570 DATA "eddedrgr"
585 return
10000 rem draw tiles rutine-rutina pintar tiles in page 1
    10010 SETPAGE 0,1:COLOR 15,1,1:COLOR=(12,0,3,0):COLOR=(11,5,3,0):COLOR=(3,0,0,1):COLOR=(7,0,2,7)
    10015 '� REGALO
    10020 DIMB$(16)
    10030 B$(0)=  "ccc66ccccc66cccc"
    10040 B$(1)=  "cc6cc6ccc6cc6ccc"
    10050 B$(2)=  "cc6ccc6c6ccc6ccc"
    10060 B$(3)=  "ccc6cc66cc66cccc"
    10070 B$(4)=  "ccccc66666cccccc"
    10080 B$(5)=  "ccffff666ffffccc"
    10090 B$(6)=  "ccafaf666afffccc"
    10100 B$(7)= "ccffff666ffafccc"
    10110 B$(8)= "ccfaff666ffffccc"
    10120 B$(9)= "cc66666666666ccc"
    10130 B$(10)="cc66666666666ccc"
    10140 B$(11)="cc66666666666ccc"
    10150 B$(12)="ccffaf666ffafccc"
    10160 B$(13)="ccffff666ffffccc"
    10170 B$(14)="ccfaff666affaccc"
    10180 B$(15)="ccffff666ffffccc"
    10199 FORI=0TO15:FORJ=0TO15
    10200 C=VAL("&H"+MID$(B$(I),J+1,1))
    10210 PSET(J+T,I),C:NEXT:NEXT:ERASEB$
    10290 '� BOLA ADORNO ROJA
    10300 DIMB$(16)
    10310 B$(0)= "cccccccccccccccc"
    10320 B$(1)= "cccccc2cccccc2cc"
    10330 B$(2)= "cceccccccccccccc"
    10340 B$(3)= "cccccccccccecccc"
    10350 B$(4)= "ccccccaaaccccccc"
    10360 B$(5)= "ccccc66666cccccc"
    10370 B$(6)= "ccc666669966cccc"
    10380 B$(7)= "6c66666669966ccc"
    10390 B$(8)= "cc66666666996cec"
    10400 B$(9)= "cc66666666996ccc"
    10410 B$(10)="cc66666666666ccc"
    10420 B$(11)="ccc666666666cccc"
    10430 B$(12)="ccc666666666cccc"
    10440 B$(13)="c2ccc66666ccc6cc"
    10450 B$(14)="cccccccccccccccc"
    10460 B$(15)="ccccccccccccccc2"
    10465 FORI=0TO15:FORJ=0TO15
    10470 C=VAL("&H"+MID$(B$(I),J+1,1))
    10480 PSET(J+16,I),C:NEXT:NEXT:ERASEB$
    10490 '� BOLA ADORNO AZUL
    10500 DIMB$(16)
    10510 B$(0)= "cccccccccccccccc"
    10520 B$(1)= "cccccc2ccccccc2c"
    10530 B$(2)= "cceccccccccccccc"
    10540 B$(3)= "ccccccccccc2cccc"
    10550 B$(4)= "ccccccaaaccccccc"
    10560 B$(5)= "ccccc44444cccccc"
    10570 B$(6)= "ccc444445544cccc"
    10580 B$(7)= "cc44444445544ccc"
    10590 B$(8)= "cc44444444554ccc"
    10600 B$(9)= "cc44444444554ccc"
    10610 B$(10)="cc44444444444ccc"
    10620 B$(11)="ccc444444444ccec"
    10630 B$(12)="ccc444444444cccc"
    10640 B$(13)="ceccc44444cccccc"
    10650 B$(14)="ccccccccccccc2cc"
    10660 B$(15)="cccacccccccccccc"
    10665 FORI=0TO15:FORJ=0TO15
    10670 C=VAL("&H"+MID$(B$(I),J+1,1))
    10680 PSET(J+32,I),C:NEXT:NEXT:ERASEB$
    10690 '� BOLA ADORNO DORADA
    10700 DIMB$(16)
    10710 B$(0)= "cccccccccccccccc"
    10720 B$(1)= "cccccccceccccccc"
    10730 B$(2)= "ccacc6cccccccccc"
    10740 B$(3)= "cccccccccccc2ccc"
    10750 B$(4)= "ccccccaaaccccccc"
    10760 B$(5)= "cccccbbbbbcccc2c"
    10770 B$(6)= "cccbbbbbffbbcccc"
    10780 B$(7)= "ccbbbbbbbffbbccc"
    10790 B$(8)= "ccbbbbbbbbffbccc"
    10800 B$(9)= "ccbbbbbbbbffbccc"
    10810 B$(10)="ccbbbbbbbbbbbccc"
    10820 B$(11)="2ccbbbbbbbbbcc6c"
    10830 B$(12)="cccbbbbbbbbbcccc"
    10840 B$(13)="cccccbbbbbccccec"
    10850 B$(14)="cccccccccccccccc"
    10860 B$(15)="cceccccccccccccc"
    10865 FORI=0TO15:FORJ=0TO15
    10870 C=VAL("&H"+MID$(B$(I),J+1,1))
    10880 PSET(J+48,I),C:NEXT:NEXT:ERASEB$
    10890 '� BASTON
    10900 DIMB$(16)
    10905 B$(0)= "ccc6ff66ccccccca"
    10910 B$(1)= "ccf66ff66ccccccc"
    10915 B$(2)= "c6ffccff6cc2cccc"
    10920 B$(3)= "c66fcc6ffcccccec"
    10925 B$(4)= "cccccc66fccccccc"
    10930 B$(5)= "ccc2ccf66ccccccc"
    10935 B$(6)= "ccccccff6cc2cccc"
    10940 B$(7)= "c2cccc6ffccccccc"
    10945 B$(8)= "cccccc66fccccccc"
    10950 B$(9)= "ccecccf66ccccc2c"
    10955 B$(10)="ccccccff6ccccccc"
    10960 B$(11)="cccccc6ffccccccc"
    10965 B$(12)="ccc6cc66fccccccc"
    10970 B$(13)="ccccccf66ccceccc"
    10975 B$(14)="cceccccccccccccc"
    10980 B$(15)="cccccccccccccccc"
    10985 FORI=0TO15:FORJ=0TO15
    10990 C=VAL("&H"+MID$(B$(I),J+1,1))
    10995 PSET(J+64,I),C:NEXT:NEXT:ERASEB$
    10997 '� CAMPANA
    11000 DIMB$(16)
    11010 B$(0)= "cccccccccccccccc"
    11020 B$(1)= "cccccccaccc2cccc"
    11030 B$(2)= "ceccccacaccccccc"
    11040 B$(3)= "cccccaaaaacccccc"
    11050 B$(4)= "ccccaaaaaaaccecc"
    11060 B$(5)= "c2ccbbaaabbccccc"
    11070 B$(6)= "ccccbabbbabccccc"
    11080 B$(7)= "ccccbbbabbbccc6c"
    11090 B$(8)= "ccccaabbbaaccccc"
    11100 B$(9)= "cccaaaaaaaaacccc"
    11110 B$(10)="ccaaaaaaaaaaaccc"
    11120 B$(11)="ccaaaaaaaaaaaccc"
    11130 B$(12)="fccccccacccccccc"
    11140 B$(13)="cccccccccccccccc"
    11150 B$(14)="cceccc2cccccc2cc"
    11160 B$(15)="cccccccccccccccc"
    11170 FORI=0TO15:FORJ=0TO15
    11180 C=VAL("&H"+MID$(B$(I),J+1,1))
    11190 PSET(J+80,I),C:NEXT:NEXT:ERASEB$
    11199 '� ESTRELLA
    11200 DIMB$(16)
    11210 B$(0)= "cccccccccccccccc"
    11220 B$(1)= "ccccceccaccccc2c"
    11230 B$(2)= "ccccccccaccccccc"
    11240 B$(3)= "ccecccccaccccccc"
    11250 B$(4)= "ccccc2caaacecccc"
    11260 B$(5)= "cccccccaaacccccc"
    11270 B$(6)= "caaaaaaaaaaaaaac"
    11280 B$(7)= "ccccaaaaaaaacccc"
    11290 B$(8)= "ccccccaaaacccccc"
    11300 B$(9)= "c2cccaaaaaaccecc"
    11310 B$(10)="ccccaaaccaaacccc"
    11320 B$(11)="cccaaccccccaacc2"
    11330 B$(12)="2caccccccccccacc"
    11340 B$(13)="cccccccccccccccc"
    11350 B$(14)="cccccccecc2ccccc"
    11360 B$(15)="ccfccccccccccccc"
    11370 FORI=0TO15:FORJ=0TO15
    11380 C=VAL("&H"+MID$(B$(I),J+1,1))
    11390 PSET(J+96,I),C:NEXT:NEXT:ERASEB$
    11400 DIMB$(16)
    11410 B$(0)= "333333333333333f"
    11420 B$(1)= "33333333373333ff"
    11430 B$(2)= "337333333333ffcc"
    11440 B$(3)= "3333333333ffca00"
    11450 B$(4)= "333337333f0000cc"
    11460 B$(5)= "333333333fcccccc"
    11470 B$(6)= "33333e33ffc2cccc"
    11480 B$(7)= "3333eeec0ccccc00"
    11490 B$(8)= "33333eccc00000cc"
    11500 B$(9)= "3333ffcccccccccc"
    11510 B$(10)="3733fccecccccccc"
    11520 B$(11)="333f0ccccccc00cc"
    11530 B$(12)="333fc0cccc00cccc"
    11540 B$(13)="33ffcc0000cccccc"
    11550 B$(14)="3ff6cccccccccecc"
    11560 B$(15)="fcccccccc2cccccc"
    11570 FORI=0TO15:FORJ=0TO15
    11580 C=VAL("&H"+MID$(B$(I),J+1,1))
    11590 PSET(J+112,I),C:NEXT:NEXT:ERASEB$
    11600 DIMB$(16)
    11610 B$(0)= "f333333333733333"
    11620 B$(1)= "cf33373333333333"
    11630 B$(2)= "ccff333333333733"
    11640 B$(3)= "0ccc0f3333333333"
    11650 B$(4)= "c000cff337333333"
    11660 B$(5)= "ccccccf333333333"
    11670 B$(6)= "cccecff333333333"
    11680 B$(7)= "0cccc6cc333e3333"
    11690 B$(8)= "c00cccc0ffeee337"
    11700 B$(9)= "ccc0000cccce3333"
    11710 B$(10)="c0cccccc0ccf3333"
    11720 B$(11)="cc2ccccccfcf3373"
    11730 B$(12)="c0cc000cccc0f333"
    11740 B$(13)="ccccccc0000cff33"
    11750 B$(14)="ccecccccccccccf3"
    11760 B$(15)="ccccc6ccccccecff"
    11770 FORI=0TO15:FORJ=0TO15
    11780 C=VAL("&H"+MID$(B$(I),J+1,1))
    11790 PSET(J+128,I),C:NEXT:NEXT:ERASEB$
    11800 DIMB$(16)
    11810 B$(0)= "cccccccccccceccc"
    11820 B$(1)= "ccccecc2ccccccac"
    11830 B$(2)= "cccccccccccccccc"
    11840 B$(3)= "cc6ccccecceccccc"
    11850 B$(4)= "cccccccccccccccc"
    11860 B$(5)= "2cccccccccccccc2"
    11870 B$(6)= "c22cc2ccecccc22c"
    11880 B$(7)= "ccc22cccccc22ccc"
    11890 B$(8)= "cc6cc22cc22ccccc"
    11900 B$(9)= "ccccccc22ccccecc"
    11910 B$(10)="cacccccccccccccc"
    11920 B$(11)="ccccccaccecccccc"
    11930 B$(12)="cccccccccccccccc"
    11940 B$(13)="cc6ccccccccceccc"
    11950 B$(14)="cccccccccccccccc"
    11960 B$(15)="ccceccc6cccccccc"
    11970 FORI=0TO15:FORJ=0TO15
    11980 C=VAL("&H"+MID$(B$(I),J+1,1))
    11990 PSET(J+144,I),C:NEXT:NEXT:ERASEB$
    12000 DIMB$(16)
    12010 B$(0)= "cccccccccccccccc"
    12020 B$(1)= "ccccfccccccccccc"
    12030 B$(2)= "fccfffccccffcccf"
    12040 B$(3)= "fcfffffccffffcff"
    12050 B$(4)= "fffffffcffffffff"
    12060 B$(5)= "ffffffffffffffff"
    12070 B$(6)= "ffcccffffffccfff"
    12080 B$(7)= "fcccccffcccccfff"
    12090 B$(8)= "ffccffffffcfccff"
    12100 B$(9)= "ffffffffccffffff"
    12110 B$(10)="fcccfffcccccffff"
    12120 B$(11)="ffffffffffffffff"
    12130 B$(12)="fffccfffffccccff"
    12140 B$(13)="ffcccffccfffccff"
    12150 B$(14)="ffffffccccffffff"
    12160 B$(15)="ffffffffffffffff"
    12170 FORI=0TO15:FORJ=0TO15
    12180 C=VAL("&H"+MID$(B$(I),J+1,1))
    12190 PSET(J+160,I),C:NEXT:NEXT:ERASEB$
    12200 DIMB$(16)
    12210 B$(0)= "3333333733333333"
    12220 B$(1)= "3373333333333333"
    12230 B$(2)= "3333333333333337"
    12240 B$(3)= "3333333333333333"
    12250 B$(4)= "3333333333333333"
    12260 B$(5)= "3733333337333333"
    12270 B$(6)= "3333333333333333"
    12280 B$(7)= "4444444444444444"
    12290 B$(8)= "f444f44fff44444f"
    12300 B$(9)= "ff4ff4f444f444f4"
    12310 B$(10)="ff4ff4f4444f4f44"
    12320 B$(11)="f4f4f44f4444f444"
    12330 B$(12)="f4f4f444f44f4f44"
    12340 B$(13)="f4f4f444f4f444f4"
    12350 B$(14)="f444ffff4f44444f"
    12360 B$(15)="4444444444444444"
    12370 FORI=0TO15:FORJ=0TO15
    12380 C=VAL("&H"+MID$(B$(I),J+1,1))
    12390 PSET(J+176,I),C:NEXT:NEXT:ERASEB$
    12400 DIMB$(16)
    12410 B$(0)= "ffffcfcfcffccfcc"
    12420 B$(1)= "fffcfcccfcffcccf"
    12430 B$(2)= "fffffcccffffffff"
    12440 B$(3)= "fffcffffffffffff"
    12450 B$(4)= "ffccccffffffffff"
    12460 B$(5)= "fffccfffffcfffff"
    12470 B$(6)= "fffffffffcccffff"
    12480 B$(7)= "ffffffffffffffff"
    12490 B$(8)= "fffccfffffffffff"
    12500 B$(9)= "ffffcfffffffffff"
    12510 B$(10)="ffffffffffffffff"
    12520 B$(11)="ffcccffffffccfff"
    12530 B$(12)="fcccffccffcccccf"
    12540 B$(13)="ffcffccccffccfff"
    12550 B$(14)="ffffffffffffffff"
    12560 B$(15)="fffffffffffffcff"
    12570 FORI=0TO15:FORJ=0TO15
    12580 C=VAL("&H"+MID$(B$(I),J+1,1))
    12590 PSET(J+192,I),C:NEXT:NEXT:ERASEB$
    12600 DIMB$(16)
    12610 B$(0)= "3333333333333337"
    12620 B$(1)= "3333333337333333"
    12630 B$(2)= "3373333333333333"
    12640 B$(3)= "3333333333333333"
    12650 B$(4)= "3333333333333733"
    12660 B$(5)= "3333733333333333"
    12670 B$(6)= "3333333333333333"
    12680 B$(7)= "3733333337333333"
    12690 B$(8)= "3333333333333333"
    12700 B$(9)= "3333333333333333"
    12710 B$(10)="3333333733333733"
    12720 B$(11)="7333333333333333"
    12730 B$(12)="3333333333333333"
    12740 B$(13)="3373333333333337"
    12750 B$(14)="3333333333337333"
    12760 B$(15)="3333337333333333"
    12770 FORI=0TO15:FORJ=0TO15
    12780 C=VAL("&H"+MID$(B$(I),J+1,1))
    12790 PSET(J+208,I),C:NEXT:NEXT:ERASEB$
    12800 DIMB$(16)
    12810 B$(0)= "333333733aaaaaaa"
    12820 B$(1)= "333333333aaaaaaa"
    12830 B$(2)= "333333333aaaaaa3"
    12840 B$(3)= "333333333aaaaaa3"
    12850 B$(4)= "373333333aaaaaa3"
    12860 B$(5)= "33333333aaaaaaa3"
    12870 B$(6)= "33333333aaa0aaa3"
    12880 B$(7)= "33333333aaa0aaa3"
    12890 B$(8)= "3333333aaa0aaa33"
    12900 B$(9)= "333333aaa0aaaa33"
    12910 B$(10)="337333000aaaa333"
    12920 B$(11)="33333aaaaaaa3333"
    12930 B$(12)="3333aaaaaaa33333"
    12940 B$(13)="3333aaaaaaa37333"
    12950 B$(14)="333aaaaaa3333333"
    12960 B$(15)="33aaaa3333333337"
    12970 FORI=0TO15:FORJ=0TO15
    12980 C=VAL("&H"+MID$(B$(I),J+1,1))
    12990 PSET(J+224,I),C:NEXT:NEXT:ERASEB$
    13000 DIMB$(16)
    13010 B$(0)= "3333337666633333"
    13020 B$(1)= "3333366660663333"
    13030 B$(2)= "3333666306666333"
    13040 B$(3)= "3336663366666333"
    13050 B$(4)= "3ff6633666666633"
    13060 B$(5)= "ffff333666666633"
    13070 B$(6)= "ffff336666666633"
    13080 B$(7)= "3ff3336666666663"
    13090 B$(8)= "33333ffffffffff3"
    13100 B$(9)= "33333ffffffffff3"
    13110 B$(10)="337333aaaaaaaaa3"
    13120 B$(11)="3333333aa000aaa3"
    13130 B$(12)="3333333a0aaaaaa3"
    13140 B$(13)="3333333aaaaaaaa3"
    13150 B$(14)="33337333aaaaaaaa"
    13160 B$(15)="33333333aaaaaaaa"
    13170 FOR I=0 TO 15:FOR J=0 TO 15
    13180 C=VAL("&H"+MID$(B$(I),J+1,1))
    13190 PSET(J+240,I),C:NEXT:NEXT:ERASE B$
13200 RETURN
20000' Rutina pintar tiles en página 0
    20002 SETPAGE 0,0
    20010 RESTORE 21000:FOR B=0 TO 12:FOR A=0 TO 15:READ T
    20020 ON T GOSUB 20050,20052,20054,20056,20058,20060,20062,20064,20066,20068,20070,20072,20074,20076,20078,20080,20082:NEXT:NEXT
    20050 COPY(112,0)-(127,15),1TO(A*16,B*16):RETURN:'� arbol izq
    20052 COPY(128,0)-(143,15),1TO(A*16,B*16):RETURN:'� arbol derch
    20054 COPY(144,0)-(159,15),1TO(A*16,B*16):RETURN:'� centro arbol
    20056 COPY(0,16)-(15,31),1TO(A*16,B*16):RETURN:'� hueco negro
    20058 COPY(16,0)-(31,15),1TO(A*16,B*16):RETURN:'� BOLA ROJA
    20060 COPY(32,0)-(47,15),1TO(A*16,B*16):RETURN:'� BOLA AZUL
    20062 COPY(48,0)-(63,15),1TO(A*16,B*16):RETURN:'� BOLA DORADA
    20064 COPY(64,0)-(79,15),1TO(A*16,B*16):RETURN:'� BASTON
    20066 COPY(80,0)-(95,15),1TO(A*16,B*16):RETURN:'� CAMPANA
    20068 COPY(96,0)-(111,15),1TO(A*16,B*16):RETURN:'� ESTRELLA
    20070 COPY(0,0)-(15,15),1TO(A*16,B*16):RETURN:'� REGALO
    20072 COPY(160,0)-(175,15),1TO(A*16,B*16):RETURN:'� BAJOS ARBOL
    20074 COPY(176,0)-(191,15),1TO(A*16,B*16):RETURN:'� LOGO
    20076 COPY(192,0)-(207,15),1TO(A*16,B*16):RETURN:'� SUELO ARBOL
    20078 COPY(208,0)-(223,15),1TO(A*16,B*16):RETURN:'� CIELO ESTRELLADO
    20080 COPY(224,0)-(239,15),1TO(A*16,B*16):RETURN:'� LUNA Abajo
    20082 COPY(240,0)-(255,15),1TO(A*16,B*16):RETURN:'� LUNA ARRIBA
    21000 DATA 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
    21001 DATA 13,15,15,15,15,15,15,15,15,15,15,15,15,17,15,15
    21002 DATA 15,15,15,15,15,15,15,1,2,15,15,15,15,16,15,15
    21003 DATA 15,15,15,15,15,15,1,11,3,2,15,15,15,15,15,15
    21004 DATA 15,15,15,15,15,1,6,3,7,3,2,15,15,15,15,15
    21005 DATA 15,15,15,15,15,10,3,3,5,3,10,15,15,15,15,15
    21006 DATA 15,15,15,15,1,3,3,6,3,8,3,2,15,15,15,15
    21007 DATA 15,15,15,15,9,8,3,5,3,3,6,9,15,15,15,15
    21008 DATA 15,15,15,1,3,3,10,11,3,7,3,3,2,15,15,15
    21009 DATA 15,15,15,7,3,9,3,6,3,5,3,10,3,15,15,15
    21010 DATA 15,15,1,5,3,11,3,8,3,3,7,3,5,2,15,15
    21011 DATA 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
    21012 DATA 15,15,15,15,15,15,15,15,15,15,15,15,15,15,15,15
    21100 DRAW"c13bm120,176r15df2rdlg2d2fdgdf3l20e3uh2lure2u2hueu":PAINT(125,180),13:COLOR=(13,3,1,1)
21110 return
    22000 RESTORE 22100
    22010 FOR G=0 TO 1
        22020 FOR I=0 TO 15
        22030 READ S$(G)
        22040 F$(G)=F$(G)+CHR$(VAL("&b"+LEFT$(S$(G),8)))
        22050 C$(G)=C$(G)+CHR$(VAL("&B"+RIGHT$(S$(G),8)))
    22060 NEXT
    22070 SPRITE$(G)=F$(G)+C$(G)
    22080 NEXT
    22090 PUT SPRITE 0,(0,0),15,0:PUT SPRITE 6,(121,15),&HA,1
    22100 DATA 0000000100000000
    22110 DATA 0000010101000000
    22120 DATA 0000001110000000
    22130 DATA 0000100100100000
    22140 DATA 0001100100110000
    22150 DATA 0000010101000000
    22160 DATA 0100001110000100
    22170 DATA 0011111111111000
    22180 DATA 0100001110000100
    22190 DATA 0000010101000000
    22200 DATA 0001100100110000
    22210 DATA 0000100100100000
    22220 DATA 0000001110000000
    22230 DATA 0000010101000000
    22240 DATA 0000000100000000
    22250 DATA 0000000000000000
    22300 '� ESTRELLA
    22300 DATA 0000000100000000
    22310 DATA 0000000100000000
    22320 DATA 0110001110001100
    22330 DATA 0111001110011100
    22340 DATA 0011101110111000
    22350 DATA 0001111111110000
    22360 DATA 0000111111110000
    22370 DATA 0011111111111000
    22380 DATA 1111111111111110
    22390 DATA 0011111111111000
    22400 DATA 0000111111100000
    22410 DATA 0001111111110000
    22420 DATA 0011101110111000
    22430 DATA 0111001110011100
    22440 DATA 0110000100001100
    22450 DATA 0000000100000000
    25000 FOR I=5 TO 9:SP$=""
        25010 FOR J=1 TO 32:READ A$
            25020 SP$=SP$+CHR$(VAL(A$))
        25030 NEXT J
        25040 SPRITE$(I)=SP$
    25050 NEXT I
    25060 rem 'sprite color definition'
    25070 for i=0 to 16*5
        25080 read a
        25085 vpoke 29696+80+i,a
    25090 next i
    25100 'MER'
    25110 DATA 0,0,0,0,69,109,85,85
    25120 DATA 69,69,69,0,0,0,0,0
    25130 DATA 0,0,0,0,220,18,18,146
    25140 DATA 28,20,210,0,0,0,0,0
    25150 'RY'
    25160 DATA 0,0,0,0,228,148,148,147
    25170 DATA 227,163,147,0,0,0,0,0
    25180 DATA 0,0,0,0,128,128,128,0
    25190 DATA 0,0,0,0,0,0,0,0
    25200 'CHRI'
    25210 DATA 0,0,0,0,105,137,137,143
    25220 DATA 137,137,105,0,0,0,0,0
    25230 DATA 0,0,0,0,114,74,74,114
    25240 DATA 82,82,74,0,0,0,0,0
    25250 'STM'
    25260 DATA 0,0,0,0,103,145,129,97
    25270 DATA 17,17,145,97,0,0,0,0
    25280 DATA 0,0,0,0,209,27,21,21
    25290 DATA 17,17,17,17,0,0,0,0
    25300 'AS'
    25310 DATA 0,0,0,0,49,74,74,73
    25320 DATA 120,74,74,73,0,0,0,0
    25330 DATA 0,0,0,0,128,64,0,128
    25340 DATA 64,64,64,128,0,0,0,0
    25350 rem color sprites definition data
    25360 DATA 10,10,10,10,15,15,15,15
    25370 DATA 10,10,10,10,10,10,10,10
    25380 DATA 10,10,10,10,15,15,15,15
    25390 DATA 10,10,10,10,10,10,10,10
    25400 DATA 10,10,10,10,15,15,15,15
    25410 DATA 10,10,10,10,10,10,10,10
    25420 DATA 10,10,10,10,15,15,15,15
    25430 DATA 10,10,10,10,10,10,10,10
    25440 DATA 10,10,10,10,15,15,15,15
    25450 DATA 10,10,10,10,10,10,10,10
    25460 DATA 10,10,10,10,15,15,15,15
    25470 DATA 10,10,10,10,10,10,10,10
25900 return
