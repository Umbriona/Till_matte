function PhiH = H_Hattprim(p,i,x)
% H_Hattprim berskriver den h�gra delen av en d/dx hatt funktion
%
%  y=0                   _________   
%                       |
%                       |
%                       |
%  y=-1/(p(i+1)-p(i))   |________
%
% H_Hattprim beh�ver en disktetiserad x vektor ett index i som talar om vilken 
% hatt funktion det �r som skall behandlas. H_Hattprim beh�ver ocks� ett fixt x v�rde
% d�r man utv�rderar hattfunktionen.
if i~=length(p)                         % Alla d/dx hattfunktioners h�gra del defineras enligt nedanst�ende ekv.
    if x>=p(i) && x<=p(i+1)             % Alla x som utv�rderas utanf�r delintervallet kommer att vara =0
        PhiH=(-1)/(p(i+1)-p(i));        % d/dx Hatt har ett konstant v�rde som beror p� deskretiseringsintervallen    
    else
        PhiH=0;
    end
elseif i==length(p)
    PhiH=0;
end