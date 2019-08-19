function [A] = stifnessasembler( p,t )
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
n = size(p,2);
m = size(t,2);
A = zeros(n,n);
for K = 1:m
    loc2glb = t(1:3,K);
    x = p(1,loc2glb);
    y = p(2,loc2glb);
    area = polyarea(x,y);
    V = [ones(1,3); x; y]';
    alpha = V\eye(3,3);
    b = alpha(2,:)';
    c = alpha(3,:)';
    AK = (b*b'+c*c')*area;
    A(loc2glb,loc2glb) = A(loc2glb,loc2glb) + AK;
end

end

