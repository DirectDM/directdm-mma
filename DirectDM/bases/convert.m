(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


TypeName[type_]:=Switch[type,"D","Dirac","C","Complex Scalar","M","Majorana","R","Real Scalar"]


SetCoeffMstar[basis_,coeff_,value_] := SetCoeffMstar[$DMType][basis, coeff, value];


SetCoeffMstar["D"][basis_,coeff_,value_] := Module[{type,num,tmp,arg,oval,scl,imgmsg},
	tmp  = ToString[Head@coeff];
	type = StringTake[tmp,1];
	num  = ToExpression@StringDrop[tmp,1];
	arg  = ToString[##]&@@coeff;
	scl  = MatchingScale[basis];
  (* ------------------------------------------------------------------------ * 
	 * Use an associations to set the value of the coefficient
   * ------------------------------------------------------------------------ *)
	odim=<|5->Q6, 6->Q6, 7->Q6, 8->Q6, 11-> Q7, 12->Q7, 13->Q7, 14->Q7,
			 1->Q7, 2->Q7, 3->Q7, 4->Q7, 9 -> Q7, 10->Q7, "M"->Q5, "D"->Q5 |>;
	onum=<|5->1, 6->2, 7->3, 8->4, 11-> 1, 12->2, 13->3, 14->4,
			 1->5, 2->6, 3->7, 4->8, 9 ->9,  10->10, "M"->1, "D"->2 |>;
	oval=<| 1  -> 1/value^3, 3 ->  1/value^3, 5->1/value^2, 7 -> 1/value^2, 
          2  -> 1/value^3, 4 -> -1/value^3, 6->1/value^2, 8 -> 1/value^2,
			   11  -> 3*\[Pi]/value^3, 13-> I*2*\[Pi]/value^3,
				 12  -> 3*\[Pi]/value^3, 14->-I*2*\[Pi]/value^3,
				  9  -> 1/MQ[arg,scl]/value^2,
         10  -> 1/MQ[arg,scl]/value^2,
         "M" ->    8\[Pi]^2/Sqrt[4\[Pi]*\[Alpha]emMZ]*value,
         "D" -> -I*8\[Pi]^2/Sqrt[4\[Pi]*\[Alpha]emMZ]*value |>;
  (* ------------------------------------------------------------------------ * 
   *  Do some error checking: correct $DMType, operator name and number
   * ------------------------------------------------------------------------ *)
	If[$DMType=!=type,Print["Please make sure to SetDMType to \""<>type<>"\" before setting\
coefficients in the "<>TypeName[type]<>" basis."];Abort[]];
	If[!StringMatchQ[type,dmtypes],
		Print["Please input a valid operator name."];Return[]];
	If[!NumericQ[num],Print["Please input a valid operator number."];Return[]];
	imgmsg = "The input must be imaginary else the cross-section can be negative!\
\nThe Operator \[Times] Coefficient for D, D13, and D14 are not Hermitian.";
  (* ------------------------------------------------------------------------ * 
   *  Call SetCoeff
   * ------------------------------------------------------------------------ *)
  If[num==0, num=arg; arg=Sequence[]];
	If[FreeQ[FullForm[value],Complex] && ( MemberQ[{13,14},num] || num === "D" ),
	  Print[imgmsg];Abort[]];
		SetCoeff[basis, odim[num][onum[num],arg], oval[num]];
];


SetCoeffMstar["M"][basis_,coeff_,value_] := Module[{type,num,tmp,arg,oval,scl,imgmsg},
	tmp  = ToString[Head@coeff];
	type = StringTake[tmp,1];
	num  = ToExpression@StringDrop[tmp,1];
	arg  = ToString[##]&@@coeff;
	scl  = MatchingScale[basis];
  (* ------------------------------------------------------------------------ * 
	 * Use an associations to set the value of the coefficient
   * ------------------------------------------------------------------------ *)
	odim=<|5->Q6, 6->Q6, 7->Q7, 8->Q7, 9->Q7, 10-> Q7,
			 	 1->Q7, 2->Q7, 3->Q7, 4->Q7|>;
	onum=<|5->2, 6->4, 7->1, 8->2, 9->3, 10-> 4,
			 	 1->5, 2->6, 3->7, 4->8|>;
	oval=<| 1  -> 1/value^3, 3 ->  1/value^3, 5->1/value^2, 7 -> 3*\[Pi]/value^3,
          2  -> 1/value^3, 4 -> -1/value^3, 6->1/value^2, 8 -> 3*\[Pi]/value^3,
			    9  ->  I*2*\[Pi]/value^3,
				 10  -> -I*2*\[Pi]/value^3|>;
  (* ------------------------------------------------------------------------ * 
   *  Do some error checking: correct $DMType, operator name and number
   * ------------------------------------------------------------------------ *)
	If[$DMType=!=type,Print["Please make sure to SetDMType to \""<>type<>"\" before setting\
coefficients in the "<>TypeName[type]<>" basis."];Abort[]];
	If[!StringMatchQ[type,dmtypes],
		Print["Please input a valid operator name."];Return[]];
	If[!NumericQ[num],Print["Please input a valid operator number."];Return[]];
	imgmsg = "The input must be imaginary else the cross-section can be negative!\
\nThe Operator \[Times] Coefficient for M9 and M10 are not Hermitian.";
  (* ------------------------------------------------------------------------ * 
   *  Call SetCoeff
   * ------------------------------------------------------------------------ *)
  If[num==0, num=arg; arg=Sequence[]];
	If[FreeQ[FullForm[value],Complex] && ( MemberQ[{13,14},num] || num === "D" ),
	  Print[imgmsg];Abort[]];
		SetCoeff[basis, odim[num][onum[num],arg], oval[num]];
];


SetCoeffMstar["C"][basis_,coeff_,value_] := Print["The conversion from the complex scalar \
basis of Goodman et al. [1009.0008] is not yet implemented."];


SetCoeffMstar["R"][basis_,coeff_,value_] := Module[{type,num,tmp,arg,oval,scl,imgmsg},
	tmp  = ToString[Head@coeff];
	type = StringTake[tmp,1];
	num  = ToExpression@StringDrop[tmp,1];
	arg  = ToString[##]&@@coeff;
	scl  = MatchingScale[basis];
  (* ------------------------------------------------------------------------ * 
	 * Use an associations to set the value of the coefficient
   * ------------------------------------------------------------------------ *)
	odim= <| 1->Q6, 2->Q6, 3->Q6, 4->Q6 |>;
	onum= <| 1->3,  2->4,  3->5,  4->6  |>;
	oval=<|  1-> 1/value^2, 3->   3*\[Pi]/value^2,
           2-> 1/value^2, 4-> I*2*\[Pi]/value^2 |>;
  (* ------------------------------------------------------------------------ * 
   *  Do some error checking: correct $DMType, operator name and number
   * ------------------------------------------------------------------------ *)
	If[$DMType=!=type,Print["Please make sure to SetDMType to \""<>type<>"\" before setting\
coefficients in the "<>TypeName[type]<>" basis."];Abort[]];
	If[!StringMatchQ[type,dmtypes],
		Print["Please input a valid operator name."];Return[]];
	If[!NumericQ[num],Print["Please input a valid operator number."];Return[]];
	imgmsg = "The input must be imaginary else the cross-section can be negative!\
\nThe Operator \[Times] Coefficient for M9 and M10 are not Hermitian.";
  (* ------------------------------------------------------------------------ * 
   *  Call SetCoeff
   * ------------------------------------------------------------------------ *)
  If[num==0, num=arg; arg=Sequence[]];
	If[FreeQ[FullForm[value],Complex] && ( MemberQ[{13,14},num] || num === "D" ),
	  Print[imgmsg];Abort[]];
		SetCoeff[basis, odim[num][onum[num],arg], oval[num]];
];


End[]


EndPackage[]
