% Utworzenie obiektu rozkładu logistycznego
mu = 0;  % Średnia
s = 1;   % Skala
logisticDist = LogisticDist(mu, s);

% Testowanie PDF
x_values = -10:0.1:10;
pdf_values = arrayfun(@(x) logisticDist.pdf(x), x_values);

% Testowanie CDF
cdf_values = arrayfun(@(x) logisticDist.cdf(x), x_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) logisticDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Logistic Distribution PDF');
xlabel('x');
ylabel('PDF');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Logistic Distribution CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Logistic Distribution Inverse CDF');
xlabel('Probability');
ylabel('x');
