function [U] = FEM_1D_tid(a,c,f,rvk,p,L,T,val_A,val_C)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

[M, C, S, R, b] = MatrixAssembler1Dtid(a,c,f,rvk,p,val_A,val_C);
t=linspace(0,T,L);
N=length(p);
U=zeros(N,L);
u0=@(x)0;
for i = 1:N
    x=p(i);
    U(i,1)=u0(x);
   
end

b1=zeros(N,1);
S1=zeros(N);

for n = 1:L-1
        
    t_h = t(n+1);
    t_v= t(n);
    dt=t_h-t_v;
    
    for k=1:length(p)
        b1(k,n)=b{k}(t_h);
        
        if k==1
            h=k:k+1;
        elseif k~=length(p)
            h=k-1:k+1;
        elseif k==length(p)
            h=k-1:k;
        end
            for h=h
             
                S1(k,h,n)=S{k,h}(t_h);
            end       
    end
    A=C+S1(:,:,n)+R;
    U_old=U(:,n);
    U_new=(M+dt*A)\(M*U_old+dt*b1(:,n));                  % Bakåt Euler
    U(:,n+1)=U_new;
end
end

