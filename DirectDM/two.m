(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


cQ["c"] = 1.32;
cQ["b"] = 1.19;
cQ["t"] = 1;


aV["u"] = aV["c"] = aV["t"] = 1/4-2/3*SW2MZ;
aA["u"] = aA["c"] = aA["t"] = -1/4;


aV["d"] = aV["s"] = aV["b"] = -1/4+1/3*SW2MZ;
aA["d"] = aA["s"] = aA["b"] = +1/4;


aV["e"] = aV["mu"] = aV["tau"] = -1/4+1/3*SW2MZ;
aA["e"] = aA["mu"] = aA["tau"] = +1/4;


bx[x_] := Sqrt[1 - x/4];


gh[xi_] := Module[{},
  ((-2 (2 + 2 xi - xi^2))/bx[xi] ArcTan[(2 bx[xi])/Sqrt[xi]] + \
    2 Sqrt[xi] (2 - xi*Log[xi]))
];


gS[x_] := Module[{},
	1/(4*bx[x])*(4-2*x+x^2)*ArcTan[2*bx[x]/Sqrt[x]] + \
	1/4*Sqrt[x]*(2-x*Log[x])
];


gAV[x_] := Module[{},
	1/(24*bx[x])*Sqrt[x]*(8-x-x^2)*ArcTan[2*bx[x]/Sqrt[x]] - \
	1/24*x*(2-(3+x)*Log[x])
];


gT1[x_] := Module[{},
	1/3*bx[x]*(2+x^2)*ArcTan[2*bx[x]/Sqrt[x]] + \
	1/12*Sqrt[x]*(1-2*x-x*(2-x)*Log[x])
];


gT2[x_] := Module[{},
	1/(4*bx[x])*x*(2-4*x+x^2)*ArcTan[2*bx[x]/Sqrt[x]] - \
	1/4*Sqrt[x]*(1-2*x-x*(2-x)*Log[x])
];


gB1[x_] := -1/24 Sqrt[x] (x*Log[x] - 2) \
	+ ((x^2 - 2 x + 4) ArcTan[2 bx[x]/Sqrt[x]])/(24 bx[x])


Gt1[z_,y_] := \
	- Sqrt[z]*(12*y^2-z*y+z^2)/(3*(4*y-z)^2) \
	+ z^(3/2)*(48*y^3-20*z*y^2+12*z^2*y-z^3)/(6*(4*y-z)^3)*Log[z] \
	+ 2*z^(3/2)*y^2*(4*y-7*z)/(3*(4*y-z)^3)*Log[4*y] \
	- z^(3/2)*Sqrt[y]*(16*y^3-4*(2+7*z)*y^2+14*(2+z)*y+5*z)/(3*(4*y-z)^3*Sqrt[1-y])\
		* ArcTan[Sqrt[1-y]/Sqrt[y]] \
	- ArcTan[Sqrt[4-z]/Sqrt[z]] \
		* ( 48*(z^2-2*z+4)*y^3 -4*z*(5*z^2-10*z+44)*y^2 + 12*z^3*(z-2)*y \
				-z^3*(z^2-2*z+4) )/( 3*(4*y-z)^3*Sqrt[4-z] );


Gt2[z_,y_] := Sqrt[z]*(2*y-z)/(4*y-z) \
	- ( z^(3/2)*(8*y^2-8*z*y+z^2) )/( 2*(4*y-z)^2 )*Log[z] \
	- ( 4*z^(3/2)*y^2 )/( (4*y-z)^2 )*Log[4*y] \
	+ ( 4*z^(3/2)*Sqrt[y]*(2*y^2-y-1) )/( (4*y-z)^2*Sqrt[1-y] ) \
		* ArcTan[Sqrt[1-y]/Sqrt[y]] \
	- ( 8*z*(z^2-2*z+1)*y - (z^2-2*z+4)*(8*y^2+z^2) )/( (4*y-z)^2*Sqrt[4-z] ) \
		* ArcTan[Sqrt[4-z]/Sqrt[z]];


I1[z_,y_] := NIntegrate[
	( (Sqrt[t+4]-Sqrt[t])*(Log[Sqrt[t+4*y]+Sqrt[t]]-Log[Sqrt[t+4*y]-Sqrt[t]]) ) \
		/ ( (t+z)^2*(t+4*y)^(5/2)*t ),
	{t,0,Infinity}
]


I2[z_,y_] := NIntegrate[
	1/2 * ( (t+2-Sqrt[t]*Sqrt[t+4])\
		*(Log[Sqrt[t+4*y]+Sqrt[t]] - Log[Sqrt[t+4*y]-Sqrt[t]]) )\
		/ ( (t+z)^2*(t+4*y)^(5/2)*t^(1/2) ),
	{t,0,Infinity}
]


I3[z_,y_] := NIntegrate[
	( (Sqrt[t+4]-Sqrt[t])*(Log[Sqrt[t+4*y]+Sqrt[t]] - Log[Sqrt[t+4*y]-Sqrt[t]]) )\
	/ ( (t+z)^2*(t+4*y)^(5/2) ),
	{t,0,Infinity}
]


I4[z_,y_] := NIntegrate[
	1/2*( Sqrt[t]*(t+2-Sqrt[t]*Sqrt[t+4])\
		* (Log[Sqrt[t+4*y]+Sqrt[t]] - Log[Sqrt[t+4*y]-Sqrt[t]]) ) \
	/ ( (t+z)^2*(t+4*y)^(5/2) ),
	{t,0,Infinity}
]


gB31[x_, y_] := -x^(3/2)/(12 (y - x)) +\
		(-x^(3/2) y^2)/(24 (y - x)^2) Log[y] -\
		(x^(5/2) (x - 2 y))/(24 (y - x)^2) Log[x] - (\
    x^(3/2) Sqrt[y] (y + 2) Sqrt[4 - y])/(12 (y - x)^2) *\
     ArcTan[Sqrt[4 - y]/Sqrt[y]] +\
   (x (x^3 - 2 (y + 1) x^2 + 4 (y + 1) x + 4 y))/(\
    12 (y - x)^2 Sqrt[4 - x]) ArcTan[Sqrt[4 - x]/Sqrt[x]];


gB32[x_, y_] := (-x^(3/2) y)/( \
   12 (y - x)^2) + \
		(-x^(5/2) y^2)/(24 (y - x)^3) Log[y] + \
		(x^(5/2) y^2)/(24 (y - x)^3) Log[x] + \
    (x^(3/2) Sqrt[y] (-6 y + x*y^2 - 2 x*y - 2 x))/( \
    	12 (y - x)^3 Sqrt[4 - y]) ArcTan[Sqrt[4 - y]/Sqrt[y]] + \
		(-x*y (x^2 y - 2 x*y - 6 x - 2 y))/(12 (y - x)^3 Sqrt[4 - x]) * \
     ArcTan[Sqrt[4 - x]/Sqrt[x]];


A1 = -2*aV["t"]^2+4*aA["t"]^2;
A2 = -aV["t"]^2 + aA["t"]^2;

gtLog[z_,y_] := 4*z^(3/2)*y^2*( A1*y*(I1[z,y]+I2[z,y]) + A2*(I3[z,y]+I4[z,y]) );


gtNoLog[z_,y_] :=  aV["t"]^2*Gt1[z,y] + aA["t"]^2*Gt2[z,y];


gt[z_,y_] := gtNoLog[z,y] + gtLog[z,y];


gz[z_,y_]:=Module[{tmp1, tmp2, tmp3, tmp4},
	tmp1 = Sum[aV[f]^2+aA[f]^2, {f,{"u","d","s","c","b"}}];
	tmp2 = -2*Sum[cQ[f]*(aV[f]^2 - aA[f]^2), {f,{"c","b"}}];
	Return[(tmp1+tmp2)*4*gB1[z] + gt[z,y]];
]


gB3[x_,y_] := gB31[x,y]+cQ["b"]*gB32[x,y];


gw[w_,y_] := 2*gB1[w] + gB3[w,y];


gHwCoeff[   ]  := \[Alpha]emMZ^2/SW2MZ^2/(8*MH^2*MW)*($JX - $YX^2/4);
gHzCoeff[   ]  := \[Alpha]emMZ^2/SW2MZ^2/(8*MH^2*MW)*$YX^2/(8*CW2MZ^(3/2));
gSzCoeff[qf_]  := \[Alpha]emMZ^2/SW2MZ^2/(CW2MZ^2*MZ^3)*$YX^2*(aV[qf]^2-aA[qf]^2);
gAVwCoeff[   ] := \[Alpha]emMZ^2/SW2MZ^2/(2*MW^2)*($JX - $YX^2/4);
gAVzCoeff[qf_] := \[Alpha]emMZ^2/SW2MZ^2/(CW2MZ^2*MZ^2)*$YX^2*2*(aV[qf]^2+aA[qf]^2);


fa[MX_] := Module[{w,z,fa},
	w = MW^2/MX^2;
	z = MZ^2/MX^2;
	fa = - cQ["t"]*(gHwCoeff[]*gh[w]+gHzCoeff[]*gh[z]);
	Return[fa];
];


fbc[MX_] := Module[{w,z,y,fbc},
	w = MW^2/MX^2;
	z = MZ^2/MX^2;
	y = MT^2/MX^2;
	fbc = 3*\[Alpha]emMZ^2/SW2MZ^2/(2*MW^3)* \
		( ($JX-$YX^2/4)*gw[w,y] + $YX^2/(8*CW2MZ^(1/2))*gz[z,y] );
	Return[fbc];
];


DeltaC71[MX_] := Module[{tmp},
(*If[MX<MZ,*)
	Return[fa[MX]+fbc[MX]];(*,
	(* Else if MX<MZ *)
 	tmp=-3*\[Alpha]emMZ^2/SW2MZ^2*MX/(8*MW^2*MH^2*CW2MZ)*\
		($YX^2+CW2MZ*(4*$JX-$YX^2));
	Return[tmp];
	]*)
]

(*
DeltaC71[MX_] := Module[{tmp1,tmp2},
	(* If MX<MZ *)
	tmp1=fa[MX]+fbc[MX];
	(* Else if MX<MZ *)
 	tmp2=-3*\[Alpha]emMZ^2/SW2MZ^2*MX/(8*MW^2*MH^2*CW2MZ)*\
		($YX^2+CW2MZ*(4*$JX-$YX^2));
	Return[HeavisideTheta[1-MX/MZ]tmp1+HeavisideTheta[1-MZ/MX]tmp2];
]*)


DeltaC75[MX_,ff_] := Module[{w,z},
	w  = MW^2/MX^2;
	z  = MZ^2/MX^2;
	Return[gHwCoeff[]*gh[w] + gHzCoeff[]*gh[z] + gSzCoeff[ff]*gS[z]];
]


DeltaC64[MX_,ff_] := Module[{w,z},
	w  = MW^2/MX^2;
	z  = MZ^2/MX^2;
	Return[gAVwCoeff[]*gAV[w] + gAVzCoeff[ff]*gAV[z]];
];


DeltaC723[MX_,ff_] := Module[{w,z,tmpw,tmpz},
	w  = MW^2/MX^2;
	z  = MZ^2/MX^2;
	tmpw = gAVwCoeff[  ]/MW * ( gT1[w] + gT2[w] );
	tmpz = gAVzCoeff[ff]/MZ * ( gT1[z] + gT2[z] );
	Return[tmpw + tmpz];
];


End[]


EndPackage[]
