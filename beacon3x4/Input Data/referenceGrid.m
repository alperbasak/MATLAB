%% Create Reference value
ref='s5';
%% import
data=readtable(['C:\Users\AHMET.BASAK\Documents\MATLAB\beacon3x4\Input Data\beacons_data',ref,'.csv'],'Delimiter',';');
time=readtable(['C:\Users\AHMET.BASAK\Documents\MATLAB\beacon3x4\Input Data\',ref,'time.xlsx'],'ReadVariableNames',false);
time=datetime(time{:,:},'InputFormat','dd-MMM-yyyy HH:mm:ss');
load('C:\Users\AHMET.BASAK\Documents\MATLAB\beacon3x4\Input Data\utils.mat');

%% filter day
data(data{:,1}<1449656555540,:)=[];

%% grid format
gridFormat=[1:4;5:8;9:12];

%% divide ref grids according to timestamp
for i=1:length(b)
    for j=1:length(time)
        idx(:,j)=data{:,2}>time(j,1) & data{:,2}<=time(j,2);
        refgrid(j).all =data{idx(:,j),[5 7]};
        
        idy=refgrid(j).all(:,1)==b(i);
        refgrids(j).b(i).sep=refgrid(j).all(idy,:);
        refmeans(j,i)=mean(refgrids(j).b(i).sep(:,2));
        refstdevs(j,i)=std(refgrids(j).b(i).sep(:,2));
    end
end
%% refmeans(dbl)->MeanGrids(struct) conversion
for j=1:size(gridFormat,1)
    for k=1:size(gridFormat,2)
        for i=1:length(b)
                RefGridMean(j,k).S(i,:)=[b(i) refmeans(gridFormat(j,k),i)];
        end
            RefGridMean(j,k).S=RefGridMean(j,k).S(~isnan(RefGridMean(j,k).S(:,2)),:);
            [~,I]=sort(RefGridMean(j,k).S(:,2),'descend');
            RefGridMean(j,k).S=RefGridMean(j,k).S(I,:);
    end
end
%% refstd(dbl)->StdGrids(struct) conversion
for j=1:size(gridFormat,1)
    for k=1:size(gridFormat,2)
        for i=1:length(b)
                RefGridStd(j,k).S(i,:)=[b(i) refstdevs(gridFormat(j,k),i)];
        end
            RefGridStd(j,k).S=RefGridStd(j,k).S(~isnan(RefGridStd(j,k).S(:,2)),:);
            [~,I]=sort(RefGridStd(j,k).S(:,2),'descend');
            RefGridStd(j,k).S=RefGridStd(j,k).S(I,:);
    end
end
