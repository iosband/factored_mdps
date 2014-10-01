% Here we have the specification of our prior and also the delta for UCRL2.

% UCRL2 Parameters
delta = 0.05;

% Posterior sampling prior
mu0 = 1 * ones(S,A);
nMu0 = 1 * ones(S,A);
tau0 = 1 * ones(S,A);
nTau0 = 1 * ones(S,A);
alpha0 = 1/S * ones(S,S,A);

%Computational ideas
epsilon = 0.1;
maxIter = 1000;

% For optimistic sampling we also set the nSample
nSample = 10;