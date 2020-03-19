 clc; clear;
 crv1 = nrbcirc(5,[0 0 0],0 );
 crv2 = nrbcirc(2,[0 5 0],0);
 xx = vectrans([0.0 0.0])*vecroty(pi/2);
 c0 = nrbtform(crv2, xx);
 torus = nrbrevolve(c0,[0.0 0.0 0.0],[0.0 0.0 1.0]);
 nrbkntplot(torus);
 title('Torus Surface');
 %h-refinement
 figure();
 torus_1=hRefineNURBS(torus,3);
 nrbkntplot (torus_1);
 title('Torus after uniform refinement');
 