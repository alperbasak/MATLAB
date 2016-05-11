%% Data to readData sorting with 1000ms period
k=1;
per=1000;
for i=1449656555000:per:actual{end,1}
    I=find(actual{:,1}>i & actual{:,1}<i+per);
    S=actual{I,[5 7]};
    [B,K]=sort(actual{I,7},'descend');
    readData(k).SortedData=S(K,:);
    
    
    for t=1:length(time)
        if i>=posixtime(actTime2(t,1))*1000 && i<=posixtime(actTime2(t,2))*1000
            comparement(k,2)=t;
        end
    end
    
    
    k=k+1;
    S=[];
    
end


