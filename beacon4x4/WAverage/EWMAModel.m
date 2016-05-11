for i=1:length(comparement)
    if comparementga(i,1)~=0
[X(i),Y(i)]=find(gridFormat==comparementga(i,1));
    end
end

% MAlen=16;

 Z(:,1)=round(EWMA(X,MAlen));
 Z(:,2)=round(EWMA(Y,MAlen));
 
 for i=1:length(Z)
     if Z(i,1)==0 
         Z(i,1)=Z(i-1,1);
     end
     if Z(i,2)==0
         Z(i,2)=Z(i-1,2);
     end
 comparement(i,1)=gridFormat(Z(i,1),Z(i,2));
 end