for i=1:length(comparement)
    if comparement(i,1)~=0
        [X(i),Y(i)]=find(gridFormat==comparement(i,1));
    end
end

% MAlen=38;
N=3;

Z(:,1)=round(StandardKalmanFilter(X,MAlen,N));
Z(:,2)=round(StandardKalmanFilter(Y,MAlen,N));

%% For maxwinlength
l1=find(isnan(Z(:,1))==1);
l2=find(isnan(Z(:,2))==1);
if ~isempty(find(isnan(Z(:,1))==1, 1))
Z(l1,1)=0;
end
if ~isempty(find(isnan(Z(:,2))==1, 1))
Z(l2,2)=0;
end

%%


for i=MAlen+N-2:length(Z)
    if Z(i,1)==0
        Z(i,1)=Z(i-1,1);
        %         indices1 = find(Z(i-MAlen:i,1), 1, 'last');
        %             Z(i,1)=Z(indices1,1);
    end
    if Z(i,2)==0   
        Z(i,2)=Z(i-1,2);
        %         indices2 = find(Z(i-MAlen:i,2), 1, 'last');
        %             Z(i,2)=Z(indices2,2);
        
    end
    comparement(i,1)=gridFormat(Z(i,1),Z(i,2));
end