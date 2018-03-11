classdef MPCOptions

    properties
        Solver
        Cost
        PredictState
        Constraints
        TerminalCost
    end
    
    methods
        function obj = set.Solver(obj,value)
            if ~(isa(value,'char'))
                error('Invalid value for MPCOptions property Solver: must be char array.')
            else
                obj.Solver = value;
            end
        end
        
        function obj = set.Cost(obj,value)
            if ~(isa(value,'char'))
                error('Invalid value for MPCOptions property Cost: must be char array.')
            else
                obj.Cost = value;
            end
        end
        
        function obj = set.PredictState(obj,value)
            if ~(isa(value,'logical'))
                error('Invalid value for MPCOptions property PredictState: must be logical TRUE or FALSE.')
            else
                obj.PredictState = value;
            end
        end
        
        function obj = set.Constraints(obj,value)
            if ~(isa(value,'logical'))
                error('Invalid value for MPCOptions property Constraints: must be logical TRUE or FALSE.')
            else
                obj.Constraints = value;
            end
        end
        
        function obj = set.TerminalCost(obj,value)
            if ~(isa(value,'char'))
                error('Invalid value for MPCOptions property TerminalCost: must be char array.')
            else
                obj.TerminalCost = value;
            end
        end
        
    end
end
