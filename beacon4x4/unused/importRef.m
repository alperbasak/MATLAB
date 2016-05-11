ref='s5';
%% import
data=readtable(['C:\Users\AHMET.BASAK\Documents\MATLAB\beacon\Input Data\beacons_data',ref,'.csv'],'Delimiter',';');
time=readtable(['C:\Users\AHMET.BASAK\Documents\MATLAB\beacon\Input Data\',ref,'time.xlsx'],'ReadVariableNames',false);
time=datetime(time{:,:},'InputFormat','dd-MMM-yyyy HH:mm:ss');
load('C:\Users\AHMET.BASAK\Documents\MATLAB\beacon\Input Data\utils.mat');

%% filter day
data(data{:,1}<1449656555540,:)=[];

%% grid format
gridFormat=[1:4;5:8;9:12];