%%compare momentary data with reference mean and std values to find the
%%grid

j=1;
% simulation=table({'Timestamp' '31060' '31061' '31477' '31047'});
for g=1:length(actTime)
for i=actTime(g,1):seconds(1):actTime(g,2)
simulation(j,1)=datenum(i);

idx(:,j)=actual{:,2}==i;
t=actual(idx(:,j),[2 5 7]);

for u=1:height(t)
for ii=1:length(b)
if t{u,2}==b(ii)
simulation(j,ii+1)=t{u,3};
%    instant(g).simulation(j,ii+1)=max(actual{idx(:,j),7});
end
end
end
j=j+1;
end
end

%% if no data is received in one second period, delete the row
% idy=sum(simulation(:,2:5),2)==0;
% simulation(idy,:)=[];

%%
    
%beacon1in rssini al beacon1in bütün mean/stdleriyle karþýlaþtýr,
%hangilerinin rangeine giriyor not et, aynýsýný bütün beaconlar için yap 
% beacon1 için 1,2,7 beacon2 için 1,3,5 beacon3 için yok ([0]) filan
%max occuranceý grid olarak dön
%birden fazla çýkarsa onlarýn orta noktasýný dön
%bir array içinde arka arkaya yaz gridleri b1, b2 filan diye ayýrmaya gerek
%yok, her bulduðunu arraya ekle, en son maxcount yap gridimiz hayrolsun