(* Initialization file for the package DirectDM` *)

Get["DirectDM`usage`"];
Get["DirectDM`functions`"];
Get["DirectDM`inputs`"];
Get["DirectDM`formfactors`"];
Get["DirectDM`two`"];


(* Bases *)

Get["DirectDM`bases`smeft`"];
Get["DirectDM`bases`xxeft`"];
Get["DirectDM`bases`sixflavor`"];
Get["DirectDM`bases`fiveflavor`"];
Get["DirectDM`bases`fourflavor`"];
Get["DirectDM`bases`threeflavor`"];
Get["DirectDM`bases`nreft`"];
Get["DirectDM`bases`convert`"];


(* Matching *)

Get["DirectDM`matching`matchew`"];
Get["DirectDM`matching`match45`"];
Get["DirectDM`matching`match34`"];
Get["DirectDM`matching`matchcnr`"];
Get["DirectDM`matching`matchcnrScalar`"];


(* Running *)

Get["DirectDM`running`runnfsm`"];

(* ------------------------------------------------------------------
 *  Set default DM properties
 * ------------------------------------------------------------------ *)
SetDMType["D"];       (* By default, the DM is a Dirac fermion,       *)
SetDMMass[100];       (*  with 100 GeV mass,                          *)
SetDMHypercharge[0];  (*  zero hypercharge,                           *)
SetDMIsospin[0];      (*  and is an isospin singlet.                  *)
SetScale[1000];       (* The default EFT scale is 1 TeV.              *)
