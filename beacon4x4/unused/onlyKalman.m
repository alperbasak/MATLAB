%% only Kalman 

for k=1:length(b)
    j=1;
    for g=1:length(actTime)
        for i=actTime(g,1):seconds(ca):actTime(g,2)
            AAA=kalmanOutput(k).b(:,1)>=i-seconds(po) & kalmanOutput(k).b(:,1)<i;
            BBB=kalmanOutput(k).b(AAA,2);
            if isempty(BBB)
                onlyKalmanM(k).outputRSSI{j,1}=0;
            else
                onlyKalmanM(k).outputRSSI{j,1}=BBB{end};
            end
            onlyKalmanM(k).outputRSSI{j,2}=datestr(i);
            outputGrid(j,2)=g;
            j=j+1;
        end
    end
end

for k=1:length(b)
    for j=1:length(onlyKalmanM(k).outputRSSI)
        if onlyKalmanM(k).outputRSSI{j,1}==0
            readData(j,k)=NaN;
        else
            readData(j,k)=onlyKalmanM(k).outputRSSI{j,1};
        end
    end
end