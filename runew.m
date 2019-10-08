(* ::Package:: *)

(* ::Text:: *)
(*DM isospin and hypercharge*)


DMProps={JX->2,dx->3,YX->0,N2->0};


(* ::Section:: *)
(*Preamble*)


adm01=Get["~/HEP/Projects/07_RGDM/anomalous-dims/results/result-dmeft6-pengs.m"];


adm02=Get["~/HEP/Projects/07_RGDM/anomalous-dims/results/result-dmeft6.m"];


adm03=Get["~/HEP/Projects/07_RGDM/anomalous-dims/results/result-smeft6-pengs.m"]/.{
(* Turn off the self-mixing in the SMEFT *)
C6[i_,___]SM[__]:>0/;i>100
};


adm04=Get["~/HEP/Projects/07_RGDM/anomalous-dims/results/result-xxeft6-pengs.m"]/.{
(* Turn off the self-mixing in the XXEFT and mixing between XXEFT and SMEFT *)
C6[i_,___]DM[__]:>0/;i>100
};


adm00=adm01+adm02+adm03+adm04;


(* ::Text:: *)
(*The anomalous dimensions were fully computed with two generations -- we now need to convert this to three generations. This must be done with care to avoid adding spurious ADs \[Proportional] y_i.*)


(* ::Subsection:: *)
(*SMEFT operator groups*)


(* ::Text:: *)
(*~~~~~~~~~~*)
(*  NOTE!   *)
(*~~~~~~~~~~*)
(*For now, need to open "DirectDM/bases/smeft.m" and evaluate the code between  "Begin["`Private`"]" and "End[]". In particular, need the 'OperasIJS' and 'OperasIJ' definitions.*)


(* The operators that are symmetric on I,J    *)
OperasIJS = {1,2,5,7,8,10};


(* The operators that have no symmetry on I,J *)
OperasIJ  = Join[{3,4,6,9},Range[11,17]];


(* The operators that have no symmetry on I,J *)
OperasI   = Range[18,24];


(* The operators that have no symmetry on I,J *)
Operas0   = {25};


(* ::Subsection::Closed:: *)
(*Replacement rules for 2 \[RightArrow] 3 generations*)


RepDD={
C6[i_,2]MAT[j_,2]:>C6[i,3]MAT[j,3]/;i<100&&j<100,
C6[i_,1]MAT[j_,1]:>C6[i,1]MAT[j,1]+C6[i,2]MAT[j,2]/;i<100&&j<100,
C6[i_,1]MAT[j_,2]:>C6[i,1]MAT[j,2]+C6[i,1]MAT[j,3]+C6[i,2]MAT[j,3]/;i<100&&j<100,
C6[i_,2]MAT[j_,1]:>C6[i,2]MAT[j,1]+C6[i,3]MAT[j,1]+C6[i,3]MAT[j,2]/;i<100&&j<100,
C6[i_,2]MAT[j_]:>C6[i,3]MAT[j]/;i<100&&j<100,
C6[i_,1]MAT[j_]:>C6[i,1]MAT[j]+C6[i,2]MAT[j]/;i<100&&j<100,
C6[i_]MAT[j_,2]:>C6[i]MAT[j,3]/;i<100&&j<100,
C6[i_]MAT[j_,1]:>C6[i]MAT[j,1]+C6[i]MAT[j,2]/;i<100&&j<100
};


RepDS={
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(*  I \[RightTeeArrow] J,K *)
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(* The generation-diagonal mixing *)
C6[i_,2]SM[j_,2,2]:>C6[i,3]SM[j,3,3]/;i<100,
C6[i_,1]SM[j_,1,1]:>C6[i,1]SM[j,1,1]+C6[i,2]SM[j,2,2]/;i<100,
(* The generation-off-diagonal mixing *)
C6[i_,1]SM[j_,1,2]:>C6[i,1]SM[j,1,2]+C6[i,1]SM[j,1,3]+C6[i,2]SM[j,2,3]/;i<100,
C6[i_,1]SM[j_,2,1]:>C6[i,1]SM[j,2,1]+C6[i,1]SM[j,3,1]+C6[i,2]SM[j,3,2]/;i<100,
C6[i_,2]SM[j_,1,2]:>C6[i,2]SM[j,1,2]+C6[i,3]SM[j,1,3]+C6[i,3]SM[j,2,3]/;i<100,
C6[i_,2]SM[j_,2,1]:>C6[i,2]SM[j,2,1]+C6[i,3]SM[j,3,1]+C6[i,3]SM[j,3,2]/;i<100,
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(*  I \[RightTeeArrow] J *)
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
C6[i_,2]SM[j_,2]:>C6[i,3]SM[j,3]/;i<100,
C6[i_,1]SM[j_,1]:>C6[i,1]SM[j,1]+C6[i,2]SM[j,2]/;i<100,
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(*  I \[RightTeeArrow] 0 *)
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
C6[i_,2]SM[25]:>C6[i,3]SM[25]/;i<100,
C6[i_,1]SM[25]:>C6[i,1]SM[25]+C6[i,2]SM[25]/;i<100,
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(*  0 \[RightTeeArrow] J *)
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
C6[i_]SM[j_,2]:>C6[i]SM[j,3]/;i<100,
C6[i_]SM[j_,1]:>C6[i]SM[j,1]+C6[i]SM[j,2]/;i<100
};


