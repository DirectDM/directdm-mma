(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


EvolveD5[vec_,mu_,la_] := Module[{sol},
	If[Length[vec]!=8,Abort[]];
	sol = NDSolve[];
];


End[]


EndPackage[]
