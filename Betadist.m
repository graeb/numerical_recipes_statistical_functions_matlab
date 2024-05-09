classdef Betadist
    properties
        alpha
        beta
        fac  % Współczynnik używany w obliczeniach
    end
    
    methods
        function obj = Betadist(aalph, bbeta)
            % Konstruktor klasy, inicjalizujący parametry rozkładu
            if aalph <= 0 || bbeta <= 0
                error('Parametry alpha i beta muszą być większe od zera');
            end
            obj.alpha = aalph;
            obj.beta = bbeta;
            obj.fac = gammaln(aalph + bbeta) - gammaln(aalph) - gammaln(bbeta);
        end
        
        function y = p(obj, x)
            % Funkcja gęstości prawdopodobieństwa dla rozkładu Beta
            if x < 0 || x > 1
                error('Wartości x muszą być w przedziale [0, 1]');
            end
            y = exp((obj.alpha - 1) * log(x) + (obj.beta - 1) * log(1 - x) + obj.fac);
        end
        
        function y = cdf(obj, x)
            % Dystrybuanta dla rozkładu Beta
            if x < 0 || x > 1
                error('Wartości x muszą być w przedziale [0, 1]');
            end
            y = betainc(x, obj.alpha, obj.beta);
        end
        
        function x = invcdf(obj, p)
            % Odwrotność dystrybuanty dla rozkładu Beta
            if p < 0 || p > 1
                error('Wartości p muszą być w przedziale [0, 1]');
            end
            x = betaincinv(p, obj.alpha, obj.beta);
        end
    end
end
