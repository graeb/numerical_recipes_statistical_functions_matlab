classdef StudentTDist < handle
    properties
        nu  % Stopnie swobody
        mu  % Średnia
        sig % Odchylenie standardowe
        np  % Współczynnik używany w obliczeniach
        fac % Współczynnik używany w obliczeniach
    end
    
    methods
        function obj = StudentTDist(nnu, mmu, ssig)
            if ssig <= 0 || nnu <= 0
                error('bad sig,nu in StudentTDist');
            end
            obj.nu = nnu;
            obj.mu = mmu;
            obj.sig = ssig;
            obj.np = 0.5 * (nnu + 1);
            obj.fac = gammaln(obj.np) - gammaln(0.5 * nnu);
        end
        
        function y = p(obj, t)
            y = exp(-obj.np * log(1 + ((t - obj.mu) / obj.sig) .^ 2 / obj.nu) + obj.fac) ...
                / (sqrt(3.141592653589793 * obj.nu) * obj.sig);
        end
        
        function y = cdf(obj, t)
            x = (t - obj.mu) / obj.sig;
            p = 0.5 * betainc(obj.nu / (obj.nu + x .^ 2), 0.5 * obj.nu, 0.5);
            y = p;
            y(x < 0) = 1 - p(x < 0);
        end
        
        function t = invcdf(obj, p)
            if any(p < 0 | p > 1)
                error('bad p in StudentTDist');
            end
            x = betaincinv(2 * min(p, 1 - p), 0.5 * obj.nu, 0.5);
            t = obj.sig * sqrt(obj.nu * (1 - x) ./ x) + obj.mu;
            t(p >= 0.5) = -t(p >= 0.5) + 2 * obj.mu;
        end
    end
end
