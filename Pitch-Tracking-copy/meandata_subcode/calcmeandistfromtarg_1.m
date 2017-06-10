% Takes the mean distance from target for each subject and plots the mean. 
% split patients and controls and calcs distance from target

for condnn=1:10
GroupData(1).cond(condnn).distfromtarg_WT_PATS=GroupData(1).cond(condnn).distfromtarg_WT(1:numpats,:)
GroupData(1).cond(condnn).distfromtarg_WT_HCs=GroupData(1).cond(condnn).distfromtarg_WT(numpats+1:numsubs,:)

GroupData(1).cond(condnn).distfromtarg_pre_PATS=GroupData(1).cond(condnn).distfromtarg_pre(1:numpats,:)
GroupData(1).cond(condnn).distfromtarg_pre_HCs=GroupData(1).cond(condnn).distfromtarg_pre(numpats+1:numsubs,:)

GroupData(1).cond(condnn).distfromtarg_post_PATS=GroupData(1).cond(condnn).distfromtarg_post(1:numpats,:)
GroupData(1).cond(condnn).distfromtarg_post_HCs=GroupData(1).cond(condnn).distfromtarg_post(numpats+1:numsubs,:)
end

figure
for condnn=1:10
    subplot(2,5,condnn)
    plot(frame_taxis(1:1360),nanmean(GroupData(1).cond(condnn).distfromtarg_WT_PATS),'LineWidth', 1.3, 'Color',bigup_gs);
    hold on
    plot(frame_taxis(1:1360),nanmean(GroupData(1).cond(condnn).distfromtarg_WT_HCs),'LineWidth', 1.3, 'Color',bigdown_gs);
    hold on
    
    plot(frame_taxis(1:1360),targets(condnn,:), 'k','LineWidth',1.3);
    goodplot
    axis([0 4 -350 550])
end

% figure
% for condnn=1:10
%     subplot(2,5,condnn)
%     plot(frame_taxis(1:1360),nanmean(GroupData(1).cond(condnn).distfromtarg_WT_HCs), 'm','LineWidth',1.3);
%     hold on
%     plot(frame_taxis(1:1360),targets(condnn,:), 'k','LineWidth',1.3);
%     goodplot
%     axis([0 4 -350 350])
% end

%% plot normalised versions
% figure
% for condnn=1:10
%     subplot(2,5,condnn)
%     plot(frame_taxis(1:1360),nanmean(GroupData(1).cond(condnn).distfromtarg_WT_PATS)/(nanmean(nanmean(GroupData(1).cond(condnn).distfromtarg_WT_PATS))),'LineWidth', 1.3, 'Color',bigup_gs);
%     hold on
%     plot(frame_taxis(1:1360),nanmean(GroupData(1).cond(condnn).distfromtarg_WT_HCs)/(nanmean(nanmean(GroupData(1).cond(condnn).distfromtarg_WT_HCs))), 'LineWidth', 1.3, 'Color',bigdown_gs);
%     hold on
%     
%     %plot(frame_taxis(1:1360),targets(condnn,:), 'k','LineWidth',1.3);
%     goodplot
%     %axis([0 4 -350 550])
% end






figure
for condnn=1:10
    subplot(2,5,condnn)
    plot(frame_taxis(1:1360),abs(nanmean(GroupData(1).cond(condnn).distfromtarg_WT_HCs)), 'm','LineWidth',1.3);
    hold on
    plot(frame_taxis(1:1360),abs(nanmean(GroupData(1).cond(condnn).distfromtarg_WT_PATS)), 'g','LineWidth',1.3);
    axis([0 4 -350 750])
end
goodplot

%% anova
for condnn=1:10
    for i=1:length(GroupData(1).cond(condnn).distfromtarg_WT)
        stats(condnn).stats(i)=ttest2(GroupData(1).cond(condnn).distfromtarg_WT(1:numpats,i),GroupData(1).cond(condnn).distfromtarg_WT(numpats+1:numsubs,i));
    end
end


figure
for condnn=1:10
    subplot(2,5,condnn)
    plot(frame_taxis(1:1360),abs(nanmean(GroupData(1).cond(condnn).distfromtarg_WT_HCs)), 'b','LineWidth',1.3);
    hold on
    plot(frame_taxis(1:1360),abs(nanmean(GroupData(1).cond(condnn).distfromtarg_WT_PATS)), 'r','LineWidth',1.3);
    axis([0 4 -350 750])
end
goodplot

figure
for condnn=1:10
    subplot(2,5,condnn)
    plot(frame_taxis(1:1360),stats(condnn).stats, 'm','LineWidth',1.3);
    axis([0 4 -1 2])
end
goodplot

