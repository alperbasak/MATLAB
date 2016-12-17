clear all
load('C:\Users\alper\Documents\MATLAB\beacon4x4\Input Data\readDataSort.mat')

k=30001;
   tic
 if ~isempty(readData(k).SortedData)
        population_size=50;
        itx=50;
        
        birey(:,1)=randi(size(gridFormat,1),population_size,1);
        birey(:,2)=randi(size(gridFormat,2),population_size,1);
        
        for i=1:length(birey)
            costs(i)=fitnessFunc(birey(i,:));
        end
        aa(itx,1)=itx*0.2;
 aa(itx,2)=min(costs);
        
        birey=bbbcf(birey,costs,[size(gridFormat,1) size(gridFormat,2)],[1 1],itx);
        bbGrid=round(mean(birey));
        
        comparement(k,1)=gridFormat(bbGrid(1),bbGrid(2));
    else
        comparement(k,1)=0;
 end
 
toc
plot(aa(:,1),aa(:,2))
%  aa(:,2)=aa(:,2)-min(aa(:,2));
% plot(aa(:,1),polyval(polyfit(aa(:,1),aa(:,2),9),aa(:,1)))