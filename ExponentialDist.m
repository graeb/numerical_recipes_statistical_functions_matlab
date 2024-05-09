classdef ExponentialDist < handle
    properties
        rate % Parametr stopy (lambda)
    end
    
    methods
        function obj = ExponentialDist(rate)
            if rate <= 0
                error('Rate musi być pozytywny');
            end
            obj.rate = rate;
        end
        
        function y = pdf(obj, x)
            if x < 0
                y = 0;
            else
                y = obj.rate * exp(-obj.rate * x);
            end
        end
        
        function y = cdf(obj, x)
            if x < 0
                y = 0;
            else
                y = 1 - exp(-obj.rate * x);
            end
        end
        
        function x = invcdf(obj, p)
            if p < 0 || p > 1
                error('Prawdopodobienśtwo musi być pomiędzy [0, 1]');
            end
            x = -log(1 - p) / obj.rate;
        end
    end
end
