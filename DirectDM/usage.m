(* ::Package:: *)

Print[Style["DirectDM v1.0",Bold,RGBColor["#4682B4"],16]];
Print["A package for matching relativistic DM x SM EFT onto the \
non-relativistic Galilean invariant EFT for DM direct detection."];
Print["By: Fady Bishara, Joachim Brod, Ben Grinstein, and Jure Zupan; \
Please cite ",
Hyperlink["[1611.00368]","https://inspirehep.net/record/1495512"],", ",
Hyperlink["[1707.06998]","https://inspirehep.net/record/1611242"],", and ",
Hyperlink["[1706.xxxxx]",""],"."];
Print["\nAvailable functions are: SetDMType, SetCoeff, SetCoeffMstar, GetCoeff, CoeffsList, ComputeCoeffs, \
and ResetBasis.\n\
Implemented bases are: \"5Flavor\", \"4Flavor\", \"3Flavor\", and \"NR\".\n\n\
For the \"NR\" basis, the CoeffsList function takes \"NR_p\" and \"NR_n\" as \
inputs to distinguish between the proton and neutron Wilson coefficients.\n\n\
Type ?SetCoeff, e.g., for usage information\n"];
(* Wilson coefficients *)
Print[Style["Note that the Wilson coefficients are dimensionfull!"]];
Print[Style["\!\(\*SubsuperscriptBox[OverscriptBox[\(\[ScriptCapitalC]\), \(^\)], \(i\), \
\((d)\)]\)\[Congruent]\!\(\*FractionBox[SubsuperscriptBox[\(\[ScriptCapitalC]\), \(i\), \((d)\)], \
SuperscriptBox[\(\[CapitalLambda]\), \(d - 4\)]]\)",15,Bold]];

BeginPackage["DirectDM`"]


CoeffsList::usage="CoeffsList[\"basis\",optional arguments] returns the list \
of Wilson coefficients.\n
The \"basis\" input can take the values {\"NREFT\",\"HDMET\"}.\n
In the \"NREFT\", \"basis\" is either \"NR_p\" or \"NR_n\"
corresponding to the proton or neutron Wilson coefficients."


SetDMType::usage="SetDMType[\"type\"] sets the DM to one of the following \
types:\n\
\t\"D\" = Dirac,\n\t\"M\" = Majorana,\n\t\"C\" = complex scalar,\n\t\"S\" = real scalar."


SetCoeff::usage="SetCoef[\"basis\",coefficient,value]"


SetCoeffMstar::usage = "Set the coefficient in the basis of [1009.0008] -- see [1708.XXXXX] for details."


GetCoeff::usage="SetCoef[\"basis\",coefficient] returns the value of the \
coefficient."


ComputeCoeffs::usage = "ComputeCoeffs[basis_i, basis_f] sets the coefficients in basis_f \
by performing the running and matching starting from basis_i.\n\
This function takes an optional parameter Running -> True or False. \
It is set to True by default."


ResetBasis::usage = "ResetBasis[\"basis\"] resets all Wilson coefficients \
to zero";


Q5::usage="Dimension 5 operators";
Q6::usage="Dimension 6 operators";
Q7::usage="Dimension 7 operators";


qsq::usage="\!\(\*OverscriptBox[\(q\), \(\[RightVector]\)]\)"


MX::usage="Dark matter mass in [GeV]"


Running::usage="Running -> True/False is an option of the ComputeCoeffs function. The default is True."


EndPackage[]