RepSD={
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(*  I,J \[RightTeeArrow] K *)
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(* The generation-diagonal mixing *)
C6[i_,2,2]MAT[j_,2]:>C6[i,3,3]MAT[j,3]/;100<i<500,
C6[i_,1,1]MAT[j_,1]:>C6[i,1,1]MAT[j,1]+C6[i,2,2]MAT[j,2]/;100<i<500,
(* The generation-off-diagonal mixing *)
C6[i_,1,2]MAT[j_,1]:>C6[i,1,2]MAT[j,1]+C6[i,1,3]MAT[j,1]+C6[i,2,3]MAT[j,2]/;100<i<500,
C6[i_,1,2]MAT[j_,2]:>C6[i,1,2]MAT[j,2]+C6[i,1,3]MAT[j,3]+C6[i,2,3]MAT[j,3]/;100<i<500,
C6[i_,2,1]MAT[j_,1]:>C6[i,2,1]MAT[j,1]+C6[i,3,1]MAT[j,1]+C6[i,3,2]MAT[j,2]/;100<i<500,
C6[i_,2,1]MAT[j_,2]:>C6[i,2,1]MAT[j,2]+C6[i,3,1]MAT[j,3]+C6[i,3,2]MAT[j,3]/;100<i<500,
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(*  I \[RightTeeArrow] J *)
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
C6[i_,2]MAT[j_,2]:>C6[i,3]MAT[j,3]/;100<i<500,
C6[i_,1]MAT[j_,1]:>C6[i,1]MAT[j,1]+C6[i,2]MAT[j,2]/;100<i<500,
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(*  I \[RightTeeArrow] 0 *)
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
C6[i_,2]MAT[j_]:>C6[i,3]MAT[j]/;100<i<500,
C6[i_,1]MAT[j_]:>C6[i,1]MAT[j]+C6[i,2]MAT[j]/;100<i<500,
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
(*  0 \[RightTeeArrow] J *)
(* ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ *)
C6[i_]MAT[j_,2]:>C6[i]MAT[j,3]/;100<i<500,
C6[i_]MAT[j_,1]:>C6[i]MAT[j,1]+C6[i]MAT[j,2]/;100<i<500
};


RepXD={
(* The generation-diagonal mixing *)
C6[i_]MAT[j_,2]:>C6[i]MAT[j,3]/;i>500,
C6[i_]MAT[j_,1]:>C6[i]MAT[j,1]+C6[i]MAT[j,2]/;i>500
};


RepDX={
(* The generation-diagonal mixing *)
C6[i_,2]DM[j_]:>C6[i,3]DM[j]/;i<100,
C6[i_,1]DM[j_]:>C6[i,1]DM[j]+C6[i,2]DM[j]/;i<100
};


RepGens=Join[RepDD,RepDS,RepSD,RepDX,RepXD];


RepY2={C6[i_,1]MAT[j_,1]:>C6[i,2]MAT[j,2],
	C6[i_,1]MAT[j_]:>C6[i,2]MAT[j],
	MAT[i_,1]C6[j_]:>MAT[i,2]C6[j]};
RepY3={C6[i_,2]MAT[j_,2]:>C6[i,3]MAT[j,3],
	C6[i_,2]MAT[j_]:>C6[i,3]MAT[j],
	MAT[i_,2]C6[j_]:>MAT[i,3]C6[j]};


(* ::Text:: *)
(*Enforce the correct index ordering for SMEFT operators that are symmetric under i,j*)


