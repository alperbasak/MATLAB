function state = plotPop(options,state,flag)

ax=gca;
ax.YTickLabel={'1','2','3','4'};
ax.YTick=[1.5 2.5 3.5 4.5];
ax.XTickLabel={'1','2','3','4'};
ax.XTick=[1.5 2.5 3.5 4.5];

grid on;

scatter(state.Population(:,2),state.Population(:,1))

xlim([0.5 4.5]);
ylim([0.5 4.5]);
title(['Generation:',num2str(state.Generation)]);
% saveas(gcf,['Generationn',num2str(state.Generation),'.jpg'])
end
