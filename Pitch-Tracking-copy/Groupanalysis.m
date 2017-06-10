%% Analyses group pitch and amp data
% ZKA April 2014

% leaves out bad subjects
% anova uses GroupData.WT_patC1_pre which is only the good subjects but is
% computed in Calc_WTstev_2.m so need to run that before this
 
clear all
close all
set_params_pitchtracking;

cd /Users/zagnew/Cereb_data/data_final_run/SUB01/expr2014.03.21.T10.46.03_mainrun/speak/block0/
pitchdata=get_vec_hist6('pitch2',3); %two arguments are file name and then file type (float vec)
block=get_vec_hist6('blockalt',3); %pert response (needs to be shifted in time as only begins in response to voice onsett detect
voiceonset=get_vec_hist6('voice_onset_detect',2); %voice detect
outbuff_wav=get_vec_hist6('outbuffer', 3); % playable waveform
outbuff_pitch=get_vec_hist6('output_pitch', 3); % pich of outbuffer is the target
amp=get_vec_hist6('weighted_mean_abs_inbuffer2', 3);
audio=get_vec_hist6('inbuffer2',3);
samples2get = length(pitchdata.data(2,:));
nframes_per_trial = pitchdata.nvecs;
taxis = (0:(samples2get-1))/fs;
frame_taxis = (0:(nframes_per_trial-1))/framef;

homedir='/Users/zagnew/Cereb_data/data_final_run/GroupData';
cd(homedir);
load /Users/zagnew/Cereb_data/data_final_run/GroupData/GroupData.mat

%% (1): Calculate the mean/average within trial stdevs for each condition for
% patients and HCs
% GroupData.WT_patC1_pre = the eight trials for eight subjects (raw stdev data)

calcmeandata_1; 

%% (3) plot mean WT stdev by trial separately - FINAL FIGURES
% plotWTstdev_1;
plot_mean_WTstd_final_1;

anova_mean_WTstdev_final_1; % runs anova on individual subject means
% gives two plots, one is 
%p_interaction = anovan(anovandata_WTstdev,{group1 group2 group3},'model','interaction')
%p_full = anovan(anovandata_WTstdev,{group1 group2 group3}, 'full')

anova_mean_WTstdev_final_2; % runs anova on subject and patient group data

%% (4) calc group distance from target and plots that
calcmeandistfromtarg_1;

load GROUPDATA;
% output from Plot_groupdata first

Plot_groupdata

anova_distancefrommean;

%% (3): STATS - Comparing within trial stdev for patients and HCs ttest
run_ttests_1;

%% (8) PLOT: clear vs noise - HCs
fig5=figure

ymin=0;
ymax=35;
subplot(2,2,1);
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'All Noise Vs All Clear trials -clear (left) - noise (right)', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')


bar(1, Stdwithin_allcleartrials_HCs_pre_data), 'b';
hold on
bar(2, Stdwithin_allnoisetrials_HCs_pre_data, 'c');
axis([0 3 ymin ymax])
title(sprintf('HCs stdev of pitch (pre window)'));

% STATS.stdwithin_allnoise_vs_clear_HCs_pre

subplot(2,2,2);
bar(1, Stdwithin_allcleartrials_HCs_post_data), 'b';
hold on
bar(2, Stdwithin_allnoisetrials_HCs_post_data, 'c');
axis([0 3 ymin ymax])
title(sprintf('HCs stdev of pitch (post window)'));

%STATS.stdwithin_allnoise_vs_clear_HCs_post

subplot(2,2,3);
bar(1, Stdwithin_allcleartrials_pats_pre_data), 'm';
hold on
bar(2, Stdwithin_allnoisetrials_pats_pre_data, 'y');
axis([0 3 ymin ymax])
title(sprintf('Patients stdev of pitch (pre window)'));

%STATS.stdwithin_allnoise_vs_clear_pats_pre

subplot(2,2,4);
bar(1, Stdwithin_allcleartrials_pats_post_data), 'm';
hold on
bar(2, Stdwithin_allnoisetrials_pats_post_data, 'y');
axis([0 3 ymin ymax])
title(sprintf('Patients stdev of pitch (post window)'));

saveas(fig5, 'GROUP_meanstdev_noise_clear_HCs.jpg')


