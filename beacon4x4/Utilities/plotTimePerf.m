   clear all
load('C:\Users\alper\Documents\MATLAB\beacon4x4\Input Data\readDataSort.mat')
k=30001;
for i=1:33
if ~isempty(readData(k).SortedData)
        %% Start with the default options
        options = gaoptimset;
        %% Modify options setting
        options = gaoptimset(options,'TimeLimit', i*0.2);
        options = gaoptimset(options,'Display', 'off');
         options = gaoptimset(options,'PlotFcns', @plotPop );
        [x,fval,exitflag,output,population,score] = ...
            ga(@fitnessFunc,2,[],[],[],[],[1 1],[size(gridFormat,1) size(gridFormat,2)],[],[],options);
        R1=round(x(1));
        R2=round(x(2));
        if R1==0
            R1=1;
        end
        if R2==0
            R2=1;
        end
        comparement(k,1)=gridFormat(R1,R2);
           
    else
        comparement(k,1)=0;
%         comparement(k,1)=comparement(k-1,1);
end
popus(i,1)=i*0.02;
popus(i,2)=mean(score);
    
end
popus(:,2)=popus(:,2)-min(popus(:,2));
plot(popus(:,1),popus(:,2))
