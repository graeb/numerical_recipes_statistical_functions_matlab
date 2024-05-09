% Create an instance of the Cauchy Distribution with location 0 and scale 1
cauchyDist = CauchyDist(0, 1);

% Testing PDF
x_values = -10:0.1:10;
pdf_values = arrayfun(@(x) cauchyDist.pdf(x), x_values);

% Testing CDF
cdf_values = arrayfun(@(x) cauchyDist.cdf(x), x_values);

% Testing Inverse CDF
p_values = linspace(0.01, 0.99, 100);
inv_cdf_values = arrayfun(@(p) cauchyDist.invcdf(p), p_values);

% Display results
figure;
subplot(3, 1, 1);
plot(x_values, pdf_values);
title('Cauchy Distribution PDF');
xlabel('x');
ylabel('PDF');

subplot(3, 1, 2);
plot(x_values, cdf_values);
title('Cauchy Distribution CDF');
xlabel('x');
ylabel('CDF');

subplot(3, 1, 3);
plot(p_values, inv_cdf_values);
title('Cauchy Distribution Inverse CDF');
xlabel('Probability');
ylabel('x');
