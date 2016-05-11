%% Search set limited to maxRSSIbeacon neighboring grids

for j=1:length(readData)
[M,MA]=max(readData(j,:));
switch MA
    case 1
        A=gridFormat(1:2,1:2);
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(A,i)));
        moder(i)=A(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 2
        A=gridFormat(1:2,3:4);
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(A,i)));
        moder(i)=A(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 3
        A=gridFormat(2:3,1:2);
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(A,i)));
        moder(i)=A(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 4
        A=gridFormat(2:3,3:4);
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(A,i)));
        moder(i)=A(MI);   
        outputGrid(j,1)=mode(moder);
        end   
end
end

%% Percentage
resultStatistics
percentages(2).out=percentage;