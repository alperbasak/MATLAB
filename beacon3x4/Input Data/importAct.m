act='s5';
%% import
actual=readtable(['C:\Users\AHMET.BASAK\Documents\MATLAB\beacon\Input Data\beacons_data',act,'.csv'],'Delimiter',';');
actTime=readtable(['C:\Users\AHMET.BASAK\Documents\MATLAB\beacon\Input Data\',act,'time.xlsx'],'ReadVariableNames',false);
actTime=datetime(actTime{:,:},'InputFormat','dd-MMM-yyyy HH:mm:ss');
actTime2=actTime-hours(2);
load('C:\Users\AHMET.BASAK\Documents\MATLAB\beacon\Input Data\utils.mat');

%% filter day
actual(actual{:,1}<1449656555540,:)=[];

