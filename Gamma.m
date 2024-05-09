classdef Gamma < Gauleg18
    properties
        gln
        EPS = eps;
        FPMIN = realmin / eps;
        ASWITCH = 100; % Zdefiniuj odpowiednią wartość graniczną dla przełączania metod
    end
    
    methods
        function y = gammp(obj, a, x)
            % Oblicza pełną funkcję gamma P(a, x).
            if x < 0 || a <= 0
                error('Nieprawidłowe argumenty w funkcji gammp');
            end
            if x == 0
                y = 0.0;
            elseif a >= obj.ASWITCH
                y = obj.gammpapprox(a, x, 1);
            elseif x < a + 1.0
                y = obj.gser(a, x);
            else
                y = 1.0 - obj.gammaCF(a, x);
            end
        end
        function x = invgammp(obj, p, a)
            if p < 0 || p > 1
                error('Wartość p musi być w zakresie [0, 1]');
            end
            if p == 0
                x = 0;
                return;
            elseif p == 1
                x = Inf;
                return;
            end
        
            % Inicjalizacja dwóch punktów x1 i x2
            x1 = a / obj.bet; % Średnia rozkładu
            x2 = x1 * 1.1; % Nieco większe początkowe przybliżenie
        
            f1 = obj.gammp(a, x1) - p;
            f2 = obj.gammp(a, x2) - p;
        
            for iter = 1:100 % Maksymalnie 100 iteracji
                if abs(f2 - f1) < 1e-10 % Zabezpieczenie przed dzieleniem przez zero
                    break;
                end
                % Aktualizacja x używając metody sekant
                x = x2 - f2 * (x2 - x1) / (f2 - f1);
                
                if x <= 0
                    x = 0.1; % Zabezpieczenie przed wartościami ujemnymi lub zerowymi
                end
                
                % Aktualizacja dla następnej iteracji
                x1 = x2;
                f1 = f2;
                x2 = x;
                f2 = obj.gammp(a, x) - p;
                
                if abs(f2) < 1e-8
                    return;
                end
            end
            warning('Nie udało się osiągnąć konwergencji w invgammp');
        end


        function y = gser(obj, a, x)
            % Oblicza funkcję gamma przez rozwinięcie w szereg dla x < a+1.
            obj.gln = gammaln(a);
            ap = a;
            sum = 1.0 / a;
            del = sum;
            while true
                ap = ap + 1;
                del = del * (x / ap);
                sum = sum + del;
                if abs(del) < abs(sum) * obj.EPS
                    break;
                end
            end
            y = sum * exp(-x + a * log(x) - obj.gln);
        end

        function y = gammaCF(obj, a, x)
            % Oblicza funkcję gamma używając ciągłego ułamka dla x >= a+1.
            obj.gln = gammaln(a);
            b = x + 1 - a;
            c = 1 / obj.FPMIN;
            d = 1 / b;
            h = d;
            i = 1;
            while true
                an = -i * (i - a);
                b = b + 2;
                d = an * d + b;
                if abs(d) < obj.FPMIN
                    d = obj.FPMIN;
                end
                c = b + an / c;
                if abs(c) < obj.FPMIN
                    c = obj.FPMIN;
                end
                d = 1 / d;
                del = d * c;
                h = h * del;
                if abs(del - 1.0) <= obj.EPS
                    break;
                end
                i = i + 1;
            end
            y = exp(-x + a * log(x) - obj.gln) * h;
        end
        function y = gammpapprox(obj, a, x, psig)
            % Przybliżona funkcja gamma dla dużych wartości a.
            a1 = a - 1;
            lna1 = log(a1);
            sqrta1 = sqrt(a1);
            if x > a1
                xu = max(a1 + 11.5 * sqrta1, x + 6.0 * sqrta1);
            else
                xu = max(0, min(a1 - 7.5 * sqrta1, x - 5.0 * sqrta1));
            end
            sum = 0;
            for j = 1:obj.ngau
                t = x + (xu - x) * obj.y(j);
                sum = sum + obj.w(j) * exp(-(t - a1) + a1 * (log(t) - lna1));
            end
            answ = sum * (xu - x) * exp(a1 * (lna1 - 1) - obj.gln);
            if psig
                if x > a1
                    y = 1.0 - answ;
                else
                    y = -answ;
                end
            else
                if x > a1
                    y = answ;
                else
                    y = 1.0 + answ;
                end
            end
        end
    end
end
