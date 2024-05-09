% Utworzenie obiektu rozkładu dwumianowego
n = 10;  % Liczba prób
p = 0.5; % Prawdopodobieństwo sukcesu w jednej próbie
binomialDist = BinomialDist(n, p);

% Testowanie PDF
k_values = 0:n;
pdf_values = arrayfun(@(k) binomialDist.p(k), k_values);

% Testowanie CDF
cdf_values = arrayfun(@(k) binomialDist.cdf(k), k_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) binomialDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
stem(k_values, pdf_values, 'filled');
title('Binomial Distribution PDF');
xlabel('k');
ylabel('PDF');

subplot(3, 1, 2);
stairs(k_values, cdf_values);
title('Binomial Distribution CDF');
xlabel('k');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Binomial Distribution Inverse CDF');
xlabel('Probability');
ylabel('k');
