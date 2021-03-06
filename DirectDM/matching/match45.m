(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


MAT45 = ConstantArray[0,{BasisDim["4Flavor"],BasisDim["5Flavor"]}];


(* ------------------------------------------------------------------ *
 *  The off diagonal contributions
 * ------------------------------------------------------------------ *)
MAT45[[Q74[1],Q75[5,"b"]]] = -1;
MAT45[[Q74[2],Q75[6,"b"]]] = -1;
MAT45[[Q74[3],Q75[7,"b"]]] = +1;
MAT45[[Q74[4],Q75[8,"b"]]] = +1;


(* ------------------------------------------------------------------ *
 *  The 4-flavor block is diagonal
 * ------------------------------------------------------------------ *)
Do[ MAT45[[Q54[i],Q55[i]]] 			= 1, {i,2} ];
Do[ MAT45[[Q64[i,f],Q65[i,f]]] 	= 1, {i,4}, {f,flavors[4]} ];
Do[ MAT45[[Q74[i],Q75[i]]] 			= 1, {i,4} ];
Do[ MAT45[[Q74[i,f],Q75[i,f]]] 	= 1, {i,5,10}, {f,flavors[4]} ];


(* ------------------------------------------------------------------ *
 *  The matching of the twist-2 operators
 * ------------------------------------------------------------------ *)
Module[{NF},
NF = 4;
MAT45[[-1,-1]] = 1;
MAT45[[-(NF+1);;-2,-(NF+1+1);;-(2+1)]] = IdentityMatrix[NF];
]


End[]


EndPackage[]
