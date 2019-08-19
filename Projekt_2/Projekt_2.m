clear all
load('tvaspalt_finfin');


k = 0.005;
T = 2;
N = size(p,2);
x = p(1,:)'; y = p(2,:)';
fixed = find(x<0.01);
xi = zeros(N,1);
eta = zeros(N,1);
 A=stifnessasembler(p,t);
 M=massassembler_2D(p,t);
 set(gcf,'Renderer','OpenGL'); 
P=pdesurf(p,t,xi);

    
for n = 1:round(T/k)
    
    
    time = n*k;
%     A_tot = [M -0.5*k*M; 0.5*k*A (M+M*0.5*k)];
%     b_tot = [M 0.5*k*M; -0.5*k*A (M-M*0.5*k)]*[xi; eta]; 
    A_tot = [M -0.5*k*M; 0.5*k*A M];
    b_tot = [M 0.5*k*M; -0.5*k*A M]*[xi; eta];
        
    x=A_tot\b_tot;
    xi = x(1:N);
    eta = x(N+1:end);
    xi(fixed) = 0.1*sin(8*pi*time);
   
    
    clf
    pdesurf(p,t,xi);
    axis ([0 2 0 1 -0.2 0.2]);
    view(0,90);
    
    F(n) = getframe;
    
    
end


movie(F,2)