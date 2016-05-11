clear all
clc

referenceGrid

importAct
readDataSort

% CDBFiltering

% %% kalman
% for ca=1:10
% for po=1:10
% clearvars -except PO po ca b gridFormat actTime seperateMeasurements refmeans refstdevs POperc
% 
% kalmanModel
% onlyKalman
% minDifference %1    
% RSSIfilter_neigh %2
% RSSIfilter_maxRef %3
% RSSIfilter_hybrid %4
% 
% for j=1:4
% J(j)=sum(percentages(j).out(:,1))/length(actTime);
% end
% [K,KI]=max(J);
% fprintf('Best KalmanOnly matching for ca=%d and po=%d: %d\n',ca,po,KI);
% PO.kalmannly(ca).dropPeriod(po,[1:3])=[po K KI];
% POperc.kalmannly(ca).caches(po).windowLength=percentages;
% end
% end
% 
% %% WA
% 
% for ca=1:10
% for po=1:10
% clearvars -except PO po ca b gridFormat actTime seperateMeasurements refmeans refstdevs POperc
% 
% weightedAverageModel
% minDifference %1    
% RSSIfilter_neigh %2
% RSSIfilter_maxRef %3
% RSSIfilter_hybrid %4
% 
% for j=1:4
% J(j)=sum(percentages(j).out(:,1))/length(actTime);
% end
% [K,KI]=max(J);
% fprintf('Best WA matching for ca=%d and po=%d: %d\n',ca,po,KI);
% PO.weightedaverage(ca).dropPeriod(po,[1:3])=[po K KI];
% POperc.weightedaverage(ca).caches(po).windowLength=percentages;
% end
% end
% %% kalman+WA
% 
% for ca=1:10
% for po=1:10
% clearvars -except PO po ca b gridFormat actTime seperateMeasurements refmeans refstdevs POperc
% 
% kalmanModel
% weightedAverageModel
% minDifference %1    
% RSSIfilter_neigh %2
% RSSIfilter_maxRef %3
% RSSIfilter_hybrid %4
% 
% for j=1:4
% J(j)=sum(percentages(j).out(:,1))/length(actTime);
% end
% [K,KI]=max(J);
% fprintf('Best Hybrid matching for ca=%d and po=%d: %d\n',ca,po,KI);
% PO.hybrid(ca).dropPeriod(po,[1:3])=[po K KI];
% POperc.hybrid(ca).caches(po).windowLength=percentages;
% end
% end