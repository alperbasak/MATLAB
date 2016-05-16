%load distance data
data=sortrows(readtable('C:\Users\AHMET.BASAK\Documents\MATLAB\beacon4x4\Input Data\rawData\distance.csv','Delimiter',';'));
load('C:\Users\AHMET.BASAK\Documents\MATLAB\beacon4x4\Input Data\utils.mat');

%load time data
time=readtable('C:\Users\AHMET.BASAK\Documents\MATLAB\beacon4x4\Input Data\rawData\raw_edited\beacons_datatime.xlsx','ReadVariableNames',false);
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
        refgrid(j).all =data{idx(:,j),[3 5]};
        
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

%% Data to readData sorting with 1000ms period
k=1;
per=1000;
for j=1:length(time)
    
    [A,~]=find(datetime(actual{:,2},'InputFormat','dd.MM.yyyy HH:mm:ss')>time(j,1), 1 );
    [B,~]=find(datetime(actual{:,2},'InputFormat','dd.MM.yyyy HH:mm:ss')<time(j,2), 1,'last' );
    
    for i=actual{A,1}:per:actual{B,1}
        I=find(actual{:,1}>i & actual{:,1}<i+per);
        S=actual{I,[3 5]};
        [B,K]=sort(actual{I,5},'ascend');
        readData(k).SortedData=S(K,:);
        
        
        for t=1:length(time)
            if i>=posixtime(actTime2(t,1))*1000 && i<=posixtime(actTime2(t,2))*1000
                comparement(k,2)=t;
            end
        end
        
        
        k=k+1;
        S=[];
        
    end
    
end

%%
for i=1:length(readData)
    for j=1:length(readData(i).SortedData)
        if length(readData(i).SortedData)>3
            if readData(i).SortedData(j,2)<1.5
                readData(i).SortedData(j,2)=1;
            elseif 1.5<readData(i).SortedData(j,2)<3
                readData(i).SortedData(j,2)=2;
            elseif 3<readData(i).SortedData(j,2)<4.5
                readData(i).SortedData(j,2)=3;
            else
                readData(i).SortedData(j,2)=4;
            end
        else
            readData(i).SortedData=[];
        end
    end
end

%%

for i=1:length(readData)
    if length(readData(i).SortedData)==4
        %      for j=1:length(readData(i).SortedData)
        A(1)=find(readData(i).SortedData(:,1)==16587);
        A(2)=find(readData(i).SortedData(:,1)==53870);
        A(3)=find(readData(i).SortedData(:,1)==65120);
        A(4)=find(readData(i).SortedData(:,1)==52959);
        
        switch readData(i).SortedData(A(1),2)
            case 1
                lateration1=[1 2];
            case 2
                lateration1=[1 2 3 6 7 8];
            case 3
                lateration1=1:12;
            case 4
                lateration1=1:16;
        end
        
        switch readData(i).SortedData(A(2),2)
            case 1
                lateration2=[3 4];
            case 2
                lateration2=2:7;
            case 3
                lateration2=1:12;
            case 4
                lateration2=1:16;
        end
        
        switch readData(i).SortedData(A(3),2)
            case 1
                lateration3=[13 14];
            case 2
                lateration3=10:15;
            case 3
                lateration3=5:16;
            case 4
                lateration3=1:16;
        end
        
        switch readData(i).SortedData(A(4),2)
            case 1
                lateration4=[15 16];
            case 2
                lateration4=[9 10 11 14 15 16];
            case 3
                lateration4=5:16;
            case 4
                lateration4=1:16;
        end
        
        comparement(i,1)=mode([lateration1, lateration2, lateration3, lateration4]);   
        lateration1=[];
        lateration2=[];
        lateration3=[];
        lateration4=[];
    end  
end

resultStatistics


