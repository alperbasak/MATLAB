for k=1:length(readData)
    if ~isempty(readData(k).SortedData)
        %% Start with the default options
        options = gaoptimset;
        %% Modify options setting
        options = gaoptimset(options,'Display', 'off');
       %  options = gaoptimset(options,'PlotFcns', @plotPop );
        [x,fval,exitflag,output,population,score] = ...
            ga(@fitnessFunc,2,[],[],[],[],[1 1],[size(gridFormat,1) size(gridFormat,2)],[],[],options);
        R1=round(x(1));
        R2=round(x(2));
        if R1==0
            R1=1;
        end
        if R2==0
            R2=1;
        end
        comparement(k,1)=gridFormat(R1,R2);
           
    else
        comparement(k,1)=0;
%         comparement(k,1)=comparement(k-1,1);
    end
    strr='%d of %d';
    sprintf(strr,k,length(readData))
end