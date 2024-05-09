classdef KSdist
    methods (Static)
        function y = pks(z)
            % Oblicza wartość dystrybuanty Kolmogorowa-Smirnowa dla statystyki z
            if z < 0
                error('Nieprawidłowe z w KSdist');
            end
            if z < 0.042
                y = 0;
            elseif z < 1.18
                exp_term = exp(-1.23370055013616983 / (z * z));
                y = 2.25675833419102515 * sqrt(-log(exp_term)) * ...
                    (exp_term + exp_term^9 + exp_term^25 + exp_term^49);
            else
                exp_term = exp(-2 * z * z);
                y = 1 - 2 * (exp_term - exp_term^4 + exp_term^9);
            end
        end

        function y = qks(z)
            % Oblicza wartość dopełnienia do 1 dystrybuanty Kolmogorowa-Smirnowa dla statystyki z
            if z < 0
                error('Nieprawidłowe z w KSdist');
            end
            if z == 0
                y = 1;
            else
                y = 1 - KSdist.pks(z);
            end
        end

        function z = invqks(q)
            % Oblicza odwrotność dopełnienia dystrybuanty Kolmogorowa-Smirnowa
            if q <= 0 || q > 1
                error('Nieprawidłowe q w KSdist');
            end
            if q == 1
                z = 0;
            elseif q > 0.3
                f = -0.392699081698724155 * (1 - q)^2;
                y = invxlogx(f);
                y_prev = 0;
                while true
                    logy = log(y);
                    ff = f / ((1 + y^4 + y^12)^2);
                    u = (y * logy - ff) / (1 + logy);
                    y_prev = y;
                    y = y - u / max(0.5, 1 - 0.5 * u / (y * (1 + logy)));
                    if abs((y_prev - y) / y) < 1.e-15
                        break;
                    end
                end
                z = 1.57079632679489662 / sqrt(-log(y));
            else
                x = 0.03;
                x_prev = 0;
                while true
                    x_prev = x;
                    x = 0.5 * q + x^4 - x^9;
                    if x > 0.06
                        x = x + x^16 - x^25;
                    end
                    if abs((x_prev - x) / x) > 1.e-15
                        break;
                    end
                end
                z = sqrt(-0.5 * log(x));
            end
        end

        function z = invpks(p)
            % Oblicza odwrotność dystrybuanty Kolmogorowa-Smirnowa
            z = KSdist.invqks(1 - p);
        end
    end
end
