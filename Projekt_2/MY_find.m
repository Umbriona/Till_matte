function  D = MY_find(A,B,C)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
N1=length(A);
N2=length(B);
N3=length(C);
h=0;
for i=1:N1
    for k=1:N3
        if A(i)==C(k)
            h=h+1;
            D1(h)=C(k);
        else
            continue
        end
    end
end
N4=length(D1);
h=0;
 for i=1:N2
    for k=1:N3
        if B(i)==C(k)
            h=h+1;
            D2(h)=C(k);
        else
            continue
        end
    end
 end 
 N5=length(D2);
 
 
 h=0;
for i=1:N4
    for k=1:N5
        D1(i)
        D2(k)
        if D1(i) == D2(k)
            h=h+1;
            D(h)=D1(i)
        else
            
        end
    end
end
end

