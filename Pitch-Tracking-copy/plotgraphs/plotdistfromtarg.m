%% plot mean distance from target for patients and for HCs
set_params;

%HCs
fig1=figure;
ha=tight_subplot(5,4,[.04,.04],[.10,.1],[.1,.02]);
%title(sprintf('Motor performance: pre and post windows'));
ymin=-390;
ymax=390;

axes(ha(1))
plot(frame_taxis_to_use, smallup,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond1_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(2))
plot(frame_taxis_to_use, HC.meandist_from_targ(1,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(5))
plot(frame_taxis_to_use, bigup,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond2_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(6))
plot(frame_taxis_to_use, HC.meandist_from_targ(2,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(9))
plot(frame_taxis_to_use, nostep,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond3_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(10))
plot(frame_taxis_to_use, HC.meandist_from_targ(3,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(13))
plot(frame_taxis_to_use, smalldown,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond4_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(14))
plot(frame_taxis_to_use, HC.meandist_from_targ(4,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(17))
plot(frame_taxis_to_use, bigdown,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond5_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(18))
plot(frame_taxis_to_use, HC.meandist_from_targ(5,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

% noise
axes(ha(3))
plot(frame_taxis_to_use, smallup,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond6_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350])
goodplot_wide

axes(ha(4))
plot(frame_taxis_to_use, HC.meandist_from_targ(6,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350])
goodplot_wide

axes(ha(7))
plot(frame_taxis_to_use, bigup,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond7_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350])
goodplot_wide

axes(ha(8))
plot(frame_taxis_to_use, HC.meandist_from_targ(7,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(11))
plot(frame_taxis_to_use, nostep,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond8_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(12))
plot(frame_taxis_to_use, HC.meandist_from_targ(8,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(15))
plot(frame_taxis_to_use, smalldown,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond9_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(16))
plot(frame_taxis_to_use, HC.meandist_from_targ(9,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(19))
plot(frame_taxis_to_use, bigdown,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond10_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(20))
plot(frame_taxis_to_use, HC.meandist_from_targ(10,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/final-figures/Distancefromtarget_HC.pdf');


% patients

fig2=figure;
ha=tight_subplot(5,4,[.04,.04],[.10,.1],[.1,.02]);
ymin=-390;
ymax=390;


axes(ha(1))
plot(frame_taxis_to_use, smallup,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond1_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(2))
plot(frame_taxis_to_use, PAT.meandist_from_targ(1,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(5))
plot(frame_taxis_to_use, bigup,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond2_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(6))
plot(frame_taxis_to_use, PAT.meandist_from_targ(2,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(9))
plot(frame_taxis_to_use, nostep,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond3_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(10))
plot(frame_taxis_to_use, PAT.meandist_from_targ(3,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(13))
plot(frame_taxis_to_use, smalldown,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond4_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(14))
plot(frame_taxis_to_use, PAT.meandist_from_targ(4,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(17))
plot(frame_taxis_to_use, bigdown,  'r --', 'LineWidth', 1.1)
hold on
plot(frame_taxis_to_use,group_cond5_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

axes(ha(18))
plot(frame_taxis_to_use, PAT.meandist_from_targ(5,:),  'k', 'LineWidth', 1.3)
axis([0 4 ymin ymax])
goodplot_wide

% noise
axes(ha(3))
plot(frame_taxis_to_use, smallup,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond6_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350])
goodplot_wide

axes(ha(4))
plot(frame_taxis_to_use, PAT.meandist_from_targ(6,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350])
goodplot_wide

axes(ha(7))
plot(frame_taxis_to_use, bigup,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond7_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350])
goodplot_wide

axes(ha(8))
plot(frame_taxis_to_use, PAT.meandist_from_targ(7,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(11))
plot(frame_taxis_to_use, nostep,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond8_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(12))
plot(frame_taxis_to_use, PAT.meandist_from_targ(8,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(15))
plot(frame_taxis_to_use, smalldown,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond9_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(16))
plot(frame_taxis_to_use, PAT.meandist_from_targ(9,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(19))
plot(frame_taxis_to_use, bigdown,  'r--', 'LineWidth', 1.3)
hold on
plot(frame_taxis_to_use, group_cond10_pats_to_use_mean, 'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide

axes(ha(20))
plot(frame_taxis_to_use, PAT.meandist_from_targ(10,:),  'k', 'LineWidth', 1.3)
axis([0 4 -350 350]);
goodplot_wide
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/final-figures/Distancefromtarget_PAT.pdf');

%% clear vs noise plotted against each other
fig3=figure;
for icond=1:5
    subplot(2,5,icond)
    plot(frame_taxis_to_use, PAT.meandist_from_targ(icond,:), 'k', 'LineWidth', 1.3)
    hold on
    plot(frame_taxis_to_use, PAT.meandist_from_targ(icond+5,:), 'r', 'LineWidth', 1.3)
    goodplot_wide
    axis([0 4 0 400])
end

for icond=1:5
    subplot(2,5,icond+5)
    plot(frame_taxis_to_use, HC.meandist_from_targ(icond,:), 'k', 'LineWidth', 1.3)
    hold on
    plot(frame_taxis_to_use, HC.meandist_from_targ(icond+5,:), 'r', 'LineWidth', 1.3)
    goodplot_wide
    axis([0 4 0 400])
end

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/final-figures/Distancefromtarget_clearvnoise.pdf');


distfromtarg_mean_1=[...
    nanmean(HC.meandist_from_targ(1,:)) ... 
    nanmean(HC.meandist_from_targ(6,:)) ...
    
    nanmean(HC.meandist_from_targ(2,:)) ...
    nanmean(HC.meandist_from_targ(7,:)) ...

    nanmean(HC.meandist_from_targ(3,:)) ...
    nanmean(HC.meandist_from_targ(8,:)) ...
        
    nanmean(HC.meandist_from_targ(4,:)) ...
    nanmean(HC.meandist_from_targ(9,:)) ...

    nanmean(HC.meandist_from_targ(5,:)) ...
    nanmean(HC.meandist_from_targ(10,:))];
    
distfromtarg_mean_2=[...    
    nanmean(PAT.meandist_from_targ(1,:)) ... 
    nanmean(PAT.meandist_from_targ(6,:)) ...
    
    nanmean(PAT.meandist_from_targ(2,:)) ...
    nanmean(PAT.meandist_from_targ(7,:)) ...

    nanmean(PAT.meandist_from_targ(3,:)) ...
    nanmean(PAT.meandist_from_targ(8,:)) ...
        
    nanmean(PAT.meandist_from_targ(4,:)) ...
    nanmean(PAT.meandist_from_targ(9,:)) ...

    nanmean(PAT.meandist_from_targ(5,:))...
    nanmean(PAT.meandist_from_targ(10,:))];
    
errY2_1=[...
   nanstd(HC.meandist_from_targ(1,:))/sqrt(length(subjects_included)*8) ... 
    nanstd(HC.meandist_from_targ(6,:))/sqrt(length(subjects_included)*8) ... 
    
    nanstd(HC.meandist_from_targ(2,:))/sqrt(length(subjects_included)*8) ... 
    nanstd(HC.meandist_from_targ(7,:))/sqrt(length(subjects_included)*8) ... 

    nanstd(HC.meandist_from_targ(3,:))/sqrt(length(subjects_included)*8) ... 
    nanstd(HC.meandist_from_targ(8,:))/sqrt(length(subjects_included)*8) ...
        
    nanstd(HC.meandist_from_targ(4,:))/sqrt(length(subjects_included)*8) ... 
    nanstd(HC.meandist_from_targ(9,:))/sqrt(length(subjects_included)*8) ... 

    nanstd(HC.meandist_from_targ(5,:))/sqrt(length(subjects_included)*8) ... 
    nanstd(HC.meandist_from_targ(10,:))/sqrt(length(subjects_included)*8)];

errY2_2=[...
    
    nanstd(PAT.meandist_from_targ(1,:))/sqrt(length(patients_included)*8) ... 
    nanstd(PAT.meandist_from_targ(6,:))/sqrt(length(patients_included)*8) ... 
    
    nanstd(PAT.meandist_from_targ(2,:))/sqrt(length(patients_included)*8) ... 
    nanstd(PAT.meandist_from_targ(7,:))/sqrt(length(patients_included)*8) ... 

    nanstd(PAT.meandist_from_targ(3,:))/sqrt(length(patients_included)*8) ... 
    nanstd(PAT.meandist_from_targ(8,:))/sqrt(length(patients_included)*8) ... 
        
    nanstd(PAT.meandist_from_targ(4,:))/sqrt(length(patients_included)*8) ... 
    nanstd(PAT.meandist_from_targ(9,:))/sqrt(length(patients_included)*8) ... 

    nanstd(PAT.meandist_from_targ(5,:))/sqrt(length(patients_included)*8) ... 
    nanstd(PAT.meandist_from_targ(10,:))];
    
fig3b=figure
whitebg('white')
subplot(211)
h = barwitherr(errY2_1, distfromtarg_mean_1);% Plot with errorbars
%set(gca,'XTickLabel',{'patients  (prestep)','controls  (prestep)','patients  (poststep)','controls  (poststep)'})
ylabel('dist from target (cents)')
set(h(1),'FaceColor', 'w')
set(h(2),'FaceColor','k')
title(sprintf('Mean dist from target HCs'));
axis([0 6 0 300])
goodplot

subplot(212)
h = barwitherr(errY2_2, distfromtarg_mean_2);% Plot with errorbars
%set(gca,'XTickLabel',{'patients  (prestep)','controls  (prestep)','patients  (poststep)','controls  (poststep)'})
ylabel('dist from target (cents)')
set(h(1),'FaceColor', 'w')
set(h(2),'FaceColor','k')
title(sprintf('Mean dist from target Patients'));
axis([0 6 0 300])
goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/final-figures/meandistancefromtarget.pdf');

%numtrials=sum(sub_total_goodtrial(allincluded))



fig4=figure;
for icond=1:10
    subplot(2,5,icond)
    plot(frame_taxis_to_use,PAT.meandist_from_targ(icond,:), 'k', 'LineWidth', 1.3)
    hold
    plot(frame_taxis_to_use,HC.meandist_from_targ(icond,:), 'r', 'LineWidth', 1.3)
    goodplot_wide
    axis([0 4 -400 400])
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/final-figures/Distancefromtarget_patsVsHCs.pdf');


fig5=figure;
for icond=1:10
    zee(icond,:)=calc_distance(HC.meandist_from_targ(icond,:), PAT.meandist_from_targ(icond,:));
    subplot(2,5,icond)
    plot(frame_taxis_to_use, zee(icond,:), 'k', 'LineWidth', 1.3)
    axis([0 4 0 400])
    goodplot_wide
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/final-figures/DistancefromtargetbetweenpatsHCs.pdf');

% plot mean distance from target
fig1_final=figure
whitebg('white')
h = barwitherr(errY2, distfromtarg_DATA_TO_USE);% Plot with errorbars
set(gca,'XTickLabel',{'patients  (prestep)','controls  (prestep)','patients  (poststep)','controls  (poststep)'})
ylabel('distance from target pitch in trials (cents)')
set(h(1),'FaceColor', 'w')
set(h(2),'FaceColor','k')
%set(h(3),'FaceColor','w')
title(sprintf('Motor performance: pre and post windows, noise and clear conditions'));
goodplot
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/final-figures/meandistancefromtarget.pdf');

