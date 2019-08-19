function C=C_Matrix(p,c)
global val_C

C=zeros(length(p));

        for i=1:length(p)
            
            switch val_C
                case 'funktion'
                    if i==1
                    c1=[(0) c(p(i)) c(p(i+1))...
                        (0) c((p(i)+p(i+1))/2)];
                    elseif i~=length(p)
                        c1=[c(p(i-1)) c(p(i)) c(p(i+1))...
                        c((p(i-1)+p(i))/2) c((p(i)+p(i+1))/2)];
                    elseif i==length(p)
                        c1=[c(p(i-1)) c(p(i)) (0)...
                        c((p(i-1)+p(i))/2) (0)];
                    end
                        
                        
                case 'konstant'
                    c1=[c c c c c];
             end
            
            if i==1
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


                    C(i,j)=(c1(2)*Hatt(p,i,p(i),2,0)*Hatt(p,j,p(i),o,0)+...
                          4*c1(5)*Hatt(p,i,(p(i+1)+p(i))/2,2,0)*Hatt(p,j,((p(i)+p(i+1))/2),o,0)+...
                          c1(3)*Hatt(p,i,p(i+1),2,0)*Hatt(p,j,p(i+1),o,0))...
                          /6*(p(i+1)-p(i));

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


                    C(i,j)=(c1(2)*Hatt(p,i,p(i),1,0)*Hatt(p,j,p(i),o,0)+...
                           4*c1(4)*Hatt(p,i,(p(i-1)+p(i))/2,1,0)*Hatt(p,j,((p(i)+p(i-1))/2),o,0)+...
                           c1(1)*Hatt(p,i,p(i-1),1,0)*Hatt(p,j,p(i-1),o,0))...
                           /6*(p(i)-p(i-1));
                    C(i,j)=C(i,j)+(c1(3)*Hatt(p,i,p(i+1),2,0)*Hatt(p,j,p(i+1),O,0)+...
                        4*c1(5)*Hatt(p,i,((p(i+1)+p(i))/2),2,0)*Hatt(p,j,((p(i+1)+p(i))/2),O,0)+...
                         c1(2)*Hatt(p,i,p(i),2,0)*Hatt(p,j,p(i),O,0))...
                         /6*(p(i+1)-p(i));

                elseif i==length(p)
                    if j==i-1
                        o=2;
                    elseif j==i 
                        o=1;
                    end

                    C(i,j)=(c1(1)*Hatt(p,i,p(i-1),1,0)*Hatt(p,j,p(i-1),o,0)+...
                        4*c1(4)*Hatt(p,i,((p(i-1)+p(i))/2),1,0)*Hatt(p,j,((p(i-1)+p(i))/2),o,0)+...
                         c1(2)*Hatt(p,i,p(i),1,0)*Hatt(p,j,p(i),o,0))...
                         /6*(p(i)-p(i-1));
                end
                if j==length(p)
                    break
                end
            end
        end
end