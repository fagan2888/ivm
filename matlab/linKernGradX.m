function gX = linKernGradX(X, kern, X2)

% LINKERNGRADX Gradient of linear kernel with respect to a point X.

% IVM

gX = kern.variance.*X2;