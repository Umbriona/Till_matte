function PhiH = H_Hatt(p,i,x)
% H_Hatt berskriver den h�gra delen av en hatt funktion
%
%      \
%       \
%        \
%         \
%    ______\
%
% H_Hatt beh�ver en disktetiserad x vektor ett index i som talar om vilken 
% hatt funktion det �r som skall behandlas. H_Hatt beh�ver ocks� ett fixt x v�rde
% d�r man utv�rderar hattfunktionen.

if i~=length(p)                                     % alla utom sista hattfunktionen defineras enligt nedanst�ende ekv. 
                                                    % kommer att vara en halv hatt och ej inneh�lla en h�ger del.
    if x>=p(i) && x<=p(i+1)                         % Om x ej tillh�r det diskretiserade delintervallet �r hatt funktionen 0
        PhiH= (p(i+1)-x)/(p(i+1)-p(i));             % Hattfunktionens h�gra del �r definerad enligt denna ekv.
    else
        PhiH=0;
    end
elseif i==length(p)                                 % Den sista hatt funktionen p� det disktetiserade intervallet
    PhiH=0;
    
    
    
end