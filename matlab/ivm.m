function model = ivm(X, y, kernelType, noiseType, selectionCriterion, d)

% IVM Initialise an IVM model.

% IVM
% Version 0.1

model.d = d;

model.X = X;
model.y = y;

model.m = [];
model.beta = [];

model.nu = zeros(size(y));
model.g = zeros(size(y));

model.kern = kernel(X, kernelType);

model.varSigma = zeros(size(y));
model.mu = zeros(size(y));

model.I = [];
model.J = [];

if strcmp(noiseType, 'gaussian')
  model.Sigma.M = [];
  model.Sigma.L = [];
else
  for i = 1:size(y, 2)
    model.Sigma(i).M = [];
    model.Sigma(i).L = [];
  end
end
model.noise.type = noiseType;
model.selectionCriterion = selectionCriterion;
model = noiseParamInit(model);

switch selectionCriterion
 case 'none'
  numData = size(X, 1);
  model.I = (1:numData);
 otherwise
  
end