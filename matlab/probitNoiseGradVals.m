function [dlnZ_dmu, dlnZ_dvs] = probitNoiseGradVals(noise, mu, varsigma, y)

% PROBITNOISEGRADVALS Gradient wrt mu and varsigma of log-likelihood for probit noise model.

% IVM



D = size(mu, 2);
c = y./sqrt(1+varsigma);
u = zeros(size(c));
for i = 1:D
  u(:, i) = c(:, i).*(mu(:, i) + noise.bias(i));
end
dlnZ_dmu = c./(sqrt(2*pi)*(exp(1/2*u.^2)-.5*erfcx(sqrt(2)/2*u)));
dlnZ_dvs = -.5*c.*u.*dlnZ_dmu;