% Utworzenie obiektu rozkładu F
nu1 = 10;  % Stopnie swobody dla licznika
nu2 = 20;  % Stopnie swobody dla mianownika
fDist = FDist(nu1, nu2);

% Testowanie PDF
f_values = 0:0.01:5;
pdf_values = arrayfun(@(f) fDist.p(f), f_values);

% Testowanie CDF
cdf_values = arrayfun(@(f) fDist.cdf(f), f_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) fDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(f_values, pdf_values);
title('F Distribution PDF');
xlabel('f');
ylabel('PDF');

subplot(3, 1, 2);
plot(f_values, cdf_values);
title('F Distribution CDF');
xlabel('f');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('F Distribution Inverse CDF');
xlabel('Probability');
ylabel('f');
