% Parametry rozkładu Gamma
alpha = 4; % Kształt
beta = 1;  % Skala

% Tworzenie obiektu rozkładu Gamma
gammaDist = Gammadist(alpha, beta);

% Testowanie PDF
x_values = 0.1:0.1:10; % Zakres wartości dla Gamma, zaczynając od 0.1
pdf_values = arrayfun(@(x) gammaDist.p(x), x_values);

% Testowanie CDF
cdf_values = arrayfun(@(x) gammaDist.cdf(x), x_values);

% Testowanie Inverse CDF
p_values = linspace(0.01, 0.99, 100); % Prawdopodobieństwa
inv_cdf_values = zeros(size(p_values)); % Inicjalizacja wektora na wyniki
for idx = 1:length(p_values)
    inv_cdf_values(idx) = gammaDist.invcdf(p_values(idx));
end

% Wyświetlenie wyników
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Gamma Distribution PDF');
xlabel('x');
ylabel('Probability Density');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Gamma Distribution CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Gamma Distribution Inverse CDF');
xlabel('Probability');
ylabel('x');
