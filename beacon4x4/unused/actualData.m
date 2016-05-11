%% import actual data
importAct
%% divide actual data according to timestamp
for i=1:length(actTime)
idy(:,i)=actual{:,2}>actTime(i,1) & actual{:,2}<=actTime(i,2);
actGrid(i).all =actual{idy(:,i),[5 7]};
end
for i=1:length(b)
    for j=1:length(actTime)
id=actGrid(j).all(:,1)==b(i);
actGrids(j).b(i).sep=actGrid(j).all(id,:);   
    end
end
%% compare actual to training set, all-1
for k=1:length(actTime)
    for i=1:length(actTime)
        for j=1:length(b)
            if isempty(actGrids(k).b(j).sep)
            actGrids(k).b(j).sep=[0 0];
            end
grid(k).percentage(i,j)=sum(abs(refmeans(i,j)- actGrids(k).b(j).sep(:,2))<refstdevs(i,j))*100/length(actGrids(k).b(j).sep(:,2));
        end
    end
end
%% find the grid with max percentage matching
    for j=1:length(actTime)
        a=sum(grid(j).percentage,2);  
        whichGrid(1,:)=1:length(actTime);
        whichGrid(2,j)=find(a==max(a));        
    end