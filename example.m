(* ::Package:: *)

(* ::Text::RGBColor[0.25098039215686274`, 0.25098039215686274`, 0.25098039215686274`]:: *)
(*If DirectDM and this notebook are in the same directory (as is the case n the git repository), you can load the package directly as shown below. Otherwise, please set $DirectDMDirectory accordingly. Keep in mind that the path should be to the *parent* folder; i.e., should not include the DirectDM folder itself.*)


(*$DirectDMDirectory="<path/to/folder/containing/DirectDM>";*)
$DirectDMDirectory=NotebookDirectory[];
AppendTo[$Path,$DirectDMDirectory];


<<DirectDM`


(* ::Subsection:: *)
(*Function help*)


?SetDMType


?SetCoeff


?GetCoeff


?ComputeCoeffs


?SetCoeffMstar


(* ::Subsection:: *)
(*Setting the Wilson coefficients in the 3 flavor basis*)


(* ::Text:: *)
(*Set the EFT scale*)


lam=100 (* GeV *);


(* ::Text:: *)
(*DirectDM assumes a Dirac fermion DM by default. Set it explicitly anyway:*)


SetDMType["D"]


(* ::Text:: *)
(*The 3Flavor basis has only light quark flavors. It is defined at \[Mu]=2GeV:*)


MyBasis="3Flavor";


(* ::Text:: *)
(*It's a good idea to reset the basis before setting Wilson coefficients*)


ResetBasis[MyBasis]


SetCoeff[MyBasis,Q6[1,"u"],1/lam^2]


Do[SetCoeff[MyBasis,Q7[i,f],1/lam^3],{i,5,8},{f,{"u","d","s","e","mu"}}]


ComputeCoeffs[MyBasis,"NR"];


(* ::Text:: *)
(*Note that in DirectDM the dark matter mass is called MX and does not have a default value. Also, the variable qsq is the squared momentum transfer q^2. *)


CoeffsList["NR_p"]//Simplify


(* ::Subsection:: *)
(*Setting coefficients in the 5 flavor basis*)


(* ::Text:: *)
(*Set the EFT scale*)


lam=100 (* GeV *);


(* ::Text:: *)
(*DirectDM assumes a Dirac fermion DM by default. Set it explicitly anyway:*)


SetDMType["D"]


(* ::Text:: *)
(*The 5Flavor basis has q=u,d,s,c,b. It is defined at \[Mu]=91.2GeV:*)


MyBasis="5Flavor";


(* ::Text:: *)
(*It's a good idea to reset the basis before setting Wilson coefficients*)


ResetBasis[MyBasis]


SetCoeff[MyBasis,Q6[1,"u"],1/lam^2]


Do[SetCoeff[MyBasis,Q7[i,f],1/lam^3],{i,5,8},{f,{"u","d","s","c","b"}}]


ComputeCoeffs[MyBasis,"NR"];


Options[ComputeCoeffs]


(* ::Text:: *)
(*Note that in DirectDM the dark matter mass is called MX and does not have a default value. Also, the variable qsq is the squared momentum transfer q^2. *)


CoeffsList["NR_p"]//Simplify


(* ::Subsection::Closed:: *)
(*Calculating the total rate in a direct detection experiment*)


(* ::Text:: *)
(*To compute the event rate using the DMFormFactor package by Anand, Fitzpatrick, & Haxton [1308.6288], download the package and load it here.*)


Needs["dmformfactor`","<path/to/dmformfactor-V?.m>"]


mNucleon=0.938 GeV;
NT=1/(131 mNucleon);
Centimeter=(10^13 Femtometer);
rhoDM=0.3 GeV/Centimeter^3;
ve=249 KilometerPerSecond;
v0=236 KilometerPerSecond;
vesc=533 KilometerPerSecond;
SetHALO["MBcutoff"];
vev=246;


Do[
SetCoeffsNonrel[i,vev^2(CoeffsList["NR_p"])[[i]]/.{qsq->qGeV^2},"p"];
SetCoeffsNonrel[i,vev^2(CoeffsList["NR_n"])[[i]]/.{qsq->qGeV^2},"n"];,
{i,14}];


SetIsotope[54,131,"default","default"]


SetJChi[1/2];
SetMChi[MX GeV];


myrate[qGeV_,MX_]=EventRate[NT,rhoDM,qGeV,ve,v0]


GeV myrate[Sqrt[131mNucleon*2*30*1*^-6/GeV],100.]


tab=Table[{10^mass,
NIntegrate[1*^-6 (* GeV/KeV *) KilogramDay GeV (myrate[Sqrt[132mNucleon*2*ER*1*^-6/GeV],10^mass])
Piecewise[{{1,ER>3&&ER<40},{0,ER>40||ER<3}}],{ER,0,50}]},
{mass,Log10[2.],3,(3-Log10[2.])/50}]


(* ::Subsection::Closed:: *)
(*Setting coefficients in the GIRSTY [1009.0008] basis*)


(* ::Text:: *)
(*It is also possible to set the Wilson coefficients in the basis of Goodman, Ibe, Rajaraman, Tait, and Yu [1009.0008] using the function SetCoeffsMstar. In this case, the value of the coefficient is SubStar[M] which is then translated into our basis as in Appendix A of [1708.XXXX].*)


SetDMType["D"]


MyBasis="5Flavor";


SetCoeffMstar[MyBasis,D5["u"],10]


GetCoeff[MyBasis,Q6[1,"u"]]


ComputeCoeffs[MyBasis,"NR"]


CoeffsList["NR_p"]


CoeffsList["NR_n"]
