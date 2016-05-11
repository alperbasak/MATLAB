%% Kalman model ('po' second window)

for k=1:length(b)
    clear s
    % Do not specify an initial state:
    s.x = nan;
    s.P = nan;
    s.A = 1;
    % Define a process noise (stdev):
    s.Q = mean(refstdevs(:,k))^2; % variance, hence stdev^2
    s.H = 1;
    % Define a measurement error (stdev):
    s.R = mean(refstdevs(:,k))^2; % variance, hence stdev^2
    % Do not define any system input (control) functions:
    s.B = 0;
    s.u = 0;
    
    for i=1:height(seperateMeasurements(k).beacon)-1
        s(end).z=seperateMeasurements(k).beacon{i,3};
        if datenum(seperateMeasurements(k).beacon{i+1,1})<datenum(seperateMeasurements(k).beacon{i,1})+seconds(po)
            s(end+1)=kalmanf(s(end));
        else
            s(i).x=s(1).x;
            s(i).P=s(1).P;
            s(end+1)=kalmanf(s(end));
        end
        
    end
    
    for j=2:length(s)
        kalmanOutput(k).b(j-1,1)=seperateMeasurements(k).beacon{j-1,1};
        kalmanOutput(k).b{j-1,2}=s(j).x;  
    end
    
end
    