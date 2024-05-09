classdef LogisticDist < handle
    properties
        mu    % Średnia, parametr lokalizacji
        s     % Skala, parametr skali
    end
    
    methods
        function obj = LogisticDist(mu, s)
            obj.mu = mu;
            obj.s = s;
        end
        
        function y = pdf(obj, x)
            % Gęstość prawdopodobieństwa (PDF) rozkładu logistycznego
            ex = exp(-(x - obj.mu) / obj.s);
            y = (ex / obj.s) / (1 + ex)^2;
        end
        
        function y = cdf(obj, x)
            % Dystrybuanta (CDF) rozkładu logistycznego
            y = 1 / (1 + exp(-(x - obj.mu) / obj.s));
        end
        
        function x = invcdf(obj, p)
            % Odwrotna dystrybuanta (Inverse CDF) rozkładu logistycznego
            x = obj.mu + obj.s * log(p / (1 - p));
        end
    end
end
