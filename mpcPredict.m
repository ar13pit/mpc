function [Phi,Gamma] = mpcPredict(A,B,N)
    Phi = [];
    for i=1:N
        Phi = [Phi; A^i];
    end
    
    Gamma = [];
    k = N;
    for i=1:N
        col = [];
        for j=1:k
            col = [col; A^(j-1)*B];
        end
        
        if i==1
            Gamma = [col];
            size_col1 = size(col);
        else
            Gamma = [Gamma [zeros(size_col1(1)-size(col,1),size_col1(2)); col]];
        end
        k = k-1;
    end
end
