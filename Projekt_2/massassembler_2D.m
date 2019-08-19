function [M] = massassembler_2D( p,t )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

n=size(p,2);
m=size(t,2);
M=zeros(n,n);
for K = 1:m
    loc2glb = t(1:3,K);
    x = p(1,loc2glb);
    y = p(2,loc2glb);
    area = polyarea(x,y);
    MK = [2 1 1;
          1 2 1;
          1 1 2]/12*area;
      M(loc2glb,loc2glb) = M(loc2glb,loc2glb) + MK;
end


end

