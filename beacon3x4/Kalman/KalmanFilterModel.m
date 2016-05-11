for i=1:length(comparement)
    if comparement(i,1)~=0
        [X(i),Y(i)]=find(gridFormat==comparement(i,1));
    end
end

MAlen=38;
N=3;

Z(:,1)=round(StandardKalmanFilter(X,MAlen,N));
Z(:,2)=round(StandardKalmanFilter(Y,MAlen,N));


for i=MAlen+N-2:length(Z)
    if Z(i,1)==0
        Z(i,1)=Z(i-1,1);
    end
    if Z(i,2)==0
        Z(i,2)=Z(i-1,2);
    end
    comparement(i,1)=gridFormat(Z(i,1),Z(i,2));
end