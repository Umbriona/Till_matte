function [M C S R b] = MatrixAssembler1Dtid(a,c,f,rvk,p,val_A,val_C)


N=length(p);
 


% Assembly of stiffnes Matrix
% konstanten a från PDE:n kan antingen vara en funktion av x eller konstant 
C=C_Matrix(p,c,val_C);
M=M_Matrix(p);  
S=S_Matrix(p,a,val_A);
b=TrapetsHatt(f,p,rvk,N);
R(1,1)=rvk{1}(p(1));
R(N,N)=rvk{1}(p(N));
    
        
end
