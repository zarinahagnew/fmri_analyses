%%

%pitch
fig6=figure;
ymin=0
ymax=35

whitebg('white')
subplot(2,2,1)
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'GROUP DATA: Within trial stdev, PATS VS HCS, PRE AND POST, clear and noise', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[GroupMeans.HC_ALLCONDS.pre_pitchWTstdev_clear GroupMeans.pat_ALLCONDS.pre_pitchWTstdev_clear; ...
    GroupMeans.HC_ALLCONDS.pre_pitchWTstdev_noise GroupMeans.pat_ALLCONDS.pre_pitchWTstdev_noise]
errY2 = [ GroupSEM.HC_ALLCONDS.pre_pitchWTstdev_clear GroupSEM.pat_ALLCONDS.pre_pitchWTstdev_clear; ...
    GroupSEM.HC_ALLCONDS.pre_pitchWTstdev_noise GroupSEM.pat_ALLCONDS.pre_pitchWTstdev_noise]
h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
ylabel('mean stdev of pitch')
set(h(1),'FaceColor',bigup_gs);
set(h(2),'FaceColor',bigdown_gs);
title(sprintf('Pre Step'));
axis([0 3 ymin ymax])
goodplot


subplot(2,2,2)
y_pitch2=[GroupMeans.HC_ALLCONDS.post_pitchWTstdev_clear GroupMeans.pat_ALLCONDS.post_pitchWTstdev_clear; ...
GroupMeans.HC_ALLCONDS.post_pitchWTstdev_noise GroupMeans.pat_ALLCONDS.post_pitchWTstdev_noise]

errY2 = [ GroupSEM.HC_ALLCONDS.post_pitchWTstdev_clear GroupSEM.pat_ALLCONDS.post_pitchWTstdev_clear; ...
    GroupSEM.HC_ALLCONDS.post_pitchWTstdev_noise GroupSEM.pat_ALLCONDS.post_pitchWTstdev_noise]          % 10% error
h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
legend('HCs','Patients')
ylabel('mean stdev of amp')
set(h(1),'FaceColor',bigup_gs);
set(h(2),'FaceColor',bigdown_gs);
title(sprintf('Post Step'));
axis([0 3 ymin ymax])
goodplot

%% amp
subplot(2,2,3)
y_AMP_clear2=[GroupMeans.HC_ALLCONDS.pre_AMP_clearWTstdev GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_clear ; ...
    GroupMeans.HC_ALLCONDS.pre_AMP_noiseWTstdev GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_noise]
errY2 = [GroupSEM.HC_ALLCONDS.pre_AMP_clearWTstdev GroupSEM.pat_ALLCONDS.pre_AMP_clearWTstdev; ...
    GroupSEM.HC_ALLCONDS.pre_AMP_noiseWTstdev GroupSEM.pat_ALLCONDS.post_AMP_noiseWTstdev]          % 10% error
