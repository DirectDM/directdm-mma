(* ::Package:: *)

BeginPackage["DirectDM`"]


Begin["`Private`"]



(* -------------------------------------------------------------------------- * 
 *  Low energy constants -- see [1708.02678]
 * -------------------------------------------------------------------------- *)
(* ===== Vector current ===== *)
\[Mu]p = 2.793; \[Mu]n = -1.913; \[Mu]s = -0.064;
(* ---- 
\[Mu]hatup = \[Mu]hatdn = + 1.84;
\[Mu]hatdp = \[Mu]hatun = - 1.03;
   ----  *)
(* ===== Axial current ===== *)
gA = 1.2723; 
\[CapitalDelta]u = Round[(0.521 + gA)/2,0.001]; (* [1707.06998] Eq. (A17) *)
\[CapitalDelta]d = Round[(0.521 - gA)/2,0.001]; (* [1707.06998] Eq. (A17) *)
\[CapitalDelta]up = \[CapitalDelta]dn = \[CapitalDelta]u;
\[CapitalDelta]dp = \[CapitalDelta]un = \[CapitalDelta]d;
\[CapitalDelta]s = -0.031;
B0mu = 6100*^-6   (* GeV^2 *);
B0md = 13300*^-6  (* GeV^2 *);
B0ms = 0.268      (* GeV^2 *);
\[Sigma]["u","p"] = 17*^-3 (* GeV *);
\[Sigma]["u","n"] = 15*^-3 (* GeV *);
\[Sigma]["d","p"] = 32*^-3 (* GeV *);
\[Sigma]["d","n"] = 36*^-3 (* GeV *);
\[Sigma]["s","p"] = \[Sigma]["s","n"] = 41.3*^-3 (* GeV *);
mG = 848*^-3 (* GeV *);


(* -------------------------------------------------------------------------- * 
 *  The u, d, and s masses are MSbar at 2 GeV from 2016 PDG
 * -------------------------------------------------------------------------- *)
mu = 2.2*^-3 (* GeV *);
md = 4.7*^-3 (* GeV *);
ms = 96*^-3  (* GeV *);
mtilde = 1/(1/mu + 1/md + 1/ms) (* Eq. B17 in [1611.00368] *);
(* -------------------------------------------------------------------------- * 
 *  Quark masses at matching scales at all other scales are obtained by       *
 *  one-loop running with the appropriate number of active flavors            *
 * -------------------------------------------------------------------------- *)
MQ["u","MZ"] = 0.0015; MQ["u","MB"] = 0.0020; MQ["u","2GeV"] = mu;
MQ["d","MZ"] = 0.0031; MQ["d","MB"] = 0.0042; MQ["d","2GeV"] = md; 
MQ["s","MZ"] = 0.063;  MQ["s","MB"] = 0.086;  MQ["s","2GeV"] = ms;
MQ["c","MZ"] = 0.78;   MQ["c","MB"] = 1.06;
MQ["b","MZ"] = 3.08;


(* -------------------------------------------------------------------------- * 
 *  The average nucleon mass and the meson masses from PDG 2016
 * -------------------------------------------------------------------------- *)
MN = (0.938272 + 0.939565)/2 (* GeV *); (* average of m_p and m_n *)
m\[Pi]  = 134.9766*^-3 (* GeV *);
m\[Eta] = 547.862*^-3  (* GeV *);


(* -------------------------------------------------------------------------- * 
 *  The tensor charges and form factor coefficients @ 2 GeV
 * -------------------------------------------------------------------------- *)
gT["u"] = + 0.794;
gT["d"] = - 0.204;
gT["s"] = + 3.2*^-4;

BT10["u","p"] = BT10["d","n"] = 3.0;
BT10["d","p"] = BT10["u","n"] = 0.24;
BT10["s","p"] = BT10["s","n"] = 0.0;



(* -------------------------------------------------------------------------- * 
 *  Derivatives of the tensor form factors
 *  ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 *  NB: for the time being, multiply by 0 to turn off q^2 term in FF
 *      -- i.e., work to leading order only in q^2 expansion;
 *      this is equivalent to setting the derivatives, FF(0)' = 0
 * -------------------------------------------------------------------------- *)
dFT0["u","p"] = dFT0["d","n"] = 0 * (0.8 * FT0["u","p"]) (* GeV^-2 *);
dFT0["d","p"] = dFT0["u","n"] = 0 * (0.7 * FT0["d","p"]) (* GeV^-2 *);
dFT0["s","p"] = dFT0["s","n"] = 0 * (0.7 * FT0["s","p"]) (* GeV^-2 *);

dFT1["u","p"] = dFT1["d","n"] = 0 * (+ 1.0 * FT1["u","p"])  (* GeV^-2 *);
dFT1["d","p"] = dFT1["u","n"] = 0 * (- 0.1 * FT1["d","p"]) (* GeV^-2 *);
dFT1["s","p"] = dFT1["s","n"] = 0 * (- 2.0) (* GeV^-2 *);


(* -------------------------------------------------------------------------- * 
 *  Electroweak inputs
 * -------------------------------------------------------------------------- *)
\[Alpha]emQ0 = 1./137.036;  (* PDG 2018 -- EW SM review *)
\[Alpha]emMZ = 1./127.955;  (* PDG 2018 -- EW SM review *)
MH           = 125.10;      (* [GeV] *)
MZ           = 91.1876;     (* [GeV] *)
MW           = 80.379;      (* [GeV] *)
MT           = 173.;        (* [GeV] *)
GF           = 1.1663787*^-5;
vev          = 1/Sqrt[Sqrt[2.]*GF] (* [GeV] *);
SW2MZ        = 0.23122 (* From PDG 2018; MSbar at MZ *);
CW2MZ        = 1-SW2MZ;
SW           = Sqrt[SW2MZ];
sw           = SW;
\[Lambda]    = 2*MH^2/vev^2  (* Dimensionless Higgs trilinear *);


(* -------------------------------------------------------------------------- * 
 *  QCD inputs
 * -------------------------------------------------------------------------- *)
MBatMBms     = 4.18    (* [GeV] -- from the 2016 PDG *);
MCat3GeVms   = 0.9851  (* [GeV] -- from lattice calculation in [1408.4169] *);
AlphaS["MZ"] = 0.1181  (* From 2016 PDG *);


scale["2GeV"] = 2; scale["MB"] = MBatMBms;
scale["3GeV"] = 3; scale["MZ"] = MZ;


End[]


EndPackage[]
