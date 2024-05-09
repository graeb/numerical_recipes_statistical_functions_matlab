classdef Beta < Gauleg18
    properties (Constant)
        SWITCH = 3000
        EPS = eps
        FPMIN = realmin / eps
    end

    methods
        function y = betai(obj, a, b, x)
            if a <= 0 || b <= 0
                error('Nieprawidłowe a lub b w funkcji betai');
            end
            if x < 0 || x > 1
                error('Nieprawidłowe x w funkcji betai');
            end
            if x == 0 || x == 1
                y = x;
            elseif a > obj.SWITCH && b > obj.SWITCH
                y = obj.betaiapprox(a, b, x);
            else
                bt = exp(gammln(a + b) - gammln(a) - gammln(b) + a * log(x) + b * log(1 - x));
                if x < (a + 1) / (a + b + 2)
                    y = bt * obj.betacf(a, b, x) / a;
                else
                    y = 1 - bt * obj.betacf(b, a, 1 - x) / b;
                end
            end
        end

        function y = betacf(obj, a, b, x)
            % Funkcja obliczająca ułamek ciągły dla funkcji betai
            m = 1;
            am = 1;
            bm = 1;
            az = 1;
            qab = a + b;
            qap = a + 1;
            qam = a - 1;
            bz = 1 - qab * x / qap;
            while abs(am / az) > obj.EPS
                m = m + 1;
                em = m;
                tem = em + em;
                d = em * (b - m) * x / ((qam + tem) * (a + tem));
                ap = az + d * am;
                bp = bz + d * bm;
                d = -(a + em) * (qab + em) * x / ((a + tem) * (qap + tem));
                app = ap + d * az;
                bpp = bp + d * bz;
                am = ap / bpp;
                bm = bp / bpp;
                az = app / bpp;
                bz = 1;
            end
            y = az;
        end

        function y = betaiapprox(obj, a, b, x)
            % Aproksymacja betai dla dużych a i b
            mu = a / (a + b);
            lnmu = log(mu);
            lnmuc = log(1 - mu);
            t = sqrt(a * b / ((a + b) * (a + b + 1)));
            if x > a / (a + b)
                if x >= 1
                    y = 1;
                else
                    xu = min(1, max(mu + 10 * t, x + 5 * t));
                end
            else
                if x <= 0
                    y = 0;
                else
                    xu = max(0, min(mu - 10 * t, x - 5 * t));
                end
            end
            sum = 0;
            for j = 1:obj.ngau
                t = x + (xu - x) * obj.y(j);
                sum = sum + obj.w(j) * exp((a - 1) * log(t) + (b - 1) * log(1 - t));
            end
            y = sum * (xu - x) * exp((a - 1) * lnmu + (b - 1) * lnmuc + gammln(a + b) - gammln(a) - gammln(b));
            if x > a / (a + b)
                y = 1 - y;
            end
        end
    end
end
