function [k, innerProd, arg, denom, numer] = mlpKernCompute(x, kern, x2)

% MLPKERNCOMPUTE Compute the multi-layer perceptron kernel given the parameters and X.

% IVM

if nargin < 3
  innerProd = x*x';
  numer = innerProd*kern.weightVariance + kern.biasVariance;
  vec = diag(numer) + 1;
  denom = sqrt(vec*vec');
  arg = numer./denom;
  k = kern.variance*asin(numer./denom);
else
  innerProd = x*x2';  
  numer = innerProd*kern.weightVariance + kern.biasVariance;
  vec1 = sum(x.*x, 2)*kern.weightVariance + kern.biasVariance + 1;
  vec2 = sum(x2.*x2, 2)*kern.weightVariance + kern.biasVariance + 1;
  denom = sqrt(vec1*vec2');
  arg = numer./denom;
  k = kern.variance*asin(numer./denom);
end