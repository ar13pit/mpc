classdef mpcObj
    
   properties (GetAccess = public, SetAccess = private)
       Model
       Horizon
       Weight
       allOk = false
       states
       inputs
   end

   properties (Access = private)
       isEmpty
   end
   %% Constructor
   methods
       
       function self = mpcObj(varargin)
           if nargin == 0
               self.isEmpty = true;
               return
           else
               self.isEmpty = false;
           end
           
           self.Model = varargin{1};
           if ~(isa(self.Model,'struct') || isa(self.Model,'cell'))
               error('Model must be either a struct or a cell')
           end
           
           if nargin >=2
               self.Horizon = varargin{2};
           else
               self.Horizon = [];
           end
           
           if nargin >=3
               self.Weight = varargin{3};
           else
               self.Weight = [];
           end
           
           if nargin >=4
               error('Excess input agruments supplied');
           end
       end
   %% Set Methods
   
       function self = setProperty(self,Property,Value)
           self = self.set(Property,Value);
       end

       function self = set(self,Property,Value)
           check_flag = mpc_check(self,Property,Value);

           if check_flag
               self.(Property) = Value;
           end
       end
       
   end
   
end
