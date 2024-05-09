classdef Gammadist < Gamma
    properties
        alph
        bet
        fac
    end

    methods
        function obj = Gammadist(aalph, bbet)
            if aalph <= 0 || bbet <= 0
                error('Nieprawidłowe wartości alph lub bet w Gammadist');
            end
            obj.alph = aalph;
            obj.bet = bbet;
            obj.fac = obj.alph * log(obj.bet) - gammaln(obj.alph);
        end

        function y = p(obj, x)
            if x <= 0
                error('Nieprawidłowe x w Gammadist');
            end
            y = exp(-obj.bet * x + (obj.alph - 1) * log(x) + obj.fac);
        end

        function y = cdf(obj, x)
            if x < 0
                error('Nieprawidłowe x w Gammadist');
            end
            y = obj.gammp(obj.alph, obj.bet * x);
        end

        function y = invcdf(obj, p)
            if p < 0 || p >= 1
                error('Nieprawidłowe p w Gammadist');
            end
            y = obj.invgammp(p, obj.alph) / obj.bet;
        end
    end
end
