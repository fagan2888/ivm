function k = mlpKernDiagCompute(x, kern)

% MLPKERNDIAGCOMPUTE Compute diagonal of multi-layer perceptron kernel.

% IVM

numer = sum(x.*x, 2)*kern.weightVariance + kern.biasVariance;
denom = numer+1;
k = kern.variance*asin(numer./denom);