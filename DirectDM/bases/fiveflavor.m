(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


(* -------------------------------------------------------------------------- *
 *  N.B. Every basis definition should include the following function:
 *    BasisDim["basis"] = dimensionality of basis
 * -------------------------------------------------------------------------- *)
NF = 5;
LEN   = Length[flavors[NF]];
OP7fl = 6;
ND5 = 2; ND6 = 4*LEN; ND7 = 4 + OP7fl*LEN;
(* -------------------------------------------------------------------------- *
 *  Add the dimension 8 operators required for weak mixing below the weak
 *    scale [1801.04240]
 * -------------------------------------------------------------------------- *)
ND8 = 4*NF;


BasisDim["5Flavor"] = ND5+ND6+ND7+(NF+1)+ND8; (* inc. (NF+1) twist-2 operators *)


ResetBasis["5Flavor"];


Q55/:Q55 = Q5["5Flavor"];
Q65/:Q65 = Q6["5Flavor"];
Q75/:Q75 = Q7["5Flavor"];
Q85/:Q85 = Q8["5Flavor"];
(*T25/:T25 = T2["5Flavor"];*)


(* Clear[Q5] *)
Q5/:Q5["5Flavor"][1] = 1;
Q5/:Q5["5Flavor"][2] = 2;


(* Clear[Q6] *)
Do[Q6/:Q6["5Flavor"][i,j] = LEN*(i-1)+1+ND5+fnum[NF,j],{i,1,4},{j,flavors[NF]}]


(* Clear[Q7] *)
Do[Q7/:Q7["5Flavor"][i] 	= ND5+ND6+i,{i,1,4}]
Do[Q7/:Q7["5Flavor"][i+4,j] = ND5+ND6+4+1+LEN*(i-1)+fnum[NF,j],{i,OP7fl},{j,flavors[NF]}]


(*Do[T2/:T2["5Flavor"][i] = ND5+ND6+ND7+i,{i,1,NF+1}]*)
Do[
	Q7/:Q7["5Flavor"][23,fl] = ND5+ND6+ND7+1+fnum[NF,fl],{fl,quarks[[;;NF]]}
]
	Q7/:Q7["5Flavor"][25] = ND5+ND6+ND7+NF+1;


(* Clear[Q8] *)
Do[Q8/:Q8["5Flavor"][i,j] = ND5+ND6+ND7+(NF+1)+1+NF*(i-1)+fnum[NF,j],{i,4},{j,quarks[[;;NF]]}]


End[]


EndPackage[]
