function S=S_Matrix(p,a,val_A)
% S_Matix skapar styvhets matrisen 
% indata till S_matirix är Det diskretiserade x intervallet och funktionen
% a(x,t), (a(x,t)*u'(x,t))'


             % ksn ej Skapa en (N/N) cellmatris med noll element


        for i=1:length(p)       % Se M_Matrix
            
            switch val_A                        % val_A är en sträng som avgör om a kommer in som ett 
                case 'funktion'                 % funktionshantag eller en konstant detta regleras sedan med en switch
                    if i==1
                        c1={(0) @(t)a(p(i),t) @(t)a(p(i+1),t)...                % Är a en funktion kommer a att evaliueras vid respektive punkt av delintervallet 
                        (0) @(t)a((p(i)+p(i+1))/2,t)};                          % för hattfunktionen med index i
                    elseif i~=length(p)
                        c1={@(t)a(p(i-1),t) @(t)a(p(i),t) @(t)a(p(i+1),t)...
                        @(t)a((p(i-1)+p(i))/2,t) @(t)a((p(i)+p(i+1))/2,t)};
                    elseif i==length(p)
                        c1={@(t)a(p(i-1),t) @(t)a(p(i),t) (0)...
                        @(t)a((p(i-1)+p(i))/2,t) (0)};
                    end
                        
                        
                case 'konstant'
                    c1={a a a a a};     % Är a itället en konstant kommer istället en konstant att införas i funktionen nedan
             end
            
            if i==1                     % Se M_Matrix
                j=i:i+1;
            elseif i~=length(p)
                j=i-1:i+1;
            elseif i==length(p)
                j=i-1:i;
            end
            
                    
            for j=j

                if i==1

                    
                    % Anger om overlappet med Phi(i) är på vänster eller höger sida 
                    if i==j
                        
                        o=2;
                    elseif j==i+1 
                        
                        o=1;
                    end

switch val_A
    case 'funktion'
                    S{i,j}=@(t)(c1{2}(t)*Hatt(p,i,p(i),2,1)*Hatt(p,j,p(i),o,1)+...
                          4*c1{5}(t)*Hatt(p,i,(p(i+1)+p(i))/2,2,1)*Hatt(p,j,((p(i)+p(i+1))/2),o,1)+...
                          c1{3}(t)*Hatt(p,i,p(i+1),2,1)*Hatt(p,j,p(i+1),o,1))...
                          /6*(p(i+1)-p(i));
    case 'konstant'
                    S{i,j}=@(t)(c1{2}*Hatt(p,i,p(i),2,1)*Hatt(p,j,p(i),o,1)+...
                          4*c1{5}*Hatt(p,i,(p(i+1)+p(i))/2,2,1)*Hatt(p,j,((p(i)+p(i+1))/2),o,1)+...
                          c1{3}*Hatt(p,i,p(i+1),2,1)*Hatt(p,j,p(i+1),o,1))...
                          /6*(p(i+1)-p(i));
end

                elseif  i~=length(p)
                    
                    if j==i-1
                        o=2;
                        O=1;
                    elseif j==i
                        O=2;
                        o=1;
                    elseif j==i+1
                        O=1;
                        o=2;
                    end

switch val_A
    case 'funktion'
                    S{i,j}=@(t)(c1{2}(t)*Hatt(p,i,p(i),1,1)*Hatt(p,j,p(i),o,1)+...
                           4*c1{4}(t)*Hatt(p,i,(p(i-1)+p(i))/2,1,1)*Hatt(p,j,((p(i)+p(i-1))/2),o,1)+...
                           c1{1}(t)*Hatt(p,i,p(i-1),1,1)*Hatt(p,j,p(i-1),o,1))...
                           /6*(p(i)-p(i-1))+(c1{3}(t)*Hatt(p,i,p(i+1),2,1)*Hatt(p,j,p(i+1),O,1)+...
                        4*c1{5}(t)*Hatt(p,i,((p(i+1)+p(i))/2),2,1)*Hatt(p,j,((p(i+1)+p(i))/2),O,1)+...
                         c1{2}(t)*Hatt(p,i,p(i),2,1)*Hatt(p,j,p(i),O,1))...
                         /6*(p(i+1)-p(i));
    case 'konstant'
                    S{i,j}=@(t)(c1{2}*Hatt(p,i,p(i),1,1)*Hatt(p,j,p(i),o,1)+...
                           4*c1{4}*Hatt(p,i,(p(i-1)+p(i))/2,1,1)*Hatt(p,j,((p(i)+p(i-1))/2),o,1)+...
                           c1{1}*Hatt(p,i,p(i-1),1,1)*Hatt(p,j,p(i-1),o,1))...
                           /6*(p(i)-p(i-1))+(c1{3}*Hatt(p,i,p(i+1),2,1)*Hatt(p,j,p(i+1),O,1)+...
                        4*c1{5}*Hatt(p,i,((p(i+1)+p(i))/2),2,1)*Hatt(p,j,((p(i+1)+p(i))/2),O,1)+...
                         c1{2}*Hatt(p,i,p(i),2,1)*Hatt(p,j,p(i),O,1))...
                         /6*(p(i+1)-p(i));
end
                elseif i==length(p)
                    if j==i-1
                        o=2;
                    elseif j==i 
                        o=1;
                    end
switch val_A
    case 'funktion'
                    S{i,j}=@(t)(c1{1}(t)*Hatt(p,i,p(i-1),1,1)*Hatt(p,j,p(i-1),o,1)+...
                        4*c1{4}(t)*Hatt(p,i,((p(i-1)+p(i))/2),1,1)*Hatt(p,j,((p(i-1)+p(i))/2),o,1)+...
                         c1{2}(t)*Hatt(p,i,p(i),1,1)*Hatt(p,j,p(i),o,1))...
                         /6*(p(i)-p(i-1));
    case 'konstant'
                    S{i,j}=@(t)(c1{1}*Hatt(p,i,p(i-1),1,1)*Hatt(p,j,p(i-1),o,1)+...
                        4*c1{4}*Hatt(p,i,((p(i-1)+p(i))/2),1,1)*Hatt(p,j,((p(i-1)+p(i))/2),o,1)+...
                         c1{2}*Hatt(p,i,p(i),1,1)*Hatt(p,j,p(i),o,1))...
                         /6*(p(i)-p(i-1));
end
                end
                if j==length(p)
                    break
                end
            end
        end
end