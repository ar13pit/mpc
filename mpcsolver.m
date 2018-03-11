function [u]=mpcsolver(mpcObj,options)
    
if ~(isa(mpcObj,'mpcObj'))
    error('First input argument must be an object of the "mpcObj" class.');
end

if nargin > 1
    if ~(mpc_check('options',options))
        error('Options not recognised. Use "mpcOptions" to set the correct options.')
    end
else
    options = mpcOptions('default');
end

cost = options.Cost;
predictFlag = options.PredictState;


end