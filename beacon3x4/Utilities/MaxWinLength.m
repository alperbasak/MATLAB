% to find max MAlength performance
for c=2:3;
    clearvars maxPercentage
    switch c
        
        %Kalman+EMWA
        case 1
            
            for MAlen=2:50
                for N=1:5
                    KalmanFilterModel
                    resultStatistics
                    maxPercentage(MAlen,N)=percen;
                end
            end
            %Lowess
        case 2
            for MAlen=2:50
                N=1;
                WMA_lowess
                resultStatistics
                maxPercentage(MAlen,N)=percen;
            end
            %EMWA
        case 3
            for MAlen=2:50
                N=1;
                EWMAModel
                resultStatistics
                maxPercentage(MAlen,N)=percen;
            end
    end
    
    [HH,H1]=max(maxPercentage);
    [H3,H2]=max(HH);
    sprintf('MAlen: %d, N: %d, Perc: %f',H1(H2),H2,H3)
end