RepSMSymm=Flatten[{SM[#,2,1]:>SM[#,1,2],SM[#,3,1]:>SM[#,1,3],SM[#,3,2]:>SM[#,2,3]}&/@OperasIJS]


(*RepCM={
C6[i_,2]MAT[j_,2]:>C6[i,3]MAT[j,3]/;i<100,
C6[i_,1]MAT[j_,1]:>C6[i,1]MAT[j,1]+C6[i,2]MAT[j,2]/;i<100,
C6[i_,1]MAT[j_,2]:>C6[i,1]MAT[j,2]+C6[i,1]MAT[j,3]+C6[i,2]MAT[j,3]/;i<100,
C6[i_,2]MAT[j_,1]:>C6[i,2]MAT[j,1]+C6[i,3]MAT[j,1]+C6[i,3]MAT[j,2]/;i<100,
C6[i_,2]f_[j_]:>C6[i,3]f[j]/;i<100,
C6[i_,1]f_[j_]:>C6[i,1]f[j]+C6[i,2]f[j]/;i<100
};*)


(*RepSD={
(* The generation-diagonal mixing *)
C6[i_,2,2]MAT[j_,2]:>C6[i,3,3]MAT[j,3]/;100<i<500,
C6[i_,1,1]MAT[j_,1]:>C6[i,1,1]MAT[j,1]+C6[i,2,2]MAT[j,2]/;100<i<500,
(* The generation-off-diagonal mixing *)
C6[i_,1,2]MAT[j_,1]:>C6[i,1,2]MAT[j,1]+C6[i,1,3]MAT[j,1]+C6[i,2,3]MAT[j,2]/;100<i<500,
C6[i_,1,2]MAT[j_,2]:>C6[i,1,2]MAT[j,2]+C6[i,1,3]MAT[j,3]+C6[i,2,3]MAT[j,3]/;100<i<500,
C6[i_,2,1]MAT[j_,1]:>C6[i,2,1]MAT[j,1]+C6[i,3,1]MAT[j,1]+C6[i,3,2]MAT[j,2]/;100<i<500,
C6[i_,2,1]MAT[j_,2]:>C6[i,2,1]MAT[j,2]+C6[i,3,1]MAT[j,3]+C6[i,3,2]MAT[j,3]/;100<i<500
};*)


(*RepXD={
(* The generation-diagonal mixing *)
C6[i_]MAT[j_,2]:>C6[i]MAT[j,3]/;i>500,
C6[i_]MAT[j_,1]:>C6[i]MAT[j,1]+C6[i]MAT[j,2]/;i>500
};*)


(*RepY2={C6[i_,1]MAT[j_,1]:>C6[i,2]MAT[j,2],C6[i_,1]f_[j_]:>C6[i,2]f[j]};
RepY3={C6[i_,2]MAT[j_,2]:>C6[i,3]MAT[j,3],C6[i_,2]f_[j_]:>C6[i,3]f[j]};*)


(* ::Subsection:: *)
(*Combine ADMs*)


comb=adm01+adm02+adm03+adm04;


adm["g1"]=Coefficient[comb,g1,2]/.RepSMSymm/.RepGens//Expand;


adm["g2"]=Coefficient[comb,g2,2]/.RepSMSymm/.RepGens//Expand;


adm["yt"]=Coefficient[comb,yt,2]/.RepSMSymm/.RepY3//Expand;


adm["yb"]=Coefficient[comb,yb,2]/.RepSMSymm/.RepY3//Expand;


adm["yc"]=Coefficient[comb,yc,2]/.RepSMSymm/.RepY2//Expand;


adm["ytau"]=Coefficient[comb,ytau,2]/.RepSMSymm/.RepY3//Expand;


(* ::Section::Closed:: *)
(*Inputs*)


btt=-9./2;bt[1]=17./12;bt[2]=9./4;bt[3]=8.;


19./3


bb[2]


bb[1,NF_:0]:=-41./6-YX^2/3dx;
bb[2,NF_:0]:=19./6-4.JX*dx/9;
bb[3,NF_:6]:=11.-2./3NF;


MZ=91.1876; 
MH=125.18;
GF=1.1663787*^-5;
vev=1/Sqrt[Sqrt[2.]*GF];


MBMB=4.18;
MCMC=1.275;
MTMT=174; (* Converted from pole mass = 173.1 QCD+EW *)


MTau=1.77686;


SW2MZ=0.23122;
alMZ[1]=1.0/128*1/(1-SW2MZ);
alMZ[2]=1.0/(128SW2MZ);
alMZ[3]=0.1181;


NF=6;


MTMZ=182;
MBMZ=3.08;
MCMZ=0.775;


al[i_,mu_,NF_:6]:=1/(1/alMZ[i]+bb[i,NF]/(2\[Pi])Log[mu/MZ])


(* ::Section:: *)
(*Setup the system of ODEs*)


(* ::Text:: *)
(*NOTE: at dim. 6, the anomalous dimensions \[Proportional] \[Lambda] vanish.*)


$couplings={"g1","g2","yt","yb","yc","ytau"(*,"lam"*)};


$couppengs={"g1","g2"};


Coup/:Coup["g1"]=g1^2;
Coup/:Coup["g2"]=g2^2;
Coup/:Coup["yt"]=yt^2;
Coup/:Coup["yb"]=yb^2;
Coup/:Coup["yc"]=yc^2;
Coup/:Coup["ytau"]=ytau^2;
Coup/:Coup["lam"]=lam;


Clear[alfa]


(* 1. Mixing into DMEFT: operators with 1 index *)
Sys01=Flatten@Table[mu*CD6[i1,f1]'[mu]==1/(4Pi)*(
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2,f2]MAT[i1,f1]]CD6[i2,f2][mu]),
		{i2,1,14},{f2,3},{gg,$couplings}]+
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2]MAT[i1,f1]]CD6[i2][mu]),{i2,15,18},
		{gg,$couplings}]+
	(* 3. Mixing of the SMEFT into DMEFT: operators symmetric on i,j *)
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[100+i2,g1,g2]MAT[i1,f1]]CD6[100+i2,g1,g2][mu]),
		{i2,OperasIJS},{g1,3},{g2,g1,3},{gg,$couppengs}]+
	(* 4. Mixing of the SMEFT into DMEFT: operators with no symmetry on i,j *)
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[100+i2,g1,g2]MAT[i1,f1]]CD6[100+i2,g1,g2][mu]),
		{i2,OperasIJ},{g1,3},{g2,3},{gg,$couppengs}]+
	(* 5. Mixing of the SMEFT into DMEFT: operators with 1 index *)
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[100+i2,g1]MAT[i1,f1]]CD6[100+i2,g1][mu]),
		{i2,OperasI},{g1,3},{gg,$couppengs}]+
	(* 6. Mixing of the SMEFT into DMEFT: operators with \[EmptySet] indices *)
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[100+i2]MAT[i1,f1]]CD6[100+i2][mu]),
		{i2,Operas0},{gg,$couppengs}]+
	(* 7. Mixing of the XXEFT into DMEFT: operators with \[EmptySet] indices *)
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[500+i2]MAT[i1,f1]]CD6[500+i2][mu]),
		{i2,4},{gg,$couppengs}]
	),{i1,1,14},{f1,3}]/.DMProps//Expand;


