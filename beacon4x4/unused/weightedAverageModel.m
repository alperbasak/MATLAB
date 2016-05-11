%% Weighted Avg ('po' second window w/ 5 second read period)

for k=1:length(b)
    j=1;
    for g=1:length(actTime)
        for i=actTime(g,1):seconds(ca):actTime(g,2)
            if exist('kalmanOutput')
                AAA=kalmanOutput(k).b(:,1)>=i-seconds(po) & kalmanOutput(k).b(:,1)<i;
                BBB=cell2mat(kalmanOutput(k).b(AAA,2));
            else
                AAA=seperateMeasurements(k).beacon{:,1}>=i-seconds(po) & seperateMeasurements(k).beacon{:,1}<i;
                BBB=seperateMeasurements(k).beacon{AAA,3};
                BBB=BBB(isfinite(BBB(:,1)));
            end   
            w=1:length(BBB);
            if isempty(w)
                weightedAverage(k).outputRSSI{j,1}=0; % NAN yap aþaðýyý sil
            else
                weightedAverage(k).outputRSSI{j,1}=sum(w'.*BBB)./sum(w);
            end
            weightedAverage(k).outputRSSI{j,2}=datestr(i);
            outputGrid(j,2)=g;
            j=j+1;
        end
    end
end

for i=1:length(b)
    for j=1:length(weightedAverage(i).outputRSSI)
        if weightedAverage(i).outputRSSI{j,1}==0
            readData(j,i)=NaN;
        else
            readData(j,i)=weightedAverage(i).outputRSSI{j,1};
        end
    end
end