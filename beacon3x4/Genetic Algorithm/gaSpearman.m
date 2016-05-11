
function y=gaSpearman(k)
RefGridMean=evalin('base','RefGridMean');
readData=evalin('base',['readData(',k,').SortedData']);
b=evalin('base','b');
Nc=length(b);
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
            
            if isempty(readData)
                Vf(:,1)=b';
                Vf(:,2)=Nc;
            else
                Vf(:,1)=readData(:,1);
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
            
            corrCoef(i,j)=corr(Vf(:,2),Vs(:,2),'type','Spearman');
            y=1-corrCoef;
            Vf=[];
        end
    end