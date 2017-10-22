(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


RsAxial[nf_, asmuh_, asmul_] := \
	Exp[2*nf/(\[Pi]*bet[0][nf]) * ( asmuh - asmul )];

RsTensor[nf_, asmuh_, asmul_] := \
	(asmul / asmuh)^(-16/(3*bet[0][nf]));


RsQrkGlu[nf_, asmuh_, asmul_] := \
	MatrixExp[-(asmuh - asmul)/(4\[Pi])*{{0,4/3},{0,0}}*gam[0][nf]/(2*bet[0][nf]) ];


R5sQrkGlu[nf_, asmuh_, asmul_] := \
	MatrixExp[-(asmuh - asmul)/(4\[Pi])*{{0,-8},{0,0}}/(2*bet[0][nf]) ];


RsGluGlu[nf_, asmuh_, asmul_] := \
  betilde[nf, asmul] / betilde[nf, asmuh];


R5sGluGlu[nf_, asmuh_, asmul_] := asmul / asmuh;


(* -------------------------------------------------------------------------- *
 *  The QED anomalous dimension matrix
 * -------------------------------------------------------------------------- *)
Qe["u"] = Qe["c"] = Qe["t"] = +2/3;
Qe["d"] = Qe["s"] = Qe["b"] = -1/3;
Qe["e"] = Qe["mu"] = Qe["tau"] = -1;
Nc["u"] = Nc["d"] = Nc["s"] = Nc["c"] = Nc["b"] = Nc["t"] = 3;
Nc["e"] = Nc["mu"] = Nc["tau"] = 1;


GamQED[f_, g_] := 8/3 Qe[g]*Qe[f]*Nc[f];


RTMP[nf_, muh_, mul_] := Module[{dim,mat,bas,qrk,lep,asmuh,asmul,tmp1,tmp2},
	asmul = AlphaS[mul];
	asmuh = AlphaS[muh];
	bas = StringJoin[{ToString[nf],"Flavor"}];
	qrk = Cases[flavors[nf],x_/;MemberQ[quarks,x]];
	lep = Cases[flavors[nf],x_/;!MemberQ[quarks,x]];
	dim = BasisDim[bas];
	mat = ConstantArray[0,{dim,dim}];
	(* ------------------------------------------------------------------------ * 
	 *  The mixing among the CP even and odd spin-0 operators
	 * ------------------------------------------------------------------------ *)
	tmp1 = RsQrkGlu[nf, asmuh, asmul];
	tmp2 = R5sQrkGlu[nf, asmuh, asmul];
	(* ------------------------------------------------------------------------ * 
	 *  The electric and magnetic dipole operators don't run
	 * ------------------------------------------------------------------------ *)
	Do[ mat[[ Q5[bas][i], Q5[bas][i] ]] = 1, {i,{1,2}}];
	(* ------------------------------------------------------------------------ * 
	 *  The fermion vector currents mix via photon penguin insertion
	 * ------------------------------------------------------------------------ *)
	Do[ mat[[ Q6[bas][i,f], Q6[bas][i,g] ]] = KroneckerDelta[f,g] + \
		\[Alpha]emMZ*GamQED[g,f]/(4\[Pi])*Log[scale[mul]/scale[muh]], \
		{i,{1,2}}, {f,flavors[nf]}, {g,flavors[nf]} ];
	(* ------------------------------------------------- *
	 *  The quark (singlet) axial currents run
	 * ------------------------------------------------- *)
	Do[ mat[[ Q6[bas][i,f], Q6[bas][i,f] ]] = 1+0*RsAxial[nf, asmuh, asmul], {i,{3,4}}, {f,qrk} ];
	(* ------------------------------------------------- *
	 *  But the lepton axial vector currents don't run
	 * ------------------------------------------------- *)
	Do[ mat[[ Q6[bas][i,f], Q6[bas][i,f] ]] = 1, {i,{3,4}}, {f,lep} ];
	(* ------------------------------------------------- *
	 *  In our basis, the GG operators don't run because
	 *  we defined them with an alpha_s
	 * ------------------------------------------------- *)
	Do[ mat[[ Q7[bas][i], Q7[bas][i] ]] = 1, {i,1,4}];
	(* ------------------------------------------------- *
	Do[ mat[[ Q7[bas][i], Q7[bas][i] ]] = R5sGluGlu[nf,asmuh,asmul], {i,{3,4}}];
	 * ------------------------------------------------- *)
	(* ------------------------------------------------- *
	 *  The fermion scalar and pseudoscalar currents don't run 
	 * ------------------------------------------------- *)
	(* ------------------------------------------------- *
	 *  The running of the quark tensor currents
	 * ------------------------------------------------- *)
	Do[ mat[[ Q7[bas][i,f], Q7[bas][i,f] ]] = RsTensor[nf,asmuh,asmul], {i,{9,10}}, {f,qrk}];
	(* ------------------------------------------------- *
	 *  The lepton tensor currents don't run
	 * ------------------------------------------------- *)
	Do[ mat[[ Q7[bas][i,f], Q7[bas][i,f] ]] = 1, {i,{9,10}}, {f,lep}];
	(* ------------------------------------------------- *
	 *  Mixing of the GG currents into quark scalar currents
	 * ------------------------------------------------- *)
	Do[ mat[[ Q7[bas][i,f], Q7[bas][i,f] ]] = tmp1[[1,1]], \
		{i,5,6}, {f,flavors[nf]} ];
	Do[ \
		mat[[ Q7[bas][5,f], Q7[bas][1] ]] = tmp1[[1,2]];\
		mat[[ Q7[bas][6,f], Q7[bas][2] ]] = tmp1[[1,2]];\
		, {f,qrk} ];
	(* ------------------------------------------------- *
	 *  Mixing of the GG currents into quark scalar currents
	 * ------------------------------------------------- *)
	Do[ mat[[ Q7[bas][i,f], Q7[bas][i,f] ]] = tmp2[[1,1]], \
		{i,7,8}, {f,flavors[nf]} ];
	Do[ \
		mat[[ Q7[bas][7,f], Q7[bas][3] ]] = -tmp2[[1,2]];\
		mat[[ Q7[bas][8,f], Q7[bas][4] ]] = +tmp2[[1,2]];\
		, {f,qrk} ];
	(* ------------------------------------------------- *)
	Return[mat];
]

End[]


EndPackage[]
