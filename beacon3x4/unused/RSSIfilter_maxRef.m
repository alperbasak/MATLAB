%% Search set limited to maxReference compared with maxRSSIbeacon

[N,NA]=max(refmeans,[],2);
for j=1:length(readData)
[M,MA]=max(readData(j,:));
A=find(NA==MA);
switch MA
    case 1
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(A,i)));
        moder(i)=A(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 2
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(A,i)));
        moder(i)=A(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 3
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(A,i)));
        moder(i)=A(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 4
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(A,i)));
        moder(i)=A(MI);   
        outputGrid(j,1)=mode(moder);
        end   
end
end

%% Percentage
resultStatistics
percentages(3).out=percentage;