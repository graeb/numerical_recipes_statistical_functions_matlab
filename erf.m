function y = erf(x)
    % ERF Error function for scalar x.
    if x >= 0
        y = 1.0 - erfccheb(x);
    else
        y = erfccheb(-x) - 1.0;
    end
end
