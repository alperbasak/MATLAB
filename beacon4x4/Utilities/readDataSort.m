%% Data to readData sorting with 1000ms period
k=1;
per=1000;
for j=1:length(time)
    
    [A,~]=find(datetime(actual{:,2},'InputFormat','dd.MM.yyyy HH:mm:ss')>time(j,1), 1 );
    [B,~]=find(datetime(actual{:,2},'InputFormat','dd.MM.yyyy HH:mm:ss')<time(j,2), 1,'last' );
    
    for i=actual{A,1}:per:actual{B,1}
        I=find(actual{:,1}>i & actual{:,1}<i+per);
        S=actual{I,[3 4]};
        [B,K]=sort(actual{I,4},'descend');
        readData(k).SortedData=S(K,:);
        
        
        for t=1:length(time)
            if i>=posixtime(actTime2(t,1))*1000 && i<=posixtime(actTime2(t,2))*1000
                comparement(k,2)=t;
            end
        end
        
        
        k=k+1;
        S=[];
        
    end
    
end