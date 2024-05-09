classdef Lognormaldist < Normaldist
    methods
        function y = p(obj, x)
            % P Gęstość prawdopodobieństwa rozkładu log-normalnego.
            if x < 0
                error('bad x in Lognormaldist');
            end
            if x == 0
                y = 0;
            else
                y = (0.398942280401432678 / (obj.sig * x)) * exp(-0.5 * ((log(x) - obj.mu) / obj.sig)^2);
            end
        end
        
        function y = cdf(obj, x)
            % CDF Dystrybuanta rozkładu log-normalnego.
            if x < 0
                error('bad x in Lognormaldist');
            end
            if x == 0
                y = 0;
            else
                y = 0.5 * erfc(-0.707106781186547524 * (log(x) - obj.mu) / obj.sig);
            end
        end
        
        function y = invcdf(obj, p)
            % INVCDF Odwrotność dystrybuanty rozkładu log-normalnego.
            if p <= 0. || p >= 1.
                error('bad p in Lognormaldist');
            end
            y = exp(-1.41421356237309505 * obj.sig * inverfc(2.*p) + obj.mu);
        end
    end
end