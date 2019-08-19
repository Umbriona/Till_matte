clear;clf; clear all
load('tvaspalt_fin');                    %Laddar in domän 


k = 0.005;                                  % Tids steg
T = 2;                                      % Slut tid
N = size(p,2);                              % Mäter antalet nder
x = p(1,:)'; y = p(2,:)';                   
C = find(x<0.01);
 A = find(y>0.3);
 B = find(y<0.6);
 fixed = MY_find(A,B,C);
 
xi = zeros(N,1);
eta = zeros(N,1);
 A=stifnessasembler(p,t);
 M=massassembler_2D(p,t);
 set(gcf,'Renderer','OpenGL');
 
P=pdesurf(p,t,xi);

    
for n = 1:round(T/k)
     
    
    time = n*k;
     A_tot = [M -0.5*k*M; 0.5*k*A (M+M*0.5*k)];
     b_tot = [M 0.5*k*M; -0.5*k*A (M-M*0.5*k)]*[xi; eta]; 
%    A_tot = [M -0.5*k*M; 0.5*k*A M];
%    b_tot = [M 0.5*k*M; -0.5*k*A M]*[xi; eta];
        
    x=A_tot\b_tot;
    xi = x(1:N);
    eta = x(N+1:end);
    xi(fixed ) = sin(8*pi*time);
   
    
    
   
    
    figure(1); clf
   pdesurf(p,t,xi);		% beräknad lösning
   axis tight
   colormap(jet)
   shading faceted
   %title('Beräknad lösning');
   %view(2);
   
   M1(n)=getframe;
   %pause		% alternativ till getframe och movie
   
   figure(2); clf
   pdesurf(p,t,xi);
   shading interp
   view(2);
   colormap(gray)
   N1(n)=getframe;
    
end


