*********//  devices  //*********
.option vntol=1p

***//  Resistant  //***
Rs1  4  3  50
Rs2  6  5  50


***//  Diod  //***
D1  16  15  Diod
D2  15  17  Diod

***//  Capacitor  //***
Cc  12  15  100p
Co  18  0  1p


***//  Voltage  //***
vcc  100  0  3
vee  200  0  -3

vid  103  0  ac  sin(0  0.01m  1k  0  0  0)
E1  3  2  103  0  0.5
E2  5  0  103  0  -0.5
  
Vdc  2  1  dc=0  

Vb  10  0  1.7

***//  DC FeedBack  //***
Ex  101  0  18  0  1
E3  1  0  102  0  1
Rx  101  102  1000g
Cx  102  0  1m



***//  Current  //***
IEE  7  200  0.2m

IQ7  100  13  0.1m
IQ8  14  200  1m
IQ9  15  200  1m

ICC1  100  16  1m
ICC2  17  200  1m

***//  Transistor  //***
Q1  8  4  7  NPN
Q2  9  6  7  NPN
Q3  11  10  8  NPN
Q4  12  10  9  NPN

Q5  12  11  100  PNP
Q6  11  11  100  PNP
Q7  200  12  13  PNP
Q8  14  13  100  PNP

Q9  100  14  15  NPN
Q10  100  16  18  NPN

Q11  200  17  18  PNP


***//  Models  //***
.Model  NPN  npn  IS=2f BF=250 vaf=100 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n
.Model  PNP  pnp  IS=4f BF=100 vaf=30 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n

.Model Diod  D  Is=10f  N=1.836  Rs=.5664 Xti=3 Eg=1.11 Cjo=4p  M=.3333 Vj=.5 Fc=.5 Bv=100 Ibv=100u Tt=11.54n

***//  analysis  //***
.op

.tran  1ps  300ms  START=200m

.end