function [G,F,Omega,Psi,Phi,Gamma] = mpcQCost(N,A,B,Q,R,P,predictFlag)
% MPCQCOST generates MPC quadratic cost function matrices
%     [G,F,Omega,Psi,Phi,Gamma] = MPCQCOST(N,P,Q,R,Phi,Gamma,False) 
%     [G,F,Omega,Psi,Phi,Gamma] = MPCQCOST(N,P,Q,R,A,B,True)

N = MPCObj.PredictionHorizon;
A = MPCObj.Plant.A;
B = MPCObj.Plant.B;
P = MPCObj.Weight.P;
Q = MPCObj.Weight.Q;
R = MPCObj.Weight.R;


s_Alpha = size(A);
s_Beta = size(B);
s_Q = size(Q);
s_R = size(R);

if ~(s_Alpha(1) == s_Beta(1))
    error(['In the "mpcQCost(N,Alpha,Beta,Q,R,P,predictFlag)" command, Matrices Alpha and Beta are inconsistent.' newline newline 'They must same number of rows.'])
end

try
    R_symmetric_flag = R==R';
catch ME
    R_symmetric_flag = false;
end

R_symmetric_flag = logical(prod(R_symmetric_flag(:)));

if predictFlag
    if s_Q == s_Alpha
    else
        error('In the "mpcQCost(N,A,B,Q,R,P,true)" command, the A and Q matrices must have the same size.')
    end
        
    if s_R(2) == s_Beta(2) && R_symmetric_flag
    else
        error('In the "mpcQCost(N,A,B,Q,R,P,true)" command, the R matrix must be symmetric positive definite with as many columns as B.')
    end
    
    [Phi,Gamma] = mpcPredict(A,B,N);

else
    if s_Q == [s_Alpha(1)/N, s_Alpha(2)]
    else
        error(['Either horizon N is wrong or the dimension of matrix Q' newline newline 'In the "mpcQCost(N,Phi,Gamma,Q,R,P,false)" command, the Q matrix must have the same size as that of A which generates Phi.'])
    end
    
    if (s_R(2) == s_Beta(2)/N) && R_symmetric_flag
    else
        error(['In the "mpcQCost(N,Phi,Gamma,Q,R,P,false)" command,' newline 'the R matrix must be symmetric positive definite with as many columns as B which generates Gamma.'])        
    end
    
    Phi = A;
    Gamma = B;    
end

omega = cell(1,N-1);
omega(:) = {Q};
omega = [omega {P}];
Omega = blkdiag(omega{:});

psi = cell(1,N);
psi(:) = {R};
Psi = blkdiag(psi{:});

G = 2*(Psi + Gamma'*Omega*Gamma);
F = 2*Gamma'*Omega*Phi;

end