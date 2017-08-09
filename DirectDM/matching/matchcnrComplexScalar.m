(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


CNRMAT/:CNRMAT["C","p"]=CNRMATpC;
CNRMAT/:CNRMAT["C","n"]=CNRMATnC;


CNRMATpC=ConstantArray[0,{15,BasisDim["3Flavor"]}];
CNRMATnC=ConstantArray[0,{15,BasisDim["3Flavor"]}];


(* ----------------------------------------------------------------- *
 *  Set the row for cNR_1
 * ----------------------------------------------------------------- *)
Block[{cnr}, cnr = 1;
	(* -------------------------------------------------------------- *)
  (*  Flavor dependent Wilson coefficients                         *)
	(* -------------------------------------------------------------- *)
  Do[
		(CNRMATpC[[cnr,#]] = 2*MX*CNRMATp[[cnr,#]]) &@ Q63[1,flav];
		(CNRMATnC[[cnr,#]] = 2*MX*CNRMATn[[cnr,#]]) &@ Q63[1,flav];
		(CNRMATpC[[cnr,#]] =      CNRMATp[[cnr,#]]) &@ Q73[5,flav];
		(CNRMATnC[[cnr,#]] =      CNRMATn[[cnr,#]]) &@ Q73[5,flav];
  	,{flav,{"u","d","s"}}];
	(* ------------------------------------------------------------ *)
	(CNRMATpC[[cnr,#]] = CNRMATp[[cnr,#]]) &@ Q73[1];
	(CNRMATnC[[cnr,#]] = CNRMATn[[cnr,#]]) &@ Q73[1];
]


(* ------------------------------------------------------------------ *
 *  Set the row for cNR_7
 * ------------------------------------------------------------------ *)
Block[{cnr}, cnr = 7;
  Do[
	   (CNRMATpC[[cnr,#]] = 2*MX*CNRMATp[[cnr,#]]) &@ Q63[3,flav];
	   (CNRMATnC[[cnr,#]] = 2*MX*CNRMATn[[cnr,#]]) &@ Q63[3,flav];
    ,{flav,{"u","d","s"}}];
]


(* ------------------------------------------------------------------ *
 *  Set the row for cNR_10
 * ------------------------------------------------------------------ *)
Block[{cnr,tmpp,tmpn}, cnr = 10;
	(* ---------------------------------------------------------------- *)
  (*  Flavor dependent Wilson coefficients                            *)
	(* ---------------------------------------------------------------- *)
  Do[
		(CNRMATpC[[cnr,#]] = CNRMATp[[cnr,#]]) &@ Q73[7,flav];
		(CNRMATnC[[cnr,#]] = CNRMATn[[cnr,#]]) &@ Q73[7,flav];
  	,{flav,{"u","d","s"}}];
	(* ---------------------------------------------------------------- *)
	(CNRMATpC[[cnr,#]] = CNRMATp[[cnr,#]]) &@ Q73[3];
	(CNRMATnC[[cnr,#]] = CNRMATn[[cnr,#]]) &@ Q73[3];
]


End[]


EndPackage[]
