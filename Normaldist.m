classdef Normaldist
    properties
        mu
        sig
    end
    
    methods
        function obj = Normaldist(mmu, ssig)
            if nargin == 0
                mmu = 0;
                ssig = 1;
            end
            if ssig <= 0
                error('bad sig in Normaldist');
            end
            obj.mu = mmu;
            obj.sig = ssig;
        end
        
        function y = p(obj, x)
            % P Gęstość prawdopodobieństwa rozkładu normalnego.
            y = (0.398942280401432678 / obj.sig) * exp(-0.5 * ((x - obj.mu) / obj.sig)^2);
        end
        
        function y = cdf(obj, x)
            % CDF Dystrybuanta rozkładu normalnego.
            y = 0.5 * erfc(-0.707106781186547524 * (x - obj.mu) / obj.sig);
        end
        
        function y = invcdf(obj, p)
            % INVCDF Odwrotność dystrybuanty rozkładu normalnego.
            if p <= 0. || p >= 1.
                error('bad p in Normaldist');
            end
            y = -1.41421356237309505 * obj.sig * inverfc(2.*p) + obj.mu;
        end
    end
end