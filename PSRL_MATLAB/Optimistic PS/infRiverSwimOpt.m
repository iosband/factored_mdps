%% Infinite RiverSwim transition model
%Canonical reinforcement learning problem, requires planning and
%exploration to perform well. See KL-UCRL Figure 1 for the example.


% Testing this out for sending to Remi Munos
addpath(genpath('~/Academics/Stanford/Second Year/ PSRL MATLAB/'))
clear

disp('Running the experiments for the RiverSwim MDP without episodic reset')
disp('We compare performance of PSRLOpt to PSRL with exponential episodes (EXPOSE)')

SetRiverSwim
SetPriors
SetExperiment
RunInfOpt
PlotGraphsOpt