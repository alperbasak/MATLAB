for k=1:length(readData)
    if ~isempty(readData(k).SortedData)
        population_size=50;
        itx=50;
        
        birey(:,1)=randi(size(gridFormat,1),population_size,1);
        birey(:,2)=randi(size(gridFormat,2),population_size,1);
        
        for i=1:length(birey)
            costs(i)=fitnessFunc(birey(i,:));
        end
        
        birey=bbbcf(birey,costs,[size(gridFormat,1) size(gridFormat,2)],[1 1],itx);
        bbGrid=round(mean(birey));
        
        comparement(k,1)=gridFormat(bbGrid(1),bbGrid(2));
    else
        comparement(k,1)=0;
    end
end