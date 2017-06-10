%% Plots group data for subjects that we want to include. These are
% specified in set_params.m. 
% here, data is converted into just the data for the subjects included

% (1) writes each persons data into a single matrix for each condition --------
% (2) PLOT MEAN RESPONSE FOR EACH CONDITION - fig1

clear all
close all

set_params_pitchtracking;

cd(cerebellar_data_rootdir)
load DATA;
DATA=DATA(allincluded);

load /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/targets_norm
load /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/subj_MP_allsubs

%% (1) writes each persons data into a single matrix for each condition --------
calc_group_means;

%% make targets
test=[zeros(1, stepframe) ones(1, 1360-stepframe)];
smallup=test*100;
bigup=test*300;
smalldown=test*-100;
bigdown=test*-300;
nostep=zeros(1,1360);
19.34 

targets(1,:)=smallup;
targets(2,:)=bigup;
targets(3,:)=nostep;
targets(4,:)=smalldown;
targets(5,:)=bigdown;
targets(6,:)=smallup;
targets(7,:)=bigup;
targets(8,:)=nostep;
targets(9,:)=smalldown;
targets(10,:)=bigdown;

%% plot group means
fig1final=figure;
boxmin=-345;
boxmax=690;
ymin=-400;
ymax=400;

subplot(2,2,1)
plot(frame_taxis_to_use, HCs_WT(1,:),'LineWidth', 1.3, 'Color',up_gs);
hold all
plot(frame_taxis_to_use,HCs_WT(2,:),'LineWidth',1.3,'Color',bigup_gs);
plot(frame_taxis_to_use,HCs_WT(3,:),'LineWidth',1.3,'Color',flat_gs);
plot(frame_taxis_to_use,HCs_WT(4,:),'LineWidth',1.3,'Color',down_gs);
plot(frame_taxis_to_use,HCs_WT(5,:),'LineWidth',1.3,'Color',bigdown_gs);
goodplot_wide

