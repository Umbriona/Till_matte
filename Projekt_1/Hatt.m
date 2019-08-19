function PHI=Hatt(p,i,x,o,prim)

if prim==0
    if o==1
        PHI=V_Hatt(p,i,x);
    elseif o==2
        PHI=H_Hatt(p,i,x);
    end
elseif prim==1
    if o==1
        PHI=V_Hattprim(p,i,x);
    elseif o==2
        PHI=H_Hattprim(p,i,x);
    end
end