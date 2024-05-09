% Parametry rozkładu Beta
alpha = 2;
beta = 5;

% Tworzenie obiektu rozkładu Beta
betaDist = Betadist(alpha, beta);

% Testowanie PDF
x_values = 0:0.01:1; % Zakres wartości dla Beta
pdf_values = arrayfun(@(x) betaDist.p(x), x_values);

% Testowanie CDF
cdf_values = arrayfun(@(x) betaDist.cdf(x), x_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100); % Prawdopodobieństwa
inv_cdf_values = arrayfun(@(p) betaDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Rozkład Beta PDF');
xlabel('x');
ylabel('PDF');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Rozkład Beta CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Rozkład Beta Inverse CDF');
xlabel('Probability');
ylabel('x');
