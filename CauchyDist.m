classdef CauchyDist < handle
    properties
        location % Parametr lokalizacji (x0)
        scale    % Parametr skali (gamma)
    end
    
    methods
        function obj = CauchyDist(location, scale)
            if scale <= 0
                error('Scale must be positive');
            end
            obj.location = location;
            obj.scale = scale;
        end
        
        function y = pdf(obj, x)
            y = (1 / (pi * obj.scale)) * (obj.scale^2 / ((x - obj.location)^2 + obj.scale^2));
        end
        
        function y = cdf(obj, x)
            y = 0.5 + atan((x - obj.location) / obj.scale) / pi;
        end
        
        function x = invcdf(obj, p)
            if p < 0 || p > 1
                error('Probability must be in [0, 1]');
            end
            x = obj.location + obj.scale * tan(pi * (p - 0.5));
        end
    end
end
