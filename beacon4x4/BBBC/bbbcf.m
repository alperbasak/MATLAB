%BBBCF verilen bireyler matrisini big-bang big-crunch yontemi kurallarina gore bir iterasyon oteler.
%Yeni olusan sayilari eskilerinin uzerine yazar.
%Iterasyon ilerledice noktalari daha yakin uzayda arar.
%
%Kullanimi: [birey]=bbbcn(birey,costs,maxval,minval)
%Burada birey populasyon boyu X parametre sayilik, 
% costs ise populasyon boyunda bir vektordur.
%Bilesenleri reel sayilardir. Bir sinirlama yapilmamistir.  
%
%
%REV 1.0		9.10.2007

function birey=bbbcf(birey,costs,maxval,minval,itx)

% itx iterasyon sayisi
%ILK DEGERLER
smoothf = 10;                    %Kac iterasyon sonra patlama etkinliginin yariya dusecegini belirtir)


if nargin == 0
   error('Parametre girilmemis ya da eksik parametre!')
end

m=size(birey,1);				%Populasyon boyu
n=size(birey,2);				%Parametre sayisi


                                % Odaklama islemi tum secenekleri en iyi tek bir noktaya (orta nokta) indirger.
[mincost, minbirey] = min(costs);
ortanokta = birey(minbirey,:);

                                % Dagitim islemi (ortanokta etrafinda normal dagilmis yeni noktalar turetir)
for birey_no=1:m-1,             %m'yinci birey orta nokta olarak eklenecek (elitizm).
   for parametre_no=1:n,
       birey(birey_no,parametre_no)=ortanokta(parametre_no)+(maxval(parametre_no)-minval(parametre_no))*0.5*randn(1)/(1+itx/smoothf);   %patlama orta nokta etrafinda maxval ve minval ile sinirli olarak yapilir
       if birey(birey_no,parametre_no)<minval(parametre_no)       %bireyopt de ayni noktalrin gozukme sebebi bu sinirlamadir.
           birey(birey_no,parametre_no)=minval(parametre_no);
       end
       if birey(birey_no,parametre_no)>maxval(parametre_no)
           birey(birey_no,parametre_no)=maxval(parametre_no);
       end
   end
end

birey(m,:)= ortanokta;          %elitist yaklasim. En iyi nokta sonuncu olarak ilistirilir.


