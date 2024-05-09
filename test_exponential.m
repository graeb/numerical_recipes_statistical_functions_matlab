% Create an instance of the Exponential Distribution with rate 1.5
expDist = ExponentialDist(1.5);

% Testing PDF
x_values = 0:0.1:10;
pdf_values = arrayfun(@(x) expDist.pdf(x), x_values);

% Testing CDF
cdf_values = arrayfun(@(x) expDist.cdf(x), x_values);

% Testing Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) expDist.invcdf(p), p_values);

% Display results
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Exponential Distribution PDF');
xlabel('x');
ylabel('PDF');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Exponential Distribution CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Exponential Distribution Inverse CDF');
xlabel('Probability');
ylabel('x');
