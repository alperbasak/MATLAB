%k=' ';
function y=gaEuclidean(k)
RefGridMean=evalin('base','RefGridMean');
readData=evalin('base',['readData(',k,').SortedData']);
    for i=1:size(RefGridMean,1)
        for j=1:size(RefGridMean,2)
            for m=1:length(readData(:,1))
                idx= RefGridMean(i,j).S==readData(m,1);
                T(m)=(RefGridMean(i,j).S(idx,2)-readData(m,2))^2;
            end
            y(i,j)=sqrt(sum(T));
            T=[];
        end
    end
end