(* 2. Mixing into DMEFT: operators with no indices *)
Sys02=Flatten@Table[mu*CD6[i1]'[mu]==1/(4Pi)*(
	Sum[(alfa[gg][mu]Coefficient[adm[gg],C6[i2,f2]MAT[i1]]CD6[i2,f2][mu]),
		{i2,1,14},{f2,3},{gg,$couplings}]+
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2]MAT[i1]]CD6[i2][mu]),
		{i2,15,18},{gg,$couplings}]+
	(* 3. Mixing of the SMEFT into DMEFT: none *)
	(* 4. Mixing of the SMEFT into DMEFT: none *)
	(* 5. Mixing of the SMEFT into DMEFT: operators with 1 index *)
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2,g1]MAT[i1]]CD6[i2,g1][mu]),
		{i2,100+OperasI},{g1,3},{gg,$couppengs}]+
	(* 6. Mixing of the SMEFT into DMEFT: operators with \[EmptySet] indices *)
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2]MAT[i1]]CD6[i2][mu]),
		{i2,100+Operas0},{gg,$couppengs}]+
	(* 7. Mixing of the XXEFT into DMEFT: operators with \[EmptySet] indices *)
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2]MAT[i1]]CD6[i2][mu]),
		{i2,500+Range[4]},{gg,$couppengs}]
	),{i1,15,18}]/.DMProps//Expand;


(* 3. Mixing into SMEFT: operators symmetric on i,j *)
Sys03=Flatten@Table[mu*CD6[100+i1,f1,f2]'[mu]==1/(4Pi)*(
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2,g2]SM[i1,f1,f2]]CD6[i2,g2][mu]),
		{i2,1,14},{g2,3},{gg,$couppengs}]
	(* 2. Mixing of the DMEFT into SMEFT: operators with \[EmptySet] indices -- NONE *)
	(* 3. Mixing of the SMEFT into SMEFT: not included *)
	(* 4. Mixing of the SMEFT into SMEFT: not included *)
	(* 5. Mixing of the SMEFT into SMEFT: not included *)
	(* 6. Mixing of the SMEFT into SMEFT: not included *)
	(* 7. Mixing of the XXEFT into SMEFT: not included *)
	),{i1,OperasIJS},{f1,3},{f2,f1,3}]/.DMProps//Expand;


(* 4. Mixing of DMEFT into SMEFT: operators with no symmetry on i,j *)
Sys04=Flatten@Table[mu*CD6[100+i1,f1,f2]'[mu]==1/(4Pi)*(
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2,g2]SM[i1,f1,f2]]CD6[i2,g2][mu]),
		{i2,1,14},{g2,3},{gg,$couppengs}]
	(* 2. Mixing of the DMEFT into SMEFT: operators with \[EmptySet] indices -- NONE *)
	(* 3. Mixing of the SMEFT into SMEFT: not included *)
	(* 4. Mixing of the SMEFT into SMEFT: not included *)
	(* 5. Mixing of the SMEFT into SMEFT: not included *)
	(* 6. Mixing of the SMEFT into SMEFT: not included *)
	(* 7. Mixing of the XXEFT into SMEFT: none *)
	),{i1,OperasIJ},{f1,3},{f2,3}]/.DMProps//Expand;


(* 5. Mixing into SMEFT: operators with 1 index *)
Sys05=Flatten@Table[mu*CD6[100+i1,f1]'[mu]==1/(4Pi)*(
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2,g2]SM[i1,f1]]CD6[i2,g2][mu]),
		{i2,1,14},{g2,3},{gg,$couppengs}]+
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2]SM[i1,f1]]CD6[i2][mu]),
		{i2,15,18},{gg,$couppengs}]
	(* 3. Mixing of the SMEFT into SMEFT: not included *)
	(* 4. Mixing of the SMEFT into SMEFT: not included *)
	(* 5. Mixing of the SMEFT into SMEFT: not included *)
	(* 6. Mixing of the SMEFT into SMEFT: not included *)
	(* 7. Mixing of the XXEFT into SMEFT: not included *)
	),{i1,OperasI},{f1,3}]/.DMProps//Expand;


(* 6. Mixing into SMEFT: operators with no indices *)
Sys06=Flatten@Table[mu*CD6[100+i1]'[mu]==1/(4Pi)*(
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2,g2]SM[i1]]CD6[i2,g2][mu]),
		{i2,1,14},{g2,3},{gg,$couppengs}]+
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2]SM[i1]]CD6[i2][mu]),
		{i2,15,18},{gg,$couppengs}]
	(* 3. Mixing of the SMEFT into SMEFT: not included *)
	(* 4. Mixing of the SMEFT into SMEFT: not included *)
	(* 5. Mixing of the SMEFT into SMEFT: not included *)
	(* 6. Mixing of the SMEFT into SMEFT: not included *)
	(* 7. Mixing of the XXEFT into SMEFT: not included *)
	),{i1,Operas0}]/.DMProps//Expand;


(* 7. Mixing into XXEFT: operators with no indices *)
Sys07=Flatten@Table[mu*CD6[500+i1]'[mu]==1/(4Pi)*(
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2,g2]DM[i1]]CD6[i2,g2][mu]),
		{i2,1,14},{g2,3},{gg,$couppengs}]+
	Sum[(alfa[gg][mu]*Coefficient[adm[gg],C6[i2]DM[i1]]CD6[i2][mu]),
		{i2,15,18},{gg,$couppengs}]
	(* 3. Mixing of the SMEFT into SMEFT: not included *)
	(* 4. Mixing of the SMEFT into SMEFT: not included *)
	(* 5. Mixing of the SMEFT into SMEFT: not included *)
	(* 6. Mixing of the SMEFT into SMEFT: not included *)
	(* 7. Mixing of the XXEFT into SMEFT: not included *)
	),{i1,Range[4]}]/.DMProps//Expand;


