# Statistical Distributions and Tests 
Matlab implementation of statistical functions mentioned in chapter 6.14 of Numerical Recipes

Implementation made by me, hope it helps someone that is forced to use matlab, if you are doing it willingly stop... Joke, or maybe not?

This repository contains a collection of MATLAB classes and scripts for various statistical distributions, along with corresponding tests to demonstrate their functionality. Each distribution has a dedicated class implementation and a test script to verify that the class functions as expected.

## List of Distributions

1. **Normal Distribution (Gaussian)** - The most commonly used distribution, applied in modeling natural phenomena, measurement errors, etc.
2. **Cauchy Distribution** - Characterized by "heavy tails", used in physics to describe resonances.
3. **t-Student Distribution** - Primarily used in statistics for estimating the means of populations with unknown standard deviations.
4. **Logistic Distribution** - Used in modeling odds (logit model) and in econometrics.
5. **Exponential Distribution** - Describes the time between consecutive events in Poisson processes.
6. **Weibull Distribution** - Important in reliability analysis and durability studies.
7. **Log-Normal Distribution** - Used for modeling life times and other variables that are products of many independent random variables.
8. **Chi-Squared Distribution (χ²)** - Key in goodness-of-fit tests and independence analyses.
9. **Gamma Distribution** - Used to model waiting times in queues.
10. **F Distribution** - Used in analysis of variance (ANOVA).
11. **Beta Distribution** - Useful in modeling variables limited to the interval [0,1], e.g., in decision theory.
12. **Kolmogorov-Smirnov Statistics** - Used in fit tests of distributions.
13. **Poisson Distribution** - Describes the number of events in a fixed period of time assuming the events occur independently.
14. **Binomial Distribution** - Models the number of successes in a series of Bernoulli experiments.

## Testing

Each distribution class includes a test script that validates the implementation by comparing the class outputs against expected values. These tests help ensure the accuracy and reliability of the statistical models provided in this repository.

## Usage

To use any of the distribution classes, simply include the class file in your MATLAB environment and create an instance of the class using the parameters specific to your data or study needs. You can then call methods like `pdf`, `cdf`, and `invcdf` to compute the probability density function, cumulative distribution function, and the inverse cumulative distribution function, respectively.

Example of using the Normal Distribution:
```matlab
% Create an instance of the Normal Distribution
normalDist = Normaldist(0, 1); % Mean = 0, Std Dev = 1

% Compute PDF value at x = 1
pdfValue = normalDist.pdf(1);

% Display the result
disp(['PDF at x = 1: ', num2str(pdfValue)]);
```
## Contributing

Contributions to this repository are welcome. Feel free to fork the repo, make improvements, and submit pull requests.
License

This project is open-sourced under the MIT license

## Special thanks
Everything here is based on code written in c from book Numerical Recipes cited below

@book{10.5555/1403886,
author = {Press, William H. and Teukolsky, Saul A. and Vetterling, William T. and Flannery, Brian P.},
title = {Numerical Recipes 3rd Edition: The Art of Scientific Computing},
year = {2007},
isbn = {0521880688},
publisher = {Cambridge University Press},
address = {USA},
edition = {3},
abstract = {Co-authored by four leading scientists from academia and industry, Numerical Recipes Third Edition starts with basic mathematics and computer science and proceeds to complete, working routines. Widely recognized as the most comprehensive, accessible and practical basis for scientific computing, this new edition incorporates more than 400 Numerical Recipes routines, many of them new or upgraded. The executable C++ code, now printed in color for easy reading, adopts an object-oriented style particularly suited to scientific applications. The whole book is presented in the informal, easy-to-read style that made earlier editions so popular. Please visit www.nr.com or www.cambridge.org/us/numericalrecipes for more details. New key features: 2 new chapters, 25 new sections, 25\% longer than Second Edition Thorough upgrades throughout the text Over 100 completely new routines and upgrades of many more. New Classification and Inference chapter, including Gaussian mixture models, HMMs, hierarchical clustering, Support Vector MachinesNew Computational Geometry chapter covers KD trees, quad- and octrees, Delaunay triangulation, and algorithms for lines, polygons, triangles, and spheres New sections include interior point methods for linear programming, Monte Carlo Markov Chains, spectral and pseudospectral methods for PDEs, and many new statistical distributions An expanded treatment of ODEs with completely new routines Plus comprehensive coverage of linear algebra, interpolation, special functions, random numbers, nonlinear sets of equations, optimization, eigensystems, Fourier methods and wavelets, statistical tests, ODEs and PDEs, integral equations, and inverse theory And much, much more! Visit the authors' web site for information about electronic subscriptions www.nr.com/aboutNR3book.html}
}
