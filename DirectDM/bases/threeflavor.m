(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


(* -------------------------------------------------------------------------- *
 *  N.B. Every basis definition should include the following function:
 *    BasisDim["basis"] = dimensionality of basis
 * -------------------------------------------------------------------------- *)
NF    = 3;
LEN   = Length[flavors[NF]];
OP7fl = 6;
ND5   = 2; ND6 = 4*LEN; ND7 = 4 + OP7fl*LEN;
BasisDim["3Flavor"] = ND5+ND6+ND7;


ResetBasis["3Flavor"];


Q53/:Q53 = Q5["3Flavor"];
Q63/:Q63 = Q6["3Flavor"];
Q73/:Q73 = Q7["3Flavor"];


(* Clear[Q5] *)
Q5/:Q5["3Flavor"][1] = 1;
Q5/:Q5["3Flavor"][2] = 2;


(* Clear[Q6] *)
Do[Q6/:Q6["3Flavor"][i,j] = LEN*(i-1)+1+ND5+fnum[NF,j],{i,1,4},{j,flavors[NF]}]


(* Clear[Q7] *)
Do[Q7/:Q7["3Flavor"][i] 	= ND5+ND6+i,{i,1,4}]
Do[Q7/:Q7["3Flavor"][i+4,j] = ND5+ND6+4+1+LEN*(i-1)+fnum[NF,j],{i,OP7fl},{j,flavors[NF]}]


End[]


EndPackage[]
