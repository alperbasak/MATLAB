%% Save max minor of each RefGrids
k=1;
D=3;
for i=1:size(RefGridMean,1)
    for j=1:size(RefGridMean,2)
        for l=1:D;
            eachGridMax(l,k)=RefGridMean(i,j).S(l,1);
        end
        k=k+1;
    end
end
%% CDB filtering
for i=1:length(readData)
    % 1st Filter (MaxRSS)
    if ~isempty(readData(i).SortedData)
        maxRssiFilter(i).Grids=find(eachGridMax(1,:)==readData(i).SortedData(1));
    else
        maxRssiFilter(i).Grids=readData(i).SortedData;
    end
    
    % 2nd Filter (Ordering)
    if length(readData(i).SortedData)>=2
        C2=maxRssiFilter(i).Grids(ismember(maxRssiFilter(i).Grids,find(eachGridMax(2,:)==readData(i).SortedData(2))));
        if any(C2)
            maxRssiFilter(i).Grids=C2;
            if length(readData(i).SortedData)>=3
                C3=maxRssiFilter(i).Grids(ismember(maxRssiFilter(i).Grids,find(eachGridMax(3,:)==readData(i).SortedData(3))));
                if any(C3)
                    maxRssiFilter(i).Grids=C3;
                end
            end
        end
    end
end
