%% Run the finite horizon experiment

% Set up the holders for regret variables
rPSRLOpt = zeros(T,nIters);
rPSRL = zeros(T,nIters);
trueVal = zeros(nIters,S);
rhoList = zeros(1,nIters);

% This loop should be a parfor, but you need the parallel toolbox.

for (i=1:nIters),
    disp('Simulating random MDP: ')
    disp(i)
    
    if(randMDP==1),
        % Creating the true random MDP
        pTrue = sampleDirichletMat(alpha0);
        [rTrue, varSample] = sampleNormalGammaMat(mu0, nMu0, tau0,nTau0,0,0,0);
    end
    s1 = 1;
    
    % Work out optimal values
    [value policy] = dpValueIteration(pTrue,rTrue,tau);
    trueVal(i,:) = value';
    
    % Running PSRLOptFinite and PSRL on the MDP
    [rPSRLOpt(:,i) states actions values pols] = ...
    PSRLOpt(M, tau, nSample, pTrue, rTrue, s1, mu0, nMu0, tau0, nTau0, alpha0);

    [rPSRL(:,i) states actions values pols vTot] = ...
    PSRL(M, tau, pTrue, rTrue, s1, mu0, nMu0, tau0, nTau0, alpha0);
    
end

rhoList = trueVal(:,s1)'/tau;