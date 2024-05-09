classdef FDist < handle
    properties
        nu1  % Stopnie swobody dla licznika
        nu2  % Stopnie swobody dla mianownika
    end
    
    methods
        function obj = FDist(nnu1, nnu2)
            if nnu1 <= 0 || nnu2 <= 0
                error('Stopnie swobody nu1 i nu2 muszą być większe od zera');
            end
            obj.nu1 = nnu1;
            obj.nu2 = nnu2;
        end
        
        function y = p(obj, f)
            % Gęstość prawdopodobieństwa (PDF) rozkładu F
            if f < 0
                error('f musi być nieujemny');
            end
            num = (obj.nu1 * f)^(obj.nu1 / 2) * obj.nu2^(obj.nu2 / 2);
            denom = (obj.nu1 * f + obj.nu2)^(obj.nu1 / 2 + obj.nu2 / 2);
            y = sqrt(num / denom) / (f * beta(obj.nu1 / 2, obj.nu2 / 2));
        end
        
        function y = cdf(obj, f)
            % Dystrybuanta (CDF) rozkładu F
            if f < 0
                error('f musi być nieujemny');
            end
            y = fcdf(f, obj.nu1, obj.nu2);
        end
        
        function f = invcdf(obj, p)
            % Odwrotna dystrybuanta (Inverse CDF) rozkładu F
            if p < 0 || p > 1
                error('p musi być w zakresie [0, 1]');
            end
            f = finv(p, obj.nu1, obj.nu2);
        end
    end
end
