function y = noiseOut(noise, mu, varsigma);

% NOISEOUT Give the output of the noise model given the mean and variance.

% IVM

y = feval([noise.type 'NoiseOut'], noise, mu, varsigma);