%% divide ref grids according to timestamp
for j=1:length(time)
    idx(:,j)=data2time>time(j,1) & data2time<=time(j,2);
    refgrid(j).all =data{idx(:,j),[3 4]};
end
%% plot avg mean&std according to reference set for X*Y grid layout
for i=1:length(b)
    for j=1:length(time)
        id=refgrid(j).all(:,1)==b(i);
        refgrids(j).b(i).sep=refgrid(j).all(id,:);
        refmeans(j,i)=mean(refgrids(j).b(i).sep(:,2));
        refstdevs(j,i)=std(refgrids(j).b(i).sep(:,2));
    end
    
    refstnd(4,:,i)=refstdevs(1:4,i);
    refstnd(3,:,i)=flip(refstdevs(5:8,i));
    refstnd(2,:,i)=refstdevs(9:12,i);
    refstnd(1,:,i)=flip(refstdevs(13:16,i));
    
    B(4,:,i)=refmeans(1:4,i);
    B(3,:,i)=flip(refmeans(5:8,i));
    B(2,:,i)=refmeans(9:12,i);
    B(1,:,i)=flip(refmeans(13:16,i));
    
    figure(1)
    hold on
    [Xq,Yq] = meshgrid(1:0.1:4);
    Vq=interp2(B(:,:,i),Xq,Yq,'cubic');
    surf(Xq,Yq,Vq)
    
%     surf(B(:,:,i),'EdgeColor',color{i},'FaceColor',color{i},'FaceAlpha','0.2','EdgeAlpha','0.2'); hold on;
    for j=1:4
        plot3(i*ones(1,20),j*ones(1,20),-90:-71);
    end
%     figure(2)
%     surf(refstnd(:,:,i),'EdgeColor',color{i},'FaceColor',color{i},'FaceAlpha','0.2','EdgeAlpha','0.2');hold on;
%     for j=1:4
%         plot3(i*ones(1,10),j*ones(1,10),0:9);
%     end
end
% hold off
