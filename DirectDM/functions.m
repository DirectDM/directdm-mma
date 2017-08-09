(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


(* By default, the DM is an isospin singlet *)
\[ScriptCapitalJ]\[Chi] = 0;


(* By default, the DM is a Dirac fermion *)
$DMType= "D";


dmtypes = {"D","M","S","C"};


MatchingScale[basis_]:=Switch[basis,"5Flavor","MZ","4Flavor","MB","3Flavor","2GeV"];


DMTypeString[type_] := 
 Switch[type, "D", "Dirac", "M", "Majorana", "C", "'Complex Scalar'", 
  "S", "'Real Scalar'"];


SetDMType[type_]:=Module[{},
	If[! StringMatchQ[type, dmtypes],
		Print["Input is not valid. Choices are \"D\", \"M\", \"C\", and \"S\"."];Return[],
		$DMType=type; Print["Set DM type to " <> DMTypeString[type]]
	];
];


n/:n["u"]=0; n/:n["d"]=1; n/:n["s"]=2;

(*
flavors = {"u","d","s","c","b","t"};
*)


quarks = {"u","d","s","c","b","t"};


flavors[nf_] := Switch[nf,\
	6, {"u","d","s","c","b","t","e","mu","tau"},
	5, {"u","d","s","c","b",    "e","mu","tau"},
	4, {"u","d","s","c",        "e","mu","tau"},
	3, {"u","d","s",            "e","mu","tau"}]


Module[{idx},
	(* Assign the quark indices from 0..5 *)
  idx=0;
  Do[fnum/:fnum[NF_,f] = idx; idx++, {f,flavors[6][[;;6]]}];
	(* Assign the leptons indices from NF..(NF+3) *)
	idx=0;
  Do[fnum/:fnum[NF_,f] = NF + idx; idx++, {f,flavors[6][[7;;]]}];
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
	Return[{basis, coeff, 2*value}];
]


(* -------------------------------------------------------------------------- * 
 *  Translate the scalar DM basis to the Dirac DM basis                       * 
 * -------------------------------------------------------------------------- *)
TranslateComplex[basis_,coeff_,value_] := Module[{number,flavor,tmp,trcoeff},
	tmp = # /. Head[#] -> List &@ coeff;
	If[Length[tmp]==2, {number, flavor} = tmp, {number} = tmp];
	trcoeff = Switch[number,
		1, Q6[1,flavor], 3, Q7[5,flavor], 5, Q7[1],
		2, Q6[3,flavor], 4, Q7[7,flavor], 6, Q7[3]];
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
	 * Make a list with the arguments of coeff[]                                *
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
		5, MemberQ[{1,2},i],
		6, MemberQ[Range[1,4],i],
		7, MemberQ[Range[1,10],i],
		_, ChkOpDim = False;]
	];
	If[$DMType === "M", ChkOpInd = Switch[d,
		6, MemberQ[{2,4},i],
		7, MemberQ[Range[1,8],i],
		_, ChkOpDim = False;]
	];
	If[$DMType === "C", ChkOpInd = Switch[d,
		6, MemberQ[Range[1,6],i],
		_, ChkOpDim = False;]
	];
	If[$DMType === "R", ChkOpInd = Switch[d,
		6, MemberQ[Range[1,4],i],
		_, ChkOpDim = False;]
	];
  (* ------------------------------------------------------------------------ *
	 *  Now handle the flags
 	 * ------------------------------------------------------------------------ *)
	If[!ChkOpDim, Print[MsgOpDim]; Abort[]];
	If[!ChkOpInd, Print[MsgOpInd]; Abort[]];
  (* ------------------------------------------------------------------------ *
	 *  If all is good, check the flavor index
 	 * ------------------------------------------------------------------------ *)
	ChkOpFlv = MemberQ[flavors[NumFlavors[basis]], f];
	If[!ChkOpFlv, Print[MsgOpFlv]; Abort[]];
]


