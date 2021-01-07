(* ::Package:: *)

BeginPackage["DirectDM`"]


Begin["`Private`"]


(* generates the RGE U matrices for the double insertions weak running below MZ scale 
   rerun this whenever values in inputs.m change
   that is, load the package
   <<DirectDM`
   then run this notebook *)


(* --------------------------------------------------------------------------
* useful definitions
* -------------------------------------------------------------------------- *)

(* functions used in SM four-quark operators running *)
SWMZ=Sqrt[SW2MZ];CWMZ=Sqrt[1-SW2MZ];CW2MZ=1-SW2MZ;
vFun[q_]:=(I3Fun[q]-2 SW2MZ QFun[q])/(2 SWMZ CWMZ);
aFun[q_]:=-I3Fun[q]/(2SWMZ CWMZ);
I3Fun["u"]=1/2;I3Fun["c"]=1/2;
I3Fun["d"]=-1/2;I3Fun["s"]=-1/2;I3Fun["b"]=-1/2;
QFun["u"]=2/3;QFun["c"]=2/3;
QFun["d"]=-1/3;QFun["s"]=-1/3;QFun["b"]=-1/3;
VCKM[q_,qPr_]:=Which[
Sort[{q,qPr}]==Sort[{"u","d"}],1,
Sort[{q,qPr}]==Sort[{"s","c"}],1,
Sort[{q,qPr}]==Sort[{"b","t"}],1,
True,0];

(* \[Alpha]S function for Nf=5,4, threshold is at mBatMBms *)
a5[\[Mu]_]:=as1l[AlphaS["MZ"], MZ, \[Mu], 5];
a5atMBms=as1l[AlphaS["MZ"]  , MZ, MBatMBms, 5];
a4[\[Mu]_]:=as1l[a5atMBms , MBatMBms, \[Mu], 4];
\[Alpha]SFun[\[Mu]_]:=
If[\[Mu]>MBatMBms, a5[\[Mu]], a4[\[Mu]]]

(* for \[Alpha]S LO running, enters ADM *)
\[Beta]0[nf_]:=(11 3-2nf)/3;

(* solutions are obtained down to 0.9 * \[Mu]Low, so that no extrapolation issues *)
LowFact=0.9;

(* variables only for this notebook *)
NcNum=3;
nfquark=5;
flavors5=flavors[nfquark];
(* {"u","d","s","c","b","e","mu","tau"} *)
flavors5q=flavors[nfquark][[;;nfquark]];
(*{"u","d","s","c","b"} *)


(* --------------------------------------------------------------------------
* anomalous dimensions
* -------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------
* gamma^(1) for the SM four-quark operators
* -------------------------------------------------------------------------- *)

(* D6 operators, n_f=5
*  100 SM-SM operators, D6qqPrList contains operators with two quark flavors, 
*  Eqs. (13)-(15) in 1801.04240, D6qList with single quark flavor, Eqs. (16)-(17) in 1801.04240 
*)

D6qqPrList[LR_]:={
D61["u","d",LR],D62["u","d",LR],D63["u","d",LR],D63["d","u",LR],D64["u","d",LR],D65["u","d",LR],D66["u","d",LR],D66["d","u",LR],
D61["u","s",LR],D62["u","s",LR],D63["u","s",LR],D63["s","u",LR],D64["u","s",LR],D65["u","s",LR],D66["u","s",LR],D66["s","u",LR],
D61["u","c",LR],D62["u","c",LR],D63["u","c",LR],D63["c","u",LR],D64["u","c",LR],D65["u","c",LR],D66["u","c",LR],D66["c","u",LR],
D61["u","b",LR],D62["u","b",LR],D63["u","b",LR],D63["b","u",LR],D64["u","b",LR],D65["u","b",LR],D66["u","b",LR],D66["b","u",LR],
D61["d","s",LR],D62["d","s",LR],D63["d","s",LR],D63["s","d",LR],D64["d","s",LR],D65["d","s",LR],D66["d","s",LR],D66["s","d",LR],
D61["d","c",LR],D62["d","c",LR],D63["d","c",LR],D63["c","d",LR],D64["d","c",LR],D65["d","c",LR],D66["d","c",LR],D66["c","d",LR],
D61["d","b",LR],D62["d","b",LR],D63["d","b",LR],D63["b","d",LR],D64["d","b",LR],D65["d","b",LR],D66["d","b",LR],D66["b","d",LR],
D61["s","c",LR],D62["s","c",LR],D63["s","c",LR],D63["c","s",LR],D64["s","c",LR],D65["s","c",LR],D66["s","c",LR],D66["c","s",LR],
D61["s","b",LR],D62["s","b",LR],D63["s","b",LR],D63["b","s",LR],D64["s","b",LR],D65["s","b",LR],D66["s","b",LR],D66["b","s",LR],
D61["c","b",LR],D62["c","b",LR],D63["c","b",LR],D63["b","c",LR],D64["c","b",LR],D65["c","b",LR],D66["c","b",LR],D66["b","c",LR]};
D6qList[LR_]:={D61["u",LR],D62["u",LR],D63["u",LR],D64["u",LR],D61["d",LR],D62["d",LR],D63["d",LR],D64["d",LR],
D61["s",LR],D62["s",LR],D63["s",LR],D64["s",LR],D61["c",LR],D62["c",LR],D63["c",LR],D64["c",LR],D61["b",LR],D62["b",LR],D63["b",LR],D64["b",LR]};
D6List[LR_]:=Join[D6qqPrList[LR],D6qList[LR]];

(* D6 operators, n_f=4
*  64 SM-SM operators in n_f=4 theory, D6qqPrList contains operators with two quark flavors, 
*  Eqs. (13)-(15) in 1801.04240, D6qList with single quark flavor, Eqs. (16)-(17) in 1801.04240,  
*)

D6qqPrListNf4[LR_]:={
D61["u","d",LR],D62["u","d",LR],D63["u","d",LR],D63["d","u",LR],D64["u","d",LR],D65["u","d",LR],D66["u","d",LR],D66["d","u",LR],
D61["u","s",LR],D62["u","s",LR],D63["u","s",LR],D63["s","u",LR],D64["u","s",LR],D65["u","s",LR],D66["u","s",LR],D66["s","u",LR],
D61["u","c",LR],D62["u","c",LR],D63["u","c",LR],D63["c","u",LR],D64["u","c",LR],D65["u","c",LR],D66["u","c",LR],D66["c","u",LR],
D61["d","s",LR],D62["d","s",LR],D63["d","s",LR],D63["s","d",LR],D64["d","s",LR],D65["d","s",LR],D66["d","s",LR],D66["s","d",LR],
D61["d","c",LR],D62["d","c",LR],D63["d","c",LR],D63["c","d",LR],D64["d","c",LR],D65["d","c",LR],D66["d","c",LR],D66["c","d",LR],
D61["s","c",LR],D62["s","c",LR],D63["s","c",LR],D63["c","s",LR],D64["s","c",LR],D65["s","c",LR],D66["s","c",LR],D66["c","s",LR]};
D6qListNf4[LR_]:={D61["u",LR],D62["u",LR],D63["u",LR],D64["u",LR],D61["d",LR],D62["d",LR],D63["d",LR],D64["d",LR],
D61["s",LR],D62["s",LR],D63["s",LR],D64["s",LR],D61["c",LR],D62["c",LR],D63["c",LR],D64["c",LR]};
D6ListNf4[LR_]:=Join[D6qqPrListNf4[LR],D6qListNf4[LR]];

(* --------------------------------------------------------------------------
* D6q->D6q anomalous dimensions
* -------------------------------------------------------------------------- *)
(* \[Gamma]^(1) matrices from 1801.04240 for mixing of SM-SM four quark operators  *)
(* in (35) of 1801.04240 *)
\[Gamma]1D6qtoD6q:={{4,4,0,-28/3},
{0,0,0,44/3},
{0,0,44/9,0},
{5/3,13/3,0,-106/9}};
\[Gamma]1D6qtoD6qSum=Sum[(D6qList[L][[4n+1;;4(n+1)]]).\[Gamma]1D6qtoD6q .(D6qList[R][[4n+1;;4(n+1)]]),{n,0,4}];


(* --------------------------------------------------------------------------
* D6q -> D6qq\[CloseCurlyQuote] anomalous dimensions
* -------------------------------------------------------------------------- *)
(* in (38) of 1801.04240 *)
\[Gamma]1D6qtoD6qqPr:={{0,0,0,0,8/3,0,0,0},
{0,0,0,0,8/3,0,0,0},
{0,0,0,0,0,0,8/3,0},
{0,0,0,0,20/9,0,0,0}
};
\[Gamma]1D6utoD6ud={D61["u",L],D62["u",L],D63["u",L],D64["u",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["u","d",R],D62["u","d",R],D63["u","d",R],D63["d","u",R],D64["u","d",R],D65["u","d",R],D66["u","d",R],D66["d","u",R]};
\[Gamma]1D6utoD6us={D61["u",L],D62["u",L],D63["u",L],D64["u",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["u","s",R],D62["u","s",R],D63["u","s",R],D63["s","u",R],D64["u","s",R],D65["u","s",R],D66["u","s",R],D66["s","u",R]};
\[Gamma]1D6utoD6uc={D61["u",L],D62["u",L],D63["u",L],D64["u",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["u","c",R],D62["u","c",R],D63["u","c",R],D63["c","u",R],D64["u","c",R],D65["u","c",R],D66["u","c",R],D66["c","u",R]};
\[Gamma]1D6utoD6ub={D61["u",L],D62["u",L],D63["u",L],D64["u",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["u","b",R],D62["u","b",R],D63["u","b",R],D63["b","u",R],D64["u","b",R],D65["u","b",R],D66["u","b",R],D66["b","u",R]};
\[Gamma]1D6dtoD6ds={D61["d",L],D62["d",L],D63["d",L],D64["d",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["d","s",R],D62["d","s",R],D63["d","s",R],D63["s","d",R],D64["d","s",R],D65["d","s",R],D66["d","s",R],D66["s","d",R]};
\[Gamma]1D6dtoD6dc={D61["d",L],D62["d",L],D63["d",L],D64["d",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["d","c",R],D62["d","c",R],D63["d","c",R],D63cd[R],D64["d","c",R],D65["d","c",R],D66["d","c",R],D66cd[R]};
\[Gamma]1D6dtoD6db={D61["d",L],D62["d",L],D63["d",L],D64["d",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["d","b",R],D62["d","b",R],D63["d","b",R],D63["b","d",R],D64["d","b",R],D65["d","b",R],D66["d","b",R],D66["b","d",R]};
\[Gamma]1D6stoD6sc={D61["s",L],D62["s",L],D63["s",L],D64["s",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["s","c",R],D62["s","c",R],D63["s","c",R],D63["c","s",R],D64["s","c",R],D65["s","c",R],D66["s","c",R],D66["c","s",R]};
\[Gamma]1D6stoD6sb={D61["s",L],D62["s",L],D63["s",L],D64["s",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["s","b",R],D62["s","b",R],D63["s","b",R],D63["b","s",R],D64["s","b",R],D65["s","b",R],D66["s","b",R],D66["b","s",R]};
\[Gamma]1D6ctoD6cb={D61["c",L],D62["c",L],D63["c",L],D64["c",L]}.\[Gamma]1D6qtoD6qqPr.
{D61["c","b",R],D62["c","b",R],D63["c","b",R],D63["b","c",R],D64["c","b",R],D65["c","b",R],D66["c","b",R],D66["b","c",R]};
(* need to include these by hand, since the above does not take into account the symmetry of D64*)
\[Gamma]1D6qtoD6qqPrOdd=8/3 ( D61["d",L]D64["u","d",R]+D61["s",L]D64["u","s",R]+D61["s",L]D64["d","s",R]+D61["c",L]D64["u","c",R]
+D61["c",L]D64["d","c",R]+D61["c",L]D64["s","c",R]+D61["b",L]D64["u","b",R]
+D61["b",L]D64["d","b",R]+D61["b",L]D64["s","b",R]+D61["b",L]D64["c","b",R])+
8/3 ( D62["d",L]D64["u","d",R]+D62["s",L]D64["u","s",R]+D62["s",L]D64["d","s",R]
+D62["c",L]D64["u","c",R]+D62["c",L]D64["d","c",R]+D62["c",L]D64["s","c",R]
+D62["b",L]D64["u","b",R]+D62["b",L]D64["d","b",R]+D62["b",L]D64["s","b",R]+D62["b",L]D64["c","b",R])+
8/3 ( D63["d",L]D66["d","u",R]+D63["s",L]D66["s","u",R]+D63["s",L]D66["s","d",R]
+D63["c",L]D66["c","u",R]+D63["c",L]D66["c","d",R]+D63["c",L]D66["c","s",R]
+D63["b",L]D66["b","u",R]+D63["b",L]D66["b","d",R]+D63["b",L]D66["b","s",R]+D63["b",L]D66["b","c",R])+
20/9 ( D64["d",L]D64["u","d",R]+D64["s",L]D64["u","s",R]+D64["s",L]D64["d","s",R]
+D64["c",L]D64["u","c",R]+D64["c",L]D64["d","c",R]+D64["c",L]D64["s","c",R]
+D64["b",L]D64["u","b",R]+D64["b",L]D64["d","b",R]+D64["b",L]D64["s","b",R]+D64["b",L]D64["c","b",R]);
\[Gamma]1D6qtoD6qqPrSum=\[Gamma]1D6utoD6ud+\[Gamma]1D6utoD6us+\[Gamma]1D6utoD6uc+\[Gamma]1D6utoD6ub+\[Gamma]1D6dtoD6ds+\[Gamma]1D6dtoD6dc+\[Gamma]1D6dtoD6db+
\[Gamma]1D6stoD6sc+\[Gamma]1D6stoD6sb+\[Gamma]1D6ctoD6cb+\[Gamma]1D6qtoD6qqPrOdd;

(* --------------------------------------------------------------------------
* D6qq\[CloseCurlyQuote] -> D6qq\[CloseCurlyQuote] anomalous dimensions
* -------------------------------------------------------------------------- *)
(* in (40) of 1801.04240 *)
\[Gamma]1D6qqPrtoD6qqPr:={{0,0,0,0,0,12,0,0},
{0,0,0,0,12,0,0,0},
{0,0,0,0,0,0,0,12},
{0,0,0,0,0,0,12,0},
{0,8/3,0,0,-19/3,5,0,0},
{8/3,0,0,0,5,-9,0,0},
{0,0,0,8/3,0,0,-23/3,5},
{0,0,8/3,0,0,0,5,-23/3}
};
\[Gamma]1D6qqPrtoD6qqPrSum=Sum[(D6qqPrList[L][[8n+1;;8(n+1)]]).\[Gamma]1D6qqPrtoD6qqPr .(D6qqPrList[R][[8n+1;;8(n+1)]]),{n,0,9}];


(* --------------------------------------------------------------------------
* D6qq\[CloseCurlyQuote] -> D6qq\[CloseCurlyQuote]\[CloseCurlyQuote] anomalous dimensions
* -------------------------------------------------------------------------- *)
(* in (43) of 1801.04240 *)
\[Gamma]1D6qqPrtoD6qqPrPr:=DiagonalMatrix[{0,0,0,0,4/3,0,4/3,0}];
\[Gamma]1D6qqPrtoD6qqPrPrSum=4/3 (D64["u","d",L](D64["u","s",R]+D64["u","c",R]+D64["u","b",R]+D64["d","s",R]+D64["d","c",R]+D64["d","b",R])
+D64["u","s",L](D64["u","d",R]+D64["u","c",R]+D64["u","b",R]+D64["d","s",R]+D64["s","c",R]+D64["s","b",R])
+D64["u","c",L](D64["u","d",R]+D64["u","s",R]+D64["u","b",R]+D64["d","c",R]+D64["s","c",R]+D64["c","b",R])
+D64["u","b",L](D64["u","d",R]+D64["u","s",R]+D64["u","c",R]+D64["d","b",R]+D64["s","b",R]+D64["c","b",R])
+D64["d","s",L](D64["u","d",R]+D64["d","c",R]+D64["d","b",R]+D64["u","s",R]+D64["s","c",R]+D64["s","b",R])
+D64["d","c",L](D64["u","d",R]+D64["d","s",R]+D64["d","b",R]+D64["u","c",R]+D64["s","c",R]+D64["c","b",R])
+D64["d","b",L](D64["u","d",R]+D64["d","s",R]+D64["d","c",R]+D64["u","b",R]+D64["s","b",R]+D64["c","b",R])
+D64["s","c",L](D64["u","s",R]+D64["d","s",R]+D64["s","b",R]+D64["u","c",R]+D64["d","c",R]+D64["c","b",R])
+D64["s","b",L](D64["u","s",R]+D64["d","s",R]+D64["s","c",R]+D64["u","b",R]+D64["d","b",R]+D64["c","b",R])
+D64["c","b",L](D64["u","c",R]+D64["d","c",R]+D64["s","c",R]+D64["u","b",R]+D64["d","b",R]+D64["s","b",R]))+
4/3 (D66["u","d",L](D66["u","s",R]+D66["u","c",R]+D66["u","b",R])
+D66["u","s",L](D66["u","d",R]+D66["u","c",R]+D66["u","b",R])
+D66["u","c",L](D66["u","d",R]+D66["u","s",R]+D66["u","b",R])
+D66["u","b",L](D66["u","d",R]+D66["u","s",R]+D66["u","c",R])
+D66["d","u",L](D66["d","s",R]+D66["d","c",R]+D66["d","b",R])
+D66["d","s",L](D66["d","u",R]+D66["d","c",R]+D66["d","b",R])
+D66["d","c",L](D66["d","u",R]+D66["d","s",R]+D66["d","b",R])
+D66["d","b",L](D66["d","u",R]+D66["d","s",R]+D66["d","c",R])
+D66["s","u",L](D66["s","d",R]+D66["s","c",R]+D66["s","b",R])
+D66["s","d",L](D66["s","u",R]+D66["s","c",R]+D66["s","b",R])
+D66["s","c",L](D66["s","u",R]+D66["s","d",R]+D66["s","b",R])
+D66["s","b",L](D66["s","u",R]+D66["s","d",R]+D66["s","c",R])
+D66["c","u",L](D66["c","d",R]+D66["c","s",R]+D66["c","b",R])
+D66["c","d",L](D66["c","u",R]+D66["c","s",R]+D66["c","b",R])
+D66["c","s",L](D66["c","u",R]+D66["c","d",R]+D66["c","b",R])
+D66["c","b",L](D66["c","u",R]+D66["c","d",R]+D66["c","s",R])
+D66["b","u",L](D66["b","d",R]+D66["b","s",R]+D66["b","c",R])
+D66["b","d",L](D66["b","u",R]+D66["b","s",R]+D66["b","c",R])
+D66["b","s",L](D66["b","u",R]+D66["b","d",R]+D66["b","c",R])
+D66["b","c",L](D66["b","u",R]+D66["b","d",R]+D66["b","s",R]));


(* --------------------------------------------------------------------------
* D6qq\[CloseCurlyQuote]->D6q anomalous dimensions
* -------------------------------------------------------------------------- *)
(* in (46) of 1801.04240 *)
\[Gamma]1D6qqPrtoD6q:={{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,0},
{0,0,0,4/3},
{0,0,0,0},
{0,0,4/9,0},
{0,0,0,0}};
\[Gamma]1D6udtoD6u={D61["u","d",L],D62["u","d",L],D63["u","d",L],D63["d","u",L],D64["u","d",L],D65["u","d",L],
D66["u","d",L],D66["d","u",L]}.\[Gamma]1D6qqPrtoD6q.{D61["u",R],D62["u",R],D63["u",R],D64["u",R]};
\[Gamma]1D6ustoD6u={D61["u","s",L],D62["u","s",L],D63["u","s",L],D63["s","u",L],D64["u","s",L],D65["u","s",L],
D66["u","s",L],D66["s","u",L]}.\[Gamma]1D6qqPrtoD6q.{D61["u",R],D62["u",R],D63["u",R],D64["u",R]};
\[Gamma]1D6uctoD6u={D61["u","c",L],D62["u","c",L],D63["u","c",L],D63["c","u",L],D64["u","c",L],D65["u","c",L],
D66["u","c",L],D66["c","u",L]}.\[Gamma]1D6qqPrtoD6q.{D61["u",R],D62["u",R],D63["u",R],D64["u",R]};
\[Gamma]1D6ubtoD6u={D61["u","b",L],D62["u","b",L],D63["u","b",L],D63["b","u",L],D64["u","b",L],D65["u","b",L],
D66["u","b",L],D66["b","u",L]}.\[Gamma]1D6qqPrtoD6q.{D61["u",R],D62["u",R],D63["u",R],D64["u",R]};
\[Gamma]1D6dstoD6d={D61["d","s",L],D62["d","s",L],D63["d","s",L],D63["s","d",L],D64["d","s",L],D65["d","s",L],
D66["d","s",L],D66["s","d",L]}.\[Gamma]1D6qqPrtoD6q.{D61["d",R],D62["d",R],D63["d",R],D64["d",R]};
\[Gamma]1D6dctoD6d={D61["d","c",L],D62["d","c",L],D63["d","c",L],D63["c","d",L],D64["d","c",L],D65["d","c",L],
D66["d","c",L],D66["c","d",L]}.\[Gamma]1D6qqPrtoD6q.{D61["d",R],D62["d",R],D63["d",R],D64["d",R]};
\[Gamma]1D6dbtoD6d={D61["d","b",L],D62["d","b",L],D63["d","b",L],D63["b","d",L],D64["d","b",L],D65["d","b",L],
D66["d","b",L],D66["b","d",L]}.\[Gamma]1D6qqPrtoD6q.{D61["d",R],D62["d",R],D63["d",R],D64["d",R]};
\[Gamma]1D6sctoD6s={D61["s","c",L],D62["s","c",L],D63["s","c",L],D63["c","s",L],D64["s","c",L],D65["s","c",L],
D66["s","c",L],D66["c","s",L]}.\[Gamma]1D6qqPrtoD6q.{D61["s",R],D62["s",R],D63["s",R],D64["s",R]};
\[Gamma]1D6sbtoD6s={D61["s","b",L],D62["s","b",L],D63["s","b",L],D63["b","s",L],D64["s","b",L],D65["s","b",L],
D66["s","b",L],D66["b","s",L]}.\[Gamma]1D6qqPrtoD6q.{D61["s",R],D62["s",R],D63["s",R],D64["s",R]};
\[Gamma]1D6cbtoD6c={D61["c","b",L],D62["c","b",L],D63["c","b",L],D63["b","c",L],D64["c","b",L],D65["c","b",L],
D66["c","b",L],D66["b","c",L]}.\[Gamma]1D6qqPrtoD6q.{D61["c",R],D62["c",R],D63["c",R],D64["c",R]};
(* the above does not pick all mixings to D64 due to symmetry of D64 and the definitions of basis for D66*)
\[Gamma]1D6cbtoD6cOdd=4/3 (D64["u","d",L]D64["d",R]+D64["u","s",L]D64["s",R]+D64["u","c",L]D64["c",R]+D64["u","b",L]D64["b",R]+
D64["d","s",L]D64["s",R]+D64["d","c",L]D64["c",R]+D64["d","b",L]D64["b",R]+
D64["s","c",L]D64["c",R]+D64["s","b",L]D64["b",R]+D64["c","b",L]D64["b",R])+
4/9 (D66["d","u",L]D63["d",R]+D66["s","u",L]D63["s",R]+D66["s","d",L]D63["s",R]+D66["c","u",L]D63["c",R]+D66["c","d",L]D63["c",R]+
D66["c","s",L]D63["c",R]+D66["b","u",L]D63["b",R]+D66["b","d",L]D63["b",R]+
D66["b","s",L]D63["b",R]+D66["b","c",L]D63["b",R]);
\[Gamma]1D6qqPrtoD6qSum=\[Gamma]1D6udtoD6u+\[Gamma]1D6ustoD6u+\[Gamma]1D6uctoD6u+\[Gamma]1D6ubtoD6u+\[Gamma]1D6dstoD6d+\[Gamma]1D6dctoD6d+
\[Gamma]1D6dbtoD6d+\[Gamma]1D6sctoD6s+\[Gamma]1D6sbtoD6s+\[Gamma]1D6cbtoD6c+\[Gamma]1D6cbtoD6cOdd;

(* --------------------------------------------------------------------------
* Combined
* -------------------------------------------------------------------------- *)
\[Gamma]1D6Sum=\[Gamma]1D6qtoD6qSum+\[Gamma]1D6qtoD6qqPrSum+\[Gamma]1D6qqPrtoD6qqPrSum+\[Gamma]1D6qqPrtoD6qqPrPrSum+\[Gamma]1D6qqPrtoD6qSum;


(* --------------------------------------------------------------------------
* Running of SM  four-quark ops.
* -------------------------------------------------------------------------- *)

(* --------------------------------------------------------------------------
* initial conditions at \[Mu]=Subscript[M, z]
* -------------------------------------------------------------------------- *)

(* Initial conditions for Subscript[D6, q] at \[Mu]=MZ for EW running, Eq. (20) in 1801.04240 *)
D61[q_,"MZ init"]:=2 SW2MZ CW2MZ vFun[q]^2;
D62[q_,"MZ init"]:=2 SW2MZ CW2MZ aFun[q]^2;
D63[q_,"MZ init"]:=4 SW2MZ CW2MZ aFun[q] vFun[q];
D64[q_,"MZ init"]:=0;
(* Initial conditions for Subscript[D6, qq'] at \[Mu]=MZ for EW running, Eqs. (18),(19) in 1801.04240 *)
D61[q_,qPr_,"MZ init"]:=4 SW2MZ CW2MZ vFun[q] vFun[qPr]+Abs[I3Fun[q]-I3Fun[qPr]]/6 Abs[VCKM[q,qPr]]^2;
D62[q_,qPr_,"MZ init"]:=4 SW2MZ CW2MZ aFun[q] aFun[qPr]+Abs[I3Fun[q]-I3Fun[qPr]]/6 Abs[VCKM[q,qPr]]^2;
D63[q_,qPr_,"MZ init"]:=4 SW2MZ CW2MZ aFun[q] vFun[qPr]-Abs[I3Fun[q]-I3Fun[qPr]]/6 Abs[VCKM[q,qPr]]^2;
D64[q_,qPr_,"MZ init"]:=Abs[I3Fun[q]-I3Fun[qPr]]Abs[VCKM[q,qPr]]^2;
D65[q_,qPr_,"MZ init"]:=D64[q,qPr,"MZ init"];
D66[q_,qPr_,"MZ init"]:=-D64[q,qPr,"MZ init"];


(* --------------------------------------------------------------------------
* constructions of anomalous dimension matrices
* -------------------------------------------------------------------------- *)
\[Gamma]Mat=Table[Coefficient[\[Gamma]1D6Sum,D6List[L][[i]]D6List[R][[j]]],{i,Length[D6List[L]]},{j,Length[D6List[R]]}];
\[Gamma]MatNf4=Table[Coefficient[\[Gamma]1D6Sum,D6ListNf4[L][[i]]D6ListNf4[R][[j]]],{i,Length[D6ListNf4[L]]},{j,Length[D6ListNf4[R]]}];



(* --------------------------------------------------------------------------
* evolution in Subscript[n, f]=5
* -------------------------------------------------------------------------- *)
D6Eqs=Table[\[Mu] D[D6List[\[Mu]][[j]],\[Mu]]==Sum[\[Alpha]SFun[\[Mu]]/(4\[Pi]) D6List[\[Mu]][[i]] \[Gamma]Mat[[i,j]],{i,Length[D6List[L]]}],{j,Length[D6List[L]]}]//Flatten;
D6InitCond=Table[D6List[MZ][[j]]==D6List["MZ init"][[j]],{j,Length[D6List[L]]}]//Flatten;
SolD6=NDSolveValue[{D6Eqs,D6InitCond}//Flatten,D6List[\[Mu]],{\[Mu],MZ,LowFact*MBatMBms}];


(* --------------------------------------------------------------------------
* evolution in Subscript[n, f]=4
* -------------------------------------------------------------------------- *)
PositionD6List=Table[Position[D6List[L],D6ListNf4[L][[i]]],{i, Length[D6ListNf4[L]]}]//Flatten;
D6ListNf4["MB init"]=Table[(SolD6/.\[Mu]->MBatMBms)[[PositionD6List[[j]]]],{j,Length[PositionD6List]}];
D6InitCondNf4=Table[D6ListNf4[MBatMBms][[j]]==D6ListNf4["MB init"][[j]],{j,Length[D6ListNf4[L]]}]//Flatten;
D6EqsNf4=Table[\[Mu] D[D6ListNf4[\[Mu]][[j]],\[Mu]]==Sum[\[Alpha]SFun[\[Mu]]/(4\[Pi]) D6ListNf4[\[Mu]][[i]] \[Gamma]MatNf4[[i,j]],{i,Length[D6ListNf4[L]]}],{j,Length[D6ListNf4[L]]}]//Flatten;
SolD6Nf4=NDSolveValue[{D6EqsNf4,D6InitCondNf4}//Flatten,D6ListNf4[\[Mu]],{\[Mu],MBatMBms,LowFact*scale["2GeV"]}];


(* --------------------------------------------------------------------------
* C6, C8 operators
* -------------------------------------------------------------------------- *)

(* 40 SM-DM operators, from 1801.04240 *)
C6List[LR_]:={C61["u",LR],C62["u",LR],C63["u",LR],C64["u",LR],C61["d",LR],C62["d",LR],C63["d",LR],
C64["d",LR],C61["s",LR],C62["s",LR],C63["s",LR],C64["s",LR],C61["c",LR],C62["c",LR],C63["c",LR],
C64["c",LR],C61["b",LR],C62["b",LR],C63["b",LR],C64["b",LR]};
C8List[LR_]:={C81["u",LR],C82["u",LR],C83["u",LR],C84["u",LR],C81["d",LR],C82["d",LR],C83["d",LR],
C84["d",LR],C81["s",LR],C82["s",LR],C83["s",LR],C84["s",LR],C81["c",LR],C82["c",LR],C83["c",LR],
C84["c",LR],C81["b",LR],C82["b",LR],C83["b",LR],C84["b",LR]};
C6C8List[LR_]:=Join[C6List[LR],C8List[LR]];
(* 32 Nf=4 SM-DM operators, from 1801.04240 *)
C6ListNf4[LR_]:={C61["u",LR],C62["u",LR],C63["u",LR],C64["u",LR],C61["d",LR],C62["d",LR],C63["d",LR],
C64["d",LR],C61["s",LR],C62["s",LR],C63["s",LR],C64["s",LR],C61["c",LR],C62["c",LR],C63["c",LR],C64["c",LR]};
C8ListNf4[LR_]:={C81["u",LR],C82["u",LR],C83["u",LR],C84["u",LR],C81["d",LR],C82["d",LR],C83["d",LR],
C84["d",LR],C81["s",LR],C82["s",LR],C83["s",LR],C84["s",LR],C81["c",LR],C82["c",LR],C83["c",LR],C84["c",LR]};
C6C8ListNf4[LR_]:=Join[C6ListNf4[LR],C8ListNf4[LR]];
(* 24 Nf=3 SM-DM operators, from 1801.04240 *)
C6ListNf3[LR_]:={C61["u",LR],C62["u",LR],C63["u",LR],C64["u",LR],C61["d",LR],C62["d",LR],C63["d",LR],
C64["d",LR],C61["s",LR],C62["s",LR],C63["s",LR],C64["s",LR]};
C8ListNf3[LR_]:={C81["u",LR],C82["u",LR],C83["u",LR],C84["u",LR],C81["d",LR],C82["d",LR],C83["d",LR],
C84["d",LR],C81["s",LR],C82["s",LR],C83["s",LR],C84["s",LR]};
C6C8ListNf3[LR_]:=Join[C6ListNf3[LR],C8ListNf3[LR]];


(* --------------------------------------------------------------------------
* \[Gamma]1Hat 
* -------------------------------------------------------------------------- *)

(* Eq. (32) in 1801.04240 *)
\[Gamma]1HatD63C63C81Sum=-16NcNum( Sum[(MQ[flavors5q[[i]],"MZ"])^2/(MQ[flavors5q[[j]],"MZ"])^2 D63[flavors5q[[i]],flavors5q[[j]],L] C63[flavors5q[[i]],L] C81[flavors5q[[j]],R],
{j,1,Length[flavors5q]},{i,1,j-1}]+
Sum[(MQ[flavors5q[[i]],"MZ"])^2/(MQ[flavors5q[[j]],"MZ"])^2 D63[flavors5q[[i]],flavors5q[[j]],L] C63[flavors5q[[i]],L] C81[flavors5q[[j]],R],{j,1,Length[flavors5q]},
{i,j+1,Length[flavors5q]}]);
\[Gamma]1HatD63C64C82Sum=-16NcNum( Sum[(MQ[flavors5q[[i]],"MZ"])^2/(MQ[flavors5q[[j]],"MZ"])^2 D63[flavors5q[[i]],flavors5q[[j]],L] C64[flavors5q[[i]],L] C82[flavors5q[[j]],R],
{j,1,Length[flavors5q]},{i,1,j-1}]+
Sum[(MQ[flavors5q[[i]],"MZ"])^2/(MQ[flavors5q[[j]],"MZ"])^2 D63[flavors5q[[i]],flavors5q[[j]],L] C64[flavors5q[[i]],L] C82[flavors5q[[j]],R],{j,1,Length[flavors5q]},
{i,j+1,Length[flavors5q]}]);
\[Gamma]1HatD62C63C83Sum=-16NcNum( Sum[(MQ[flavors5q[[j]],"MZ"])^2/(MQ[flavors5q[[i]],"MZ"])^2 D62[flavors5q[[i]],flavors5q[[j]],L] C63[flavors5q[[j]],L] C83[flavors5q[[i]],R]+
(MQ[flavors5q[[i]],"MZ"])^2/(MQ[flavors5q[[j]],"MZ"])^2 D62[flavors5q[[i]],flavors5q[[j]],L] C63[flavors5q[[i]],L] C83[flavors5q[[j]],R],{j,1,Length[flavors5q]},{i,1,j-1}]);
\[Gamma]1HatD62C64C84Sum=-16NcNum( Sum[(MQ[flavors5q[[j]],"MZ"])^2/(MQ[flavors5q[[i]],"MZ"])^2 D62[flavors5q[[i]],flavors5q[[j]],L] C64[flavors5q[[j]],L] C84[flavors5q[[i]],R]+
(MQ[flavors5q[[i]],"MZ"])^2/(MQ[flavors5q[[j]],"MZ"])^2 D62[flavors5q[[i]],flavors5q[[j]],L] C64[flavors5q[[i]],L] C84[flavors5q[[j]],R],{j,1,Length[flavors5q]},{i,1,j-1}]);
(* only the loops with b and c quarks are kept *)
JBRepl={D61["u","d",L]->0,D62["u","d",L]->0,D63["u","d",L]->0,D63["d","u",L]->0,D64["u","d",L]->0,D65["u","d",L]->0,
D66["u","d",L]->0,D66["d","u",L]->0,
D61["u","s",L]->0,D62["u","s",L]->0,D63["u","s",L]->0,D63["s","u",L]->0,D64["u","s",L]->0,D65["u","s",L]->0,
D66["u","s",L]->0,D66["s","u",L]->0,
D61["d","s",L]->0,D62["d","s",L]->0,D63["d","s",L]->0,D63["s","d",L]->0,D64["d","s",L]->0,D65["d","s",L]->0,
D66["d","s",L]->0,D66["s","d",L]->0};
(* combined *)
\[Gamma]1HatSum=(\[Gamma]1HatD63C63C81Sum+\[Gamma]1HatD63C64C82Sum+\[Gamma]1HatD62C63C83Sum+\[Gamma]1HatD62C64C84Sum)/.JBRepl;


(* --------------------------------------------------------------------------
* \[Gamma]1Tilde
* -------------------------------------------------------------------------- *)
(* Eq. (33) in 1801.04240 *)
\[Gamma]m0=6*4/3;
\[Gamma]1TildeSum[nf_]:=2(\[Gamma]m0-\[Beta]0[nf])Sum[C8List[L][[i]]C8List[R][[i]],{i,Length[C8List[L]]}];


(* --------------------------------------------------------------------------
* RGE, ADM
* -------------------------------------------------------------------------- *)
ReplD6Sol=Table[D6List[L][[i]]-> SolD6[[i]],{i,Length[D6List[L]]}];
ReplD6SolNf4=Table[D6ListNf4[L][[i]]-> SolD6Nf4[[i]],{i,Length[D6ListNf4[L]]}];
\[Gamma]HatMat[\[Mu]X_]:=Table[Coefficient[\[Gamma]1HatSum,C6List[L][[i]]C8List[R][[j]]]/.ReplD6Sol/.\[Mu]->\[Mu]X,{i,Length[C6List[L]]},{j,Length[C8List[R]]}];
\[Gamma]HatMatNf4[\[Mu]X_]:=Table[Coefficient[\[Gamma]1HatSum,C6ListNf4[L][[i]]C8ListNf4[R][[j]]]/.ReplD6SolNf4/.\[Mu]->\[Mu]X,{i,Length[C6ListNf4[L]]},{j,Length[C8ListNf4[R]]}];


(* --------------------------------------------------------------------------
* Umat RGE Subscript[n, f]=5
* -------------------------------------------------------------------------- *)
\[Gamma]MatU[\[Mu]X_]:=Table[Coefficient[\[Gamma]1HatSum+\[Gamma]1TildeSum[5],C6C8List[L][[i]]C6C8List[R][[j]]]/.ReplD6Sol/.\[Mu]->\[Mu]X,{i,Length[C6C8List[L]]},
{j,Length[C6C8List[R]]}];
Interm1[\[Mu]_]=\[Alpha]SFun[\[Mu]]/(4\[Pi]) \[Gamma]MatU[\[Mu]]\[Transpose].Table[UMat[i,k,\[Mu]],{i,Length[C6C8List[L]]},{k,Length[C6C8List[L]]}];
UMatEqs=Table[\[Mu] D[UMat[j,k,\[Mu]],\[Mu]]==Interm1[\[Mu]][[j,k]],{j,Length[C6C8List[L]]},{k,Length[C6C8List[L]]}]//Flatten;
VarListUMat=Table[UMat[i,j,\[Mu]],{i,Length[C6C8List[L]]},{j,Length[C6C8List[R]]}]//Flatten;
UMatInitCond=Table[UMat[i,j,MZ]==KroneckerDelta[i,j],{i,Length[C6C8List[L]]},{j,Length[C6C8List[R]]}]//Flatten;
SolUmat=NDSolveValue[{UMatEqs,UMatInitCond}//Flatten,VarListUMat,{\[Mu],MZ,LowFact*MBatMBms}];
UmatNum=Transpose[Table[SolUmat[[i+j Length[C6C8List[r]]]],{i,Length[C6C8List[L]]},{j,0,Length[C6C8List[R]]-1}]];


(* --------------------------------------------------------------------------
* Umat RGE Subscript[n, f]=4
* -------------------------------------------------------------------------- *)
\[Gamma]MatUNf4[\[Mu]X_]:=Table[Coefficient[\[Gamma]1HatSum+\[Gamma]1TildeSum[4],C6C8ListNf4[L][[i]]C6C8ListNf4[R][[j]]]/.ReplD6SolNf4/.\[Mu]->\[Mu]X,
{i,Length[C6C8ListNf4[L]]},{j,Length[C6C8ListNf4[R]]}];
Interm1Nf4[\[Mu]_]=\[Alpha]SFun[\[Mu]]/(4\[Pi]) \[Gamma]MatUNf4[\[Mu]]\[Transpose].Table[UMat[i,k,\[Mu]],{i,Length[C6C8ListNf4[L]]},{k,Length[C6C8ListNf4[L]]}];
UMatEqsNf4=Table[\[Mu] D[UMat[j,k,\[Mu]],\[Mu]]==Interm1Nf4[\[Mu]][[j,k]],{j,Length[C6C8ListNf4[L]]},{k,Length[C6C8ListNf4[L]]}]//Flatten;
VarListUMatNf4=Table[UMat[i,j,\[Mu]],{i,Length[C6C8ListNf4[L]]},{j,Length[C6C8ListNf4[R]]}]//Flatten;
UMatInitCondNf4=Table[UMat[i,j,MBatMBms]==KroneckerDelta[i,j],{i,Length[C6C8ListNf4[L]]},{j,Length[C6C8ListNf4[R]]}]//Flatten;
SolUmatNf4=NDSolveValue[{UMatEqsNf4,UMatInitCondNf4}//Flatten,VarListUMatNf4,{\[Mu],MBatMBms, LowFact*scale["2GeV"]}];
UmatNumNf4=Transpose[Table[SolUmatNf4[[i+j Length[C6C8ListNf4[r]]]],{i,Length[C6C8ListNf4[L]]},{j,0,Length[C6C8ListNf4[R]]-1}]];


(* --------------------------------------------------------------------------
* U matrix that takes as inputs C_i^(6)[MZ] and gives C_i^8[mu=2GeV]
* -------------------------------------------------------------------------- *)
PositionC6C8List=Table[Position[C6C8List[L],C6C8ListNf4[L][[i]]],{i, Length[C6C8ListNf4[L]]}]//Flatten;
PositionC6C8ListNf4toNf3=Table[Position[C6C8ListNf4[L],C6C8ListNf3[L][[i]]],{i, Length[C6C8ListNf3[L]]}]//Flatten;
UmatResInt=Table[(UmatNumNf4/.\[Mu]->scale["2GeV"])[[PositionC6C8ListNf4toNf3[[j]]]],{j,Length[PositionC6C8ListNf4toNf3]}].
Table[(UmatNum/.\[Mu]->MBatMBms)[[PositionC6C8List[[j]]]],{j,Length[PositionC6C8List]}];
UmatRes=UmatResInt[[13;;,;;20]];


Export[NotebookDirectory[]<>"/Umat.dat",UmatRes];


End[]


EndPackage[]
