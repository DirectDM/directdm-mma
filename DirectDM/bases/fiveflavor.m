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
BasisDim["5Flavor"] = ND5+ND6+ND7;


ResetBasis["5Flavor"];


Q55/:Q55 = Q5["5Flavor"];
Q65/:Q65 = Q6["5Flavor"];
Q75/:Q75 = Q7["5Flavor"];


(* Clear[Q5] *)
Q5/:Q5["5Flavor"][1] = 1;
Q5/:Q5["5Flavor"][2] = 2;


(* Clear[Q6] *)
Do[Q6/:Q6["5Flavor"][i,j] = LEN*(i-1)+1+ND5+fnum[NF,j],{i,1,4},{j,flavors[NF]}]


(* Clear[Q7] *)
Do[Q7/:Q7["5Flavor"][i] 	= ND5+ND6+i,{i,1,4}]
Do[Q7/:Q7["5Flavor"][i+4,j] = ND5+ND6+4+1+LEN*(i-1)+fnum[NF,j],{i,OP7fl},{j,flavors[NF]}]


End[]


EndPackage[]
