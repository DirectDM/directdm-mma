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


BasisDim["DMEFT"] = ND5+ND6;


ResetBasis["DMEFT"];


Q56D/:Q56D = Q5["DMEFT"];
Q66D/:Q66D = Q6["DMEFT"];


(* Clear[Q5] *)
Do[Q5/:Q5["DMEFT"][i] = i,{i,ND5}];


(* Clear[Q6] *)
Do[Q6/:Q6["DMEFT"][i,j] = ND5+NG*(i-1)+j,{i,NFlavorI},{j,NG}]
Do[Q6/:Q6["DMEFT"][NFlavorI+i] = ND5+NFlavorI*NG+i,{i,NFlavor0}]


End[]


EndPackage[]
