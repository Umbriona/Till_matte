function M=M_Matrix(p)
% M_Matrix skapar mass matrisen med hj�lp av Hatt 
% In data till M_Matrix �r intervall diskretiseringen av x

M=zeros(length(p));                     % Skapar en matris av storlek(N/N) vars element �r =0

        for i=1:length(p)               % Loop som g�r �ver alla hatt funktioner, index i beskriver rader
            if i==1                     % index j beskriver kolumner i M 
                j=i:i+1;                % eftersom ekvationen beskriver �verlappet av de tv� hatt funktonerna
            elseif i~=length(p)         % kommer j endast att g� mellan i-1 till i+1.
                j=i-1:i+1;              % f�r att undvika on�diga ber�kningar definierar vi j p� detta s�tt
            elseif i==length(p)
                j=i-1:i;
            end
            for j=j                     % I denna loop tas allts� det redan defenierade j indexet

                if i==1                 % Eftersom vi inte har n�gon v�nster del av hattfunktionen_1 delas for loppen upp i tre delar.

                    
                    % Anger om overlappet med Phi(i) �r p� v�nster eller h�ger sida 
                    if i==j
                        
                        o=2;            % o avg�r om den andra hattfunktionen �verlappar med        
                    elseif j==i+1       % v�nster eller h�ger del av hattfunktionen
                        
                        o=1;
                    end


                    M(i,j)=(Hatt(p,i,p(i),2,0)*Hatt(p,j,p(i),o,0)+...                           % M skapas med att medhj�lp av simpsons rgel f�r att f� arean under �verlappet  
                          4*Hatt(p,i,(p(i+1)+p(i))/2,2,0)*Hatt(p,j,((p(i)+p(i+1))/2),o,0)+...   % mellan de tv� hattfunktionerna, d�r index j best�mmer index p�hattfunktion nr. tv� 
                          Hatt(p,i,p(i+1),2,0)*Hatt(p,j,p(i+1),o,0))...
                          /6*(p(i+1)-p(i));

                elseif  i~=length(p)        % D� hattfunktion i ej �r n�gon utav kant funktionerna  
                    
                    if j==i-1
                        o=2;                % o Och O �r index som g�r in i funktionen Hatt f�r att avg�ra om det �r 
                        O=1;                % den h�gra eller v�nstra delen av hattfunkrionen som skall anv�ndas
                    elseif j==i
                        O=2;
                        o=1;
                    elseif j==i+1
                        O=1;
                        o=2;
                    end


                    M(i,j)=(Hatt(p,i,p(i),1,0)*Hatt(p,j,p(i),o,0)+...                               % D� i �r skilt fr�n 1 och N s� g�r j fr�n i-1 - i+1
                           4*Hatt(p,i,(p(i-1)+p(i))/2,1,0)*Hatt(p,j,((p(i)+p(i-1))/2),o,0)+...
                           Hatt(p,i,p(i-1),1,0)*Hatt(p,j,p(i-1),o,0))...                            % D� i=j kommer b�da delarna av ekvationen att vara skilt ifr�n 0
                           /6*(p(i)-p(i-1));
                    M(i,j)=M(i,j)+(Hatt(p,i,p(i+1),2,0)*Hatt(p,j,p(i+1),O,0)+...
                        4*Hatt(p,i,((p(i+1)+p(i))/2),2,0)*Hatt(p,j,((p(i+1)+p(i))/2),O,0)+...       % Om j=1+-i kommer en av delarna att vara =0   
                         Hatt(p,i,p(i),2,0)*Hatt(p,j,p(i),O,0))...
                         /6*(p(i+1)-p(i));

                elseif i==length(p)
                    if j==i-1
                        o=2;
                    elseif j==i 
                        o=1;
                    end

                    M(i,j)=(Hatt(p,i,p(i-1),1,0)*Hatt(p,j,p(i-1),o,0)+...                       % Ekvationen d� i=N
                        4*Hatt(p,i,((p(i-1)+p(i))/2),1,0)*Hatt(p,j,((p(i-1)+p(i))/2),o,0)+...
                         Hatt(p,i,p(i),1,0)*Hatt(p,j,p(i),o,0))...
                         /6*(p(i)-p(i-1));
                end
                if j==length(p)
                    break
                end
            end
        end
end
