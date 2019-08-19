function PhiV = V_Hatt(p,i,x)
% V_Hatt berskriver den v�nstra delen av en hatt funktion
%
%        /
%       /
%      /
%     /
%    /_______
%
% V_Hatt beh�ver en disktetiserad x vektor ett index i som talar om vilken 
% hatt funktion det �r som skall behandlas. V_Hatt beh�ver ocks� ett fixt x v�rde
% d�r man utv�rderar hattfunktionen.
if i~=1                                     % Den f�rsta hattfunktionen har ingen v�nster del
    if x>=p(i-1) && x<=p(i)                 % Om x v�rdet �r utanf�r del intervallet som hattfunktionen �r definerad g�ller ej denna ekv.
        PhiV=(x-p(i-1))/(p(i)-p(i-1));      % Hattfunktionens v�nstra del 
    else
        PhiV=0;                             % Om x v�rdet �r utanf�r del intervallet som hattfunktionen �r definerad �r ekvationen =0
    end
elseif i==1
    PhiV=0;                                 % D� den f�rsta hattfunktionen utv�rderas �r den v�nstra delen =0 
end