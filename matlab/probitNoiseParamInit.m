function model = probitNoiseParamInit(model)

% PROBITNOISEPARAMINIT probistic classification model's parameter initialisation.

% IVM

model.u = zeros(size(model.y));
model.c = zeros(size(model.y));
nClass1 = sum(model.y==1, 1);
nClass2 = sum(model.y==-1, 1);
model.noise.bias = invCumGaussian(nClass1./(nClass2+nClass1));