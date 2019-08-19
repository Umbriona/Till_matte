function PhiH = H_Hattprim(p,i,x)
% H_Hattprim berskriver den högra delen av en d/dx hatt funktion
%
%  y=0                   _________   
%                       |
%                       |
%                       |
%  y=-1/(p(i+1)-p(i))   |________
%
% H_Hattprim behöver en disktetiserad x vektor ett index i som talar om vilken 
% hatt funktion det är som skall behandlas. H_Hattprim behöver också ett fixt x värde
% där man utvärderar hattfunktionen.
if i~=length(p)                         % Alla d/dx hattfunktioners högra del defineras enligt nedanstående ekv.
    if x>=p(i) && x<=p(i+1)             % Alla x som utvärderas utanför delintervallet kommer att vara =0
        PhiH=(-1)/(p(i+1)-p(i));        % d/dx Hatt har ett konstant värde som beror på deskretiseringsintervallen    
    else
        PhiH=0;
    end
elseif i==length(p)
    PhiH=0;
end