Length[#]&/@{Sys01,Sys02,Sys03,Sys04,Sys05,Sys06,Sys07}//Total


Wilcos=Join[Flatten@Table[CD6[i,f],{i,1,14},{f,3}],Table[CD6[i],{i,15,18}],
Flatten@Table[CD6[i,f1,f2],{i,100+OperasIJS},{f1,3},{f2,f1,3}],
Flatten@Table[CD6[i,f1,f2],{i,100+OperasIJ},{f1,3},{f2,3}],
Flatten@Table[CD6[i,f1],{i,100+OperasI},{f1,3}],
Flatten@Table[CD6[i],{i,100+Operas0}],
Flatten@Table[CD6[i],{i,500+Range[4]}]
];


RepAlfa={
alfa["g1"][mu_]:>al[1,mu]/.DMProps,
alfa["g2"][mu_]:>al[2,mu]/.DMProps,
alfa["g3"][mu_]:>al[3,mu]};


RunEW:=NDSolve[{
Sequence@@(Sys01/.RepAlfa/.DMProps),
Sequence@@(Sys02/.RepAlfa/.DMProps),
Sequence@@(Sys03/.RepAlfa/.DMProps),
Sequence@@(Sys04/.RepAlfa/.DMProps),
Sequence@@(Sys05/.RepAlfa/.DMProps),
Sequence@@(Sys06/.RepAlfa/.DMProps),
Sequence@@(Sys07/.RepAlfa/.DMProps),
Sequence@@ICS,
alfa["yt"]'[mu]==alfa["yt"][mu]/(2*Pi*mu)(9./2.alfa["yt"][mu]+3./2.alfa["yb"][mu]+
	9/2alfa["yc"][mu]+alfa["ytau"][mu]-17./12.alfa["g1"][mu]-9./4.alfa["g2"][mu]-
	8alfa["g3"][mu])/.RepAlfa/.DMProps,
alfa["yb"]'[mu]==alfa["yb"][mu]/(2*Pi*mu)(9./2.alfa["yb"][mu]+3./2.alfa["yt"][mu]+
	3./2.alfa["yc"][mu]+alfa["ytau"][mu]-5./12.alfa["g1"][mu]-9./4.alfa["g2"][mu]-
	8alfa["g3"][mu])/.RepAlfa/.DMProps,
alfa["yc"]'[mu]==alfa["yc"][mu]/(2*Pi*mu)(9./2.alfa["yt"][mu]+9./2.alfa["yc"][mu]+
	3./2.alfa["yb"][mu]+alfa["ytau"][mu]-17./12.alfa["g1"][mu]-9./4.alfa["g2"][mu]-
	8alfa["g3"][mu])/.RepAlfa/.DMProps,
alfa["ytau"]'[mu]==alfa["ytau"][mu]/(2*Pi*mu)(5./2.alfa["ytau"][mu]+3.alfa["yt"][mu]+
	3.alfa["yb"][mu]+3alfa["yc"][mu]-15./4.alfa["g1"][mu]-9./4.alfa["g2"][mu])/.RepAlfa/.DMProps,
alfa["lam"]'[mu]==1/(4*Pi*mu)(alfa["lam"][mu](3/4alfa["lam"][mu]-3/4(alfa["g1"][mu]+
	3alfa["g2"][mu])+(3alfa["yt"][mu]+3alfa["yc"][mu]+3alfa["yb"][mu]+alfa["ytau"][mu]))+
	3./4.(alfa["g1"][mu]^2+2alfa["g1"][mu]alfa["g2"][mu]+3alfa["g2"][mu]^2)
	-4(3alfa["yt"][mu]^2+(3alfa["yb"][mu]^2+3alfa["yc"][mu]^2+alfa["ytau"][mu]^2)))/.RepAlfa/.DMProps,
alfa["yt"][MZ]==(Sqrt[2.0]*MTMZ/246.22)^2/(4*Pi),
alfa["yb"][MZ]==(Sqrt[2.0]*MBMZ/246.22)^2/(4*Pi),
alfa["yc"][MZ]==(Sqrt[2.0]*MCMZ/246.22)^2/(4*Pi),
alfa["ytau"][MZ]==(Sqrt[2.0]*MTau/246.22)^2/(4*Pi),
alfa["lam"][MZ]==2Sqrt[2]MH^2*GF/(4*Pi)},
Join[{alfa["yt"],alfa["yb"],alfa["yc"],alfa["ytau"],alfa["lam"]},Wilcos],
{mu,MZ,\[CapitalLambda]},Method->"ExplicitRungeKutta",PrecisionGoal->6,AccuracyGoal->6]//AbsoluteTiming;


(* ::Section::Closed:: *)
(*Running g_1 only*)


$tag="g1";


$KeepCoupl=alfa[a_][mu]:>0/;UnsameQ[a,$tag];


