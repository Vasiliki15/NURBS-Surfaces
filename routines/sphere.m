%!demo

clc; clear;
knot = [0,0,0,1/2,1/2,1,1,1];
cp=[1 0; 1 1; 0 1; -1 1; -1 0];
w=[1, sqrt(2)/2, 1, sqrt(2)/2, 1];
%w=[1,1,1,1,1];
projcord=nurb2proj(5,cp,w');
proj_cp= [projcord(:,1) projcord(:,2)];
nurb=nrbmak(proj_cp',knot);
figure();
nrbkntplot (nurb);
title('Semicircle Curve');
figure();
nrbctrlplot(nurb);
title('Semicircle Curve with control points');

%sphere surface
sphere = nrbrevolve(nurb,[0.0 0.0 0.0],[1.0 0.0 0.0]);
figure();
nrbkntplot (sphere);
title('Sphere Surface');
figure();
nrbctrlplot(sphere);
title('Sphere surface with control points');


%h refinment
uniqueKnots = unique(knot);
newKnotsX   = [0.125 0.375 0.625 0.875];
%newKnotsX   = [0.0625 0.125 0.185 0.3125 0.375 0.4375 0.5625 0.625 0.6875 0.8125 0.875 0.9375];
 nonewkX     = size(newKnotsX,2);
weightedPts = proj_cp;  
 [newKnots,newControlPts] = ...
           RefineKnotVectCurve(4,2,knot,weightedPts,newKnotsX,nonewkX-1);
 
 nurb=nrbmak(newControlPts',newKnots);
 figure();
 nrbkntplot (nurb);
 title('Semicircle after refinement');
figure();
nrbctrlplot(nurb);
title('Semicircle Curve with control points after refinement');
sphere = nrbrevolve(nurb,[0.0 0.0 0.0],[1.0 0.0 0.0]);
figure();
nrbkntplot (sphere);
title('Sphere after refinement');
 
 
 figure();
 sphr_1=hRefineNURBS(sphere,3);
 nrbkntplot (sphr_1);
 title('Sphere after uniform refinement');
 




