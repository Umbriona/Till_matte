function F = TrapetsHatt(f,p,rvk,N)



for i=1:length(p)
    if i==1
        
        F{i,1}=@(t)(f(p(i),t)*Hatt(p,i,p(i),2,0)+...
            f(p(i+1),t)*Hatt(p,i,p(i+1),2,0))...
            /2*(p(i+1)-p(i))+rvk{1}(p(1))*rvk{2}(p(1))-rvk{3}(p(1));
        
    elseif  i~=length(p)
        
        
        F{i,1}=@(t)(f(p(i-1),t)*Hatt(p,i,p(i-1),1,0)+...
            f(p(i),t)*Hatt(p,i,p(i),1,0))...
            /2*(p(i)-p(i-1))+...
            (f(p(i),t)*Hatt(p,i,p(i),2,0)+...
            f(p(i+1),t)*Hatt(p,i,p(i+1),2,0))...
            /2*(p(i+1)-p(i));
        
    elseif i==length(p)
        
        
        
        F{i,1}=@(t)(f(p(i-1),t)*Hatt(p,i,p(i-1),1,0)+f(p(i),t)*Hatt(p,i,p(i),1,0))...
            /2*(p(i)-p(i-1))+rvk{1}(p(N))*rvk{2}(p(N))-rvk{3}(p(N));
        
    end
    
end

end
