function [S, M, R, r] = PoissonAssembler1D(p,rvk)

N = length(p);      % Antal nodpunkter

S = zeros(N,N);     % Styvhetsmatris
M = zeros(N,N);     % Massmatris
R = zeros(N,N);     % Randmatris
    % lastvektor
r = zeros(N,1);     % randvektor

    for i = 1:(N-1)             %Lopar över delintervallen
    
        h = p(i+1) - p(i);      % Delintervallens längd
    
        % Asembly of the stiffnesmatrix
        S(i,i)     = S(i,i)+1/h;
        S(i,i+1)   = S(i,i+1)-1/h;
        S(i+1,i)   = S(i+1,i)-1/h;
        S(i+1,i+1) = S(i+1,i+1)+1/h;
    
        
        
    
        % Massmatrix
        M(i,i)      = M(i,i)+h/3;
        M(i,i+1)    = M(i,i+1)+h/6;
        M(i+1,i)    = M(i+1,i)+h/6;
        M(i+1,i+1)  = M(i+1,i+1)+1/3*h;
    
    end

% Bidrag från randpunkterna

% från vänster randpunkt x=a

R(1,1) = rvk{1}(1);
r(1) = rvk{1}(1) * rvk{2}(1) - rvk{3}(1);

% Från höger randpunkt x=b
R(N,N) = rvk{1}(4); % I punkten x=b Är gamma = le4, g_N = 0.0 och g_D = 0.0.
r(N)   = rvk{1}(4) * rvk{2}(5) - rvk{3}(6);

end
    