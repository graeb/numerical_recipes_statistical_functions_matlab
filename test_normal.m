% Parametry rozkładu normalnego
mu = 0; % Średnia
sigma = 1; % Odchylenie standardowe

% Tworzenie obiektu rozkładu normalnego
normDist = Normaldist(mu, sigma);

% Testowanie PDF
x_values = -3:0.1:3; % Zakres wartości
pdf_values = arrayfun(@(x) normDist.p(x), x_values);

% Testowanie CDF
cdf_values = arrayfun(@(x) normDist.cdf(x), x_values);

% Testowanie Inverse CDF - unikanie wartości 0 i 1
p_values = linspace(0.01, 0.99, 100); % Prawdopodobieństwa
inv_cdf_values = arrayfun(@(p) normDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Rozkład Normalny PDF');
xlabel('x');
ylabel('PDF');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Rozkład Normalny CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Rozkład Normalny Inverse CDF');
xlabel('Prawdopodobieństwo');
ylabel('x');
