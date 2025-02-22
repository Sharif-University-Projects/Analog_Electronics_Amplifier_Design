*********//	devices	//*********
.option vntol=1p
.option nomod
.option post
.option accurate = 0.01

***//	Resistant	//***
Rs		7	8	50
Rref	200	1	47k


***//	Diod	//***
D1	18	17	Diod
D2	17	19	Diod

Db1	6	5	Diod
Db2	5	4	Diod

***//	Capacitor	//***
Cc	11	16	80p
Co	20	0	1p


***//	Voltage	//***
vcc	200	0	3
vee	100	0	-3

vin	7	0	ac	sin(-770.6088u	2.1	1k	0	0	0)


***//	Transistor	//***
Q1	10	20	4	NPN
Q2	9	8	4	NPN
Q3	12	6	10	NPN
Q4	11	6	9	NPN

Q5	12	12	13	PNP
Q6	11	12	14	PNP
Q7	13	13	200	PNP
Q8	14	13	200	PNP
Q9	100	11	15	PNP
Q10	16	15	200	PNP

Q11	200	16	17	NPN
Q12	200	18	20	NPN

Q13	100	19	20	PNP

Q14	1	2	100	NPN
Q15	200	1	2	NPN
Q16	3	2	100	NPN

Q17	4	2	100	NPN03


Q19	19	2	100	NPN10
Q21	17	2	100	NPN10
Q23	16	2	100	NPN10

Q24	6	3	200	PNP
Q25	3	3	200	PNP
Q28	15	3	200	PNP

Q30	18	3	200	PNP10



***//	Models	//***
.Model  NPN		npn	IS=2f BF=250 vaf=100 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n
.Model  NPN03	npn	IS=6f BF=250 vaf=100 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n
.Model  NPN10	npn	IS=20f BF=250 vaf=100 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n

.Model  PNP		pnp	IS=4f BF=100 vaf=30 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n
.Model  PNP10	pnp	IS=40f BF=100 vaf=30 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n

.Model Diod	D	Is=10f	N=1.836	Rs=.5664 Xti=3 Eg=1.11 Cjo=4p	M=.3333 Vj=.5 Fc=.5 Bv=100 Ibv=100u Tt=11.54n

***//	analysis	//***
.op
.tran	1ps	10ms	START=0

.ac	dec	1000	1	10000G

.probe   Gainn=par('db(vm(20))')
.probe   Phase=par('vp(20)')

.pz v(20) vin
.end

