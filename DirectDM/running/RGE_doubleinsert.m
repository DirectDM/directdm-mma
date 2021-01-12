(* ::Package:: *)

BeginPackage["DirectDM`"]


Begin["`Private`"]


NotebookDirectory[]


(* import the evolution matrix for double insertions, 
the matrix is generated by Umat_doubleinsert.m, which should be rerun if the inputs.m 
is modified
*)
UDoubleInsert=Import[NotebookDirectory[]<>"Umat.dat"];


(* 
the input are C6i at MZ
{C61u, C62u, C63u, C64u,C61d, C62d, C63d, C64d, C61s, C62s, C63s, C64s, C61c, C62c, C63c, C64c, C61b, C62b, C63b, C64b}

the output are C8i at \[Mu]=2 GeV
{C81u, C82u, C83u, C84u,C81d, C82d, C83d, C84d, C81s, C82s, C83s, C84s} 
*)

C8fromC6DoubleInsert[C6input_]:=UDoubleInsert.C6input;


End[]


EndPackage[]
