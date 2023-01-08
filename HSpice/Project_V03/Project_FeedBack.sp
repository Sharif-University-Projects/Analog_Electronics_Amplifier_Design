*********//	devices	//*********
.option vntol=1p
.option nomod
.option post
.option accurate = 0.01

***//	Resistant	//***
Rs		7	8	50
Rref	200	1	4.7x


***//	Diod	//***
Db1	6	5	Diod
Db2	5	4	Diod

***//	Capacitor	//***
Cc	11	16	12p
Co	17	0	1p


***//	Voltage	//***
vcc	200	0	3
vee	100	0	-3

vin	7	0	ac	sin(-770.6088u	2.3	1k	0	0	0)


***//	Transistor	//***
Q1	10	17	4	NPN
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
Q14	1	2	100	NPN
Q15	200	1	2	NPN
Q16	3	2	100	NPN

Q17	4	2	100	NPN32


Q21	17	2	100	NPN150
Q23	16	2	100	NPN150

Q24	6	3	200	PNP2

Q25	3	3	200	PNP

Q28	15	3	200	PNP15




***//	Models	//***
.Model  NPN		npn	IS=2f BF=250 vaf=100 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n
.Model  NPN32	npn	IS=64f BF=250 vaf=100 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n
.Model  NPN150	npn	IS=300f BF=250 vaf=100 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n

.Model  PNP		pnp	IS=4f BF=100 vaf=30 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n
.Model  PNP2	pnp	IS=8f BF=100 vaf=30 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n
.Model  PNP15	pnp	IS=60f BF=100 vaf=30 cje=0.5p cjc=0.5p cjs=1p mjs=0.5 mjc=0.5 mje=0.5 vje=0.65 vjc=0.65 vjs=0.65 tf=0.1n


.Model Diod	D	Is=10f	N=1.836	Rs=.5664 Xti=3 Eg=1.11 Cjo=4p	M=.3333 Vj=.5 Fc=.5 Bv=100 Ibv=100u Tt=11.54n

***//	analysis	//***
.op
.tran	1ps	10ms	START=0

.ac	dec	1000	1	10000G

.probe   Gainn=par('db(vm(17))')
.probe   Phase=par('vp(17)')

.pz v(17) vin
.end

