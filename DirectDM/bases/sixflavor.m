(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


BasisDim/:BasisDim["6Flavor"]=BasisDim["DMEFT"];
ResetBasis/:ResetBasis["6Flavor"]=ResetBasis["DMEFT"];
CoeffsListInt/:CoeffsListInt["6Flavor"]=CoeffsListInt["DMEFT"];
CoeffsList/:CoeffsList["6Flavor"]=CoeffsListInt["DMEFT"];


ResetBasis["6Flavor"];


Q5/:Q5["6Flavor"]=Q5["DMEFT"];
Q6/:Q6["6Flavor"]=Q6["DMEFT"];


End[]


EndPackage[]
