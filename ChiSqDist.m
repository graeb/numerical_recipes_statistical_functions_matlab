classdef ChiSqDist < handle
    properties
        nu  % Stopnie swobody
    end
    
    methods
        function obj = ChiSqDist(nnu)
            if nnu <= 0
                error('Stopnie swobody nu muszą być większe od zera');
            end
            obj.nu = nnu;
        end
        
        function y = p(obj, x)
            % Gęstość prawdopodobieństwa (PDF) rozkładu chi-kwadrat
            if x < 0
                error('x musi być nieujemny');
            end
            alpha = obj.nu / 2;
            beta = 1 / 2;
            y = (x^(alpha - 1) * exp(-x / beta)) / (beta^alpha * gamma(alpha));
        end
        
        function y = cdf(obj, x)
            % Dystrybuanta (CDF) rozkładu chi-kwadrat
            if x < 0
                error('x musi być nieujemny');
            end
            alpha = obj.nu / 2;
            beta = 1 / 2;
            y = gammainc(x / (2 * beta), alpha);
        end
        
        function x = invcdf(obj, p)
            % Odwrotna dystrybuanta (Inverse CDF) rozkładu chi-kwadrat
            if p < 0 || p > 1
                error('p musi być w zakresie [0, 1]');
            end
            alpha = obj.nu / 2;
            beta = 1 / 2;
            x = gaminv(p, alpha, 2 * beta);
        end
    end
end
