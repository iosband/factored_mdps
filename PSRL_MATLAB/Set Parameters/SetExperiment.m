% Here we set up the simulation parameters

T = 10000; % Total time for experiment
tau = 20; % Episode length (where appropriate)
M = T/tau; % Number of episodes (where appropriate)

nIters = 20;

%rand('seed',0) % This is for reproducibility

%cd '~/Academics/Stanford/Second Year/PSRL_MATLAB/'
%addpath(genpath('~/Academics/Stanford/Second Year/PSRL_MATLAB/'))