h = barwitherr(errY2, y_AMP_clear2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
%legend('Patients','HCs')
ylabel('mean stdev of amp')
set(h(1),'FaceColor',bigup_gs);
set(h(2),'FaceColor',bigdown_gs);
goodplot


subplot(2,2,4)
y_AMP_noise2=[GroupMeans.HC_ALLCONDS.post_AMP_clearWTstdev GroupMeans.pat_ALLCONDS.post_AMP_clearWTstdev ; ...
    GroupMeans.HC_ALLCONDS.post_AMP_noiseWTstdev GroupMeans.pat_ALLCONDS.post_AMP_noiseWTstdev]
errY2 = [GroupSEM.HC_ALLCONDS.post_AMP_clearWTstdev GroupSEM.pat_ALLCONDS.post_AMP_clearWTstdev; ...
    GroupSEM.HC_ALLCONDS.post_AMP_noiseWTstdev GroupSEM.pat_ALLCONDS.post_AMP_noiseWTstdev]          % 10% error

h = barwitherr(errY2, y_AMP_noise2);% Plot with errorbars
set(gca,'XTickLabel',{'pre window','post window'})
ylabel('mean stdev of amp')
set(h(1),'FaceColor',bigup_gs);
set(h(2),'FaceColor',bigdown_gs);
goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/MeanWTstdev_final.pdf');

STATS.allclearconds_pat_HCs_pre=ttest2(group_pat_pre_clear, group_HC_pre_clear)
STATS.allclearconds_pat_HCs_post=ttest2(group_pat_post_clear, group_HC_post_clear)
STATS.allclearconds_pre_post_HCs=ttest2(group_HC_pre_clear, group_HC_post_clear)
STATS.allnoiseconds_pat_HCs_pre=ttest2(group_pat_pre_noise, group_HC_pre_noise)
STATS.allnoiseconds_pat_HCs_post=ttest2(group_pat_post_noise, group_HC_post_noise)
STATS.allnoiseconds_pre_post_pats=ttest(group_pat_pre_noise, group_pat_post_noise)
STATS.allnoiseconds_pre_post_HCs=ttest(group_HC_pre_noise, group_HC_post_noise)

STATS.allpreconditions_HC=ttest2(group_HC_pre_noise, group_HC_pre_clear)
STATS.allpreconditions_pat=ttest2(group_pat_pre_noise, group_pat_pre_clear)
STATS.allpostconditions_pat=ttest2(group_pat_post_noise, group_pat_post_clear)
STATS.allpostconditions_HC=ttest2(group_HC_post_noise, group_HC_post_clear)

clc
display final data:
group_HC_pre_noise_final=nanmean(group_HC_pre_noise)
group_HC_post_noise_final=nanmean(group_HC_post_noise)
group_pat_pre_noise_final=nanmean(group_pat_pre_noise)
group_pat_post_noise_final=nanmean(group_pat_post_noise)


group_HC_pre_noise_final_std=nanstd(group_HC_pre_noise)
group_HC_post_noise_final_std=nanstd(group_HC_post_noise)
group_pat_pre_noise_final_std=nanstd(group_pat_pre_noise)
group_pat_post_noise_final_std=nanstd(group_pat_post_noise)







% wholetrial
% fig7=figure;
% ymin=0
% ymax=200
%
% whitebg('white')
% subplot(2,1,1)
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'GROUP DATA: Within trial stdev, PATS VS HCS, clear and noise', ...
%     'EdgeColor', 'none', ...
%     'HorizontalAlignment', 'center')
% y_pitch2=[GroupMeans.HC_ALLCONDS.wholetrial_pitchWTstdev_clear GroupMeans.pat_ALLCONDS.wholetrial_pitchWTstdev_clear; ...
%           GroupMeans.HC_ALLCONDS.wholetrial_pitchWTstdev_noise GroupMeans.pat_ALLCONDS.wholetrial_pitchWTstdev_noise]
% errY2 = [ GroupSEM.HC_ALLCONDS.wholetrial_pitchWTstdev_clear GroupSEM.pat_ALLCONDS.wholetrial_pitchWTstdev_clear; ...
%           GroupSEM.HC_ALLCONDS.wholetrial_pitchWTstdev_noise GroupSEM.pat_ALLCONDS.wholetrial_pitchWTstdev_noise]
% h = barwitherr(errY2, y_pitch2);% Plot with errorbars
% set(gca,'XTickLabel',{'clear','noise'})
% ylabel('mean stdev of pitch (cents)')
% set(h(1),'FaceColor',bigup_gs);
% set(h(2),'FaceColor',bigdown_gs);
% title(sprintf('wholetrial'));
% axis([0 3 ymin ymax])
%
% STATS.allclearconds_pat_HCs_pre=ttest2(group_pat_wholetrial_clear, group_HC_wholetrial_clear);
% STATS.allclearconds_pat_HCs_post=ttest2(group_pat_post_clear, group_HC_post_clear);
% STATS.allclearconds_wholetrial_post_pats=ttest(group_pat_wholetrial_clear, group_pat_post_clear);
% STATS.allclearconds_wholetrial_post_HCs=ttest2(group_HC_wholetrial_clear, group_HC_post_clear)
%
% STATS.allnoiseconds_pat_HCs_wholetrial=ttest2(group_pat_wholetrial_noise, group_HC_wholetrial_noise)
% STATS.allnoiseconds_pat_HCs_post=ttest2(group_pat_post_noise, group_HC_post_noise)
% STATS.allnoiseconds_wholetrial_post_pats=ttest(group_pat_wholetrial_noise, group_pat_post_noise)
% STATS.allnoiseconds_wholetrial_post_HCs=ttest(group_HC_wholetrial_noise, group_HC_post_noise)
%
% subplot(2,1,2)
%
% y_AMP_clear2=[GroupMeans.HC_ALLCONDS.wholetrial_AMP_clearWTstdev GroupMeans.pat_ALLCONDS.wholetrial_AMP_WTstdev_clear ; ...
%           GroupMeans.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev GroupMeans.pat_ALLCONDS.wholetrial_AMP_WTstdev_noise]
% errY2 = [GroupSEM.HC_ALLCONDS.wholetrial_AMP_clearWTstdev GroupSEM.pat_ALLCONDS.wholetrial_AMP_clearWTstdev; ...
%          GroupSEM.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev GroupSEM.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev]          % 10% error
% h = barwitherr(errY2, y_AMP_clear2);% Plot with errorbars
% set(gca,'XTickLabel',{'clear','noise'})
% %legend('Patients','HCs')
% ylabel('mean stdev of amp')
% set(h(1),'FaceColor',bigup_gs);
% set(h(2),'FaceColor',bigdown_gs);
%
% saveas(fig7, 'GROUP_meanstdev_wholetrialWTstdev.jpg')
%
%
%
