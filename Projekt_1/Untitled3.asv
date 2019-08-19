clear all
clc
clf
 h = pi/9;
 p = 0:h:pi;
 
 f=@(x) x-x.^2+2;
 gamma=@(x)1e4;
 g_D=@(x)0;
 g_N=@(x)0;
 rvk={gamma g_D g_N};
 %rvk=[rvk rvk];
 
 [S M R r] = PoissonAssembler1D(p,rvk);
 A=S + M + R;
 N=length(p);
 V=TrapetsHatt(f,p,rvk,N);
 l=V+r;
 U =A\l;
 plot(p,U,'d-');
 
 hold on 
 x=linspace(0,1,20);
 G=@(x) x.*(1-x);
 plot(x,G(x),'r-')
 
 hold off