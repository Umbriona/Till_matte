function PhiV = V_Hatt(p,i,x)
% V_Hatt berskriver den vänstra delen av en hatt funktion
%
%        /
%       /
%      /
%     /
%    /_______
%
% V_Hatt behöver en disktetiserad x vektor ett index i som talar om vilken 
% hatt funktion det är som skall behandlas. V_Hatt behöver också ett fixt x värde
% där man utvärderar hattfunktionen.
if i~=1                                     % Den första hattfunktionen har ingen vänster del
    if x>=p(i-1) && x<=p(i)                 % Om x värdet är utanför del intervallet som hattfunktionen är definerad gäller ej denna ekv.
        PhiV=(x-p(i-1))/(p(i)-p(i-1));      % Hattfunktionens vänstra del 
    else
        PhiV=0;                             % Om x värdet är utanför del intervallet som hattfunktionen är definerad är ekvationen =0
    end
elseif i==1
    PhiV=0;                                 % Då den första hattfunktionen utvärderas är den vänstra delen =0 
end