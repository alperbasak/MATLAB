for MAlen=1:120
        disp(MAlen)
        load('C:\Users\AHMET.BASAK\Documents\MATLAB\beacon4x4\Input Data\BBBCEucwoKalman.mat');
        KalmanFilterModel
        resultStatistics
        maxPercentage(MAlen,N)=percen;
end
plot(maxPercentage(:,3))

for i=1:119
a(i)=((maxPercentage(i+1,3)-maxPercentage(i,3))/i);
end
[A,B]=min(a(20:end));
disp(B+19)
