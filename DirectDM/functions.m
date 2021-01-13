(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


dmtypes = {"D","M","C","R"};


MatchingScale[basis_]:=Switch[basis,"5Flavor","MZ","4Flavor","MB","3Flavor","2GeV"];


DMTypeString[type_] := 
 Switch[type, "D", "Dirac Fermion", "M", "Majorana Fermion", "C", "Complex Scalar", 
  "R", "Real Scalar"];


SetDMType[type_]:=Module[{},
	If[! StringMatchQ[type, dmtypes],
		Print["Input is not valid. Choices are \"D\", \"M\", \"C\", and \"R\"."];Return[],
		$DMType=type; Print["Set DM type to " <> DMTypeString[type]]
	];
];


SetDMMass[mx_]:=Module[{},$MChi = mx;];


SetDMHypercharge[hyp_]:=Module[{},
	$YX = hyp;
];

SetDMIsospin[iso_]:=Module[{},
	If[Mod[iso,0.5]!=0.,
		Print["The DM weak isospin must be a integer multiple of 1/2"]; Abort[],
		$IX = iso;
		$DX = 2*iso+1;
		$JX = iso*(iso+1);
	];
];


SetScale[scale_]:=Module[{}, $Lambda = scale;];


n/:n["u"]=0; n/:n["d"]=1; n/:n["s"]=2;

(*
flavors = {"u","d","s","c","b","t"};
*)


quarks  = {"u","d","s","c","b","t"};
leptons = {"e","mu","tau"};


ui[gen_] := Switch[gen,1,"u",2,"c",3,"t"];
di[gen_] := Switch[gen,1,"d",2,"s",3,"b"];
li[gen_] := Switch[gen,1,"e",2,"mu",3,"tau"];


flavors[nf_] := Switch[nf,\
	(* In the 6Flavor basis, the flavor index is the generation index *)
	6, {1,2,3},
	5, {"u","d","s","c","b","e","mu","tau"},
	4, {"u","d","s","c",    "e","mu","tau"},
	3, {"u","d","s",        "e","mu","tau"}]


Module[{idx},
	(* Assign the quark indices from 0..5 *)
  idx=0;
  Do[fnum/:fnum[NF_,f] = idx; idx++, {f,quarks}];
	(* Assign the leptons indices from NF..(NF+3) *)
	idx=0;
  Do[fnum/:fnum[NF_,f] = NF + idx; idx++, {f,leptons}];
]


(* -------------------------------------------------------------------------- * 
 *  Translate the Majorana basis to the Dirac DM basis                        * 
 * -------------------------------------------------------------------------- *)
TranslateMajorana[basis_,coeff_,value_] := Module[{number,flavor,tmp,trcoeff,dim},
	dim = ToExpression@StringDrop[ToString@Head[coeff],1];
	tmp = # /. Head[#] -> List &@ coeff;
	If[Length[tmp]==2, {number, flavor} = tmp, {number} = tmp];
	(* ------------------------------------------------------------------------ * 
	 *  Check that the user didn't try to set Q5, Q6[1,_], or Q6[3,_]
 	 * ------------------------------------------------------------------------ *)
	If[dim==5 || (dim==6 && MemberQ[{1,3},number]),
		Print["The dipole operators and the vector current vanish for a Majoranan Fermion. \
Please enter a valid operator."];Abort[]];
	Return[{basis, coeff, value}];
]


(* -------------------------------------------------------------------------- * 
 *  Translate the scalar DM basis to the Dirac DM basis                       * 
 * -------------------------------------------------------------------------- *)
TranslateComplex[basis_,coeff_,value_] := Module[{number,flavor,tmp,trcoeff},
	tmp = # /. Head[#] -> List &@ coeff;
	If[Length[tmp]==2, {number, flavor} = tmp, {number} = tmp];
	trcoeff = Switch[number,
		1, Q6[1,flavor], 3, Q7[5,flavor], 5, Q7[1], 7, Q7[11],
		2, Q6[3,flavor], 4, Q7[7,flavor], 6, Q7[3], 8, Q7[13]];
	Return[{basis, trcoeff, value}];
]


(* -------------------------------------------------------------------------- * 
 *  Translate the real scalar basis to the complex scalar DM basis            * 
 * -------------------------------------------------------------------------- *)
TranslateReal[basis_,coeff_,value_] := Module[{number,flavor,tmp,trcoeff,dim},
	dim = ToExpression@StringDrop[ToString@Head[coeff],1];
	tmp = # /. Head[#] -> List &@ coeff;
	If[Length[tmp]==2, {number, flavor} = tmp, {number} = tmp];
	(* ------------------------------------------------------------------------ * 
	 *  The input has already been validated so no need to check again
 	 * ------------------------------------------------------------------------ *)
	If[Length[tmp]==2, {number, flavor} = tmp, {number} = tmp];
	trcoeff = Switch[number,
		3, Q7[5,flavor], 5, Q7[1], 7, Q7[11],
		4, Q7[7,flavor], 6, Q7[3], 8, Q7[13]];
	Return[{basis, trcoeff, value}];
]


ValidateCoeff[basis_, coeff_] := Module[{tmp01,tmp02,d,i,f,flag,
	ChkOpDim,ChkOpInd,ChkOpNam,MsgOpNam,MsgOpInd,MsgOpDim},
	MsgOpNam = "The operator name is not valid.";
	MsgOpDim = "The operator dimension is not valid.";
	MsgOpInd = "The operator index is not valid.";
	MsgOpFlv = "The flavor index is not valid.";
  (* ------------------------------------------------------------------------ *
	 *  Make a string from the Head of coeff[]                                  *
 	 * ------------------------------------------------------------------------ *)
	tmp01 = ToString@Head[coeff];
  (* ------------------------------------------------------------------------ *
	 * Check that operator name starts with Q and has one number (dim)          *
 	 * ------------------------------------------------------------------------ *)
	If[!StringMatchQ[tmp01, RegularExpression["Q[567]"]], Print[MsgOpNam]; Abort[]];
  (* ------------------------------------------------------------------------ *
	(* Extract the operator dimension, index, and flavor *)
 	 * ------------------------------------------------------------------------ *)
	tmp02 = Join[{ToExpression@StringDrop[tmp01,1]},{##} &@@ coeff];
  (* ------------------------------------------------------------------------ *
	 *  Check that the operator has at least one argument, the index            *
 	 * ------------------------------------------------------------------------ *)
	If[Length@tmp02 < 2,
		Print["The operator should have at least one argument: an index."]; Abort[]];
	d = tmp02[[1]]; i = tmp02[[2]]; If[Length@tmp02>2, f = tmp02[[3]]];
	(*Return[{tmp01,d, tmp02}];*)
	If[$DMType === "D", ChkOpInd = Switch[d,
		(* NOTE: Input checking for the DMEFT basis is not fully implemented!! *)
		5, If[basis==="6Flavor",MemberQ[Range[8],i],MemberQ[{1,2},i]],
		6, If[basis==="6Flavor",MemberQ[Range[18],i],MemberQ[Range[4],i]],
		7, MemberQ[Join[Range[1,10],{23,25}],i],
		_, ChkOpDim = False;]
	];
	If[$DMType === "M", ChkOpInd = Switch[d,
		6, MemberQ[{2,4},i],
		7, MemberQ[Join[Range[1,8],{23,25}],i],
		_, ChkOpDim = False;]
	];
	If[$DMType === "C", ChkOpInd = Switch[d,
		6, MemberQ[Range[1,8],i],
		_, ChkOpDim = False;]
	];
	If[$DMType === "R", ChkOpInd = Switch[d,
		6, MemberQ[Range[3,8],i],
		_, ChkOpDim = False;]
	];
  (* ------------------------------------------------------------------------ *
	 *  Now handle the flags
 	 * ------------------------------------------------------------------------ *)
	If[!ChkOpDim, Print[MsgOpDim]; Abort[]];
	If[!ChkOpInd, Print[MsgOpInd]; Abort[]];
  (* ------------------------------------------------------------------------ *
	 *  If all is good, check the flavor index
	 *  Warning: needs to be augmented to check if the operator takes a flavor
	 * 					 index
 	 * ------------------------------------------------------------------------ *)
	ChkOpFlv = True;
	If[Length[tmp02]>=3,ChkOpFlv = 
		If[basis==="6Flavor",MemberQ[{1,2,3},f],
			MemberQ[flavors[NumFlavors[basis]], f]];
	If[!ChkOpFlv, Print[MsgOpFlv]; Abort[]];];
]


SetCoeff[btmp_,coeff_,value_] := Module[{tmp1,basis},
	If[btmp==="DMEFT",basis="6Flavor",basis=btmp];
	ValidateCoeff[basis,coeff];
	Switch[$DMType, 
		"D", SetCoeffInt[basis,coeff,value],
		"C", SetCoeffInt[##]&@@TranslateComplex[basis,coeff,value],
		"M", SetCoeffInt[##]&@@TranslateMajorana[basis,coeff,value],
		"R", SetCoeffInt[##]&@@TranslateReal[basis,coeff,value]
	];
];


SetCoeffInt[btmp_,coeff_,value_]:=Module[{tmp1, tmp2, basis},
	If[btmp==="DMEFT",basis="6Flavor",basis=btmp];
	tmp1 = CoeffsListInt[basis];
  If[NumericQ[coeff],
    tmp2 = coeff,
    tmp2 = (Head[#][basis]@(#/.Head[#]->Sequence)) &@ coeff];
	tmp1[[tmp2]] = value;
	CoeffsListInt[basis] = tmp1;
]


NumFlavors[basis_] := Switch[basis, "6Flavor", 3, "5Flavor", 5, "4Flavor", 4, "3Flavor", 3];


CoeffsList[basis_] := If[StringMatchQ[basis,{"NR_p","NR_n"}], CoeffsListInt[basis],
	Switch[$DMType,
		"D", CoeffsListInt[basis],
		"M", 	Join[
			Flatten@Table[GetCoeff[basis, Q6[i,f]],
				{i,{2,4}}, {f, flavors[NumFlavors[basis]]}], 
			Table[GetCoeff[basis, Q7[i]], {i,1,4}],
			Flatten@Table[GetCoeff[basis, Q7[i,f]],
				{i,5,8}, {f, flavors[NumFlavors[basis]]}]
		],
		"C", 	Join[
			Flatten@Table[GetCoeff[basis, Q6[i,f]],
				{i,1,4}, {f, flavors[NumFlavors[basis]]}], 
			Table[GetCoeff[basis, Q6[i]], {i,5,8}]],
		"R", 	Join[
			Flatten@Table[GetCoeff[basis, Q6[i,f]],
				{i,3,4}, {f, flavors[NumFlavors[basis]]}], 
			Table[GetCoeff[basis, Q6[i]], {i,5,8}]]
	]
];


GetCoeff[btmp_,coeff_]:= Module[{tmp,tmpcoeff,basis},
	If[btmp==="DMEFT",basis="6Flavor",basis=btmp];
	If[basis === "NR_p" || basis === "NR_n",
	Return[CoeffsListInt[basis][[coeff]]],
	ValidateCoeff[basis,coeff];
	tmpcoeff = Switch[$DMType,"D",coeff,
		"M",TranslateMajorana[basis,coeff,1][[2]],
		"C",TranslateComplex[basis,coeff,1][[2]],
		"R",TranslateReal[basis,coeff,1][[2]]];
	tmp = (Head[#][basis]@(#/.Head[#]->Sequence)) &@ tmpcoeff;
	Return[CoeffsListInt[basis][[tmp]]]]
]


ResetBasis[btmp_] := Module[{basis},
	If[btmp==="DMEFT",basis="6Flavor",basis=btmp];
  CoeffsListInt[basis] = ConstantArray[0,BasisDim[basis]];
]


BasisID/:BasisID["NR"] 			= 0;
BasisID/:BasisID["3Flavor"] = 1;
BasisID/:BasisID["4Flavor"] = 6;
BasisID/:BasisID["5Flavor"] = 9;
BasisID/:BasisID["6Flavor"] = 13;


(* By default, matching at LO in q^2 expansion *)
Options[ComputeCoeffs] = {Running->True, NLO->False};

EvolutionMatrix[ bit_, runtf_, NLORep_] := Module[{UMat,RMat},
  (* ------------------------------------------------------------------------ *)
	(* RMat[BasisID["3Flavor"]] = RTMP[3, "3GeV", "2GeV"]; *)
	(* No running in the 3Flavor basis -- match 4->3 at 2GeV *)
	RMat[BasisID["3Flavor"]] = IdentityMatrix[BasisDim["3Flavor"]];
	RMat[BasisID["4Flavor"]] = RTMP[4, "MB",   "2GeV"];
	RMat[BasisID["5Flavor"]] = RTMP[5, "MZ",   "MB" ];
	(* For now, no running in the 6 flavor basis -- tie in the RUNEW *)
	RMat[BasisID["6Flavor"]]   = IdentityMatrix[BasisDim["6Flavor"]];
	Switch[ bit,
		26, UMat = If[runtf, RMat[13], IdentityMatrix[BasisDim["6Flavor"]]],
		22, UMat = If[runtf, MATEW.RMat[13], MATEW],
		19, UMat = If[runtf, MAT45.RMat[9].MATEW.RMat[13], MAT45.MATEW],
		18, UMat = If[runtf, RMat[9], IdentityMatrix[BasisDim["5Flavor"]]],
		15, UMat = If[runtf, MAT45.RMat[9], MAT45],
		14, UMat = If[runtf, MAT34.RMat[6].MAT45.RMat[9].MATEW.RMat[13], MAT34.MAT45.MATEW],
		12, UMat = If[runtf, RMat[6], IdentityMatrix[BasisDim["4Flavor"]]],
		10, UMat = If[runtf, MAT34.RMat[6].MAT45.RMat[9], MAT34.MAT45],
		 7, UMat = If[runtf, MAT34.RMat[6], MAT34],
		 2, UMat = If[runtf, RMat[1], IdentityMatrix[BasisDim["3Flavor"]]],
		(* ----------------------------------------------------------------------- * 
     *  The following cases end in the NR basis, must treat p & n separately
		 * ----------------------------------------------------------------------- *)
		13, UMat = If[runtf, RMat[1].MAT34.RMat[6].MAT45.RMat[9].MATEW.RMat[13], MAT34.MAT45.MATEW],
		 9, UMat = If[runtf, RMat[1].MAT34.RMat[6].MAT45.RMat[9], MAT34.MAT45],
		 6, UMat = If[runtf, RMat[1].MAT34.RMat[6], MAT34],
		 1, UMat = If[runtf, RMat[1], IdentityMatrix[BasisDim["3Flavor"]]],
		 0, UMat = IdentityMatrix[BasisDim["NR"]]; Print["Both the initial and final bases\
are the NR EFT basis.\nThere is nothing to do. The evolution matrix is the Identity."];
	];
	Return[UMat];
]


ComputeCoeffs[basi_, basf_, OptionsPattern[]] := Module[
	{bi,bf,tmpp,tmpn, c75tmp, UMat, RMat, runtf, mult, NLORep, deltmp, del56i,mxtmp},
	runtf = OptionValue[Running];
  (* Make a replacement list to turn off/on the NLO option for NR basis *)
  NLORep=Switch[OptionValue[NLO],False,{$NLO->0},True,{$NLO->1}];
	bi = BasisID[basi];
	bf = BasisID[basf];
  (* ------------------------------------------------------------------------ *)
	If[ bi < bf, Print["Running and matching are only implemented\n\
from a high to a low scale at the moment."]; Abort[];];
	(* ------------------------------------------------------------------------ *
 	 *  Now treat the gauge contribution to the matching at MZ (inc. twist-2)  
 	 * ------------------------------------------------------------------------ *)
	If[ (bi==13)&&(bf < 13), 
		Block[{tmp66,tmp56,tmpI5,ctmp5},
			(* -------------------------------------------------------------------- *
 	 		 *  [1] Do the running in the 6 flavor basis first
 	 		 * -------------------------------------------------------------------- *)
			tmp66 = EvolutionMatrix[13+13,runtf,NLORep];
			(* -------------------------------------------------------------------- *
 	 		 *  [2] Shift the DM mass
 	 		 * -------------------------------------------------------------------- *)
			SetDMMass[$MChi-MZ^2*CW2MZ*SW2MZ/(2*Pi*\[Alpha]emMZ*$Lambda)*\
					(GetCoeff["6Flavor",Q5[3]]+$YX/4*GetCoeff["6Flavor",Q5[4]])];
			(* -------------------------------------------------------------------- *
 	 		 *  [3] Shift the dimension 5 Wilson coefficients
 	 		 * -------------------------------------------------------------------- *)
			deltmp = (CW2MZ*MZ^2*SW2MZ)/(2*Pi*\[Alpha]emMZ*$Lambda*$MChi)*\
				(GetCoeff["6Flavor",Q5[7]] + $YX/4*GetCoeff["6Flavor",Q5[8]]);
			del56i[i_] := deltmp*GetCoeff["6Flavor",Q5[If[i<=4,i+4,i-4]]];
			Do[SetCoeff["6Flavor",Q5[i],GetCoeff["6Flavor",Q5[i]]+If[i<=4,1,-1]*del56i[i]],{i,{3,4,7,8}}];
			(* -------------------------------------------------------------------- *
 	 		 *  [4] Match from NF=6 to NF=5; no running!
 	 		 * -------------------------------------------------------------------- *)
			tmp56 = EvolutionMatrix[13+9,False,NLORep];
			(* --- 5 flavor > final    --- *)
			tmpI5 = EvolutionMatrix[9+bf,runtf,NLORep];
			CoeffsListInt["5Flavor"] = tmp56.tmp66.CoeffsListInt[basi];
			(* --- Gauge contribution to the matching --- *)
			Do[
				SetCoeff["5Flavor",Q7[5,fl], GetCoeff["5Flavor",Q7[5,fl]] + DeltaC75[$MChi,fl]];
				SetCoeff["5Flavor",Q6[4,fl], GetCoeff["5Flavor",Q6[4,fl]] + DeltaC64[$MChi,fl]], 
				{fl,flavors[5]}];
			Do[SetCoeff["5Flavor",Q7[23,fl],
				GetCoeff["5Flavor",Q7[23,fl]] + DeltaC723[$MChi,fl]],{fl,quarks[[;;5]]}];
			SetCoeff["5Flavor",Q7[1], GetCoeff["5Flavor",Q7[1]] + DeltaC71[$MChi]]; 
			If[ bf != 0,
				CoeffsListInt[basf] = tmpI5.CoeffsListInt["5Flavor"];,
				CoeffsListInt["NR_p"] = CNRMAT[$DMType,"p"].tmpI5.CoeffsListInt["5Flavor"]/.NLORep;
				CoeffsListInt["NR_n"] = CNRMAT[$DMType,"n"].tmpI5.CoeffsListInt["5Flavor"]/.NLORep;
			]
		],
 	(* ------------------------------------------------------------------------ *)
	UMat = EvolutionMatrix[bi+bf,runtf,NLORep];
	If[ bf != 0,
		CoeffsListInt[basf] = UMat.CoeffsListInt[basi];,
		CoeffsListInt["NR_p"] = CNRMAT[$DMType,"p"].UMat.CoeffsListInt[basi]/.NLORep;
		CoeffsListInt["NR_n"] = CNRMAT[$DMType,"n"].UMat.CoeffsListInt[basi]/.NLORep;
	]
	];
	CoeffsListInt[basf] = Chop[CoeffsListInt[basf]];
]



(* -------------------------------------------------------------------------- *
 *  The coefficients of the QCD beta function. The overvall normalization
 *  follows Appendix A in [1409.8290] by Hill and Solon.
 * -------------------------------------------------------------------------- *)
bet[0][nf_] := 11 - 2/3*nf;
bet[1][nf_] := 102 - 38/3*nf;
bet[2][nf_] := 2857/2 - 5033/18*nf + 325/54*nf^2;
bet[3][nf_] := 149753/6 + 3564*Zeta[3] - (1078361/162 + 6508/27*Zeta[3])*nf+\
  (50065/162 + 6472/81*Zeta[3])*nf^2 + 1093/729*nf^3;


(* -------------------------------------------------------------------------- *
 *  The coefficients of the mass anomalous dimensions. The overvall
 *  normalization follows Appendix A in [1409.8290] by Hill and Solon.
 * -------------------------------------------------------------------------- *)
gam[0][nf_] := 8;
gam[1][nf_] := 404/3 - 40/9*nf;
gam[2][nf_] := 2498 - (4432/27 + 320/3*Zeta[3])*nf - 280/81*nf^2;
gam[3][nf_] := 4603055/81 + 271360/27*Zeta[3] - 17600*Zeta[5] + \
  (-183446/27 - 68384/9*Zeta[3] + 1760*Zeta[4] + 36800/9*Zeta[5])*nf + \
  (10484/243 + 1600/9*Zeta[3] - 320/3*Zeta[4])*nf^2 + \
  (-664/243 + 128/27*Zeta[3])*nf^3;


(* -------------------------------------------------------------------------- *
 *  Now define the two functions in Eq. (108) of App. A in [1409.8290]
 *  OverTilde[\[Beta]] = dLog[\[Beta]]/dLog[\[Mu]] and
 *  \[Gamma]m = dLog[m_q]/dLog[\[Mu]]
 * -------------------------------------------------------------------------- *)
betilde[nf_, as_] := - Sum[ bet[i][nf]*( as / (4\[Pi]) )^(i+1), {i,0,3}];
gammamq[nf_, as_] := - Sum[ gam[i][nf]*( as / (4\[Pi]) )^(i+1), {i,0,3}];


as1l[al0_, mu0_, muf_, nf_] := al0/(1 + al0*(11 - 2/3 nf)/(2 \[Pi]) Log[muf/mu0]);


as2l[al0_, mu0_, muf_, nf_] := 
 al[Log[muf]] /. 
  Flatten@NDSolve[{1/(2 al[logmu]) al'[logmu] == -b0[nf]*
        al[logmu]/(4 \[Pi]) - b1[nf]*(al[logmu]/(4 \[Pi]))^2, 
     al[Log[mu0]] == al0}, al, {logmu, Log[mu0], Log[muf]}];

AlphaS["MB"]   = as1l[AlphaS["MZ"]  , MZ, MBatMBms, 5];
AlphaS["2GeV"] = as1l[AlphaS["MB"]  , MBatMBms, 2, 4];
AlphaS["MC"]   = as1l[AlphaS["MB"]  , MBatMBms, MCatMCms, 4];

(* -------------------------------------------------------------------------- * 
 *  Quark masses at matching scales at all other scales are obtained by       *
 *  one-loop running with the appropriate number of active flavors            *
 * -------------------------------------------------------------------------- *)
mq1l[flav_,mu0_,muf_,nf_] := MQ[flav,mu0]*(AlphaS[muf]/AlphaS[mu0])^(4/bet[0][nf]);

MQ["u","MB"] = mq1l["u", "2GeV", "MB", 4];
MQ["d","MB"] = mq1l["d", "2GeV", "MB", 4];
MQ["s","MB"] = mq1l["s", "2GeV", "MB", 4];
MQ["c","MB"] = mq1l["c", "MC"  , "MB", 4];

MQ["u","MZ"] = mq1l["u", "MB", "MZ", 5];
MQ["d","MZ"] = mq1l["d", "MB", "MZ", 5];
MQ["s","MZ"] = mq1l["s", "MB", "MZ", 5];
MQ["c","MZ"] = mq1l["c", "MB", "MZ", 5];
MQ["b","MZ"] = mq1l["b", "MB", "MZ", 5];
(* -------------------------------------------------------------------------- *
 *  The coefficients of the SU(2)_L and U(1)_Y beta functions.
 *  References: 
 * -------------------------------------------------------------------------- *)
bet["g1",0] := -41.0/6.0-$YX^2/3.0*$DX;
bet["g2",0] := +19.0/6.0-4.0/9.0*$JX*$DX;


End[]


EndPackage[]
