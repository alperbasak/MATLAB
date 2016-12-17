% import data
data=sortrows(readtable('C:\Users\alper\Documents\MATLAB\beacon4x4\Input Data\rawData\raw_edited\data_edited.csv','Delimiter',';'));
load('C:\Users\alper\Documents\MATLAB\beacon4x4\Input Data\utils.mat');

%load time data
time=readtable('C:\Users\alper\Documents\MATLAB\beacon4x4\Input Data\rawData\raw_edited\beacons_datatime.xlsx','ReadVariableNames',false);
time=datetime(time{:,:},'InputFormat','dd.MM.yyyy HH:mm:ss');

% %seperate actual and reference data (random)
% rndIDx=sort(randperm(height(data),round(height(data)*0.1)));
% rowrange=[];
% for i=1:length(rndIDx)
% range=rndIDx(i):rndIDx(i)+10;
% rowrange=[rowrange,range];
% end
% rndIDx=unique(rowrange);
% [~,idx]=find(rndIDx>height(data));
% rndIDx(idx)=[];
%
% actual=data(rndIDx,:);
% data(rndIDx,:)=[];

%seperate actual and reference data (period)
actual=[];
for i=1:length(time)
    [~,A]=min(abs(datetime(data{:,2},'InputFormat','dd.MM.yyyy HH:mm:ss')-time(i,2)+hours(1)));
    [~,B]=min(abs(datetime(data{:,2},'InputFormat','dd.MM.yyyy HH:mm:ss')-time(i,2)));    
    actual=[actual;data(A:B,:)];
    data(A:B,:)=[];
end

actual=sortrows(actual);
data2time=datetime(data{:,2},'InputFormat','dd.MM.yyyy HH:mm:ss');

%GMT and DST
actTime2=time-hours(2);
actTime2(14,:)=actTime2(14,:)-hours(1);

%% grid format
gridFormat=[16:-1:13;9:12;8:-1:5;1:4];

%% divide ref grids according to timestamp
clear idx
for i=1:length(b)
    for j=1:length(time)
        idx(:,j)=data2time>time(j,1) & data2time<=time(j,2);
        refgrid(j).all =data{idx(:,j),[3 4]};
        
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