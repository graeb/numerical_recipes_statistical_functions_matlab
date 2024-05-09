function u = invxlogx(y)
    % Oblicza odwrotność x * log(x) = y
    ooe = 0.367879441171442322;
    if y >= 0 || y <= -ooe
        error('Nie istnieje taka odwrotna wartość');
    end
    if y < -0.2
        u = log(ooe - sqrt(2 * ooe * (y + ooe)));
    else
        u = -10;
    end
    to = 0;
    while true
        t = (log(y / u) - u) * (u / (1 + u));
        u = u + t;
        if t < 1.e-8 && abs(t + to) < 0.01 * abs(t)
            break;
        end
        to = t;
        if abs(t / u) < 1.e-15
            break;
        end
    end
    u = exp(u);
end
