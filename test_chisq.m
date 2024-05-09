% Utworzenie obiektu rozkładu chi-kwadrat
nu = 10;  % Stopnie swobody
chiSqDist = ChiSqDist(nu);

% Testowanie PDF
x_values = 0:0.1:20;
pdf_values = arrayfun(@(x) chiSqDist.p(x), x_values);

% Testowanie CDF
cdf_values = arrayfun(@(x) chiSqDist.cdf(x), x_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) chiSqDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Chi-Square Distribution PDF');
xlabel('x');
ylabel('PDF');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Chi-Square Distribution CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Chi-Square Distribution Inverse CDF');
xlabel('Probability');
ylabel('x');
