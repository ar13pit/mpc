function [check_flag] = mpc_check(varargin)

minArgrs = 2;
maxArgs = 3;
narginchk(minArgrs,maxArgs);

if nargin == 2
    Property = varargin{1};
    Value = varargin{2};
    
    if ~(Property == 'options')
        error('Invalid value for input argument Property: must be "options".')
    end
    
    if ~(isa(Value,'MPCOptions'))
        error('Invalid MPCOptions object. Use mpcOptions to create an MPCOptions class object.')
    end
    
    possible_options = mpcOptions('possible');
    
end



end