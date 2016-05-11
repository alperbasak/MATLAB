%Rs
Nc=length(b);
for k=1:length(readData)
    for i=1:size(RefGridMean,1)
        for j=1:size(RefGridMean,2)
            Vs(:,1)=RefGridMean(i,j).S(:,1);
            Vsl=length(Vs);
            Vs(:,2)=1:Vsl;
            if Vsl<Nc
                Vs(Vsl+1:Nc,1)=b(~ismember(b,Vs))';
                Vs(Vsl+1:Nc,2)=Nc;
            end
            Rs(i,j)=(1/Nc)*sum(Vs(:,2));
            
            %Rf
            
            if isempty(readData(k).SortedData)
                Vf(:,1)=b';
                Vf(:,2)=Nc;
            else
                Vf(:,1)=readData(k).SortedData(:,1);
                Vfl=length(Vf);
                Vf(:,2)=1:Vfl;
                if Vfl<Nc
                    Vf(Vfl+1:Nc,1)=b(~ismember(b,Vf))';
                    Vf(Vfl+1:Nc,2)=Nc;
                end
            end
            Rf=(1/Nc)*sum(Vf(:,2));
            
            [~,I]=sort(Vs(:,1));
            Vs=Vs(I,:);
            I=[];
            [~,I]=sort(Vf(:,1));
            Vf=Vf(I,:);
            
%             corrCoef(k).dist(i,j)=(sum((Vf(:,2)-Rf).*(Vs(:,2)-Rs(i,j))))/...
%                 sqrt(sum((Vf(:,2)-Rf).^2)*sum((Vs(:,2)-Rs(i,j)).^2));
            corrCoef(k).dist(i,j)=corr(Vf(:,2),Vs(:,2),'type','Spearman');
            Vf=[];
        end
    end
end



for k=1:length(corrCoef)
    if isempty(readData(k).SortedData)
        comparement(k,1)=0;
    else
        if length(maxRssiFilter(k).Grids)>1
            for j=1:length(maxRssiFilter(k).Grids)
                [X,Y]=find(gridFormat==maxRssiFilter(k).Grids(j));   
                spearmanCoef(k).dist(X,Y)=1-corrCoef(k).dist(X,Y); 
            end  
                spearmanCoef(k).dist(spearmanCoef(k).dist<=0)=inf;
                [v, x1] = min(spearmanCoef(k).dist);
                [val, y] = min(v);
                x = x1(y);
                comparement(k,1)=gridFormat(x,y);
            
        elseif length(maxRssiFilter(k).Grids)==1
            comparement(k,1)=maxRssiFilter(k).Grids;
        end
    end
end
