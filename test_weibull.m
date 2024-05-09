% Utworzenie obiektu rozkładu Weibulla
lambda = 1.5;  % Parametr skali
k = 2.5;       % Parametr kształtu
weibullDist = WeibullDist(lambda, k);

% Testowanie PDF
x_values = 0:0.01:3;
pdf_values = arrayfun(@(x) weibullDist.p(x), x_values);

% Testowanie CDF
cdf_values = arrayfun(@(x) weibullDist.cdf(x), x_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) weibullDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Weibull Distribution PDF');
xlabel('x');
ylabel('PDF');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Weibull Distribution CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Weibull Distribution Inverse CDF');
xlabel('Probability');
ylabel('x');
