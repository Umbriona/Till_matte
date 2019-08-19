clear all
clc
global val_C val_A

disp('Ekvationen som skall lösas är')
disp('ut(x,t) - (a(x)*ux(x,t))x+c(x)*u(x,t)=f(x,t)')
disp('Robins Randvilkor')

val=menu('Vill du skapa en egen funktion eller köra med test?','Egen','Test');
%val=input('vill du köra med "test" funk eller skapa en "egen": ');

switch val
    case 2 %'test'
        N=100;
        p=linspace(0,pi,N);
        a=@(x,t)1;
        val_A='funktion';
        c=0;
        val_C='konstant';
        rvk{1}=@(x)10000;
        rvk{2}=@(x)sin(x);
        rvk{3}=@(x)0;
        f=@(x,t)sin(x)*(sin(t)+cos(t));
        [M, C, S, R, b] = MatrixAssembler1Dtid(a,c,f,rvk,p);
        
    case 1 %'egen'
        xs1=menu('Start punkt x', '-10','pi','-1','0','1','pi','10','Annat');
        switch xs1
            case 1
                xs=-10;
            case 2
                xs=-pi;
            case 3
                xs=-1;
            case 4
                xs=0;
            case 5
                xs=1;
            case 6
                xs=pi;
            case 7
                xs=10;
            case 8
                xs=inpit('Ange start värde för x');
        end
        
                xf1=menu('Slut punkt x', '-pi','-1','0','1','pi','10','100','Annat');
        switch xf1
            case 1
                xf=-pi;
            case 2
                xf=-1;
            case 3
                xf=0;
            case 4
                xf=1;
            case 5
                xf=pi;
            case 6
                xf=10;
            case 7
                xf=100;
            case 8
                xf=inpit('Ange slut värde för x');
        end
Yes=0;        
while(Yes~=2)
N1=menu('Antal del intervall','1','5','10','20','50','100','1000','Annat');
switch N1
    case 1
        N=1;
    case 2
        N=5;
    case 3
        N=10;
    case 4
        N=20;
    case 5
        N=50;
    case 6
        N=100;
    case 7
        N=1000;
    case 8
        N=inpit('Antal delintervall');
end
    if (xf-xs)/N>1
        Yes=menu('Antalet intervaller är litet i jemförelse med slut längden vill du ändra antal intervaller?','Ja','Nej');
    else
        Yes=2;
    end
end
p=linspace(xs,xf,N);
a1=menu('Ange a i ekvationen','a=0','a=1','a=Annat');
switch a1
    case 1
        a=0;
        val_A='konstant';
    case 2
        a=1;
        val_A='konstant';
    case 3
        a=input('Ange a i ekvationen som en funktion av @(x,t): '); 
        val_A='funktion';
end
c1=menu('Ange c i ekvationen','c=0','c=1','c=funktion');
switch c1
    case 1
        c=0;
        val_C='konstant';
    case 2
        c=1;
        val_C='konstant';
    case 3
        c=input('Ange c i ekvationen som en funktion av @(x,t): '); 
        val_C='funktion';
end
rv1=menu('Ange gamma i Robins Randvilkor','gamma=0','gamma=1','gamma=10','Gamma=100','Annat');
switch rv1
    case 1
        rvk{1}=@(x)0;
    case 2
        rvk{1}=@(x)1;
    case 3
        rvk{1}=@(x)10;
    case 4
        rvk{1}=@(x)100;
    case 5
        rvk{1}=input('Gamma i Robins randvilkor. Ges i form av funktions hantag (@(x)):');        val_C='funktion';
end

rv2=menu('Ange G_d i Robins Randvilkor','G_d=0','G_d=1','G_d=x','G_d=sin(x)','Annat');
switch rv2
    case 1 
        rvk{2}=@(x)0;
    case 2
        rvk{2}=@(x)1;
    case 3
        rvk{2}=@(x)x;
    case 4
        rvk{2}=@(x)sin(x);
    case 5
        rvk{2}=input('g_d i Robins randvilkor. Ges i form av funktions hantag (@(x)):');
end
rv3=menu('Ange G_N i Robins Randvilkor','G_N=0','G_N=1','G_N=x','G_N=sin(x)','Annat');
switch rv3
    case 1
        rvk{3}=@(x)0;
    case 2
        rvk{3}=@(x)1;
    case 3
        rvk{3}=@(x)x;
    case 4
        rvk{3}=@(x)sin(x);
    case 5
rvk{3}=input('g_N i Robins randvilkor. Ges i form av funktions hantag (@(x)):');
end


rv4=menu('Ange f i ekvationen','f=0','f=1','f=x','f=sin(x)*(sin(t)+cos(t))','Annat');
switch rv4
    case 1
        f=@(x,t)0;
    case 2
        f=@(x,t)1;
    case 3
        f=@(x,t)x;
    case 4
        f=@(x,t)sin(x)*(sin(t)+cos(t));
    case 5
f=input('Ange f i ekvationen. f måste anges som ett funktions hantag (@(x,t)):');
end

[M, C, S, R, b] = MatrixAssembler1Dtid(a,c,f,rvk,p);
end



                T1=menu('Slut tid T', '0.5','1','2','3','pi','10','100','Annat');
        switch T1
            case 1
                T=0.5;
            case 2
                T=1;
            case 3
                T=2;
            case 4
                T=3;
            case 5
                T=pi;
            case 6
                T=10;
            case 7
                T=100;
            case 8
                T=input('Ange slut tid för T');
        end
        yes=0;
while (yes~=2)
    N2=menu('Antal tids intervall','1','5','10','20','50','100','1000','Annat');
    switch N2
        case 1
            L=1;
        case 2
            L=5;
        case 3
            L=10;
        case 4
            L=20;
        case 5
            L=50;
        case 6
            L=100;
        case 7
            L=1000;
        case 8
            L=input('Ange antal tids intervaller: ');
    end
    if T/L>1
        yes=menu('Antalet intervaller är litet i jemförelse med slut längden vill du ändra antal intervaller?','Ja','Nej');
    else
        yes=2;
    end
end
t=linspace(0,T,L);

U=zeros(N,L);

rv5=menu('Ange begynnelsevärde i ekvationen','u0=0','u0=1','u0=x','u0=sin(x)','u0=cos(x)','Annat');
switch rv5
    case 1
        u0=@(x)0;
    case 2
        u0=@(x)1;
    case 3
        u0=@(x)x;
    case 4
        u0=@(x)sin(x);
    case 5
        u0=@(x)cos(x);
    case 6
u0=input('Begynelse värde, ges i form av funk. hantag (@(x)): ');
end
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



z=U(:,1);
h=plot(p,z);
axis tight
set(gca,'nextplot','replacechildren');

for k=1:L
    z=U(:,k);
    set(h,'Ydata',z);
    W(k) = getframe;
    
end
movie(W,2)


F2=menu('Vill du se yt plot?','Ja','Nej');
switch F2
    case 1
        plot2=1;
    case 2
        plot2=0;
end
if plot2==0
else
    figure(k+1)
    surf(t,p,U)
    title('U(x,t)')
    xlabel('Tid')
    ylabel('X')
    zlabel('U(x,t)')
end