RunEWg1:=NDSolve[{
Sequence@@(Sys01/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys02/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys03/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys04/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys05/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys06/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys07/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@ICS
},
Wilcos,
{mu,MZ,\[CapitalLambda]},Method->"ExplicitRungeKutta"(*,PrecisionGoal->3,AccuracyGoal->8*)]//AbsoluteTiming;


\[CapitalLambda]=1*^4;
Do[ICS=#[\[CapitalLambda]]==0.&/@Wilcos;
ICS[[i]]=Wilcos[[i]][\[CapitalLambda]]==1.;
{time[$tag,i],sol[$tag,i]}=RunEWg1;
WCMZ[$tag,i]=#[MZ]&/@Wilcos/.Flatten[sol[$tag,i]],{i,46}]


ResJB[$tag]=Import[FileNameJoin[{
"~/HEP/Projects/07_RGDM/directdm/directdm-validation/results-py",
"EW_from_EW_Ychi_1_dchi_3_Lambda_10000_DIRAC_"<>$tag<>"_fady_ordering.dat"}],"Table"];


JBDD=ResJB[$tag][[;;46,;;46]];


FBDD=WCMZ[$tag,#][[;;46]]&/@Range[46];


diff=(JBDD-FBDD)/(JBDD/.(0.)->ep);


Position[diff,x_/;Abs[x]>0.005]


(* ::Section::Closed:: *)
(*Running g_2 only*)


$tag="g2";


$KeepCoupl=alfa[a_][mu]:>0/;UnsameQ[a,$tag];


tmp=Flatten@NDSolve[{mu Derivative[1][CD6[1,1]][mu]==CD6[1,1][mu]/(3 \[Pi] (29.596160000000005` -3.3157279810811526` Log[0.010966403326768112` mu])),
CD6[1,1][1*^4]==1.},
CD6[1,1],{mu,MZ,1*^4}]


CD6[1,1][MZ]/.tmp


(1/(1+al[2,MZ]bb[2]/(2\[Pi])Log[1*^4/MZ]))^(4./3./(2*bb[2]))/.DMProps


RunEWg1:=NDSolve[{
Sequence@@(Sys01/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys02/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys03/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys04/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys05/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys06/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys07/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@ICS
},
Wilcos,
{mu,MZ,\[CapitalLambda]},Method->"ExplicitRungeKutta",PrecisionGoal->12,AccuracyGoal->12]//AbsoluteTiming;


\[CapitalLambda]=1*^4;
Do[ICS=#[\[CapitalLambda]]==0.&/@Wilcos;
ICS[[i]]=Wilcos[[i]][\[CapitalLambda]]==1.;
{time[$tag,i],sol[$tag,i]}=RunEWg1;
WCMZ[$tag,i]=#[MZ]&/@Wilcos/.Flatten[sol[$tag,i]],{i,46}]


ResJB[$tag]=Import[FileNameJoin[{
"~/HEP/Projects/07_RGDM/directdm/directdm-validation/results-py",
"EW_from_EW_Ychi_1_dchi_3_Lambda_10000_DIRAC_"<>$tag<>"_fady_ordering.dat"}],"Table"];


JBDD=ResJB[$tag][[;;46,;;46]];


FBDD=WCMZ[$tag,#][[;;46]]&/@Range[46];


diff=(JBDD-FBDD)/(JBDD/.(0.)->ep);


Position[diff,x_/;Abs[x]>0.001]


(* ::Section::Closed:: *)
(*Running y_t only*)


$tag="yt";


$KeepCoupl=alfa[a_][mu]:>0/;UnsameQ[a,$tag];


RunEWg1:=NDSolve[{
Sequence@@(Sys01/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys02/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys03/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys04/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys05/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys06/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@(Sys07/.$KeepCoupl/.RepAlfa/.DMProps),
Sequence@@ICS,
alfa["yt"]'[mu]==alfa["yt"][mu]/(2*Pi*mu)(9./2.alfa["yt"][mu]+3./2.alfa["yb"][mu]+
	9/2alfa["yc"][mu]+alfa["ytau"][mu]-17./12.alfa["g1"][mu]-9./4.alfa["g2"][mu]-
	8alfa["g3"][mu])/.$KeepCoupl/.RepAlfa/.DMProps,
alfa["yt"][MZ]==(Sqrt[2.0]*MTMZ/246.22)^2/(4*Pi)
},
Join[{alfa["yt"]},Wilcos],
{mu,MZ,\[CapitalLambda]},Method->"ExplicitRungeKutta",PrecisionGoal->6,AccuracyGoal->8]//AbsoluteTiming;


\[CapitalLambda]=1*^4;
Do[ICS=#[\[CapitalLambda]]==0.&/@Wilcos;
ICS[[i]]=Wilcos[[i]][\[CapitalLambda]]==1.;
{time[$tag,i],sol[$tag,i]}=RunEWg1;
WCMZ[$tag,i]=#[MZ]&/@Wilcos/.Flatten[sol[$tag,i]],{i,46}]


ResJB[$tag]=Import[FileNameJoin[{
"~/HEP/Projects/07_RGDM/directdm/directdm-validation/results-py",
"EW_from_EW_Ychi_1_dchi_3_Lambda_10000_DIRAC_"<>$tag<>"_fady_ordering.dat"}],"Table"];


JBDD=ResJB[$tag][[;;46,;;46]];


FBDD=WCMZ[$tag,#][[;;46]]&/@Range[46];


diff=(JBDD-Chop@FBDD)/(JBDD/.(0.)->ep);


Chop@FBDD[[3]]


Chop@JBDD[[3]]


diff[[3]]


Position[diff,x_/;Abs[x]>0.0001]


(* ::Section:: *)
(*Running*)


(* ::Subsubsection:: *)
(*AxA*)


\[CapitalLambda]=1*^3;
ICS=#[\[CapitalLambda]]==0.&/@Wilcos;


(ICS[[#]]=Wilcos[[#]][\[CapitalLambda]]==1)&/@Flatten[Position[Wilcos,CD6[7|8,1]]]
(ICS[[#]]=Wilcos[[#]][\[CapitalLambda]]==-1)&/@Flatten[Position[Wilcos,CD6[6,1]]]


$tag="YX="<>ToString[YX/.DMProps]<>",dx="<>ToString[dx/.DMProps];
$tag=StringJoin[{$tag,",AxA"}];


{time[$tag],sol[$tag]}=RunEW;


WCMZ[$tag]=Take[Chop[#[MZ]&/@Wilcos/.Flatten[sol[$tag]]],{1,46}]


(* ::Subsubsection:: *)
(*VxA*)


\[CapitalLambda]=1*^3;
ICS=#[\[CapitalLambda]]==0.&/@Wilcos;


(ICS[[#]]=Wilcos[[#]][\[CapitalLambda]]==1)&/@Flatten[Position[Wilcos,CD6[3|4,1]]]
(ICS[[#]]=Wilcos[[#]][\[CapitalLambda]]==-1)&/@Flatten[Position[Wilcos,CD6[2,1]]]


$tag="YX="<>ToString[YX/.DMProps]<>",dx="<>ToString[dx/.DMProps];
$tag=StringJoin[{$tag,",VxA"}];


{time[$tag],sol[$tag]}=RunEW;


WCMZ[$tag]=Take[Chop[#[MZ]&/@Wilcos/.Flatten[sol[$tag]]],{1,46}]


(* ::Subsubsection:: *)
(**)


\[CapitalLambda]=1*^3;
Do[ICS=#[\[CapitalLambda]]==0.&/@Wilcos;
ICS[[i]]=Wilcos[[i]][\[CapitalLambda]]==1.;
{time[$tag,i],sol[$tag,i]}=RunEW;
WCMZ[$tag,i]=#[MZ]&/@Wilcos/.Flatten[sol[$tag,i]],{i,3,46}]


time[$tag,2]


$fname=FileNameJoin[{
"~/HEP/Projects/07_RGDM/directdm/directdm-validation/results-mma",
"EW_from_EW_Ychi_"<>ToString[YX/.DMProps]<>"_dchi_3_Lambda_10000_DIRAC.m"}];
If[FileExistsQ[$fname],DeleteFile[$fname]];
Export[$fname,Table[WCMZ[$tag,i],{i,46}],"Table"]


(*Save[FileNameJoin[{NotebookDirectory[],"EW_from_EW_Ychi_1_dchi_3_Lambda_10000_DIRAC.m"}],WCMZ]*)


Clear[WCMZ,time,sol]
Do[ICS=#[\[CapitalLambda]]==0.&/@Wilcos;
ICS[[i]]=Wilcos[[i]][\[CapitalLambda]]==1.;
{time[i],sol[i]}=RunEW;
WCMZ[i]=(#[MZ]&/@Wilcos)/.sol[i],{i,43,46}]


Flatten[WCMZ[46]][[46]]


Clear[WCMZ,time,sol]
Do[ICS=#[\[CapitalLambda]]==0.&/@Wilcos;
ICS[[i]]=Wilcos[[i]][\[CapitalLambda]]==1.;
{time[i],sol[i]}=RunEW;
WCMZ[i]=(#[MZ]&/@Wilcos)/.sol[i],{i,43,46}]


time[#]&/@Range[43,46]


(* ::Section:: *)
(*Paper plots*)


Do[ICS=#[\[CapitalLambda]]==0.&/@Wilcos;
ICS[[i]]=Wilcos[[i]][\[CapitalLambda]]==1.;
{time[$tag,i],sol[$tag,i]}=RunEW;
WCMZ[$tag,i]=#[MZ]&/@Wilcos/.Flatten[sol[$tag,i]],{i,46}]


(* ::Subsubsection:: *)
(*1st generation V+A*)


$tag="G1:V+A";


\[CapitalLambda]=60*^3;
ICS=#[\[CapitalLambda]]==0.&/@Wilcos;


Do[
{ind}=Position[Wilcos,CD6[i,1]]//Flatten;
ICS[[ind]]=Wilcos[[ind]][\[CapitalLambda]]==1.;,{i,{3,4}}]


{time[$tag],sol[$tag]}=RunEW;


WCMZ[$tag]=Flatten[(#[MZ]&/@Wilcos)/.sol[$tag]];


(* ::Subsubsection:: *)
(*1st generation V-A*)


$tag="G1:V-A";


\[CapitalLambda]=60*^3;
ICS=#[\[CapitalLambda]]==0.&/@Wilcos;


Do[
{ind}=Position[Wilcos,CD6[i,1]]//Flatten;
ICS[[ind]]=Wilcos[[ind]][\[CapitalLambda]]==1.;,{i,{2}}]


{time[$tag],sol[$tag]}=RunEW;


WCMZ[$tag]=Flatten[(#[MZ]&/@Wilcos)/.sol[$tag]];


(* ::Subsubsection:: *)
(*Results*)


Flatten[WCMZ["G1:V+A"]][[;;46]]


Flatten[WCMZ["G1:V-A"]][[;;46]]


$fname=FileNameJoin[{NotebookDirectory[],"paper_fig_2_dim6.m"}];
If[FileExistsQ[$fname],DeleteFile[$fname]];
Save[$fname,WCMZ]


(* ::Section:: *)
(*Compare*)


ResJB=Import["~/HEP/Projects/07_RGDM/directdm/directdm-validation/results-py/EW_from_EW_Ychi_1_dchi_3_Lambda_10000_DIRAC.dat","Table"];


ResJB=Import["~/HEP/Projects/07_RGDM/directdm/directdm-validation/results-py/EW_from_EW_Ychi_1_dchi_3_Lambda_10000_DIRAC_fady_order.dat","Table"];


JBHH=ResJB[[#,#]]&/@Range[43,46];


ResJB[[


diff[x_]:=(1-Flatten[WCMZ[x]][[;;46]]/ResJB[[x,;;46]])100





{(#-Mod[#,3])/3,Mod[#,3]+1}&@@@Position[diff[43],x_/;Abs[x]>80]


{(#-Mod[#,3])/3,Mod[#,3]+1}&@@@Position[diff[44],x_/;Abs[x]>100]


{(#-Mod[#,3])/3,Mod[#,3]+1}&@@@Position[diff[45],x_/;Abs[x]>100]


{(#-Mod[#,3])/3,Mod[#,3]+1}&@@@Position[diff[46],x_/;Abs[x]>100]


diff[44]


diff[45]


diff[46]


diff01=(1-Flatten[WCMZ[43]][[;;46]]/ResJB[[43,;;46]])100


diff01=(1-Flatten[WCMZ[43]][[;;46]]/ResJB[[43,;;46]])100


Flatten[WCMZ[43]][[;;46]]


ResJB[[43,;;46]]


Position[diff01,x_/;Abs[x]>100]


{(#-Mod[#,3])/3,Mod[#,3]}&@26


Flatten[WCMZ[1]][[#]]&@@@Position[diff01,x_/;x>100]


Flatten[WCMZ[1]][[;;3]]


Print["FB = ",SetPrecision[Flatten[WCMZ[1]][[;;3]],8]]
Print["JB = ",SetPrcision[ResJB[[1,;;3]],8]]





ResJB[[1,#]]&@@@Position[diff01,x_/;x>100]


BarChart[1-Flatten[WCMZ[1]][[;;46]]/(ResJB[[1,;;46]]+ep)]


FBHH=Flatten[WCMZ[#]][[#]]&/@Range[43,46];


(1-FBHH/JBHH)*100


FBHH=Flatten[WCMZ[43]][[;;46]]


ResFBDM=WCMZ[#][[1,#]]&/@Range[Length@Wilcos]


ResFBDM=WCMZ[#][[1,#]]&/@Range[46]


ResJBDM=ResJB[[1;;46,1;;46]][[#,#]]&/@Range[46]


(1-ResFBDM/ResJBDM)*100


tmp=(1-ResFBDM/ResJBDM)*100


Position[tmp,x_/;Abs[x]>2]


Mod[5,3]










(* ::Section::Closed:: *)
(*Purgatory*)


$couplings={"g1","g2","yt"};
$II={1,6,9};
$JJ={15};


WW00=Join[Flatten@Table[CD6[i,f],{i,$II},{f,2}],Table[CD6[j],{j,$JJ}]];


Coefficient[adm01+adm02,la]


Coefficient[adm01+adm02,g2^2C6[1,2]MAT[1,2]]


Coefficient[tmp,C6[1,1]MAT[1,1]]


Coefficient[tmp,C6[1,3]DM[3]]


Coefficient[tmp,C6[1,2]DM[3]]


Table[Coefficient[adm01+adm02,g2^2C6[i2,f2]MAT[i1,f1]],{i2,$II},{f2,2},{i1,$II},{f1,2}]


CC00=Join[{Flatten@Table[mu*CD6[i1,f1]'[mu]==1/(4\[Pi])*(
	Sum[Sum[alf[gg][mu]*Coefficient[adm00,Coup[gg]C6[i2,f2]MAT[i1,f1]]CD6[i2,f2][mu],
		{i2,$II},{f2,2}],{gg,$couplings}]+
	Sum[Sum[alf[gg][mu]*Coefficient[adm00,Coup[gg]C6[i2]MAT[i1,f1]]CD6[i2][mu],{i2,$JJ}],
		{gg,$couplings}]
	),{i1,$II},{f1,2}],
	Flatten@Table[mu*CD6[i1]'[mu]==1/(4Pi)*(
	Sum[Sum[alf[gg][mu]*Coefficient[adm00,Coup[gg]C6[i2,f2]MAT[i1]]CD6[i2,f2][mu],{i2,$II},{f2,2}],
		{gg,$couplings}]+
	Sum[Sum[alf[gg][mu]*Coefficient[adm00,Coup[gg]C6[i2]MAT[i1]]CD6[i2][mu],{i2,$JJ}],
		{gg,$couplings}]
	),
{i1,$JJ}]}];


repccd=MapThread[Rule,{Derivative[1][#][mu]&/@WW00,Table[dxdmu[i],{i,0,Length[WW00]-1}]}];


repccx=MapThread[Rule,{#[mu]&/@WW00,Table[x[i],{i,0,Length[WW00]-1}]}];


Print[CForm[#]]&/@(Factor[#2&@@@Flatten[CC00]/.repccd/.repccx]/.{
alf["g1"][mu]->alfa[1,mu],alf["g2"][mu]->alfa[2,mu],
alf["yt"][mu]->x[7]
})


ICS00=#[\[CapitalLambda]]==0&/@WW00;
ICS00=ICS00/.Equal[CD6[1,1][\[CapitalLambda]],0]->Equal[CD6[1,1][\[CapitalLambda]],1]


system=Join[{
Sequence@@Flatten[CC00/.{alf->alfa,yb->0,yc->0,ytau->0}],
Sequence@@ICS00,
alfa["yt"]'[mu]==alfa["yt"][mu]/(2*Pi*mu)(9./2.alfa["yt"][mu]-17./12.alfa["g1"][mu]-9./4.alfa["g2"][mu]-
	8alfa["g3"][mu]),
alfa["yt"][MZ]==(Sqrt[2.0]*MTMZ/246.22)^2/(4*Pi)}]//Simplify;


{time,sol}=NDSolve[system,
Join[{alfa["yt"]},WW00],
{mu,700.,\[CapitalLambda]},InterpolationOrder->1]//AbsoluteTiming;
