% Utworzenie obiektu rozkładu Studenta-t
nu = 10;  % stopnie swobody
mu = 0;   % średnia
sig = 2;  % odchylenie standardowe
studentDist = StudentTDist(nu, mu, sig);

% Testowanie PDF
t_values = -10:0.1:10;
pdf_values = arrayfun(@(t) studentDist.p(t), t_values);

% Testowanie CDF
cdf_values = arrayfun(@(t) studentDist.cdf(t), t_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) studentDist.invcdf(p), p_values);

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(t_values, pdf_values);
title('Student-t Distribution PDF');
xlabel('t');
ylabel('PDF');

subplot(3, 1, 2);
plot(t_values, cdf_values);
title('Student-t Distribution CDF');
xlabel('t');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Student-t Distribution Inverse CDF');
xlabel('Probability');
ylabel('t');