subplot(2,2,2)
plot(frame_taxis_to_use, HCs_WT(6,:), 'Color',[up_gs],'LineWidth',1.3);
hold all
plot(frame_taxis_to_use, HCs_WT(7,:), 'Color',[bigup_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, HCs_WT(8,:),  'Color',[flat_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, HCs_WT(9,:),  'Color',[down_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, HCs_WT(10,:),  'Color',[bigdown_gs],'LineWidth',1.3);
axis([0 4 ymin ymax])
goodplot_wide

subplot(2,2,3)
plot(frame_taxis_to_use, pats_WT(1,:), 'Color',[up_gs],'LineWidth',1.3);
hold all
plot(frame_taxis_to_use, pats_WT(2,:), 'Color',[bigup_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, pats_WT(3,:), 'Color',[flat_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, pats_WT(4,:), 'Color',[down_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, pats_WT(5,:), 'Color',[bigdown_gs],'LineWidth',1.3);
axis([0 4 ymin ymax])
goodplot

subplot(2,2,4)
plot(frame_taxis_to_use, pats_WT(6,:), 'Color',[up_gs],'LineWidth',1.3);
hold all
plot(frame_taxis_to_use, pats_WT(7,:), 'Color',[bigup_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, pats_WT(8,:), 'Color',[flat_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, pats_WT(9,:), 'Color',[down_gs],'LineWidth',1.3);
plot(frame_taxis_to_use, pats_WT(10,:), 'Color',[bigdown_gs],'LineWidth',1.3);
axis([0 4 ymin ymax])
goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Fig2.pdf');

%% same figure with sems
% -------------------------------------------------------------------------

figure
subplot(2,2,1)
plot(frame_taxis_to_use, HCs_WT(1,:),'LineWidth', 1.3, 'Color',up_gs);
hold all
plot(frame_taxis_to_use,HCs_WT(2,:),'LineWidth',1.3,'Color',bigup_gs);
plot(frame_taxis_to_use,HCs_WT(3,:),'LineWidth',1.3,'Color',flat_gs);
plot(frame_taxis_to_use,HCs_WT(4,:),'LineWidth',1.3,'Color',down_gs);
plot(frame_taxis_to_use,HCs_WT(5,:),'LineWidth',1.3,'Color',bigdown_gs);
%sems
plot(frame_taxis_to_use, HCs_WT(1,:), 'k');
hold all
plot(frame_taxis_to_use,HCs_WT(2,:), 'k');
plot(frame_taxis_to_use,HCs_WT(3,:), 'k');
plot(frame_taxis_to_use,HCs_WT(4,:), 'k');
plot(frame_taxis_to_use,HCs_WT(5,:), 'k');

plot(frame_taxis_to_use, HCs_WT_posSEM(1,:),'LineWidth', 1, 'Color',up_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(1,:),'LineWidth', 1, 'Color',up_gs);
plot(frame_taxis_to_use, HCs_WT_posSEM(2,:),'LineWidth', 1, 'Color',bigup_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(2,:),'LineWidth', 1, 'Color',bigup_gs);
plot(frame_taxis_to_use, HCs_WT_posSEM(3,:),'LineWidth', 1, 'Color',flat_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(3,:),'LineWidth', 1, 'Color',flat_gs);
plot(frame_taxis_to_use, HCs_WT_posSEM(4,:),'LineWidth', 1, 'Color',down_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(4,:),'LineWidth', 1, 'Color',down_gs);
plot(frame_taxis_to_use, HCs_WT_posSEM(5,:),'LineWidth', 1, 'Color',bigdown_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(5,:),'LineWidth', 1, 'Color',bigdown_gs);
goodplot_wide

subplot(2,2,2)
plot(frame_taxis_to_use, HCs_WT(6,:), 'k');
hold all
plot(frame_taxis_to_use, HCs_WT(7,:), 'k');
plot(frame_taxis_to_use, HCs_WT(8,:), 'k');
plot(frame_taxis_to_use, HCs_WT(9,:), 'k');
plot(frame_taxis_to_use, HCs_WT(10,:), 'k');
plot(frame_taxis_to_use, HCs_WT_posSEM(6,:),'LineWidth', 1, 'Color',up_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(6,:),'LineWidth', 1, 'Color',up_gs);
plot(frame_taxis_to_use, HCs_WT_posSEM(7,:),'LineWidth', 1, 'Color',bigup_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(7,:),'LineWidth', 1, 'Color',bigup_gs);
plot(frame_taxis_to_use, HCs_WT_posSEM(8,:),'LineWidth', 1, 'Color',flat_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(8,:),'LineWidth', 1, 'Color',flat_gs);
plot(frame_taxis_to_use, HCs_WT_posSEM(9,:),'LineWidth', 1, 'Color',down_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(9,:),'LineWidth', 1, 'Color',down_gs);
plot(frame_taxis_to_use, HCs_WT_posSEM(10,:),'LineWidth', 1, 'Color',bigdown_gs);
plot(frame_taxis_to_use, HCs_WT_negSEM(10,:),'LineWidth', 1, 'Color',bigdown_gs);
axis([0 4 ymin ymax])
goodplot_wide

subplot(2,2,3)
plot(frame_taxis_to_use, pats_WT(1,:), 'k');
hold all
plot(frame_taxis_to_use, pats_WT(2,:), 'k');
plot(frame_taxis_to_use, pats_WT(3,:), 'k');
plot(frame_taxis_to_use, pats_WT(4,:), 'k');
plot(frame_taxis_to_use, pats_WT(5,:), 'k');
plot(frame_taxis_to_use, pats_WT_posSEM(1,:),'LineWidth', 1, 'Color',up_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(1,:),'LineWidth', 1, 'Color',up_gs);
plot(frame_taxis_to_use, pats_WT_posSEM(2,:),'LineWidth', 1, 'Color',bigup_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(2,:),'LineWidth', 1, 'Color',bigup_gs);
plot(frame_taxis_to_use, pats_WT_posSEM(3,:),'LineWidth', 1, 'Color',flat_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(3,:),'LineWidth', 1, 'Color',flat_gs);
plot(frame_taxis_to_use, pats_WT_posSEM(4,:),'LineWidth', 1, 'Color',down_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(4,:),'LineWidth', 1, 'Color',down_gs);
plot(frame_taxis_to_use, pats_WT_posSEM(5,:),'LineWidth', 1, 'Color',bigdown_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(5,:),'LineWidth', 1, 'Color',bigdown_gs);
axis([0 4 ymin ymax])
goodplot

subplot(2,2,4)
plot(frame_taxis_to_use, pats_WT(6,:), 'k');
hold all
plot(frame_taxis_to_use, pats_WT(7,:), 'k');
plot(frame_taxis_to_use, pats_WT(8,:), 'k');
plot(frame_taxis_to_use, pats_WT(9,:), 'k');
plot(frame_taxis_to_use, pats_WT(10,:), 'k');
plot(frame_taxis_to_use, pats_WT_posSEM(6,:),'LineWidth', 1, 'Color',up_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(6,:),'LineWidth', 1, 'Color',up_gs);
plot(frame_taxis_to_use, pats_WT_posSEM(7,:),'LineWidth', 1, 'Color',bigup_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(7,:),'LineWidth', 1, 'Color',bigup_gs);
plot(frame_taxis_to_use, pats_WT_posSEM(8,:),'LineWidth', 1, 'Color',flat_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(8,:),'LineWidth', 1, 'Color',flat_gs);
plot(frame_taxis_to_use, pats_WT_posSEM(9,:),'LineWidth', 1, 'Color',down_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(9,:),'LineWidth', 1, 'Color',down_gs);
plot(frame_taxis_to_use, pats_WT_posSEM(10,:),'LineWidth', 1, 'Color',bigdown_gs);
plot(frame_taxis_to_use, pats_WT_negSEM(10,:),'LineWidth', 1, 'Color',bigdown_gs);
axis([0 4 ymin ymax])
goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Fig2_with sems.pdf');

%set(h1,'FaceAlpha',0.5);


%% Fig 2 Mean complex variablity
% -------------------------------------------------------------------------
figure
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Pitch variability across groups', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[HC_clear HC_noise ; PAT_clear PAT_noise];
errY2 = [HC_clear_SEM HC_noise_SEM ; PAT_clear_SEM PAT_noise_SEM];

h = barwitherr(errY2, y_pitch2);% Plot with errorbars

set(gca,'XTickLabel',{'Controls','Patients'})
ylabel('Pitch Variability')
set(h(1),'FaceColor',clear_colour,'EdgeColor', clear_colour ,'LineWidth',1.5);
set(h(2),'FaceColor',masked_colour,'EdgeColor', masked_colour ,'LineWidth',1.5);
goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Group Variability_bar.pdf');


%% Example plot of high freq variability
% -------------------------------------------------------------------------

figure
for trial=1:10
%plot(frame_taxis(1:1111),pats_WT(trial,250:end), 'Color',[bigup_gs],'LineWidth',1.3);
plot(frame_taxis(1:1111),pats_WT(trial,250:end),'Color',[0.3 0.3 0.3],'LineWidth',1.3);
hold on
lowpass_pats_WT(trial,:)=lowpass(pats_WT(trial,250:end), 0.01, 3);
plot(frame_taxis(1:1111),lowpass(pats_WT(trial,250:end), 0.01, 3), 'Color',[bigdown_gs],'LineWidth',1);
goodplot
end

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Group Means with low pass filter.pdf');

%% Distance from low pass filter example
figure
for trial=1:5
    subplot(5,1,trial)
    dist_pats_WT(trial,:)=calc_distance(lowpass_pats_WT(trial,:),pats_WT(trial,250:end))
    plot(frame_taxis(1:1111),dist_pats_WT(trial,:),'Color',[down_gs],'LineWidth',1.3);
    h=area(frame_taxis(1:1111),dist_pats_WT(trial,:),'LineStyle',':');
    set(h,'FaceColor',[0.1 0.1 0.1], 'LineStyle','-'); 
    goodplot
    axis([0 3.5 0 150])
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/example_highfreqvariablitybar.pdf');


%% Plot difference between variability in clear and noise trials
figure
for moo=1:5
    subplot(5,1,moo)
    plot(frame_taxis(1:length(PAT.variability_cond(moo,:))), PAT.variability_cond(moo,:)-PAT.variability_cond(moo+5,:),'Color',[pat_colour],'LineWidth',1.1);
    hold all
    plot(frame_taxis(1:length(PAT.variability_cond(moo,:))),HC.variability_cond(moo,:)-HC.variability_cond(moo+5,:),'Color',[hc_colour],'LineWidth',1.1);    
    axis([0 3.5 -50 100])
    goodplot
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/diff in clear and noise variability.pdf');

% here it is clear minus noise. a flat line shows no difference in
% variability, 
% negative values show increased
% postiive values show less variability in the noise conditions compared to the clear conditions


%% plot distance from target
figure
for trial=1:5
    subplot(2,5,trial)
    distfromtarg_pats_WT(trial,:)=calc_distance(targets(trial,250:end),pats_WT(trial,250:end));
    distfromtarg_HCs_WT(trial,:)=calc_distance(targets(trial,250:end),HCs_WT(trial,250:end));
    
    h=area(frame_taxis(1:1111),distfromtarg_pats_WT(trial,:),'LineStyle',':');
    set(h,'FaceColor',[pat_colour], 'LineStyle','-','EdgeColor',[pat_colour]);
    % set(h,'FaceColor','c', 'LineStyle','-','EdgeColor','c');

    hold 
    h=area(frame_taxis(1:1111),distfromtarg_HCs_WT(trial,:),'LineStyle','-');
    set(h,'FaceColor',[hc_colour], 'LineStyle','-','EdgeColor',[hc_colour]);
    % set(h,'FaceColor','k', 'LineStyle','-','EdgeColor','k');
    
    goodplot_wide
    axis([0 3.5 0 400])
end

for trial=6:10
    subplot(2,5,trial)
    distfromtarg_pats_WT(trial,:)=calc_distance(targets(trial,250:end),pats_WT(trial,250:end));
    distfromtarg_HCs_WT(trial,:)=calc_distance(targets(trial,250:end),HCs_WT(trial,250:end));
    
    h=area(frame_taxis(1:1111),distfromtarg_pats_WT(trial,:),'LineStyle',':');
    %set(h,'FaceColor',[pat_colour], 'LineStyle','-','EdgeColor',[pat_colour]);
    set(h,'FaceColor',[1 1 1], 'LineWidth',1.5,'LineStyle','-','EdgeColor',[pat_colour]);

    hold 
    h=area(frame_taxis(1:1111),distfromtarg_HCs_WT(trial,:),'LineStyle','-');
    %set(h,'FaceColor',[hc_colour], 'LineStyle','-','EdgeColor',[hc_colour]);
    set(h,'FaceColor',[1 1 1],'LineWidth',1.5, 'LineStyle','-','EdgeColor',[hc_colour]);
    goodplot_wide
    axis([0 3.5 0 400])
end

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/distance_from_targets.pdf');


%% anova on distance data


% ttest for each plot
% 
% for i=1:length*distfromtarg_pats_WT(trial,:))
%     ttest2(distfromtarg_pats_WT(1,i),(distfromtarg_HCs_WT(1,i)) 


%% plot bar graph
hc_clear=nanmean([distfromtarg_HCs_WT(1,:) distfromtarg_HCs_WT(2,:) ...
          distfromtarg_HCs_WT(3,:) distfromtarg_HCs_WT(4,:) distfromtarg_HCs_WT(5,:)]);
hc_noise=nanmean([distfromtarg_HCs_WT(6,:) distfromtarg_HCs_WT(7,:) ...
           distfromtarg_HCs_WT(8,:)  distfromtarg_HCs_WT(9,:) distfromtarg_HCs_WT(10,:)]);
pat_clear= nanmean([distfromtarg_pats_WT(1,:)  distfromtarg_pats_WT(2,:) ...
           distfromtarg_pats_WT(3,:)  distfromtarg_pats_WT(4,:) distfromtarg_pats_WT(5,:)]);
pat_noise=nanmean([distfromtarg_pats_WT(6,:) distfromtarg_pats_WT(7,:) ...
          distfromtarg_pats_WT(8,:) distfromtarg_pats_WT(9,:) distfromtarg_pats_WT(10,:)]);

hc_clear_std=nanstd([distfromtarg_HCs_WT(1,:) distfromtarg_HCs_WT(2,:) ...
          distfromtarg_HCs_WT(3,:) distfromtarg_HCs_WT(4,:) distfromtarg_HCs_WT(5,:)]);
hc_noise_std=nanstd([distfromtarg_HCs_WT(6,:) distfromtarg_HCs_WT(7,:) ...
           distfromtarg_HCs_WT(8,:)  distfromtarg_HCs_WT(9,:) distfromtarg_HCs_WT(10,:)]);
pat_clear_std= nanstd([distfromtarg_pats_WT(1,:)  distfromtarg_pats_WT(2,:) ...
           distfromtarg_pats_WT(3,:)  distfromtarg_pats_WT(4,:) distfromtarg_pats_WT(5,:)]);
pat_noise_std=nanstd([distfromtarg_pats_WT(6,:) distfromtarg_pats_WT(7,:) ...
          distfromtarg_pats_WT(8,:) distfromtarg_pats_WT(9,:) distfromtarg_pats_WT(10,:)]);

%% distance from target
figure
whitebg('white')
meandist= [hc_clear hc_noise; pat_clear pat_noise]
err =[hc_clear_std/sqrt(5) hc_noise_std/sqrt(5); pat_clear/sqrt(5) pat_noise/sqrt(5)]
      
h = barwitherr(err, meandist);% Plot with errorbars
goodplot
set(h(1),'FaceColor',hc_colour,'EdgeColor', hc_colour ,'LineWidth',1.2);
set(h(2),'FaceColor',pat_colour,'EdgeColor', pat_colour ,'LineWidth',1.2);

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/MeanDistfromtarg.pdf');

% and the bar graph
figure
whitebg('white')
y_pitch2=[nanmean(distfromtarg_HCs_WT(1,:)) nanmean(distfromtarg_HCs_WT(2,:)) ...
          nanmean(distfromtarg_HCs_WT(3,:)) nanmean(distfromtarg_HCs_WT(4,:)) ...
          nanmean(distfromtarg_HCs_WT(5,:)); nanmean(distfromtarg_HCs_WT(6,:))...
          nanmean(distfromtarg_HCs_WT(7,:)) nanmean(distfromtarg_HCs_WT(8,:)) ...
          nanmean(distfromtarg_HCs_WT(9,:)) nanmean(distfromtarg_HCs_WT(10,:)); ...
          nanmean(distfromtarg_pats_WT(1,:)) nanmean(distfromtarg_pats_WT(2,:)) ...
          nanmean(distfromtarg_pats_WT(3,:)) nanmean(distfromtarg_pats_WT(4,:)) ...
          nanmean(distfromtarg_pats_WT(5,:)) ;nanmean(distfromtarg_pats_WT(6,:))...
          nanmean(distfromtarg_pats_WT(7,:)) nanmean(distfromtarg_pats_WT(8,:))...
          nanmean(distfromtarg_pats_WT(9,:)) nanmean(distfromtarg_pats_WT(10,:))];
          
errY2 =[nanstd(distfromtarg_HCs_WT(1,:))/sqrt(1) nanstd(distfromtarg_HCs_WT(2,:)) ...
          nanstd(distfromtarg_HCs_WT(3,:)) nanstd(distfromtarg_HCs_WT(4,:)) ...
          nanstd(distfromtarg_HCs_WT(5,:)); nanstd(distfromtarg_HCs_WT(6,:))...
          nanstd(distfromtarg_HCs_WT(7,:)) nanstd(distfromtarg_HCs_WT(8,:)) ...
          nanstd(distfromtarg_HCs_WT(9,:)) nanstd(distfromtarg_HCs_WT(10,:)); ...
          nanstd(distfromtarg_pats_WT(1,:)) nanstd(distfromtarg_pats_WT(2,:)) ...
          nanstd(distfromtarg_pats_WT(3,:)) nanstd(distfromtarg_pats_WT(4,:)) ...
          nanstd(distfromtarg_pats_WT(5,:)) ;nanstd(distfromtarg_pats_WT(6,:)) ...
          nanstd(distfromtarg_pats_WT(7,:)) nanstd(distfromtarg_pats_WT(8,:))...
          nanstd(distfromtarg_pats_WT(9,:)) nanstd(distfromtarg_pats_WT(10,:))];
      
      
h = barwitherr(errY2, y_pitch2);% Plot with errorbars
goodplot
set(h(1),'FaceColor',up_gs,'EdgeColor', 'k' ,'LineWidth',1.2);
set(h(2),'FaceColor',bigup_gs,'EdgeColor', 'k' ,'LineWidth',1.2);
set(h(3),'FaceColor',flat_gs,'EdgeColor', 'k' ,'LineWidth',1.2);
set(h(4),'FaceColor',down_gs,'EdgeColor', 'k' ,'LineWidth',1.2);
set(h(5),'FaceColor',bigdown_gs,'EdgeColor', 'k' ,'LineWidth',1.2);

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/GroupVariability_bar_final.pdf');



%% pre and post windows
figure
subplot(221)
plot(nanmean(HCs_pre(1:5,:)),'Color',[bigdown_gs],'LineWidth',1.2);
hold
plot(nanmean(HCs_pre(6:10,:)),'Color',[bigup_gs],'LineWidth',1.2);
goodplot
axis([0 400 -160 -70])

subplot(222)
plot(nanmean(HCs_post(1:5,:)),'Color',[bigdown_gs],'LineWidth',1.2);
hold
plot(nanmean(HCs_post(6:10,:)),'Color',[bigup_gs],'LineWidth',1.2);
goodplot
axis([0 400 -160 -70])

subplot(223)
plot(nanmean(pats_pre(1:5,:)),'Color',[bigdown_gs],'LineWidth',1.2);
hold
plot(nanmean(pats_pre(6:10,:)),'Color',[bigup_gs],'LineWidth',1.2);
goodplot
axis([0 400 60 90])


subplot(224)
plot(nanmean(pats_post(1:5,:)),'Color',[bigdown_gs],'LineWidth',1.2);
hold
plot(nanmean(pats_post(6:10,:)),'Color',[bigup_gs],'LineWidth',1.2);
goodplot
axis([0 400 80 130])

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/WTSTdev_preandpsot_bar_final.pdf');


%% plot patients and controls pitch variability on same graph
figure
for moo=1:5
    subplot(5,1,moo)
    plot(frame_taxis(1:length(PAT.variability_cond(moo,:))), PAT.variability_cond(moo,:)-PAT.variability_cond(moo+5,:),'Color',[pat_colour],'LineWidth',1.1);
    hold all
    plot(frame_taxis(1:length(PAT.variability_cond(moo,:))),HC.variability_cond(moo,:)-HC.variability_cond(moo+5,:),'Color',[hc_colour],'LineWidth',1.1);    
    axis([0 3.5 -50 100])
    goodplot
end

cd(cerebellar_data_rootdir)
save('GROUPDATA')

%Run stats on distancefrommean data
anova_distancefrommean;

%% save data for R repeated measures anova
cd data-for-r
for isubj=1:13
filename = [ 'cereb_prt_diff_' num2str(isubj) '.txt' ];
dlmwrite(filename,gp.cereb_diff_eachsub(isubj,:)')
filename_sham = [ 'sham_prt_diff_' num2str(isubj) '.txt' ];
dlmwrite(filename_sham,gp.sham_diff_eachsub(isubj,:)')
end


for isubj=1:13
filename = [ 'cereb_prt_diff_horiz' num2str(isubj) '.txt' ];
dlmwrite(filename,gp.cereb_diff_eachsub(isubj,:))
filename_sham = [ 'sham_prt_diff_horiz_' num2str(isubj) '.txt' ];
dlmwrite(filename_sham,gp.sham_diff_eachsub(isubj,:))
end

cd ..

