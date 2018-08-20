(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


(* -------------------------------------------------------------------------- *
 *  N.B. Every basis definition should include the following function:
 *    BasisDim["basis"] = dimensionality of basis
 * -------------------------------------------------------------------------- *)
ND6 = 4;

BasisDim["XXEFT"] = ND6;


ResetBasis["XXEFT"];


Q66X/:Q66X = Q6["XXEFT"];


(* Clear[Q6] *)
Do[Q6/:Q6["XXEFT"][i] = BasisDim["DMEFT"]+BasisDim["SMEFT"]+i,{i,ND6}]


End[]


EndPackage[]
