%% Run the infinite horizon experiment

% Set up the holders for regret variables
rPSRLOpt = zeros(T,nIters);
rPSRL = zeros(T,nIters);
trueVal = zeros(nIters,S);
rhoList = zeros(1,nIters);

% This loop should be a parfor, but you need the parallel toolbox.

for i = 1:nIters,
    disp('Starting iteration: ')
    disp(i)
    % Perform regret analysis for UCRL2 and EXPOSE
    
    if(randMDP==1),
        % Creating the true random MDP
        pTrue = sampleDirichletMat(alpha0);
        [rTrue, varSample] = sampleNormalGammaMat(mu0, nMu0, tau0,nTau0,0,0,0);
    end
    
    s1 = 1;
    
    % Work out optimal performance
    [value policy flag rho] = ...
    valueIteration( pTrue, rTrue, epsilon, maxIter);
    rhoList(i) = rho;
    
    [rPSRLOpt(:,i) states actions values pols flags] = ...
        EXPOSEOpt(T, nSample, pTrue, rTrue, s1, mu0, nMu0, tau0, nTau0, alpha0, epsilon, maxIter);
    [rPSRL(:,i) states actions values pols flags vTot] = ...
        EXPOSE(T, pTrue, rTrue, s1, mu0, nMu0, tau0, nTau0, alpha0, epsilon, maxIter);
end