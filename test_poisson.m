% Utworzenie obiektu rozkładu Poissona
% Uwaga wymaga Statistics and Machine Learning Toolbox.
lambda = 5; % Średnia liczba zdarzeń
poissonDist = PoissonDist(lambda);

% Testowanie PDF
n_values = 0:15; % Zakres wartości n
pdf_values = arrayfun(@(n) poissonDist.p(n), n_values);

% Testowanie CDF
cdf_values = arrayfun(@(n) poissonDist.cdf(n), n_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) poissonDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
stem(n_values, pdf_values, 'filled');
title('Rozkład Poisson PDF');
xlabel('n');
ylabel('PDF');

subplot(3, 1, 2);
stairs(n_values, cdf_values);
title('Rozkład Poisson CDF');
xlabel('n');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Rozkład Poisson Inverse CDF');
xlabel('Probability');
ylabel('n');
