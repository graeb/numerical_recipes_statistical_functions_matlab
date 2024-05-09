classdef PoissonDist < handle
    properties
        lambda % Średnia liczba zdarzeń
    end
    
    methods
        function obj = PoissonDist(llambda)
            if llambda <= 0
                error('lambda musi być większa od zera');
            end
            obj.lambda = llambda;
        end
        
        function y = p(obj, n)
            if n < 0 || floor(n) ~= n
                error('n musi być nieujemną liczbą całkowitą');
            end
            y = exp(-obj.lambda) * obj.lambda^n / factorial(n);
        end
        
        function y = cdf(obj, n)
            if n < 0 || floor(n) ~= n
                error('n musi być nieujemną liczbą całkowitą');
            end
            y = poisscdf(n, obj.lambda);
        end
        
        function n = invcdf(obj, p)
            if p < 0 || p > 1
                error('p musi być w zakresie [0, 1]');
            end
            n = poissinv(p, obj.lambda);
        end
    end
end
