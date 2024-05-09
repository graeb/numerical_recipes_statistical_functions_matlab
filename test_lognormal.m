% Utworzenie obiektu rozkładu log-normalnego
mu = 0;    % Średnia logarytmów
sigma = 0.25; % Odchylenie standardowe logarytmów
logNormalDist = Lognormaldist(mu, sigma);

% Testowanie PDF
x_values = 0.1:0.01:3;
pdf_values = arrayfun(@(x) logNormalDist.p(x), x_values);

% Testowanie CDF
cdf_values = arrayfun(@(x) logNormalDist.cdf(x), x_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) logNormalDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Log-Normal Distribution PDF');
xlabel('x');
ylabel('PDF');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Log-Normal Distribution CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Log-Normal Distribution Inverse CDF');
xlabel('Probability');
ylabel('x');
