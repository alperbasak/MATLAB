%% after CDB filtering sum of abs difference
for i=1:length(maxRssiFilter)
    if length(maxRssiFilter(i).Grids)>1
        for j=1:length(maxRssiFilter(i).Grids)
            [X,Y]=find(gridFormat==maxRssiFilter(i).Grids(j));
            for k=1:length(readData(i).SortedData(:,1))
                T(k)=abs(readData(i).SortedData(k,2)-RefGridMean(X,Y).S(k,2));
            end
            SumT(j)=sum(T);
        end
        [~,U]=min(SumT);
        comparement(i,1)=maxRssiFilter(i).Grids(U);
        SumT=[];
    elseif length(maxRssiFilter(i).Grids)==1
        comparement(i,1)=maxRssiFilter(i).Grids;
    end  
end

