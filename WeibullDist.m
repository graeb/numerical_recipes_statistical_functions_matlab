classdef WeibullDist < handle
    properties
        lambda  % Parametr skali
        k       % Parametr kształtu
    end
    
    methods
        function obj = WeibullDist(llambda, kk)
            if llambda <= 0 || kk <= 0
                error('Parametry lambda i k muszą być większe od zera');
            end
            obj.lambda = llambda;
            obj.k = kk;
        end
        
        function y = p(obj, x)
            % Gęstość prawdopodobieństwa (PDF) rozkładu Weibulla
            if x < 0
                error('x musi być nieujemny');
            end
            y = (obj.k / obj.lambda) * (x / obj.lambda).^(obj.k - 1) * exp(-(x / obj.lambda).^obj.k);
        end
        
        function y = cdf(obj, x)
            % Dystrybuanta (CDF) rozkładu Weibulla
            if x < 0
                error('x musi być nieujemny');
            end
            y = 1 - exp(-(x / obj.lambda).^obj.k);
        end
        
        function x = invcdf(obj, p)
            % Odwrotna dystrybuanta (Inverse CDF) rozkładu Weibulla
            if p < 0 || p > 1
                error('p musi być w zakresie [0, 1]');
            end
            x = obj.lambda * (-log(1 - p)).^(1 / obj.k);
        end
    end
end
