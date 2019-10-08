(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


(* -------------------------------------------------------------------------- *
 *  N.B. Every basis definition should include the following function:
 *    BasisDim["basis"] = dimensionality of basis
 * -------------------------------------------------------------------------- *)
NG = 3;
NFlavorI = 14; NFlavor0 = 4;
ND5 = 8; ND6 = NFlavorI*NG + NFlavor0;


BasisDim["6Flavor"] = ND5+ND6;


ResetBasis["6Flavor"];


Q56D/:Q56D = Q5["6Flavor"];
Q66D/:Q66D = Q6["6Flavor"];


(* Clear[Q5] *)
Do[Q5/:Q5["6Flavor"][i] = i,{i,ND5}];


(* Clear[Q6] *)
Do[Q6/:Q6["6Flavor"][i,j] = ND5+NG*(i-1)+j,{i,NFlavorI},{j,NG}]
Do[Q6/:Q6["6Flavor"][NFlavorI+i] = ND5+NFlavorI*NG+i,{i,NFlavor0}]


End[]


EndPackage[]

