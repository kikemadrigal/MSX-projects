1'1 fila
21 set page 0,0
22 vpoke 32768,&h66
23 vpoke 32769,&h66
24 vpoke 32770,&h66
25 vpoke 32771,&h66
26 vpoke 32772,&h66
27 vpoke 32773,&h66
28 vpoke 32774,&h66
29 vpoke 32775,&h66
1 '2 fila'
1 'En el byte 128+32768 empezará la siguiente fila'
31 vpoke 32896,&h66:'8080'
32 vpoke 32897,&h66:'8081'
33 vpoke 32898,&h66:'8082'
34 vpoke 32899,&h66:'8083'
35 vpoke 32900,&h66:'8084'
36 vpoke 32901,&h66:'8085'
37 vpoke 32902,&h66:'8086'
38 vpoke 32903,&h66:'8087'
1 '3 fila'
1 'En el byte (128*2)+32768 empezará la siguiente fila'
40 vpoke 33024,&h66: '8088'
41 vpoke 33025,&h66
42 vpoke 33026,&h66
43 vpoke 33027,&h66
44 vpoke 33028,&h66
45 vpoke 33029,&h66
46 vpoke 33030,&h66
47 vpoke 33031,&h66
1 '4 fila'
1 'En el byte (128*3)+32768 empezará la siguiente fila'
50 vpoke 33152,&h66: '8088'
51 vpoke 33153,&h66
52 vpoke 33154,&h66
53 vpoke 33155,&h66
54 vpoke 33156,&h66
55 vpoke 33157,&h66
56 vpoke 33158,&h66
57 vpoke 33159,&h66
1 '5 fila'
1 'En el byte (128*4)+32768 empezará la siguiente fila'
60 vpoke 33280,&h66: '8088'
61 vpoke 33281,&h66
62 vpoke 33282,&h66
63 vpoke 33283,&h66
64 vpoke 33284,&h66
65 vpoke 33285,&h66
66 vpoke 33286,&h66
67 vpoke 33287,&h66
1 '6 fila'
1 'En el byte (128*5)+32768 empezará la siguiente fila'
70 vpoke 33408,&h66: '8088'
71 vpoke 33409,&h66
72 vpoke 33410,&h66
73 vpoke 33411,&h66
74 vpoke 33412,&h66
75 vpoke 33413,&h66
76 vpoke 33414,&h66
77 vpoke 33415,&h66
1 '7 fila'
1 'En el byte (128*6)+32768 empezará la siguiente fila'
80 vpoke 33536,&h66: '8088'
81 vpoke 33537,&h66
82 vpoke 33538,&h66
83 vpoke 33539,&h66
84 vpoke 33540,&h66
85 vpoke 33541,&h66
86 vpoke 33542,&h66
87 vpoke 33543,&h66
1 '8 fila'
1 'En el byte (128*7)+32768 empezará la siguiente fila'
90 vpoke 33664,&h66: '8088'
91 vpoke 33665,&h66
92 vpoke 33666,&h66
93 vpoke 33667,&h66
94 vpoke 33668,&h66
95 vpoke 33669,&h66
96 vpoke 33670,&h66
97 vpoke 33671,&h66
100 set page 0,1





20 re=32768
30 data  "ccc66ccccc66cccc"
40 data  "cc6cc6c6cc6ccccc"
50 data  "cc6ccc6c6ccc6ccc"
60 data  "ccc6cc66cc66cccc"
70 data  "ccccc66666cccccc"
80 data  "ccffff666ffffccc"
90 data  "ccafaf666afffccc"
100 data "ccffff666ffafccc"
110 data "ccfaff666ffffccc"
120 data "cc66666666666ccc"
130 data "cc66666666666ccc"
140 data "cc66666666666ccc"
150 data "ccffaf666ffafccc"
160 data "ccffff666ffffccc"
170 data "ccfaff666affaccc"
180 data "ccffff666ffffccc"
190 restore 30
191 set page 0,0
195 'FOR y=0 TO 15
    200 FOR x=0 TO 15
        1   'substrae una cedena: mid(cadena, posición_inicio, tamaño)'
        210 read a$:b$=mid$(a$,x+1,2)
        220 vpoke re,VAL("&H"+b$)
        230 re=re+1
    240 next x
    245 re=re+128
250 'next y 
260 set page 0,1