function y = inverfc(p)
    % INVERFC Odwrotność uzupełniającej funkcji błędu.
    if p >= 2.0
        y = -100.;
    elseif p <= 0.0
        y = 100.;
    else
        if p < 1.0
            pp = p;
        else
            pp = 2.0 - p;
        end
        t = sqrt(-2.0 * log(pp / 2.0));
        x = -0.70711 * ((2.30753 + t * 0.27061) / (1.0 + t * (0.99229 + t * 0.04481)) - t);
        for j = 1:2
            err = erfc(x) - pp;
            x = x + err / (1.12837916709551257 * exp(-x^2) - x * err);
        end
        if p < 1.0
            y = x;
        else
            y = -x;
        end
    end
end
