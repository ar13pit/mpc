function [Kmpc] = mpcQUnconstrained(G,F,N,m)
    Kmpc = [eye(m) zeros(m,N-1)]*G^-1*F;
end