SetCoeff[basis_,coeff_,value_] := Module[{tmp1},
	ValidateCoeff[basis,coeff];
	Switch[$DMType, 
		"D", SetCoeffInt[basis,coeff,value],
		"C", SetCoeffInt[##]&@@TranslateComplex[basis,coeff,value],
		"M", SetCoeffInt[##]&@@TranslateMajorana[basis,coeff,value]
	];
];


SetCoeffInt[basis_,coeff_,value_]:=Module[{tmp1, tmp2},
	tmp1 = CoeffsListInt[basis];
  If[NumericQ[coeff],
    tmp2 = coeff,
    tmp2 = (Head[#][basis]@(#/.Head[#]->Sequence)) &@ coeff];
	tmp1[[tmp2]] = value;
	CoeffsListInt[basis] = tmp1;
]


NumFlavors[basis_] := Switch[basis, "5Flavor", 5, "4Flavor", 4, "3Flavor", 3];


CoeffsList[basis_] := If[StringMatchQ[basis,{"NR_p","NR_n"}], CoeffsListInt[basis],
	Switch[$DMType,
		"D", CoeffsListInt[basis],
		"M", CoeffsListInt[basis],
		"C", 	Join[
			Flatten@Table[GetCoeff[basis,#2]&@@TranslateComplex[basis, Q6[i,f], 1],
				{i,1,4}, {f, flavors[NumFlavors[basis]]}], 
			Table[GetCoeff[basis,#2]&@@TranslateComplex[basis, Q6[i], 1], {i,5,6}],
			{0,0}
		]
	]
];


GetCoeff[basis_,coeff_]:= Module[{tmp},
	If[basis === "NR_p" || basis === "NR_n",
	Return[CoeffsListInt[basis][[coeff]]],
	tmp = (Head[#][basis]@(#/.Head[#]->Sequence)) &@ coeff;
	Return[CoeffsListInt[basis][[tmp]]]]
]


ResetBasis[basis_] := Module[{},
  CoeffsListInt[basis] = ConstantArray[0,BasisDim[basis]];
]


(* ------------------------------------------------------------------ *
 *  Matching correction due to EW gauge interactions
 * ------------------------------------------------------------------ *)
f[mx_, mw_: 80.385] := 
 Module[{xi}, xi = mw^2/mx^2; 
  Sqrt[xi]/2 (4 + (2 (-4 + xi^2) ArcTanh[Sqrt[(-4 + xi)/xi]])/ \
     Sqrt[(-4 + xi) xi] - 2 xi Log[xi] +  \
     Sqrt[(-4 + xi) xi] Log[1/2 (-2 + xi + Sqrt[(-4 + xi) xi])])]

\[Delta]C75 = (Sqrt[4 \[Pi]*\[Alpha]emMZ] \[Alpha]emMZ)/(
  2 \[Pi]*sw^3 \[Lambda]*vev^3) \[ScriptCapitalJ]\[Chi]*f[MX];


BasisID/:BasisID["NR"] 			= 0;
BasisID/:BasisID["3Flavor"] = 1;
BasisID/:BasisID["4Flavor"] = 6;
BasisID/:BasisID["5Flavor"] = 9;


Options[ComputeCoeffs] = {Running->True};


ComputeCoeffs[basi_, basf_, OptionsPattern[]] := Module[
	{bi,bf,tmpp,tmpn, c75tmp, UMat, RMat, runtf},
	runtf = OptionValue[Running];
	bi = BasisID[basi];
	bf = BasisID[basf];
  (* ------------------------------------------------------------------------ *)
	If[ bi < bf, Print["Running and matching are only implemented\n\
from a high to a low scale at the moment."]; Abort[];];
  (* ------------------------------------------------------------------------ *)
	(* RMat[BasisID["3Flavor"]] = RTMP[3, "3GeV", "2GeV"]; *)
	(* No running in the 3Flavor basis -- match 4->3 at 2GeV *)
	RMat[BasisID["3Flavor"]] = IdentityMatrix[BasisDim["3Flavor"]];
	RMat[BasisID["4Flavor"]] = RTMP[4, "MB",   "2GeV"];
	RMat[BasisID["5Flavor"]] = RTMP[5, "MZ",   "MB" ];
	If[ bi==9 && \[ScriptCapitalJ]\[Chi] != 0,
		Do[c75tmp = GetCoeff["5Flavor", Q7[5,fl]];
			SetCoeff["5Flavor",Q7[5,fl], c75tmp + \[Delta]C75];,
			{fl,flavors[5][[;;5]]}]
	];
  (* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
	Switch[ bi+bf,
		18, UMat = If[runtf, RMat[9], IdentityMatrix[BasisDim["5Flavor"]]],
		15, UMat = If[runtf, MAT45.RMat[9], MAT45],
		12, UMat = If[runtf, RMat[6], IdentityMatrix[BasisDim["4Flavor"]]],
		10, UMat = If[runtf, MAT34.RMat[6].MAT45.RMat[9], MAT34.MAT45],
		 7, UMat = If[runtf, MAT34.RMat[6], MAT34],
		 2, UMat = If[runtf, RMat[1], IdentityMatrix[BasisDim["3Flavor"]]],
		(* ----------------------------------------------------------------------- * 
     *  The following cases end in the NR basis, must treat p & n separately
		 * ----------------------------------------------------------------------- *)
		 9, UMat = If[runtf, RMat[1].MAT34.RMat[6].MAT45.RMat[9], MAT34.MAT45],
		 6, UMat = If[runtf, RMat[1].MAT34.RMat[6], MAT34],
		 1, UMat = If[runtf, RMat[1], IdentityMatrix[BasisDim["3Flavor"]]],
		 0, UMat = IdentityMatrix[BasisDim["NR"]]; Print["Both the initial and final bases\
are the NR EFT basis.\nThere is nothing to do. The evolution matrix is the Identity."];
	];
  (* ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++ *)
	If[ bf != 0,
		CoeffsListInt[basf] = UMat.CoeffsListInt[basi];,
		(* -------------------------------------------------- *)
		CoeffsListInt["NR_p"] = CNRMAT[$DMType,"p"].UMat.CoeffsListInt[basi];
		CoeffsListInt["NR_n"] = CNRMAT[$DMType,"n"].UMat.CoeffsListInt[basi];
	];
]



SetIChi[IX_] := Module[{}, \[ScriptCapitalJ]\[Chi] = IX(IX+1) ];


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
AlphaS["3GeV"] = as1l[AlphaS["MB"]  , MBatMBms, 3, 4];
AlphaS["2GeV"] = as1l[AlphaS["3GeV"], 3, 2, 3];


End[]


EndPackage[]
