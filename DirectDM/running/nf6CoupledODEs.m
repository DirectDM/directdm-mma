(* ::Package:: *)

BeginPackage["DirectDM`"];


Begin["`Private`"]


$nf6CoupledODEs={\[Mu]*Derivative[1][CD6[1, 1]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(12*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/
    (3*Pi) + (2*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (4*$DX*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) - 
   (alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/Pi + (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/
    (9*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(2*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[5, 1][\[Mu]])/
    (4*Pi) - (3*alfa["g2"][\[Mu]]*CD6[6, 1][\[Mu]])/Pi + 
   (alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[118, 1][\[Mu]])/(12*Pi) + 
   (5*alfa["g2"][\[Mu]]*CD6[101, 1, 1][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[101, 1, 2][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[101, 1, 3][\[Mu]])/(2*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[102, 1, 1][\[Mu]])/(3*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 1, 1][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 1, 2][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 1, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[1, 2]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(12*Pi) - 
   (alfa["yc"][\[Mu]]*CD6[15][\[Mu]])/(4*Pi) + (2*alfa["g2"][\[Mu]]*CD6[501][\[Mu]])/
    (3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (2*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (4*$DX*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(2*Pi) - (alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/
    Pi + (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(9*Pi) + 
   (alfa["yc"][\[Mu]]*CD6[1, 2][\[Mu]])/(4*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/
    (2*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[5, 2][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[6, 2][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[118, 2][\[Mu]])/
    (12*Pi) + (alfa["g2"][\[Mu]]*CD6[101, 1, 2][\[Mu]])/(2*Pi) + 
   (5*alfa["g2"][\[Mu]]*CD6[101, 2, 2][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[101, 2, 3][\[Mu]])/(2*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[102, 2, 2][\[Mu]])/(3*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 2, 1][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 2, 2][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 2, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[1, 3]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(12*Pi) - 
   (alfa["yb"][\[Mu]]*CD6[15][\[Mu]])/(4*Pi) - (alfa["yt"][\[Mu]]*CD6[15][\[Mu]])/
    (4*Pi) + (2*alfa["g2"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   (2*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (2*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (4*$DX*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/
    (2*Pi) - (alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/Pi + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(9*Pi) + 
   (alfa["yb"][\[Mu]]*CD6[1, 3][\[Mu]])/(4*Pi) + (alfa["yt"][\[Mu]]*CD6[1, 3][\[Mu]])/
    (4*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[5, 3][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[6, 3][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[118, 3][\[Mu]])/
    (12*Pi) + (alfa["g2"][\[Mu]]*CD6[101, 1, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[101, 2, 3][\[Mu]])/(2*Pi) + 
   (5*alfa["g2"][\[Mu]]*CD6[101, 3, 3][\[Mu]])/(6*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[102, 3, 3][\[Mu]])/(3*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 3, 1][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 3, 2][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 3, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[2, 1]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(36*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) + 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(18*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(18*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(18*Pi) + (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/
    (18*Pi) + (alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/
    (9*Pi) - (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/
    (18*Pi) - (3*$JX*alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/(4*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(4*Pi) - (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(18*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[119, 1][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[101, 1, 1][\[Mu]])/(24*Pi) + 
   (7*$YX*alfa["g1"][\[Mu]]*CD6[102, 1, 1][\[Mu]])/(18*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[102, 1, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[102, 1, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 1, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 1, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 1, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 1, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[2, 2]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(36*Pi) + 
   (alfa["yc"][\[Mu]]*CD6[16][\[Mu]])/(4*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/
    (18*Pi) + ($DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) + 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(18*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(18*Pi) + (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (18*Pi) + ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(6*Pi) + 
   (alfa["yc"][\[Mu]]*CD6[2, 2][\[Mu]])/(4*Pi) + (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/
    (18*Pi) + (alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) - (alfa["yc"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (4*Pi) + (alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(18*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/(4*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(4*Pi) - (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(18*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[119, 2][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[101, 2, 2][\[Mu]])/(24*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[102, 1, 2][\[Mu]])/(6*Pi) + 
   (7*$YX*alfa["g1"][\[Mu]]*CD6[102, 2, 2][\[Mu]])/(18*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[102, 2, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 2, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 2, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 2, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 2, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[2, 3]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(36*Pi) - 
   (alfa["yb"][\[Mu]]*CD6[16][\[Mu]])/(4*Pi) + (alfa["yt"][\[Mu]]*CD6[16][\[Mu]])/
    (4*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) + 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(18*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(18*Pi) + (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (18*Pi) + (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(18*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) + 
   (alfa["yb"][\[Mu]]*CD6[2, 3][\[Mu]])/(4*Pi) + (alfa["yt"][\[Mu]]*CD6[2, 3][\[Mu]])/
    (4*Pi) + (alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/
    (9*Pi) - (alfa["yt"][\[Mu]]*CD6[3, 3][\[Mu]])/(4*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(18*Pi) - 
   (alfa["yb"][\[Mu]]*CD6[4, 3][\[Mu]])/(4*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/(4*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(4*Pi) - (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(18*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[119, 3][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[101, 3, 3][\[Mu]])/(24*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[102, 1, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[102, 2, 3][\[Mu]])/(6*Pi) + 
   (7*$YX*alfa["g1"][\[Mu]]*CD6[102, 3, 3][\[Mu]])/(18*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 3, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 3, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 3, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 3, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 3, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 3, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[3, 1]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) + 
   (2*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) + 
   (4*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) + 
   (2*$JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (2*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + (2*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (9*Pi) + (2*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) + 
   (4*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(6*Pi) + 
   (4*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + (4*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/
    (9*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/Pi - 
   (2*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[120, 1][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 1, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 2, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 3, 1][\[Mu]])/(6*Pi) + 
   (8*$YX*alfa["g1"][\[Mu]]*CD6[105, 1, 1][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[105, 1, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[105, 1, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 1, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[3, 2]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) - 
   (alfa["yc"][\[Mu]]*CD6[16][\[Mu]])/(2*Pi) + (2*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/
    (9*Pi) + (4*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) + 
   (2*$JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (2*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + (2*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (9*Pi) - (alfa["yc"][\[Mu]]*CD6[2, 2][\[Mu]])/(2*Pi) + 
   (2*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) + (4*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/
    (9*Pi) + (4*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(6*Pi) + 
   (alfa["yc"][\[Mu]]*CD6[3, 2][\[Mu]])/(2*Pi) + (4*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/
    (9*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/Pi - 
   (2*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[120, 2][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 1, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 2, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 3, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[105, 1, 2][\[Mu]])/(3*Pi) + 
   (8*$YX*alfa["g1"][\[Mu]]*CD6[105, 2, 2][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[105, 2, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 2, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[3, 3]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) - 
   (alfa["yt"][\[Mu]]*CD6[16][\[Mu]])/(2*Pi) + (2*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/
    (9*Pi) + (4*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) + 
   (2*$JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (2*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + (2*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (9*Pi) + (2*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) - 
   (alfa["yt"][\[Mu]]*CD6[2, 3][\[Mu]])/(2*Pi) + (4*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/
    (9*Pi) + (4*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + 
   (4*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(6*Pi) + 
   (alfa["yt"][\[Mu]]*CD6[3, 3][\[Mu]])/(2*Pi) - (2*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/Pi - (2*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[120, 3][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 1, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 2, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[103, 3, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[105, 1, 3][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[105, 2, 3][\[Mu]])/(3*Pi) + 
   (8*$YX*alfa["g1"][\[Mu]]*CD6[105, 3, 3][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 3, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 3, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 3, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[4, 1]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(18*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) - 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (9*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/
    (9*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[121, 1][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 1, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 2, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 3, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 1, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 2, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 3, 1][\[Mu]])/(3*Pi) - 
   (4*$YX*alfa["g1"][\[Mu]]*CD6[107, 1, 1][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[107, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[107, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 1, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[4, 2]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(18*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) - 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (9*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (9*Pi) + ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (2*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/
    (9*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[121, 2][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 1, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 2, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 3, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 1, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 2, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 3, 2][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[107, 1, 2][\[Mu]])/(6*Pi) - 
   (4*$YX*alfa["g1"][\[Mu]]*CD6[107, 2, 2][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[107, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 2, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[4, 3]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(18*Pi) + 
   (alfa["yb"][\[Mu]]*CD6[16][\[Mu]])/(2*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/
    (9*Pi) - (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(9*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (9*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) - 
   (alfa["yb"][\[Mu]]*CD6[2, 3][\[Mu]])/(2*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi) + 
   (alfa["yb"][\[Mu]]*CD6[4, 3][\[Mu]])/(2*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/
    (2*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/
    (9*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[121, 3][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 1, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 2, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[104, 3, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 1, 3][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 2, 3][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[106, 3, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[107, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[107, 2, 3][\[Mu]])/(6*Pi) - 
   (4*$YX*alfa["g1"][\[Mu]]*CD6[107, 3, 3][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 3, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 3, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[5, 1]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[17][\[Mu]])/(12*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/
    (3*Pi) + (2*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[1, 1][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[2, 1][\[Mu]])/Pi - (alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/Pi + 
   (alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/
    (6*Pi), \[Mu]*Derivative[1][CD6[5, 2]][\[Mu]] == 
  (alfa["g2"][\[Mu]]*CD6[17][\[Mu]])/(12*Pi) - (alfa["yc"][\[Mu]]*CD6[17][\[Mu]])/
    (4*Pi) + (2*alfa["g2"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - 
   (2*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[1, 2][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[2, 2][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/
    (2*Pi) - (alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/Pi + 
   (alfa["yc"][\[Mu]]*CD6[5, 2][\[Mu]])/(4*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/
    (6*Pi), \[Mu]*Derivative[1][CD6[5, 3]][\[Mu]] == 
  (alfa["g2"][\[Mu]]*CD6[17][\[Mu]])/(12*Pi) - (alfa["yb"][\[Mu]]*CD6[17][\[Mu]])/
    (4*Pi) - (alfa["yt"][\[Mu]]*CD6[17][\[Mu]])/(4*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/
    (3*Pi) + (2*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[1, 3][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[2, 3][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/(2*Pi) - 
   (alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/Pi + (alfa["yb"][\[Mu]]*CD6[5, 3][\[Mu]])/
    (4*Pi) + (alfa["yt"][\[Mu]]*CD6[5, 3][\[Mu]])/(4*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[6, 1]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(36*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(18*Pi) + 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(18*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(4*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(4*Pi) + (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (18*Pi) + (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(18*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(18*Pi) + (alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(9*Pi) - (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[6, 2]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(36*Pi) + 
   (alfa["yc"][\[Mu]]*CD6[18][\[Mu]])/(4*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/
    (18*Pi) + ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(18*Pi) + 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(18*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(4*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(4*Pi) + (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (18*Pi) + (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(18*Pi) + 
   (alfa["yc"][\[Mu]]*CD6[6, 2][\[Mu]])/(4*Pi) + (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/
    (18*Pi) + (alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(9*Pi) - (alfa["yc"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (4*Pi) + (alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(9*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[6, 3]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(36*Pi) - 
   (alfa["yb"][\[Mu]]*CD6[18][\[Mu]])/(4*Pi) + (alfa["yt"][\[Mu]]*CD6[18][\[Mu]])/
    (4*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(18*Pi) + 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(18*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(4*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(4*Pi) + (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (18*Pi) + (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(18*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(18*Pi) + (alfa["yb"][\[Mu]]*CD6[6, 3][\[Mu]])/
    (4*Pi) + (alfa["yt"][\[Mu]]*CD6[6, 3][\[Mu]])/(4*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(9*Pi) - 
   (alfa["yt"][\[Mu]]*CD6[7, 3][\[Mu]])/(4*Pi) - (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(18*Pi) - (alfa["yb"][\[Mu]]*CD6[8, 3][\[Mu]])/
    (4*Pi) - (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/
    (18*Pi) - (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(18*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(18*Pi) - (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/
    (18*Pi), \[Mu]*Derivative[1][CD6[7, 1]][\[Mu]] == 
  (alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(9*Pi) + (2*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/
    (9*Pi) + (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(9*Pi) + 
   (2*$JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/Pi + (2*alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (9*Pi) + (2*alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(9*Pi) + 
   (2*alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(9*Pi) + (4*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/
    (9*Pi) + (4*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(9*Pi) + 
   (4*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[7, 2]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(9*Pi) - 
   (alfa["yc"][\[Mu]]*CD6[18][\[Mu]])/(2*Pi) + (2*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/
    (9*Pi) + (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(9*Pi) + 
   (2*$JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/Pi + (2*alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (9*Pi) + (2*alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(9*Pi) - 
   (alfa["yc"][\[Mu]]*CD6[6, 2][\[Mu]])/(2*Pi) + (2*alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/
    (9*Pi) + (4*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(9*Pi) + 
   (4*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(9*Pi) + (alfa["yc"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (2*Pi) + (4*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[7, 3]][\[Mu]] == (alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(9*Pi) - 
   (alfa["yt"][\[Mu]]*CD6[18][\[Mu]])/(2*Pi) + (2*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/
    (9*Pi) + (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(9*Pi) + 
   (2*$JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/Pi + (2*alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (9*Pi) + (2*alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(9*Pi) + 
   (2*alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(9*Pi) - (alfa["yt"][\[Mu]]*CD6[6, 3][\[Mu]])/
    (2*Pi) + (4*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(9*Pi) + 
   (4*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(9*Pi) + (4*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/
    (9*Pi) + (alfa["yt"][\[Mu]]*CD6[7, 3][\[Mu]])/(2*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[8, 1]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(18*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(9*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(9*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(2*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (9*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(9*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(9*Pi), \[Mu]*Derivative[1][CD6[8, 2]][\[Mu]] == 
  -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(18*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/
    (9*Pi) - ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(9*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(2*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (9*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(9*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/
    (9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(9*Pi), \[Mu]*Derivative[1][CD6[8, 3]][\[Mu]] == 
  -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(18*Pi) + (alfa["yb"][\[Mu]]*CD6[18][\[Mu]])/
    (2*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(9*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(9*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(2*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/
    (9*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(9*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(9*Pi) - (alfa["yb"][\[Mu]]*CD6[6, 3][\[Mu]])/
    (2*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(9*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(9*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/
    (9*Pi) + (alfa["yb"][\[Mu]]*CD6[8, 3][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(9*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(9*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/
    (9*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[9, 1]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(12*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/
    (3*Pi) + (2*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (4*$DX*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(2*Pi) - 
   (4*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/
    (6*Pi) + (3*$YX*alfa["g1"][\[Mu]]*CD6[12, 1][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[13, 1][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[122, 1][\[Mu]])/
    (12*Pi) + (2*alfa["g2"][\[Mu]]*CD6[108, 1, 1][\[Mu]])/(3*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 1, 1][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 2, 1][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 3, 1][\[Mu]])/(2*Pi), 
 \[Mu]*Derivative[1][CD6[9, 2]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(12*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/
    (3*Pi) + (2*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (4*$DX*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(6*Pi) - (4*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/
    (3*Pi) + (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(6*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[12, 2][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[13, 2][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[122, 2][\[Mu]])/
    (12*Pi) + (2*alfa["g2"][\[Mu]]*CD6[108, 2, 2][\[Mu]])/(3*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 1, 2][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 2, 2][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 3, 2][\[Mu]])/(2*Pi), 
 \[Mu]*Derivative[1][CD6[9, 3]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(12*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[15][\[Mu]])/(4*Pi) + (2*alfa["g2"][\[Mu]]*CD6[501][\[Mu]])/
    (3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (2*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (4*$DX*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/
    (6*Pi) - (4*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(9*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[9, 3][\[Mu]])/(4*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[12, 3][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[13, 3][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[122, 3][\[Mu]])/
    (12*Pi) + (2*alfa["g2"][\[Mu]]*CD6[108, 3, 3][\[Mu]])/(3*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 1, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 2, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[111, 3, 3][\[Mu]])/(2*Pi), 
 \[Mu]*Derivative[1][CD6[10, 1]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/
    (6*Pi) - (3*$JX*alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/(4*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(4*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[123, 1][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 1, 1][\[Mu]])/(2*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 1, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 1, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 2, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 3, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 1, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 2, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 3, 1][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 3, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[10, 2]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/
    (6*Pi) + ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/(4*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(4*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[123, 2][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 2, 2][\[Mu]])/(2*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 2, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 1, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 2, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 3, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 1, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 2, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 3, 2][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 3, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[10, 3]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(12*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[16][\[Mu]])/(4*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/
    (6*Pi) - ($DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[10, 3][\[Mu]])/(4*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi) - (alfa["ytau"][\[Mu]]*CD6[11, 3][\[Mu]])/
    (4*Pi) - (3*$JX*alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/(4*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(4*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[123, 3][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[108, 3, 3][\[Mu]])/(2*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 3, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 3, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 1, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 2, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[112, 3, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 1, 3][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 2, 3][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[114, 3, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[115, 3, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[11, 1]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(3*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(3*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/
    (3*Pi) - (3*$YX*alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(2*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[124, 1][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 3, 1][\[Mu]])/(6*Pi) - 
   (2*$YX*alfa["g1"][\[Mu]]*CD6[110, 1, 1][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[110, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[110, 1, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 1, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 2, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 3, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 1, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 2, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 3, 1][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 1, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 2, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 3, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[11, 2]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(3*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/
    (3*Pi) + ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(3*Pi) - 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(2*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[124, 2][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 3, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[110, 1, 2][\[Mu]])/(6*Pi) - 
   (2*$YX*alfa["g1"][\[Mu]]*CD6[110, 2, 2][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[110, 2, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 1, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 2, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 3, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 1, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 2, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 3, 2][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 1, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 2, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 3, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[11, 3]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(6*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[16][\[Mu]])/(2*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/
    (3*Pi) - (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(3*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(3*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[10, 3][\[Mu]])/(2*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(3*Pi) + 
   ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[11, 3][\[Mu]])/(2*Pi) - 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(2*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[124, 3][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[109, 3, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[110, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[110, 2, 3][\[Mu]])/(6*Pi) - 
   (2*$YX*alfa["g1"][\[Mu]]*CD6[110, 3, 3][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 1, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 2, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[113, 3, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 1, 3][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 2, 3][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[116, 3, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 1, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 2, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[117, 3, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[12, 1]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[17][\[Mu]])/(12*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/
    (3*Pi) + (2*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/(2*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[9, 1][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[10, 1][\[Mu]])/Pi - (4*alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/
    (3*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[12, 2]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[17][\[Mu]])/(12*Pi) + 
   (2*alfa["g2"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/
    (3*Pi) + (2*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/(2*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[9, 2][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[10, 2][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/
    (6*Pi) - (4*alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/(3*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[12, 3]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[17][\[Mu]])/(12*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[17][\[Mu]])/(4*Pi) + (2*alfa["g2"][\[Mu]]*CD6[502][\[Mu]])/
    (3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/(2*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[9, 3][\[Mu]])/(4*Pi) - 
   (3*alfa["g2"][\[Mu]]*CD6[10, 3][\[Mu]])/Pi + (alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/(6*Pi) - 
   (4*alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/(3*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[12, 3][\[Mu]])/(4*Pi), 
 \[Mu]*Derivative[1][CD6[13, 1]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(6*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(6*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(4*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(4*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[13, 2]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(12*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(6*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(6*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(4*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(4*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[13, 3]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(12*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[18][\[Mu]])/(4*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/
    (6*Pi) - ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(6*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(6*Pi) - 
   (3*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(4*Pi) + 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(4*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(6*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[13, 3][\[Mu]])/(4*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/
    (6*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(6*Pi) - (alfa["ytau"][\[Mu]]*CD6[14, 3][\[Mu]])/
    (4*Pi), \[Mu]*Derivative[1][CD6[14, 1]][\[Mu]] == 
  -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(6*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/
    (3*Pi) - ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(3*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(3*Pi) - 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(3*Pi), 
 \[Mu]*Derivative[1][CD6[14, 2]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(3*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(3*Pi) - 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(3*Pi), 
 \[Mu]*Derivative[1][CD6[14, 3]][\[Mu]] == -(alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(6*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[18][\[Mu]])/(2*Pi) - ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/
    (3*Pi) - ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(3*Pi) - 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(3*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/
    (3*Pi) - (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(3*Pi) - 
   (2*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (3*Pi) - (2*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(3*Pi) - 
   (3*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(3*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[13, 3][\[Mu]])/(2*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/
    (3*Pi) + (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(3*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(3*Pi) + (alfa["ytau"][\[Mu]]*CD6[14, 3][\[Mu]])/
    (2*Pi), \[Mu]*Derivative[1][CD6[15]][\[Mu]] == 
  (-17*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(12*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(9*Pi) + 
   (3*alfa["yb"][\[Mu]]*CD6[15][\[Mu]])/(2*Pi) + (3*alfa["yc"][\[Mu]]*CD6[15][\[Mu]])/
    (2*Pi) + (3*alfa["yt"][\[Mu]]*CD6[15][\[Mu]])/(2*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[15][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[125][\[Mu]])/
    (6*Pi) + (2*alfa["g2"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) - 
   (2*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (2*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(3*Pi) + 
   (4*$DX*$JX*alfa["g2"][\[Mu]]*CD6[503][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/
    (2*Pi) - (3*alfa["yc"][\[Mu]]*CD6[1, 2][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(2*Pi) - (3*alfa["yb"][\[Mu]]*CD6[1, 3][\[Mu]])/
    (2*Pi) - (3*alfa["yt"][\[Mu]]*CD6[1, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(6*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[9, 3][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[118, 1][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[118, 2][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[118, 3][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[122, 1][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[122, 2][\[Mu]])/(6*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[122, 3][\[Mu]])/(6*Pi), \[Mu]*Derivative[1][CD6[16]][\[Mu]] == 
  (alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(12*Pi) + ($DX*$YX^2*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/
    (6*Pi) + (3*alfa["yb"][\[Mu]]*CD6[16][\[Mu]])/(2*Pi) + 
   (3*alfa["yc"][\[Mu]]*CD6[16][\[Mu]])/(2*Pi) + (3*alfa["yt"][\[Mu]]*CD6[16][\[Mu]])/
    (2*Pi) + (alfa["ytau"][\[Mu]]*CD6[16][\[Mu]])/(2*Pi) + 
   (5*$YX*alfa["g1"][\[Mu]]*CD6[125][\[Mu]])/(24*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[501][\[Mu]])/(3*Pi) + 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[503][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
    (6*Pi) + (3*alfa["yc"][\[Mu]]*CD6[2, 2][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) - (3*alfa["yb"][\[Mu]]*CD6[2, 3][\[Mu]])/
    (2*Pi) + (3*alfa["yt"][\[Mu]]*CD6[2, 3][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/
    (3*Pi) - (3*alfa["yc"][\[Mu]]*CD6[3, 2][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) - (3*alfa["yt"][\[Mu]]*CD6[3, 3][\[Mu]])/
    (2*Pi) - (alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/
    (6*Pi) + (3*alfa["yb"][\[Mu]]*CD6[4, 3][\[Mu]])/(2*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[10, 3][\[Mu]])/(2*Pi) - (alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi) + (alfa["ytau"][\[Mu]]*CD6[11, 3][\[Mu]])/
    (2*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[119, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[119, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[119, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[120, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[120, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[120, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[121, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[121, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[121, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[123, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[123, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[123, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[124, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[124, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[124, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[17]][\[Mu]] == (-17*alfa["g2"][\[Mu]]*CD6[17][\[Mu]])/(12*Pi) + 
   (3*alfa["yb"][\[Mu]]*CD6[17][\[Mu]])/(2*Pi) + (3*alfa["yc"][\[Mu]]*CD6[17][\[Mu]])/
    (2*Pi) + (3*alfa["yt"][\[Mu]]*CD6[17][\[Mu]])/(2*Pi) + 
   (alfa["ytau"][\[Mu]]*CD6[17][\[Mu]])/(2*Pi) + (2*alfa["g2"][\[Mu]]*CD6[502][\[Mu]])/
    (3*Pi) - (2*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(3*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[504][\[Mu]])/(9*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/
    (2*Pi) - (3*alfa["yc"][\[Mu]]*CD6[5, 2][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/(2*Pi) - (3*alfa["yb"][\[Mu]]*CD6[5, 3][\[Mu]])/
    (2*Pi) - (3*alfa["yt"][\[Mu]]*CD6[5, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/(6*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[12, 3][\[Mu]])/(2*Pi), \[Mu]*Derivative[1][CD6[18]][\[Mu]] == 
  (alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(12*Pi) + (3*alfa["yb"][\[Mu]]*CD6[18][\[Mu]])/
    (2*Pi) + (3*alfa["yc"][\[Mu]]*CD6[18][\[Mu]])/(2*Pi) + 
   (3*alfa["yt"][\[Mu]]*CD6[18][\[Mu]])/(2*Pi) + (alfa["ytau"][\[Mu]]*CD6[18][\[Mu]])/
    (2*Pi) + ($YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[502][\[Mu]])/(6*Pi) + 
   ($JX*$YX*alfa["g1"][\[Mu]]*CD6[504][\[Mu]])/(6*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(6*Pi) + (alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/
    (6*Pi) + (3*alfa["yc"][\[Mu]]*CD6[6, 2][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(6*Pi) - (3*alfa["yb"][\[Mu]]*CD6[6, 3][\[Mu]])/
    (2*Pi) + (3*alfa["yt"][\[Mu]]*CD6[6, 3][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(3*Pi) + (alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/
    (3*Pi) - (3*alfa["yc"][\[Mu]]*CD6[7, 2][\[Mu]])/(2*Pi) + 
   (alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(3*Pi) - (3*alfa["yt"][\[Mu]]*CD6[7, 3][\[Mu]])/
    (2*Pi) - (alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/
    (6*Pi) + (3*alfa["yb"][\[Mu]]*CD6[8, 3][\[Mu]])/(2*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(6*Pi) - (alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(6*Pi) - 
   (alfa["ytau"][\[Mu]]*CD6[13, 3][\[Mu]])/(2*Pi) - (alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/
    (6*Pi) - (alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(6*Pi) - 
   (alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(6*Pi) + (alfa["ytau"][\[Mu]]*CD6[14, 3][\[Mu]])/
    (2*Pi), \[Mu]*Derivative[1][CD6[101, 1, 1]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[101, 1, 2]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[101, 1, 3]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[101, 2, 2]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[101, 2, 3]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[101, 3, 3]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[102, 1, 1]][\[Mu]] == ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/
   (18*Pi), \[Mu]*Derivative[1][CD6[102, 1, 2]][\[Mu]] == 
  ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[102, 1, 3]][\[Mu]] == 
  ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[102, 2, 2]][\[Mu]] == ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/
   (18*Pi), \[Mu]*Derivative[1][CD6[102, 2, 3]][\[Mu]] == 
  ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[102, 3, 3]][\[Mu]] == ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/
   (18*Pi), \[Mu]*Derivative[1][CD6[105, 1, 1]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[105, 1, 2]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[105, 1, 3]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[105, 2, 2]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[105, 2, 3]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[105, 3, 3]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[107, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[107, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[107, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[107, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[107, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[107, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[108, 1, 1]][\[Mu]] == 
  ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(18*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[108, 1, 2]][\[Mu]] == 
  ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(18*Pi) + 
   ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(18*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[108, 1, 3]][\[Mu]] == 
  ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(18*Pi) + 
   ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(18*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[108, 2, 2]][\[Mu]] == 
  ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(18*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[108, 2, 3]][\[Mu]] == 
  ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(18*Pi) + 
   ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(18*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[108, 3, 3]][\[Mu]] == 
  ($DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(18*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[110, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(3*Pi), 
 \[Mu]*Derivative[1][CD6[110, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(3*Pi), 
 \[Mu]*Derivative[1][CD6[110, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(3*Pi), 
 \[Mu]*Derivative[1][CD6[110, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(3*Pi), 
 \[Mu]*Derivative[1][CD6[110, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(3*Pi), 
 \[Mu]*Derivative[1][CD6[110, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(3*Pi), 
 \[Mu]*Derivative[1][CD6[103, 1, 1]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[103, 1, 2]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[103, 1, 3]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[103, 2, 1]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[103, 2, 2]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[103, 2, 3]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[103, 3, 1]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[103, 3, 2]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[103, 3, 3]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[104, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[106, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[106, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[106, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[106, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[106, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[106, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[106, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[106, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[106, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(9*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[109, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[109, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[109, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[109, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[109, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[109, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[109, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[109, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[109, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[111, 1, 1]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[111, 1, 2]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[111, 1, 3]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[111, 2, 1]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[111, 2, 2]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[111, 2, 3]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[111, 3, 1]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[111, 3, 2]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[111, 3, 3]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[112, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[112, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[112, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[112, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[112, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[112, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[112, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[112, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[112, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[113, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(18*Pi), 
 \[Mu]*Derivative[1][CD6[114, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[114, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[114, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[114, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[114, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[114, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[114, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[114, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[114, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(6*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[115, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[116, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) + 
   (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 1, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 1, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 1, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 2, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 2, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 2, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 3, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 3, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[117, 3, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(3*Pi) - 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[118, 1]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[118, 2]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[118, 3]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[119, 1]][\[Mu]] == 
  ($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[119, 2]][\[Mu]] == 
  ($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[119, 3]][\[Mu]] == 
  ($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(18*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[120, 1]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[120, 2]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[120, 3]][\[Mu]] == 
  (2*$DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[121, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[121, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[121, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(9*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[122, 1]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[122, 2]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[122, 3]][\[Mu]] == 
  (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(9*Pi) + 
   (2*$DX*$JX*alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(9*Pi), 
 \[Mu]*Derivative[1][CD6[123, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[123, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[123, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(6*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[124, 1]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[124, 2]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[124, 3]][\[Mu]] == 
  -($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(3*Pi) + 
   ($DX*$YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[125]][\[Mu]] == ($DX*$JX*alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/
    (18*Pi) + ($DX*$YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[501]][\[Mu]] == ($YX*alfa["g1"][\[Mu]]*CD6[16][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[2, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[2, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[2, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[3, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[3, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[3, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[4, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[4, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[4, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[10, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[10, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[10, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[11, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[11, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[11, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[502]][\[Mu]] == ($YX*alfa["g1"][\[Mu]]*CD6[18][\[Mu]])/(12*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[6, 1][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[6, 2][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[6, 3][\[Mu]])/(6*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[7, 1][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[7, 2][\[Mu]])/(3*Pi) + 
   ($YX*alfa["g1"][\[Mu]]*CD6[7, 3][\[Mu]])/(3*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[8, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[8, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[8, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[13, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[13, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[13, 3][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[14, 1][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[14, 2][\[Mu]])/(6*Pi) - 
   ($YX*alfa["g1"][\[Mu]]*CD6[14, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[503]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[15][\[Mu]])/(12*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[1, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 2][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[1, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[9, 1][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 2][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[9, 3][\[Mu]])/(6*Pi), 
 \[Mu]*Derivative[1][CD6[504]][\[Mu]] == (alfa["g2"][\[Mu]]*CD6[17][\[Mu]])/(12*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[5, 1][\[Mu]])/(2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 2][\[Mu]])/
    (2*Pi) + (alfa["g2"][\[Mu]]*CD6[5, 3][\[Mu]])/(2*Pi) + 
   (alfa["g2"][\[Mu]]*CD6[12, 1][\[Mu]])/(6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 2][\[Mu]])/
    (6*Pi) + (alfa["g2"][\[Mu]]*CD6[12, 3][\[Mu]])/(6*Pi)};


End[]


EndPackage[]
