(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


MAT34 = ConstantArray[0,{BasisDim["3Flavor"],BasisDim["4Flavor"]}];


(* ------------------------------------------------------------------ *
 *  Matching correction due to EW gauge interactions
 * ------------------------------------------------------------------ *)
f[mx_, mw_: 80.385] := 
 Module[{xi}, xi = mw^2/mx^2; 
  Sqrt[xi]/2 (4 + (2 (-4 + xi^2) ArcTanh[Sqrt[(-4 + xi)/xi]])/ \
     Sqrt[(-4 + xi) xi] - 2 xi Log[xi] +  \
     Sqrt[(-4 + xi) xi] Log[1/2 (-2 + xi + Sqrt[(-4 + xi) xi])])]

\[Delta]C74 = (Sqrt[4 \[Pi]*\[Alpha]emMZ] \[Alpha]emMZ)/(
  2 \[Pi]*sw^3 \[Lambda]*vev^3) \[ScriptCapitalJ]\[Chi]*f[MX];


(* ------------------------------------------------------------------ *
 *  The off diagonal contributions
 * ------------------------------------------------------------------ *)
MAT34[[Q73[1],Q74[5,"c"]]] = -1;
MAT34[[Q73[2],Q74[6,"c"]]] = -1;
MAT34[[Q73[3],Q74[7,"c"]]] = +1/2;
MAT34[[Q73[4],Q74[8,"c"]]] = +1/2;


(* ------------------------------------------------------------------ *
 *  The 4-flavor block is diagonal
 * ------------------------------------------------------------------ *)
Do[ MAT34[[Q53[i],Q54[i]]] 			= 1, {i,2} ];
Do[ MAT34[[Q63[i,f],Q64[i,f]]] 	= 1, {i,4}, {f,flavors[3]} ];
Do[ MAT34[[Q73[i],Q74[i]]] 			= 1, {i,4} ];
Do[ MAT34[[Q73[i,f],Q74[i,f]]] 	= 1, {i,5,10}, {f,flavors[3]} ];


End[]


EndPackage[]
