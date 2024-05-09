% Generowanie danych z rozkładu normalnego dla celów demonstracyjnych
mu = 0; % Średnia
sigma = 1; % Odchylenie standardowe
data = normrnd(mu, sigma, 100, 1); % 100 punktów danych

% Przeprowadzenie testu Kołmogorowa-Smirnowa
[h, p, ksstat, cv] = kstest((data - mu) / sigma, 'Alpha', 0.05);

% Wyświetlenie wyników
fprintf('Wynik testu K-S:\n');
fprintf('Hipoteza zerowa (dane pochodzą z N(%d, %d)): ', mu, sigma);
if h == 0
    fprintf('nie została odrzucona na poziomie istotności 0.05.\n');
else
    fprintf('została odrzucona na poziomie istotności 0.05.\n');
end
fprintf('Wartość p: %f\n', p);
fprintf('Statystyka testu K-S: %f\n', ksstat);
fprintf('Wartość krytyczna: %f\n', cv);

% Sortowanie danych i obliczenie ECDF
sortedData = sort(data);
ecdf = (1:length(sortedData))' / length(sortedData);

% Obliczenie teoretycznego CDF dla rozkładu normalnego
theoreticalCDF = normcdf(sortedData, mu, sigma);

% Rysowanie wykresów
figure;
hold on;
plot(sortedData, ecdf, 'b-', 'LineWidth', 2, 'DisplayName', 'ECDF');
plot(sortedData, theoreticalCDF, 'r--', 'LineWidth', 2, 'DisplayName', 'Theoretical CDF');
legend('show');
title('ECDF vs Theoretical CDF');
xlabel('Value');
ylabel('Cumulative Probability');
hold off;
