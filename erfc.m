function y = erfc(x)
    % ERFC Complementary error function for scalar x.
    if x >= 0
        y = erfccheb(x);
    else
        y = 2.0 - erfccheb(-x);
    end
end