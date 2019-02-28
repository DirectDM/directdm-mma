(* ::Package:: *)

BeginPackage["DirectDM`"]


Begin["`Private`"]



(* -------------------------------------------------------------------------- * 
 *  Full FFs
 * -------------------------------------------------------------------------- *)
(* ===== Vector current ===== *)
Do[F1[qq,nn] = FF0["1",qq,nn], {qq,{"u","d","s"}},{nn,{"p","n"}}];
Do[F2[qq,nn] = FF0["2",qq,nn], {qq,{"u","d","s"}},{nn,{"p","n"}}];


(* ===== Axial current ===== *)
Do[ FA[qq,nn] = FF0["A" ,qq,nn], {qq,{"u","d","s"}},{nn,{"p","n"}}];
Do[FPp[qq,nn] = FF0["Pp",qq,nn], {qq,{"u","d","s"}},{nn,{"p","n"}}];


(* ===== Scalar current ===== *)
Do[ FS[qq,nn] = FF0["S" ,qq,nn], {qq,{"u","d","s"}},{nn,{"p","n"}}];


(* ===== Pseudoscalar current ===== *)
Do[ FP[qq,nn] = FF0["P" ,qq,nn], {qq,{"u","d","s"}},{nn,{"p","n"}}];


(* ===== GG current ===== *)
Do[ FG[nn] = FF0["G",nn], {nn,{"p","n"}}];


(* ===== GGdual current ===== *)
Do[FGt[nn] = FF0["Gt",nn], {nn,{"p","n"}}];


(* ===== Tensor current ===== *)
Do[FT0[qq,nn] = FF0["T0",qq,nn], {qq,{"u","d","s"}},{nn,{"p","n"}}];
Do[FT1[qq,nn] = FF0["T1",qq,nn], {qq,{"u","d","s"}},{nn,{"p","n"}}];


(* -------------------------------------------------------------------------- * 
 *  Zero momentum transfer FFs
 * -------------------------------------------------------------------------- *)
(* ===== Vector current ===== *)
FF0["1","u","p"] = 2;  FF0["1","d","p"] = 1;  FF0["1","s","p"] = 0;
FF0["1","d","n"] = 2;  FF0["1","u","n"] = 1;  FF0["1","s","n"] = 0;
FF0["2","u","p"] = 2(\[Mu]p-1)+\[Mu]n+\[Mu]s;
FF0["2","d","n"] = 2(\[Mu]p-1)+\[Mu]n+\[Mu]s;
FF0["2","d","p"] = 2\[Mu]n+(\[Mu]p-1)+\[Mu]s;
FF0["2","u","n"] = 2\[Mu]n+(\[Mu]p-1)+\[Mu]s;
FF0["2","s","p"] = \[Mu]s;
FF0["2","s","n"] = \[Mu]s;


aupPpEta = 2*(\[CapitalDelta]up+\[CapitalDelta]dp-2\[CapitalDelta]s)/3;
PionPole = 1/(m\[Pi]^2  + qsq);
EtaPole  = 1/(m\[Eta]^2 + qsq);
(* ===== Axial current ===== *)
FF0["A","u","p"]  = FF0["A","d","n"] = \[CapitalDelta]u;
FF0["A","d","p"]  = FF0["A","u","n"] = \[CapitalDelta]d;
FF0["A","s","p"]  = FF0["A","s","n"] = \[CapitalDelta]s;
FF0["Pp","u","p"] = + 2*gA*MN^2*PionPole + aupPpEta*MN^2*EtaPole;
FF0["Pp","d","p"] = - 2*gA*MN^2*PionPole + aupPpEta*MN^2*EtaPole;
FF0["Pp","s","p"] = - 2*aupPpEta*MN^2*EtaPole;
FF0["Pp","d","n"] = + 2*gA*MN^2*PionPole + aupPpEta*MN^2*EtaPole;
FF0["Pp","u","n"] = - 2*gA*MN^2*PionPole + aupPpEta*MN^2*EtaPole;
FF0["Pp","s","n"] = - 2*aupPpEta*MN^2*EtaPole;


(* ===== Scalar current ===== *)
Do[FF0["S",qq,nn] = \[Sigma][qq,nn], {qq,{"u","d","s"}}, {nn,{"p","n"}}];


(* ===== Pseudoscalar current ===== *)
aPPi["u","p"] = + gA*B0mu/MN;  aPPi["d","p"] = - gA*B0md/MN;
aPPi["d","n"] = + gA*B0md/MN;  aPPi["u","n"] = - gA*B0mu/MN;
aPPi["s","p"] = aPPi["s","n"] = 0;
TMP = (\[CapitalDelta]up+\[CapitalDelta]dp-2\[CapitalDelta]s);
aPEta["u","p"] = + B0mu*TMP/(3*MN);  aPEta["d","p"] = + B0md*TMP/(3*MN);
aPEta["d","n"] = + B0md*TMP/(3*MN);  aPEta["u","n"] = + B0mu*TMP/(3*MN);
aPEta["s","p"] = aPEta["s","n"] = - 2*B0ms*TMP/(3*MN);
Do[FF0["P",qq,nn] = MN^2*PionPole*aPPi[qq,nn] + MN^2*EtaPole*aPEta[qq,nn]
  ,{qq,{"u","d","s"}},{nn,{"p","n"}}]


(* ===== GG current ===== *)
FF0["G","p"] = FF0["G","n"] = -2*mG/27;


(* ===== GGdual current ===== *)
(* ----
  NOTE: aGtPi  -> - aGtPi under {p->n, u->d, and d->u} while 
        aGtEta -> + aGtEta
 ---- *)
aGtPi  = -mtilde*MN*gA*(1/mu-1/md)/2;
aGtEta = -mtilde*MN*(\[CapitalDelta]u+\[CapitalDelta]d-2\[CapitalDelta]s)*\
  (1/mu+1/md-2/ms)/6;
bGtp   = -mtilde*MN*(\[CapitalDelta]up/mu + \[CapitalDelta]dp/md + \[CapitalDelta]s/ms);
bGtn   = -mtilde*MN*(\[CapitalDelta]un/mu + \[CapitalDelta]dn/md + \[CapitalDelta]s/ms);
FF0["Gt","p"] = -qsq*PionPole*(+aGtPi) - qsq*EtaPole*aGtEta + bGtp;
FF0["Gt","n"] = -qsq*PionPole*(-aGtPi) - qsq*EtaPole*aGtEta + bGtn;


(* ===== Tensor current ===== *)
FF0["T0","u","p"] = + mu * gT["u"];  FF0["T0","d","p"] = + md * gT["d"];
FF0["T0","d","n"] = + md * gT["u"];  FF0["T0","u","n"] = + mu * gT["d"];
FF0["T0","s","p"] = FF0["T0","s","n"] = + ms * gT["s"];
FF0["T1","u","p"] = - mu * BT10["u","p"];  FF0["T1","d","p"] = - md * BT10["d","p"];
FF0["T1","d","n"] = - md * BT10["u","p"];  FF0["T1","u","n"] = - mu * BT10["d","p"];
FF0["T1","s","p"] = FF0["T1","s","n"] = - ms * BT10["s","p"];


End[]


EndPackage[]
