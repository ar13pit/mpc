function options = mpcOptions(type)

if nargin < 1
    type = 'default';
end

switch type
    case 'default'
        options = MPCOptions();
        options.Solver = 'QuadProg';
        options.Cost = 'Quadratic';
        options.PredictState = true;
        options.Constraints = false;
        options.TerminalCost = 'LQR';
    
    case 'possible'
        options.Solver = {'QuadProg'};
        options.Cost = {'Quadratic','Linear'};
        options.PredictState = {true,false};
        options.Constraints = {true,false};
        options.TerminalCost = {'LQR','DLYAP','LMI'};
        
        
    
    otherwise
        error('Invalid input argument')
        
end

end