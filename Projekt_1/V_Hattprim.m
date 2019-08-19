function PhiV = V_Hattprim(p,i,x)
% V_Hattprim berskriver den vänstra delen av en d/dt hatt funktion
%
%  y=1/(p(i)-p(i-1))     _________   
%                       |
%                       |
%                       |
%  y=0                  |________
%
% V_Hattprim behöver en disktetiserad x vektor ett index i som talar om vilken 
% hatt funktion det är som skall behandlas. V_Hattprim behöver också ett fixt x värde
% där man utvärderar hattfunktionen.
if i~=1                         % Om den första hattfunktonen utvärderas finns ingen vänster del.
    if x>=p(i-1) && x<=p(i)     % Om x ej tillhör del intervallet gäller ej denna ekv.
        PhiV=1/(p(i)-p(i-1));   % ekvationen beror endast på det deskretiserade delintervallet.
    else
        PhiV=0;                 % Om x ej tillhör delinervallet kommer funktionen att vara =0 
    end
elseif i==1
    PhiV=0;                     % Den första hattfunktionen har ingen vänstra del.
end