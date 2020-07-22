(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


NF = 3;
$basis = StringJoin[ToString[NF],"Flavor"];


Q53/:Q53 = Q5[$basis];
Q63/:Q63 = Q6[$basis];
Q73/:Q73 = Q7[$basis];
Q83/:Q83 = Q8[$basis];


(* -------------------------------------------------------------------------- *
 *  NOTE: The code below this comment should be identical in
 *    bases/threeflavor.m, bases/fourflavor.m, and bases/fiveflavor.m
 * -------------------------------------------------------------------------- *)
LEN   = Length[flavors[NF]];
ND7a = 4;
ND7b = 6*LEN;
ND7c = 4;
ND7d = 8*LEN;
ND5 = 2; ND6 = 4*LEN; ND7 = ND7a + ND7b + ND7c + ND7d;
(* -------------------------------------------------------------------------- *
 *  Add the dimension 8 operators required for weak mixing below the weak
 *    scale [1801.04240]
 * -------------------------------------------------------------------------- *)
ND8 = 4*NF;


(* -------------------------------------------------------------------------- *
 *  N.B. Every basis definition should include the following function:
 *    BasisDim["basis"] = dimensionality of basis
 * -------------------------------------------------------------------------- *)
BasisDim[$basis] = ND5+ND6+ND7+(LEN+1)+ND8; (* inc. ((NF+3)+1) twist-2 operators *)


ResetBasis[$basis];


(* Dimension 5 operators *)
Q5/:Q5[$basis][1] = 1;
Q5/:Q5[$basis][2] = 2;


(* Dimension 6 operators *)
Do[Q6/:Q6[$basis][i,j] = LEN*(i-1)+1+ND5+fnum[NF,j],{i,1,4},{j,flavors[NF]}]


(* Dimension 7 operators *)
Do[Q7/:Q7[$basis][i] = ND5+ND6+i,{i,1,4}]

Do[Q7/:Q7[$basis][i+4,j] = ND5+ND6+ND7a+
	LEN*(i-1)+1+fnum[NF,j],{i,6},{j,flavors[NF]}]

Do[Q7/:Q7[$basis][i+4+6] = ND5+ND6+ND7a+ND7b+i,{i,1,4}]

Do[Q7/:Q7[$basis][i+4+6+4,j] = ND5+ND6+ND7a+ND7b+ND7c+
	LEN*(i-1)+1+fnum[NF,j],{i,8},{j,flavors[NF]}]
Do[
	Q7/:Q7[$basis][23,fl] = ND5+ND6+ND7+1+fnum[NF,fl],{fl,flavors[NF]}
]
	Q7/:Q7[$basis][25] = ND5+ND6+ND7+LEN+1;


(* Dimension 8 operators *)
Do[Q8/:Q8[$basis][i,j] = ND5+ND6+ND7+(NF+1)+1+NF*(i-1)+fnum[NF,j],{i,4},{j,quarks[[;;NF]]}]


End[]


EndPackage[]
