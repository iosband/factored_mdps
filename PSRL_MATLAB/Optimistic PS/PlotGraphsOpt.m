%% Here we will analyse the data, outputting the average regret and graphs
aveRewardPSRL = sum(rPSRL(:))/nIters;
aveRewardPSRLOpt = sum(rPSRLOpt(:))/nIters;

meanRegPSRL = mean(rhoList)*T - aveRewardPSRL;
meanRegPSRLOpt = mean(rhoList)*T - aveRewardPSRLOpt;

disp('Average Regret of PSRL: ')
meanRegPSRL
disp('Average Regret of PSRLOpt: ')
meanRegPSRLOpt


%-----------------------------------------------------------------------
% Now we are going to look at the cumulative regret over time.
regPSRL  = cumsum(repmat(rhoList,T,1)) - cumsum(rPSRL);
regPSRLOpt = cumsum(repmat(rhoList,T,1)) - cumsum(rPSRLOpt);

worstPSRL = max(regPSRL,[],2);
avePSRL = mean(regPSRL,2);
bestPSRL = min(regPSRL,[],2);

worstPSRLOpt = max(regPSRLOpt,[],2);
avePSRLOpt = mean(regPSRLOpt,2);
bestPSRLOpt = min(regPSRLOpt,[],2);

%------------------------------------------------------------------------
% You need to show PSRL on a shorter time frame
tPSRL = T;

set(0,'defaultAxesFontName', 'arial');
set(0,'defaultTextFontName', 'arial');
set(gca,'FontSize',14) ;

%PSRL alone, min
figure
hold on
plot(avePSRL(1:tPSRL),'r','linewidth',1.5)
plot(bestPSRL(1:tPSRL),'r-.')
plot(worstPSRL(1:tPSRL),'r-.')
leg = legend('PSRL Regret (ave)','PSRL Regret (worst)', 'PSRL Regret (best)',...
    'Location','NorthWest');
set(leg,'FontSize',16)
xlabel('Time elapsed' , 'FontSize',20)
ylabel('Regret', 'FontSize',20)

%PSRLOpt alone
axis([0 10000 -100 1000])
figure
hold on
plot(avePSRLOpt,'b','linewidth',1.5)
plot(bestPSRLOpt,'b-.')
plot(worstPSRLOpt,'b-.')
legend('PSRLOpt Regret (ave)','PSRLOpt Regret (worst)', 'PSRLOpt Regret (best)',...
    'Location','NorthWest')
xlabel('Time elapsed')
ylabel('Regret')

%PSRLOpt and PSRL
figure
hold on
plot(avePSRL,'r','linewidth',1.5)
plot(bestPSRL,'r-.')
plot(worstPSRL,'r-.')
plot(avePSRLOpt,'b','linewidth',1.5)
plot(bestPSRLOpt,'b-.')
plot(worstPSRLOpt,'b-.')
legend('PSRL Regret (ave)','PSRL Regret (worst)', 'PSRL Regret (best)', ...
    'PSRLOpt Regret (ave)','PSRLOpt Regret (worst)', 'PSRLOpt Regret (best)', ...
    'Location','NorthWest')
xlabel('Time elapsed')
ylabel('Regret')

% Every single experiment together
figure
hold on
for i = 1:(nIters),
    plot(regPSRL(:,i),'r-.','linewidth',0.1)
    plot(regPSRLOpt(:,i),'b-.','linewidth',0.1)
end

leg = legend('PSRL Regret', 'PSRLOpt Regret','Location','northwest');
set(leg,'FontSize',16)
xlabel('Time elapsed' , 'FontSize',20)
ylabel('Regret', 'FontSize',20)