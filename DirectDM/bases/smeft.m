(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


(* -------------------------------------------------------------------------- *
 *  N.B. Every basis definition should include the following function:
 *    BasisDim["basis"] = dimensionality of basis
 * -------------------------------------------------------------------------- *)
NG = 3;          (* Number of generations  *)
NFlavorIJS = 6;  (* No symmetry on I,J     *)
NFlavorIJ  = 11; (* Symmetric on I,J       *)
NFlavorI   = 7;  (* One gen. index         *)
NFlavor0   = 1;  (* No generation indices  *)


BasisDim["SMEFT"] = NFlavorIJS*1/2*NG*(NG+1) + NFlavorIJ*NG^2 + NFlavorI*NG + NFlavor0;


(* The operators that are symmetric on I,J    *)
OperasIJS = {1,2,5,7,8,10};


(* The operators that have no symmetry on I,J *)
OperasIJ  = Join[{3,4,6,9},Range[11,17]];


Clear[TmpArray]
TmpArray  = ConstantArray[0,NFlavorIJS+NFlavorIJ+NFlavorI+NFlavor0];
Do[TmpArray[[i]] = 1/2*NG*(NG+1), {i,OperasIJS}];
Do[TmpArray[[i]] = NG^2         , {i,OperasIJ }];
Do[TmpArray[[i]] = NG, {i,#+1,#+NFlavorI}]&@(NFlavorIJS+NFlavorIJ);
Do[TmpArray[[i]] = 1,  {i,#+1,#+NFlavor0}]&@(NFlavorIJS+NFlavorIJ+NFlavorI);


OpStart   = Accumulate[TmpArray]-TmpArray;


(* The operators that have no symmetry on I,J *)
OperasI   = Range[18,24];


(* The operators that have no symmetry on I,J *)
Operas0   = {25};


ResetBasis["SMEFT"];


Q66S/:Q66S = Q6["SMEFT"];

(* NOTE: These operators must start at BasisDim["DMEFT"]+1 *)

(* The operators that are symmetric on I,J    *)
Do[Q6/:Q6["SMEFT"][i,j,k] = BasisDim["DMEFT"] + OpStart[[i]]+If[j>1,j,0]+k,{i,OperasIJS},{j,NG},{k,j,NG}] 
(* The operators that have no symmetry on I,J *)
Do[Q6/:Q6["SMEFT"][i,j,k] = BasisDim["DMEFT"] + OpStart[[i]]+NG*(j-1)+k,{i,OperasIJ},{j,NG},{k,NG}] 
(* The operators with one flavor index        *)
Do[Q6/:Q6["SMEFT"][i,j] = BasisDim["DMEFT"] + OpStart[[i]]+j, {i,#+1,#+NFlavorI},{j,NG}]&@(NFlavorIJS+NFlavorIJ);
(* The operator with no flavor indices        *)
Do[Q6/:Q6["SMEFT"][i] = BasisDim["DMEFT"] + OpStart[[i]]+j, {i,#+1,#+NFlavor0},{j,NFlavor0}]&@(NFlavorIJS+NFlavorIJ+NFlavorI);


End[]


EndPackage[]
