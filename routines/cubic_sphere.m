clc; clear;
knot = [0,0,0,0,1/4,1/2,3/4,1,1,1,1];
cp=[1 0; 1 0.5; 1 1; 0 2; -1 1; -1 0.5; -1 0];
%w=[1, sqrt(2)/2, sqrt(2)/2, sqrt(2)/2, 2 ,sqrt(2)/2,1];
%projcord=nurb2proj(5,cp,w');
%proj_cp= [projcord(:,1) projcord(:,2)];

nurb=nrbmak(cp',knot);
figure();
nrbctrlplot (nurb);
title('Curve with control points');
figure();
nrbkntplot (nurb);
title('Curve with knots');
%sphere surface
sphere = nrbrevolve(nurb,[0.0 0.0 0.0],[1.0 0.0 0.0]);
figure();
nrbkntplot (sphere);
figure();
nrbctrlplot(sphere);
title('Spheroidal  Surface');

%bezier extraction
[C,nb]=bezierExtraction(knot,3);
C1=C(:,:,1);
C2=C(:,:,2);
C3=C(:,:,3);
C4=C(:,:,4);
cp1=[1 0; 1 0.5; 1 1; 0 2];
cp11= C1'*cp1;
cp2=[1 0.5; 1 1; 0 2; -1 1];
cp22=C2'*cp2;
cp3=[ 1 1; 0 2; -1 1; -1 0.5];
cp33=C3'*cp3;
cp4=[0 2; -1 1; -1 0.5; -1 0];
cp44=C4'*cp4;
cp11(4,:) = [];
cp22(4,:) = [];
cp33(4,:) = [];
cpnew=cat(1,cp11,cp22,cp33,cp44);
knotnew=[0,0,0,0,1/4,1/4,1/4,1/2,1/2,1/2,3/4,3/4,3/4,1,1,1,1];
nurbnew=nrbmak(cpnew',knotnew);
figure();
nrbctrlplot (nurbnew);
title('Curve after Bezier Extraction');
% %sphere surface
spherenew = nrbrevolve(nurbnew,[0.0 0.0 0.0],[1.0 0.0 0.0]);
figure();
nrbkntplot (spherenew);
title('Spheroidal  Surface after Bezier Extraction');

