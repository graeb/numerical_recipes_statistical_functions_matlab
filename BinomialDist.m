classdef BinomialDist < handle
    properties
        n   % Liczba prób
        prob % Prawdopodobieństwo sukcesu w jednej próbie
    end
    
    methods
        function obj = BinomialDist(nn, pp)
            if nn <= 0 || floor(nn) ~= nn
                error('Liczba prób n musi być dodatnią liczbą całkowitą');
            end
            if pp < 0 || pp > 1
                error('Prawdopodobieństwo pp musi być w zakresie [0, 1]');
            end
            obj.n = nn;
            obj.prob = pp;
        end
        
        function y = p(obj, k)
            if k < 0 || k > obj.n || floor(k) ~= k
                error('k musi być liczbą całkowitą w zakresie od 0 do n');
            end
            y = nchoosek(obj.n, k) * obj.prob^k * (1 - obj.prob)^(obj.n - k);
        end
        
        function y = cdf(obj, k)
            if k < 0 || k > obj.n || floor(k) ~= k
                error('k musi być liczbą całkowitą w zakresie od 0 do n');
            end
            y = binocdf(k, obj.n, obj.prob);
        end
        
        function k = invcdf(obj, p)
            if p < 0 || p > 1
                error('p musi być w zakresie [0, 1]');
            end
            k = binoinv(p, obj.n, obj.prob);
        end
    end
end
