%% divide ref grids according to timestamp
for i=1:length(time)
idx(:,i)=data{:,2}>time(i,1) & data{:,2}<=time(i,2);
refgrid(i).all =data{idx(:,i),[5 7]};
end
%% plot avg mean&std according to reference set for X*Y grid layout  
for i=1:length(b)
    for j=1:length(time)
id=refgrid(j).all(:,1)==b(i);
refgrids(j).b(i).sep=refgrid(j).all(id,:);
refmeans(j,i)=mean(refgrids(j).b(i).sep(:,2));
refstdevs(j,i)=std(refgrids(j).b(i).sep(:,2));
    end
    refstnd(:,:,i)=rot90(reshape(refstdevs(:,i),[4,3]));
    B(:,:,i)=rot90(reshape(refmeans(:,i),[4,3]));
    figure(1)
    surf(B(:,:,i),'EdgeColor',color{i},'FaceColor',color{i},'FaceAlpha','0.2','EdgeAlpha','0.2'); hold on;
    for j=1:3
       plot3(i*ones(1,40),j*ones(1,40),-110:-71);
    end
    figure(2)
    surf(refstnd(:,:,i),'EdgeColor',color{i},'FaceColor',color{i},'FaceAlpha','0.2','EdgeAlpha','0.2');hold on;
    for j=1:3
       plot3(i*ones(1,10),j*ones(1,10),0:9);
    end
end
% hold off
