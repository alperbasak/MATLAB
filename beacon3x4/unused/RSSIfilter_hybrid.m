%% Search set limited to maxRSSIbeacon neighboring grids + maxReference

[N,NA]=max(refmeans,[],2);
for j=1:length(readData)
[M,MA]=max(readData(j,:));
A=find(NA==MA);
switch MA
    case 1
        B=gridFormat(1:2,1:2);
        C=unique([reshape(B,[],1);A]);
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(C,i)));
        moder(i)=C(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 2
        B=gridFormat(1:2,3:4);
        C=unique([reshape(B,[],1);A]);
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(C,i)));
        moder(i)=C(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 3
        B=gridFormat(2:3,1:2);
        C=unique([reshape(B,[],1);A]);
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(C,i)));
        moder(i)=C(MI);   
        outputGrid(j,1)=mode(moder);
        end
    case 4
        B=gridFormat(2:3,3:4);
        C=unique([reshape(B,[],1);A]);
        for i=1:length(b)
        [M,MI]=min(abs(readData(j,i)-refmeans(C,i)));
        moder(i)=C(MI);   
        outputGrid(j,1)=mode(moder);
        end   
end
end

%% Percentage
resultStatistics
percentages(4).out=percentage;