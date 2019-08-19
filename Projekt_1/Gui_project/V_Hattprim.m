function PhiV = V_Hattprim(p,i,x)
% V_Hattprim berskriver den v�nstra delen av en d/dt hatt funktion
%
%  y=1/(p(i)-p(i-1))     _________   
%                       |
%                       |
%                       |
%  y=0                  |________
%
% V_Hattprim beh�ver en disktetiserad x vektor ett index i som talar om vilken 
% hatt funktion det �r som skall behandlas. V_Hattprim beh�ver ocks� ett fixt x v�rde
% d�r man utv�rderar hattfunktionen.
if i~=1                         % Om den f�rsta hattfunktonen utv�rderas finns ingen v�nster del.
    if x>=p(i-1) && x<=p(i)     % Om x ej tillh�r del intervallet g�ller ej denna ekv.
        PhiV=1/(p(i)-p(i-1));   % ekvationen beror endast p� det deskretiserade delintervallet.
    else
        PhiV=0;                 % Om x ej tillh�r delinervallet kommer funktionen att vara =0 
    end
elseif i==1
    PhiV=0;                     % Den f�rsta hattfunktionen har ingen v�nstra del.
end