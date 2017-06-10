%% Measures within and acorss trial stdev
% stdev of pre and post step periods, and mean/stdev across trials
% -------------------------------------------------------------------------
% ZKA March 2014

% note: change the subjects that are written out in set_params before running
% this. All data is writtn eto DATA.mat but the good data is written to
% DATA_TO_USE.mat

% loads the sorted_data from C_sort_data
% (1) Calculates within trial stdev for each subject, for pitch (default)
% and amplitude signal and writes it to a single matrix DATA(subject). 
% (2) Calculates mean and stdev *across* trial pitch for each subject and
% write to "DATA(isubj).mean_cond1_pre"
% (3) Write out only the subjects to use and save to DATA_TO_USE
% (4) Concatenates data from each subject into one line e.g. 'GroupData.WT_patC1_pre'
% saves this all to save 'GroupData/GroupData.mat'

close all
clear all
set_params_pitchtracking;
window_frames=201;

%for plotting only :)
minpitch=100;
maxpitch=300;

cd(cerebellar_data_rootdir);
npatients = 0;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB02/expr2014.03.21.T12.33.58_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB03/expr2014.03.21.T14.35.35_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB04/expr2014.03.21.T17.20.11_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB05/expr2014.03.21.T18.50.52_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB06/expr2014.03.22.T11.05.45_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB07/expr2014.03.22.T12.15.42_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB08/expr2014.03.22.T14.01.48_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB09/expr2014.03.22.T15.52.01_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB10/expr2014.03.22.T16.37.44_mainrun/speak/';
npatients = npatients+ 1;
patient_info{npatients}.exprdir = 'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB12/expr2014.03.23.T11.03.52_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/';

% HCS
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC01/expr2014.05.06.T12.36.43_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC02/expr2014.06.17.T12.53.53_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC03/expr2014.06.17.T13.50.36_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC04/expr2014.06.17.T16.22.20_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC05/expr2014.06.18.T15.14.02_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC06/expr2014.06.18.T16.18.27_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC07/expr2014.07.25.T10.29.55_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC08/expr2014.08.14.T15.57.52_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC09/expr2014.09.21.T14.17.36_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC12/expr2015.05.11.T11.18.14_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC13/expr2015.05.11.T11.53.19_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC14/expr2015.05.11.T12.28.56_mainrun/speak/';
meanpitchtag(npatients)=14;


for isubj = 1:npatients
    the_expr_dir = [cerebellar_data_rootdir (patient_info{isubj}.exprdir)];
    cd (the_expr_dir);
    cd block0
    pitchdata=get_vec_hist6('pitch2',3);                                    %two arguments are file name and then file type (float vec)
    block=get_vec_hist6('blockalt',3);                                      %pert response (needs to be shifted in time as only begins in response to voice onsett detect
    voiceonset=get_vec_hist6('voice_onset_detect',2);                       %voice detect
    outbuff_wav=get_vec_hist6('outbuffer', 3);                              % playable waveform
    outbuff_pitch=get_vec_hist6('output_pitch', 3);                         % pich of outbuffer is the target
    amp=get_vec_hist6('weighted_mean_abs_inbuffer2', 3);
    audio=get_vec_hist6('inbuffer2',3);
    
    % sort out x axis
    samples2get = length(pitchdata.data(2,:));
    fs = 11025;
    framef = fs/32;
    nframes_per_trial = pitchdata.nvecs;
    taxis = (0:(samples2get-1))/fs;
    frame_taxis = (0:(nframes_per_trial-1))/framef;
    cd (the_expr_dir);

    load (sprintf('%ssorted_data.mat',patient_info{isubj}.exprdir))         % loads output form C_sort_conds.m    
    
%% (1) Calculate within trial stdev for each subject, for pitch (default) 
%  and amplitude signal and write it to a single matrix 'DATA' which has
%  all subjects included
    %cond 1
    condnn=1;
    for trial=1:8
        DATA(isubj).StdWithinCond1_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond1_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond1_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond1_within_wholetrial_var(trial)=(DATA(isubj).StdWithinCond1_within_wholetrial_stdev(trial))*(DATA(isubj).StdWithinCond1_within_pre_stdev(trial));
       
        % amplitude
        DATA(isubj).StdWithinCond1_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond1_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond1_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        DATA(isubj).StdWithinCond1_within_wholetrial_var_AMP(trial)=(DATA(isubj).StdWithinCond1_within_wholetrial_stdev_AMP(trial))*(DATA(isubj).StdWithinCond1_within_wholetrial_stdev_AMP(trial));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond1_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond1_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    
    end
    DATA(isubj).StdWithinCond1_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond1_within_pre_stdev);
    DATA(isubj).StdWithinCond1_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond1_within_post_stdev);
    DATA(isubj).StdWithinCond1_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond1_within_wholetrial_stdev);
    
    DATA(isubj).StdWithinCond1_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond1_within_pre_stdev);
    DATA(isubj).StdWithinCond1_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond1_within_post_stdev);
    DATA(isubj).StdWithinCond1_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond1_within_wholetrial_stdev);

    condnn=2;
    for trial=1:8
        DATA(isubj).StdWithinCond2_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond2_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond2_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond2_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond2_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond2_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond2_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond2_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
        
    end
    
    DATA(isubj).StdWithinCond2_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond2_within_pre_stdev);
    DATA(isubj).StdWithinCond2_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond2_within_post_stdev);
    DATA(isubj).StdWithinCond2_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond2_within_wholetrial_stdev);
    
    DATA(isubj).StdWithinCond2_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond2_within_pre_stdev);
    DATA(isubj).StdWithinCond2_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond2_within_post_stdev);
    DATA(isubj).StdWithinCond2_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond2_within_wholetrial_stdev);
    
    condnn=3;
    for trial=1:8
        DATA(isubj).StdWithinCond3_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond3_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond3_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond3_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond3_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond3_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond3_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond3_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
        
    end
    
    DATA(isubj).StdWithinCond3_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond3_within_pre_stdev);
    DATA(isubj).StdWithinCond3_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond3_within_post_stdev);
    DATA(isubj).StdWithinCond3_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond3_within_wholetrial_stdev);
    
    DATA(isubj).StdWithinCond3_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond3_within_pre_stdev);
    DATA(isubj).StdWithinCond3_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond3_within_post_stdev);
    DATA(isubj).StdWithinCond3_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond3_within_wholetrial_stdev);
     
    condnn=4;
    for trial=1:8
        DATA(isubj).StdWithinCond4_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond4_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond4_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond4_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond4_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond4_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond4_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond4_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));     
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
        
    end    
    DATA(isubj).StdWithinCond4_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond4_within_pre_stdev);
    DATA(isubj).StdWithinCond4_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond4_within_post_stdev);
    DATA(isubj).StdWithinCond4_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond4_within_wholetrial_stdev);
    
    DATA(isubj).StdWithinCond4_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond4_within_pre_stdev);
    DATA(isubj).StdWithinCond4_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond4_within_post_stdev);
    DATA(isubj).StdWithinCond4_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond4_within_wholetrial_stdev);

    condnn=5;
    for trial=1:8
        DATA(isubj).StdWithinCond5_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond5_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond5_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond5_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond5_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond5_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond5_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond5_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
        
    end
%     DATA(isubj).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
%     DATA(isubj).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
%     DATA(isubj).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    
    DATA(isubj).StdWithinCond5_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond5_within_pre_stdev);
    DATA(isubj).StdWithinCond5_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond5_within_post_stdev);
    DATA(isubj).StdWithinCond5_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond5_within_wholetrial_stdev);

    DATA(isubj).StdWithinCond5_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond5_within_pre_stdev);
    DATA(isubj).StdWithinCond5_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond5_within_post_stdev);
    DATA(isubj).StdWithinCond5_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond5_within_wholetrial_stdev);
    
    condnn=6;
    for trial=1:8
        DATA(isubj).StdWithinCond6_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond6_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond6_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond6_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond6_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond6_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond6_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond6_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);     
    end
%     DATA(isubj).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
%     DATA(isubj).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
%     DATA(isubj).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    
    DATA(isubj).StdWithinCond6_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond6_within_pre_stdev);
    DATA(isubj).StdWithinCond6_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond6_within_post_stdev);
    DATA(isubj).StdWithinCond6_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond6_within_wholetrial_stdev);
    
    DATA(isubj).StdWithinCond6_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond6_within_pre_stdev);
    DATA(isubj).StdWithinCond6_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond6_within_post_stdev);
    DATA(isubj).StdWithinCond6_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond6_within_wholetrial_stdev);
    
    
    condnn=7;
    for trial=1:8
        DATA(isubj).StdWithinCond7_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond7_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond7_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond7_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond7_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond7_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond7_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond7_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
        
    end
%     DATA(isubj).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);    
%     DATA(isubj).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
%     DATA(isubj).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    
    DATA(isubj).StdWithinCond7_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond7_within_pre_stdev);
    DATA(isubj).StdWithinCond7_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond7_within_post_stdev);
    DATA(isubj).StdWithinCond7_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond7_within_wholetrial_stdev);
    
    DATA(isubj).StdWithinCond7_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond7_within_pre_stdev);
    DATA(isubj).StdWithinCond7_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond7_within_post_stdev);
    DATA(isubj).StdWithinCond7_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond7_within_wholetrial_stdev);
    
    condnn=8;
    for trial=1:8
        DATA(isubj).StdWithinCond8_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond8_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond8_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond8_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond8_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond8_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond8_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond8_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    end
%     DATA(isubj).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
%     DATA(isubj).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
%     DATA(isubj).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    
    DATA(isubj).StdWithinCond8_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond8_within_pre_stdev);
    DATA(isubj).StdWithinCond8_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond8_within_post_stdev);
    DATA(isubj).StdWithinCond8_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond8_within_wholetrial_stdev);

    DATA(isubj).StdWithinCond8_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond8_within_pre_stdev);
    DATA(isubj).StdWithinCond8_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond8_within_post_stdev);
    DATA(isubj).StdWithinCond8_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond8_within_wholetrial_stdev);

    condnn=9;
    for trial=1:8
        DATA(isubj).StdWithinCond9_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond9_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond9_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond9_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond9_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond9_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond9_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond9_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    end
%     DATA(isubj).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);  
%     DATA(isubj).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
%     DATA(isubj).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    
    DATA(isubj).StdWithinCond9_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond9_within_pre_stdev);
    DATA(isubj).StdWithinCond9_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond9_within_post_stdev);
    DATA(isubj).StdWithinCond9_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond9_within_wholetrial_stdev);

    DATA(isubj).StdWithinCond9_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond9_within_pre_stdev);
    DATA(isubj).StdWithinCond9_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond9_within_post_stdev);
    DATA(isubj).StdWithinCond9_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond9_within_wholetrial_stdev);
    
    condnn=10;
    for trial=1:8
        DATA(isubj).StdWithinCond10_within_pre_stdev(trial)=nanstd(sorted_data(condnn).prestep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond10_within_post_stdev(trial)=nanstd(sorted_data(condnn).poststep_norm_to_targ(trial,:));
        DATA(isubj).StdWithinCond10_within_wholetrial_stdev(trial)=nanstd(sorted_data(condnn).wholetrial_norm_to_targ(trial,:));
        % amplitude
        DATA(isubj).StdWithinCond10_within_pre_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_prestep(trial,:));
        DATA(isubj).StdWithinCond10_within_post_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_poststep(trial,:));
        DATA(isubj).StdWithinCond10_within_wholetrial_stdev_AMP(trial)=nanstd(sorted_data(condnn).AMP_wholetrial(trial,:));
        %WT trial mean pitch
        DATA(isubj).WTtrialmeanpitch_cond10_pre(trial)=nanmean(sorted_data(condnn).prestep(trial,:));
        DATA(isubj).WTtrialmeanpitch_cond10_post(trial)=nanmean(sorted_data(condnn).poststep(trial,:));
        % distance from target
        DATA(isubj).cond(condnn).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
        DATA(isubj).cond(condnn).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
        DATA(isubj).cond(condnn).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);            
    end
%     DATA(isubj).distfromtarg_WT=nanmean(sorted_data(condnn).distfromtarg_WT);
%     DATA(isubj).distfromtarg_pre=nanmean(sorted_data(condnn).distfromtarg_PRE);
%     DATA(isubj).distfromtarg_post=nanmean(sorted_data(condnn).distfromtarg_POST);    
    
    DATA(isubj).StdWithinCond10_within_pre_meanstdev=nanmean(DATA(isubj).StdWithinCond10_within_pre_stdev);
    DATA(isubj).StdWithinCond10_within_post_meanstdev=nanmean(DATA(isubj).StdWithinCond10_within_post_stdev);
    DATA(isubj).StdWithinCond10_within_wholetrial_meanstdev=nanmean(DATA(isubj).StdWithinCond10_within_wholetrial_stdev);

    DATA(isubj).StdWithinCond10_within_pre_stdevstdev=nanstd(DATA(isubj).StdWithinCond10_within_pre_stdev);
    DATA(isubj).StdWithinCond10_within_post_stdevstdev=nanstd(DATA(isubj).StdWithinCond10_within_post_stdev);
    DATA(isubj).StdWithinCond10_within_wholetrial_stdevstdev=nanstd(DATA(isubj).StdWithinCond10_within_wholetrial_stdev);
    
    % individual subject stats
    DATA(isubj).STATS_comp1_pre_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_pre_stdev, DATA(isubj).StdWithinCond6_within_pre_stdev);
    DATA(isubj).STATS_comp2_pre_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_pre_stdev, DATA(isubj).StdWithinCond6_within_pre_stdev);
    DATA(isubj).STATS_comp3_pre_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_pre_stdev, DATA(isubj).StdWithinCond6_within_pre_stdev);
    DATA(isubj).STATS_comp4_pre_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_pre_stdev, DATA(isubj).StdWithinCond6_within_pre_stdev);
    DATA(isubj).STATS_comp5_pre_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_pre_stdev, DATA(isubj).StdWithinCond6_within_pre_stdev);
    DATA(isubj).STATS_comp1_post_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_post_stdev, DATA(isubj).StdWithinCond6_within_post_stdev);
    DATA(isubj).STATS_comp2_post_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_post_stdev, DATA(isubj).StdWithinCond6_within_post_stdev);
    DATA(isubj).STATS_comp3_post_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_post_stdev, DATA(isubj).StdWithinCond6_within_post_stdev);
    DATA(isubj).STATS_comp4_post_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_post_stdev, DATA(isubj).StdWithinCond6_within_post_stdev);
    DATA(isubj).STATS_comp5_post_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_post_stdev, DATA(isubj).StdWithinCond6_within_post_stdev);
    DATA(isubj).STATS_comp1_wholetrial_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_wholetrial_stdev, DATA(isubj).StdWithinCond6_within_wholetrial_stdev);
    DATA(isubj).STATS_comp2_wholetrial_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_wholetrial_stdev, DATA(isubj).StdWithinCond6_within_wholetrial_stdev);
    DATA(isubj).STATS_comp3_wholetrial_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_wholetrial_stdev, DATA(isubj).StdWithinCond6_within_wholetrial_stdev);
    DATA(isubj).STATS_comp4_wholetrial_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_wholetrial_stdev, DATA(isubj).StdWithinCond6_within_wholetrial_stdev);
    DATA(isubj).STATS_comp5_wholetrial_stdevwithin=ttest(DATA(isubj).StdWithinCond1_within_wholetrial_stdev, DATA(isubj).StdWithinCond6_within_wholetrial_stdev);
    
    save /Users/zagnew/Cereb_data/data_final_run/TrialData.mat DATA 
    
    
%% 2. Calculate mean and stdev *across* trial pitch for each subject
% could fix this..not sure what i  was thinking looping it like this?! 

    
    condition=1;
    for b=1:window_frames % frame loop
        mean_cond1_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond1_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond1_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond1_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    condition=2;
    for b=1:window_frames % frame loop
        mean_cond2_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond2_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond2_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond2_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    condition=3;
    for b=1:window_frames % frame loop
        mean_cond3_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond3_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond3_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond3_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    condition=4;
    for b=1:window_frames % frame loop
        mean_cond4_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond4_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond4_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond4_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    condition=5;
    for b=1:window_frames % frame loop
        mean_cond5_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond5_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond5_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond5_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    condition=6;
    for b=1:window_frames % frame loop
        mean_cond6_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond6_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond6_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond6_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    condition=7;
    for b=1:window_frames % frame loop
        mean_cond7_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond7_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond7_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond7_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    condition=8;
    for b=1:window_frames % frame loop
        mean_cond8_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond8_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond8_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond8_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    condition=9;
    for b=1:window_frames
        pre = sorted_data(condition).prestep(:,b);
        post = sorted_data(condition).poststep(:,b)
        mean_cond9_pre(b)=nanmean(pre);
        std_cond9_pre(b)=nanstd(post);
        mean_cond9_post(b)=nanmean(post);
        std_cond9_post(b)=nanstd(post);
    end
    
    condition=10;
    for b=1:window_frames  
        mean_cond10_pre(b)=nanmean(sorted_data(condition).prestep(:,b));
        std_cond10_pre(b)=nanstd(sorted_data(condition).poststep(:,b));
        mean_cond10_post(b)=nanmean(sorted_data(condition).poststep(:,b));
        std_cond10_post(b)=nanstd(sorted_data(condition).poststep(:,b));
    end
    
    % whole trial
    condition=1;
    for b=1:nframes_to_use  
        mean_cond1_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond1_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=2;
    for b=1:nframes_to_use  
        mean_cond2_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond2_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=3;
    for b=1:nframes_to_use  
        mean_cond3_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond3_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=4;
    for b=1:nframes_to_use  
        mean_cond4_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond4_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=5;
    for b=1:nframes_to_use  
        mean_cond5_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond5_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=6;
    for b=1:nframes_to_use  
        mean_cond6_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond6_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=7;
    for b=1:nframes_to_use  
        mean_cond7_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond7_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=8;
    for b=1:nframes_to_use  
        mean_cond8_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond8_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=9;
    for b=1:nframes_to_use  
        mean_cond9_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond9_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
    
    condition=10;
    for b=1:nframes_to_use  
        mean_cond10_wholetrial(b)=nanmean(sorted_data(condition).wholetrial(:,b));
        std_cond10_wholetrial(b)=nanstd(sorted_data(condition).wholetrial(:,b));
    end
      
%% write that to DATA.mat also
    
    DATA(isubj).mean_cond1_wholetrial=mean_cond1_wholetrial;
    DATA(isubj).mean_cond2_wholetrial=mean_cond2_wholetrial;
    DATA(isubj).mean_cond3_wholetrial=mean_cond3_wholetrial;
    DATA(isubj).mean_cond4_wholetrial=mean_cond4_wholetrial;
    DATA(isubj).mean_cond5_wholetrial=mean_cond5_wholetrial;
    DATA(isubj).mean_cond6_wholetrial=mean_cond6_wholetrial;
    DATA(isubj).mean_cond7_wholetrial=mean_cond7_wholetrial;
    DATA(isubj).mean_cond8_wholetrial=mean_cond8_wholetrial;
    DATA(isubj).mean_cond9_wholetrial=mean_cond9_wholetrial;
    DATA(isubj).mean_cond10_wholetrial=mean_cond10_wholetrial;
    DATA(isubj).mean_cond1_pre=mean_cond1_pre;
    DATA(isubj).mean_cond2_pre=mean_cond2_pre;
    DATA(isubj).mean_cond3_pre=mean_cond3_pre;
    DATA(isubj).mean_cond4_pre=mean_cond4_pre;
    DATA(isubj).mean_cond5_pre=mean_cond5_pre;
    DATA(isubj).mean_cond6_pre=mean_cond6_pre;
    DATA(isubj).mean_cond7_pre=mean_cond7_pre;
    DATA(isubj).mean_cond8_pre=mean_cond8_pre;
    DATA(isubj).mean_cond9_pre=mean_cond9_pre;
    DATA(isubj).mean_cond10_pre=mean_cond10_pre;
    
    DATA(isubj).mean_cond1_post=mean_cond1_post;
    DATA(isubj).mean_cond2_post=mean_cond2_post;
    DATA(isubj).mean_cond3_post=mean_cond3_post;
    DATA(isubj).mean_cond4_post=mean_cond4_post;
    DATA(isubj).mean_cond5_post=mean_cond5_post;
    DATA(isubj).mean_cond6_post=mean_cond6_post;
    DATA(isubj).mean_cond7_post=mean_cond7_post;
    DATA(isubj).mean_cond8_post=mean_cond8_post;
    DATA(isubj).mean_cond9_post=mean_cond9_post;
    DATA(isubj).mean_cond10_post=mean_cond10_post;
    close all
    cd(cerebellar_data_rootdir)
     
end

cd(cerebellar_data_rootdir)

%% (3) Write out only the subjects to use and save to DATA_TO_USE
DATA_TO_USE=DATA(allincluded);
    
%% ------------------------------------------------------------------------    
% distance from target
% DATA(17).cond(2).distfromtarg_WT

for condnn=1:10;
    GroupData(1).cond(condnn).distfromtarg_WT=[DATA(1).cond(condnn).distfromtarg_WT;DATA(2).cond(condnn).distfromtarg_WT;DATA(3).cond(condnn).distfromtarg_WT;...
        DATA(4).cond(condnn).distfromtarg_WT;DATA(5).cond(condnn).distfromtarg_WT;DATA(6).cond(condnn).distfromtarg_WT;...
        DATA(7).cond(condnn).distfromtarg_WT;DATA(8).cond(condnn).distfromtarg_WT;DATA(9).cond(condnn).distfromtarg_WT;...
        DATA(10).cond(condnn).distfromtarg_WT;DATA(11).cond(condnn).distfromtarg_WT;DATA(12).cond(condnn).distfromtarg_WT;...
        DATA(13).cond(condnn).distfromtarg_WT;DATA(14).cond(condnn).distfromtarg_WT;DATA(15).cond(condnn).distfromtarg_WT;...
        DATA(16).cond(condnn).distfromtarg_WT;DATA(17).cond(condnn).distfromtarg_WT;DATA(18).cond(condnn).distfromtarg_WT;...
        DATA(19).cond(condnn).distfromtarg_WT;DATA(20).cond(condnn).distfromtarg_WT;DATA(21).cond(condnn).distfromtarg_WT;...
        DATA(22).cond(condnn).distfromtarg_WT;DATA(23).cond(condnn).distfromtarg_WT;DATA(24).cond(condnn).distfromtarg_WT;...
        DATA(25).cond(condnn).distfromtarg_WT;DATA(26).cond(condnn).distfromtarg_WT;DATA(27).cond(condnn).distfromtarg_WT;...
        DATA(28).cond(condnn).distfromtarg_WT;DATA(29).cond(condnn).distfromtarg_WT;DATA(30).cond(condnn).distfromtarg_WT];
    
    GroupData(1).cond(condnn).distfromtarg_pre=[DATA(1).cond(condnn).distfromtarg_pre;DATA(2).cond(condnn).distfromtarg_pre;DATA(3).cond(condnn).distfromtarg_pre;...
        DATA(4).cond(condnn).distfromtarg_pre;DATA(5).cond(condnn).distfromtarg_pre;DATA(6).cond(condnn).distfromtarg_pre;...
        DATA(7).cond(condnn).distfromtarg_pre;DATA(8).cond(condnn).distfromtarg_pre;DATA(9).cond(condnn).distfromtarg_pre;...
        DATA(10).cond(condnn).distfromtarg_pre;DATA(11).cond(condnn).distfromtarg_pre;DATA(12).cond(condnn).distfromtarg_pre;...
        DATA(13).cond(condnn).distfromtarg_pre;DATA(14).cond(condnn).distfromtarg_pre;DATA(15).cond(condnn).distfromtarg_pre;...
        DATA(16).cond(condnn).distfromtarg_pre;DATA(17).cond(condnn).distfromtarg_pre;DATA(18).cond(condnn).distfromtarg_pre;...
        DATA(19).cond(condnn).distfromtarg_pre;DATA(20).cond(condnn).distfromtarg_pre;DATA(21).cond(condnn).distfromtarg_pre;...
        DATA(22).cond(condnn).distfromtarg_pre;DATA(23).cond(condnn).distfromtarg_pre;DATA(24).cond(condnn).distfromtarg_pre;...
        DATA(25).cond(condnn).distfromtarg_pre;DATA(26).cond(condnn).distfromtarg_pre;DATA(27).cond(condnn).distfromtarg_pre;...
        DATA(28).cond(condnn).distfromtarg_pre;DATA(29).cond(condnn).distfromtarg_pre;DATA(30).cond(condnn).distfromtarg_pre];
    
    GroupData(1).cond(condnn).distfromtarg_post=[DATA(1).cond(condnn).distfromtarg_post;DATA(2).cond(condnn).distfromtarg_post;DATA(3).cond(condnn).distfromtarg_post;...
        DATA(4).cond(condnn).distfromtarg_post;DATA(5).cond(condnn).distfromtarg_post;DATA(6).cond(condnn).distfromtarg_post;...
        DATA(7).cond(condnn).distfromtarg_post;DATA(8).cond(condnn).distfromtarg_post;DATA(9).cond(condnn).distfromtarg_post;...
        DATA(10).cond(condnn).distfromtarg_post;DATA(11).cond(condnn).distfromtarg_post;DATA(12).cond(condnn).distfromtarg_post;...
        DATA(13).cond(condnn).distfromtarg_post;DATA(14).cond(condnn).distfromtarg_post;DATA(15).cond(condnn).distfromtarg_post;...
        DATA(16).cond(condnn).distfromtarg_post;DATA(17).cond(condnn).distfromtarg_post;DATA(18).cond(condnn).distfromtarg_post;...
        DATA(19).cond(condnn).distfromtarg_post;DATA(20).cond(condnn).distfromtarg_post;DATA(21).cond(condnn).distfromtarg_post;...
        DATA(22).cond(condnn).distfromtarg_post;DATA(23).cond(condnn).distfromtarg_post;DATA(24).cond(condnn).distfromtarg_post;...
        DATA(25).cond(condnn).distfromtarg_post;DATA(26).cond(condnn).distfromtarg_post;DATA(27).cond(condnn).distfromtarg_post;...
        DATA(28).cond(condnn).distfromtarg_post;DATA(29).cond(condnn).distfromtarg_post;DATA(30).cond(condnn).distfromtarg_post]; 
end




% only include the subjects included
size(GroupData(1).cond(1).distfromtarg_WT)
for condnn=1:10
    GroupData(1).cond(condnn).distfromtarg_WT=GroupData(1).cond(condnn).distfromtarg_WT(allincluded,:)
    GroupData(1).cond(condnn).distfromtarg_pre=GroupData(1).cond(condnn).distfromtarg_pre(allincluded,:)    
    GroupData(1).cond(condnn).distfromtarg_post=GroupData(1).cond(condnn).distfromtarg_post(allincluded,:)    
end

% 
% %plot that
% figure
% for condnn=1:10
%     subplot(2, 5, condnn)
%     plot(frame_taxis(1:1360), nanmean(GroupData(1).cond(condnn).distfromtarg_WT), 'm')
% end



%% save all dis wutnot
save DATA DATA;
save DATA_TO_USE DATA_TO_USE;

save (['SS_meandata',num2str(isubj)]);
%  save '['SS_meancon1_post',num2str(isubj)]' mean_cond1_post



% pre window
origdata_cond1_pre = DATA_TO_USE(1).StdWithinCond1_within_pre_stdev;
GroupData.WT_patC1_pre = origdata_cond1_pre;
origdata_cond2_pre = DATA_TO_USE(1).StdWithinCond2_within_pre_stdev;
GroupData.WT_patC2_pre = origdata_cond2_pre;
origdata_cond3_pre = DATA_TO_USE(1).StdWithinCond3_within_pre_stdev;
GroupData.WT_patC3_pre = origdata_cond3_pre;
origdata_cond4_pre = DATA_TO_USE(1).StdWithinCond4_within_pre_stdev;
GroupData.WT_patC4_pre = origdata_cond4_pre;
origdata_cond5_pre = DATA_TO_USE(1).StdWithinCond5_within_pre_stdev;
GroupData.WT_patC5_pre = origdata_cond5_pre;
origdata_cond6_pre = DATA_TO_USE(1).StdWithinCond6_within_pre_stdev;
GroupData.WT_patC6_pre = origdata_cond6_pre;
origdata_cond7_pre = DATA_TO_USE(1).StdWithinCond7_within_pre_stdev;
GroupData.WT_patC7_pre = origdata_cond7_pre;
origdata_cond8_pre = DATA_TO_USE(1).StdWithinCond8_within_pre_stdev;
GroupData.WT_patC8_pre = origdata_cond8_pre;
origdata_cond9_pre = DATA_TO_USE(1).StdWithinCond9_within_pre_stdev;
GroupData.WT_patC9_pre = origdata_cond9_pre;
origdata_cond10_pre = DATA_TO_USE(1).StdWithinCond10_within_pre_stdev;
GroupData.WT_patC10_pre = origdata_cond10_pre;

for i = 2:length(patients_included)
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_pre_stdev;
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_pre_stdev;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_pre_stdev;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_pre_stdev;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_pre_stdev;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_pre_stdev;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_pre_stdev;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_pre_stdev;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_pre_stdev;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_pre_stdev;
    
    GroupData.WT_patC1_pre = [GroupData.WT_patC1_pre dataToAppend_cond1];
    GroupData.WT_patC2_pre = [GroupData.WT_patC2_pre dataToAppend_cond2];
    GroupData.WT_patC3_pre = [GroupData.WT_patC3_pre dataToAppend_cond3];
    GroupData.WT_patC4_pre = [GroupData.WT_patC4_pre dataToAppend_cond4];
    GroupData.WT_patC5_pre = [GroupData.WT_patC5_pre dataToAppend_cond5];
    GroupData.WT_patC6_pre = [GroupData.WT_patC6_pre dataToAppend_cond6];
    GroupData.WT_patC7_pre = [GroupData.WT_patC7_pre dataToAppend_cond7];
    GroupData.WT_patC8_pre = [GroupData.WT_patC8_pre dataToAppend_cond8];
    GroupData.WT_patC9_pre = [GroupData.WT_patC9_pre dataToAppend_cond9];
    GroupData.WT_patC10_pre = [GroupData.WT_patC10_pre dataToAppend_cond10];
end

%% post window
origdata_cond1_post = DATA_TO_USE(1).StdWithinCond1_within_post_stdev;
GroupData.WT_patC1_post = origdata_cond1_post;
origdata_cond2_post = DATA_TO_USE(1).StdWithinCond2_within_post_stdev;
GroupData.WT_patC2_post = origdata_cond2_post;
origdata_cond3_post = DATA_TO_USE(1).StdWithinCond3_within_post_stdev;
GroupData.WT_patC3_post = origdata_cond3_post;
origdata_cond4_post = DATA_TO_USE(1).StdWithinCond4_within_post_stdev;
GroupData.WT_patC4_post = origdata_cond4_post;
origdata_cond5_post = DATA_TO_USE(1).StdWithinCond5_within_post_stdev;
GroupData.WT_patC5_post = origdata_cond5_post;
origdata_cond6_post = DATA_TO_USE(1).StdWithinCond6_within_post_stdev;
GroupData.WT_patC6_post = origdata_cond6_post;
origdata_cond7_post = DATA_TO_USE(1).StdWithinCond7_within_post_stdev;
GroupData.WT_patC7_post = origdata_cond7_post;
origdata_cond8_post = DATA_TO_USE(1).StdWithinCond8_within_post_stdev;
GroupData.WT_patC8_post = origdata_cond8_post;
origdata_cond9_post = DATA_TO_USE(1).StdWithinCond9_within_post_stdev;
GroupData.WT_patC9_post = origdata_cond9_post;
origdata_cond10_post = DATA_TO_USE(1).StdWithinCond10_within_post_stdev;
GroupData.WT_patC10_post = origdata_cond10_post;

for i = 2:length(patients_included)
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_post_stdev;
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_post_stdev;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_post_stdev;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_post_stdev;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_post_stdev;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_post_stdev;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_post_stdev;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_post_stdev;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_post_stdev;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_post_stdev;
    
    GroupData.WT_patC1_post = [GroupData.WT_patC1_post dataToAppend_cond1];
    
    GroupData.WT_patC2_post = [GroupData.WT_patC2_post dataToAppend_cond2];
    GroupData.WT_patC3_post = [GroupData.WT_patC3_post dataToAppend_cond3];
    GroupData.WT_patC4_post = [GroupData.WT_patC4_post dataToAppend_cond4];
    GroupData.WT_patC5_post = [GroupData.WT_patC5_post dataToAppend_cond5];
    GroupData.WT_patC6_post = [GroupData.WT_patC6_post dataToAppend_cond6];
    GroupData.WT_patC7_post = [GroupData.WT_patC7_post dataToAppend_cond7];
    GroupData.WT_patC8_post = [GroupData.WT_patC8_post dataToAppend_cond8];
    GroupData.WT_patC9_post = [GroupData.WT_patC9_post dataToAppend_cond9];
    GroupData.WT_patC10_post = [GroupData.WT_patC10_post dataToAppend_cond10];
end


% check
DATA_TO_USE(1).StdWithinCond1_within_post_stdev % subject 1
% should be same as:
GroupData.WT_patC1_post(1, 1:8)

DATA_TO_USE(2).StdWithinCond1_within_post_stdev % subject 2
% should be same as:
GroupData.WT_patC1_post(1, 9:16)

%% wholetrial window
origdata_cond1_wholetrial = DATA_TO_USE(1).StdWithinCond1_within_wholetrial_stdev;
GroupData.WT_patC1_wholetrial = origdata_cond1_wholetrial;
origdata_cond2_wholetrial = DATA_TO_USE(1).StdWithinCond2_within_wholetrial_stdev;
GroupData.WT_patC2_wholetrial = origdata_cond2_wholetrial;
origdata_cond3_wholetrial = DATA_TO_USE(1).StdWithinCond3_within_wholetrial_stdev;
GroupData.WT_patC3_wholetrial = origdata_cond3_wholetrial;
origdata_cond4_wholetrial = DATA_TO_USE(1).StdWithinCond4_within_wholetrial_stdev;
GroupData.WT_patC4_wholetrial = origdata_cond4_wholetrial;
origdata_cond5_wholetrial = DATA_TO_USE(1).StdWithinCond5_within_wholetrial_stdev;
GroupData.WT_patC5_wholetrial = origdata_cond5_wholetrial;
origdata_cond6_wholetrial = DATA_TO_USE(1).StdWithinCond6_within_wholetrial_stdev;
GroupData.WT_patC6_wholetrial = origdata_cond6_wholetrial;
origdata_cond7_wholetrial = DATA_TO_USE(1).StdWithinCond7_within_wholetrial_stdev;
GroupData.WT_patC7_wholetrial = origdata_cond7_wholetrial;
origdata_cond8_wholetrial = DATA_TO_USE(1).StdWithinCond8_within_wholetrial_stdev;
GroupData.WT_patC8_wholetrial = origdata_cond8_wholetrial;
origdata_cond9_wholetrial = DATA_TO_USE(1).StdWithinCond9_within_wholetrial_stdev;
GroupData.WT_patC9_wholetrial = origdata_cond9_wholetrial;
origdata_cond10_wholetrial = DATA_TO_USE(1).StdWithinCond10_within_wholetrial_stdev;
GroupData.WT_patC10_wholetrial = origdata_cond10_wholetrial;

for i = 2:length(patients_included)
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_wholetrial_stdev;
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_wholetrial_stdev;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_wholetrial_stdev;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_wholetrial_stdev;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_wholetrial_stdev;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_wholetrial_stdev;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_wholetrial_stdev;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_wholetrial_stdev;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_wholetrial_stdev;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_wholetrial_stdev;
    
    GroupData.WT_patC1_wholetrial = [GroupData.WT_patC1_wholetrial dataToAppend_cond1];
    
    GroupData.WT_patC2_wholetrial = [GroupData.WT_patC2_wholetrial dataToAppend_cond2];
    GroupData.WT_patC3_wholetrial = [GroupData.WT_patC3_wholetrial dataToAppend_cond3];
    GroupData.WT_patC4_wholetrial = [GroupData.WT_patC4_wholetrial dataToAppend_cond4];
    GroupData.WT_patC5_wholetrial = [GroupData.WT_patC5_wholetrial dataToAppend_cond5];
    GroupData.WT_patC6_wholetrial = [GroupData.WT_patC6_wholetrial dataToAppend_cond6];
    GroupData.WT_patC7_wholetrial = [GroupData.WT_patC7_wholetrial dataToAppend_cond7];
    GroupData.WT_patC8_wholetrial = [GroupData.WT_patC8_wholetrial dataToAppend_cond8];
    GroupData.WT_patC9_wholetrial = [GroupData.WT_patC9_wholetrial dataToAppend_cond9];
    GroupData.WT_patC10_wholetrial = [GroupData.WT_patC10_wholetrial dataToAppend_cond10];
end

% check
DATA_TO_USE(1).StdWithinCond1_within_wholetrial_stdev % subject 1
% should be same as:
GroupData.WT_patC1_wholetrial(1, 1:8)

DATA_TO_USE(2).StdWithinCond1_within_wholetrial_stdev % subject 2
% should be same as:
GroupData.WT_patC1_wholetrial(1, 9:16)


%% HCs pre

origdata_cond1_pre = DATA_TO_USE(numpats+1).StdWithinCond1_within_pre_stdev; % HC number 1
GroupData.WT_HCC1_pre = origdata_cond1_pre;
origdata_cond2_pre = DATA_TO_USE(numpats+1).StdWithinCond2_within_pre_stdev;
GroupData.WT_HCC2_pre = origdata_cond2_pre;
origdata_cond3_pre = DATA_TO_USE(numpats+1).StdWithinCond3_within_pre_stdev;
GroupData.WT_HCC3_pre = origdata_cond3_pre;
origdata_cond4_pre = DATA_TO_USE(numpats+1).StdWithinCond4_within_pre_stdev;
GroupData.WT_HCC4_pre = origdata_cond4_pre;
origdata_cond5_pre = DATA_TO_USE(numpats+1).StdWithinCond5_within_pre_stdev;
GroupData.WT_HCC5_pre = origdata_cond5_pre;
origdata_cond6_pre = DATA_TO_USE(numpats+1).StdWithinCond6_within_pre_stdev;
GroupData.WT_HCC6_pre = origdata_cond6_pre;
origdata_cond7_pre = DATA_TO_USE(numpats+1).StdWithinCond7_within_pre_stdev;
GroupData.WT_HCC7_pre = origdata_cond7_pre;
origdata_cond8_pre = DATA_TO_USE(numpats+1).StdWithinCond8_within_pre_stdev;
GroupData.WT_HCC8_pre = origdata_cond8_pre;
origdata_cond9_pre = DATA_TO_USE(numpats+1).StdWithinCond9_within_pre_stdev;
GroupData.WT_HCC9_pre = origdata_cond9_pre;
origdata_cond10_pre = DATA_TO_USE(numpats+1).StdWithinCond10_within_pre_stdev;
GroupData.WT_HCC10_pre = origdata_cond10_pre;

for i = numpats+1:numsubs
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_pre_stdev; %not to be 2 but to be 
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_pre_stdev;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_pre_stdev;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_pre_stdev;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_pre_stdev;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_pre_stdev;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_pre_stdev;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_pre_stdev;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_pre_stdev;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_pre_stdev;
    
    GroupData.WT_HCC1_pre = [GroupData.WT_HCC1_pre dataToAppend_cond1];
    GroupData.WT_HCC2_pre = [GroupData.WT_HCC2_pre dataToAppend_cond2];
    GroupData.WT_HCC3_pre = [GroupData.WT_HCC3_pre dataToAppend_cond3];
    GroupData.WT_HCC4_pre = [GroupData.WT_HCC4_pre dataToAppend_cond4];
    GroupData.WT_HCC5_pre = [GroupData.WT_HCC5_pre dataToAppend_cond5];
    GroupData.WT_HCC6_pre = [GroupData.WT_HCC6_pre dataToAppend_cond6];
    GroupData.WT_HCC7_pre = [GroupData.WT_HCC7_pre dataToAppend_cond7];
    GroupData.WT_HCC8_pre = [GroupData.WT_HCC8_pre dataToAppend_cond8];
    GroupData.WT_HCC9_pre = [GroupData.WT_HCC9_pre dataToAppend_cond9];
    GroupData.WT_HCC10_pre = [GroupData.WT_HCC10_pre dataToAppend_cond10];
end

DATA_TO_USE(numpats+1).StdWithinCond1_within_pre_stdev % subject 1
% should be same as:
GroupData.WT_HCC1_pre(1, 1:8)

DATA_TO_USE(numpats+1).StdWithinCond1_within_pre_stdev % subject 2
% should be same as:
GroupData.WT_HCC1_pre(1, 9:16)

% post
origdata_cond1_post = DATA_TO_USE(numpats+1).StdWithinCond1_within_post_stdev; % HC number 1
GroupData.WT_HCC1_post = origdata_cond1_post;
origdata_cond2_post = DATA_TO_USE(numpats+1).StdWithinCond2_within_post_stdev;
GroupData.WT_HCC2_post = origdata_cond2_post;
origdata_cond3_post = DATA_TO_USE(numpats+1).StdWithinCond3_within_post_stdev;
GroupData.WT_HCC3_post = origdata_cond3_post;
origdata_cond4_post = DATA_TO_USE(numpats+1).StdWithinCond4_within_post_stdev;
GroupData.WT_HCC4_post = origdata_cond4_post;
origdata_cond5_post = DATA_TO_USE(numpats+1).StdWithinCond5_within_post_stdev;
GroupData.WT_HCC5_post = origdata_cond5_post;
origdata_cond6_post = DATA_TO_USE(numpats+1).StdWithinCond6_within_post_stdev;
GroupData.WT_HCC6_post = origdata_cond6_post;
origdata_cond7_post = DATA_TO_USE(numpats+1).StdWithinCond7_within_post_stdev;
GroupData.WT_HCC7_post = origdata_cond7_post;
origdata_cond8_post = DATA_TO_USE(numpats+1).StdWithinCond8_within_post_stdev;
GroupData.WT_HCC8_post = origdata_cond8_post;
origdata_cond9_post = DATA_TO_USE(numpats+1).StdWithinCond9_within_post_stdev;
GroupData.WT_HCC9_post = origdata_cond9_post;
origdata_cond10_post = DATA_TO_USE(numpats+1).StdWithinCond10_within_post_stdev;
GroupData.WT_HCC10_post = origdata_cond10_post;

for i = numpats+1:numsubs
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_post_stdev; %not to be 2 but to be 
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_post_stdev;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_post_stdev;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_post_stdev;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_post_stdev;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_post_stdev;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_post_stdev;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_post_stdev;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_post_stdev;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_post_stdev;
    
    GroupData.WT_HCC1_post = [GroupData.WT_HCC1_post dataToAppend_cond1];
    GroupData.WT_HCC2_post = [GroupData.WT_HCC2_post dataToAppend_cond2];
    GroupData.WT_HCC3_post = [GroupData.WT_HCC3_post dataToAppend_cond3];
    GroupData.WT_HCC4_post = [GroupData.WT_HCC4_post dataToAppend_cond4];
    GroupData.WT_HCC5_post = [GroupData.WT_HCC5_post dataToAppend_cond5];
    GroupData.WT_HCC6_post = [GroupData.WT_HCC6_post dataToAppend_cond6];
    GroupData.WT_HCC7_post = [GroupData.WT_HCC7_post dataToAppend_cond7];
    GroupData.WT_HCC8_post = [GroupData.WT_HCC8_post dataToAppend_cond8];
    GroupData.WT_HCC9_post = [GroupData.WT_HCC9_post dataToAppend_cond9];
    GroupData.WT_HCC10_post = [GroupData.WT_HCC10_post dataToAppend_cond10];
end

DATA_TO_USE(numpats+1).StdWithinCond1_within_post_stdev % subject 1
% should be same as:
GroupData.WT_HCC1_post(1, 1:8)

DATA_TO_USE(numpats+1).StdWithinCond1_within_post_stdev % subject 2
% should be same as:s
GroupData.WT_HCC1_post(1, 9:16)


% whole trial
origdata_cond1_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond1_within_wholetrial_stdev; % HC number 1
GroupData.WT_HCC1_wholetrial = origdata_cond1_wholetrial;
origdata_cond2_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond2_within_wholetrial_stdev;
GroupData.WT_HCC2_wholetrial = origdata_cond2_wholetrial;
origdata_cond3_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond3_within_wholetrial_stdev;
GroupData.WT_HCC3_wholetrial = origdata_cond3_wholetrial;
origdata_cond4_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond4_within_wholetrial_stdev;
GroupData.WT_HCC4_wholetrial = origdata_cond4_wholetrial;
origdata_cond5_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond5_within_wholetrial_stdev;
GroupData.WT_HCC5_wholetrial = origdata_cond5_wholetrial;
origdata_cond6_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond6_within_wholetrial_stdev;
GroupData.WT_HCC6_wholetrial = origdata_cond6_wholetrial;
origdata_cond7_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond7_within_wholetrial_stdev;
GroupData.WT_HCC7_wholetrial = origdata_cond7_wholetrial;
origdata_cond8_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond8_within_wholetrial_stdev;
GroupData.WT_HCC8_wholetrial = origdata_cond8_wholetrial;
origdata_cond9_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond9_within_wholetrial_stdev;
GroupData.WT_HCC9_wholetrial = origdata_cond9_wholetrial;
origdata_cond10_wholetrial = DATA_TO_USE(numpats+1).StdWithinCond10_within_wholetrial_stdev;
GroupData.WT_HCC10_wholetrial = origdata_cond10_wholetrial;

for i = numpats+1:numsubs
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_wholetrial_stdev; %not to be 2 but to be 
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_wholetrial_stdev;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_wholetrial_stdev;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_wholetrial_stdev;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_wholetrial_stdev;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_wholetrial_stdev;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_wholetrial_stdev;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_wholetrial_stdev;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_wholetrial_stdev;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_wholetrial_stdev;
    
    GroupData.WT_HCC1_wholetrial = [GroupData.WT_HCC1_wholetrial dataToAppend_cond1];
    GroupData.WT_HCC2_wholetrial = [GroupData.WT_HCC2_wholetrial dataToAppend_cond2];
    GroupData.WT_HCC3_wholetrial = [GroupData.WT_HCC3_wholetrial dataToAppend_cond3];
    GroupData.WT_HCC4_wholetrial = [GroupData.WT_HCC4_wholetrial dataToAppend_cond4];
    GroupData.WT_HCC5_wholetrial = [GroupData.WT_HCC5_wholetrial dataToAppend_cond5];
    GroupData.WT_HCC6_wholetrial = [GroupData.WT_HCC6_wholetrial dataToAppend_cond6];
    GroupData.WT_HCC7_wholetrial = [GroupData.WT_HCC7_wholetrial dataToAppend_cond7];
    GroupData.WT_HCC8_wholetrial = [GroupData.WT_HCC8_wholetrial dataToAppend_cond8];
    GroupData.WT_HCC9_wholetrial = [GroupData.WT_HCC9_wholetrial dataToAppend_cond9];
    GroupData.WT_HCC10_wholetrial = [GroupData.WT_HCC10_wholetrial dataToAppend_cond10];
end

DATA_TO_USE(numpats+1).StdWithinCond1_within_wholetrial_stdev % subject 1
% should be same as:
GroupData.WT_HCC1_wholetrial(1, 1:8)

DATA_TO_USE(numpats+1).StdWithinCond1_within_wholetrial_stdev % subject 2
% should be same as:
GroupData.WT_HCC1_wholetrial(1, 9:16)


%% AMP

origdata_cond1_pre_AMP = DATA_TO_USE(1).StdWithinCond1_within_pre_stdev_AMP;
GroupData.WT_patC1_pre_AMP = origdata_cond1_pre_AMP;
origdata_cond2_pre_AMP = DATA_TO_USE(1).StdWithinCond2_within_pre_stdev_AMP;
GroupData.WT_patC2_pre_AMP = origdata_cond2_pre_AMP;
origdata_cond3_pre_AMP = DATA_TO_USE(1).StdWithinCond3_within_pre_stdev_AMP;
GroupData.WT_patC3_pre_AMP = origdata_cond3_pre_AMP;
origdata_cond4_pre_AMP = DATA_TO_USE(1).StdWithinCond4_within_pre_stdev_AMP;
GroupData.WT_patC4_pre_AMP = origdata_cond4_pre_AMP;
origdata_cond5_pre_AMP = DATA_TO_USE(1).StdWithinCond5_within_pre_stdev_AMP;
GroupData.WT_patC5_pre_AMP = origdata_cond5_pre_AMP;
origdata_cond6_pre_AMP = DATA_TO_USE(1).StdWithinCond6_within_pre_stdev_AMP;
GroupData.WT_patC6_pre_AMP = origdata_cond6_pre_AMP;
origdata_cond7_pre_AMP = DATA_TO_USE(1).StdWithinCond7_within_pre_stdev_AMP;
GroupData.WT_patC7_pre_AMP = origdata_cond7_pre_AMP;
origdata_cond8_pre_AMP = DATA_TO_USE(1).StdWithinCond8_within_pre_stdev_AMP;
GroupData.WT_patC8_pre_AMP = origdata_cond8_pre_AMP;
origdata_cond9_pre_AMP = DATA_TO_USE(1).StdWithinCond9_within_pre_stdev_AMP;
GroupData.WT_patC9_pre_AMP = origdata_cond9_pre_AMP;
origdata_cond10_pre_AMP = DATA_TO_USE(1).StdWithinCond10_within_pre_stdev_AMP;
GroupData.WT_patC10_pre_AMP = origdata_cond10_pre_AMP;

for i = 2:length(patients_included)
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_pre_stdev_AMP;
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_pre_stdev_AMP;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_pre_stdev_AMP;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_pre_stdev_AMP;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_pre_stdev_AMP;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_pre_stdev_AMP;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_pre_stdev_AMP;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_pre_stdev_AMP;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_pre_stdev_AMP;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_pre_stdev_AMP;
    
    GroupData.WT_patC1_pre_AMP = [GroupData.WT_patC1_pre_AMP dataToAppend_cond1];
    GroupData.WT_patC2_pre_AMP = [GroupData.WT_patC2_pre_AMP dataToAppend_cond2];
    GroupData.WT_patC3_pre_AMP = [GroupData.WT_patC3_pre_AMP dataToAppend_cond3];
    GroupData.WT_patC4_pre_AMP = [GroupData.WT_patC4_pre_AMP dataToAppend_cond4];
    GroupData.WT_patC5_pre_AMP = [GroupData.WT_patC5_pre_AMP dataToAppend_cond5];
    GroupData.WT_patC6_pre_AMP = [GroupData.WT_patC6_pre_AMP dataToAppend_cond6];
    GroupData.WT_patC7_pre_AMP = [GroupData.WT_patC7_pre_AMP dataToAppend_cond7];
    GroupData.WT_patC8_pre_AMP = [GroupData.WT_patC8_pre_AMP dataToAppend_cond8];
    GroupData.WT_patC9_pre_AMP = [GroupData.WT_patC9_pre_AMP dataToAppend_cond9];
    GroupData.WT_patC10_pre_AMP = [GroupData.WT_patC10_pre_AMP dataToAppend_cond10];
end

% check
DATA_TO_USE(1).StdWithinCond1_within_pre_stdev_AMP % subject 1
% should be same as:
GroupData.WT_patC1_pre_AMP(1, 1:8)

DATA_TO_USE(2).StdWithinCond1_within_pre_stdev_AMP % subject 2
% should be same as:
GroupData.WT_patC1_pre_AMP(1, 9:16)


%% post window

origdata_cond1_post_AMP = DATA_TO_USE(1).StdWithinCond1_within_post_stdev_AMP;
GroupData.WT_patC1_post_AMP = origdata_cond1_post_AMP;
origdata_cond2_post_AMP = DATA_TO_USE(1).StdWithinCond2_within_post_stdev_AMP;
GroupData.WT_patC2_post_AMP = origdata_cond2_post_AMP;
origdata_cond3_post_AMP = DATA_TO_USE(1).StdWithinCond3_within_post_stdev_AMP;
GroupData.WT_patC3_post_AMP = origdata_cond3_post_AMP;
origdata_cond4_post_AMP = DATA_TO_USE(1).StdWithinCond4_within_post_stdev_AMP;
GroupData.WT_patC4_post_AMP = origdata_cond4_post_AMP;
origdata_cond5_post_AMP = DATA_TO_USE(1).StdWithinCond5_within_post_stdev_AMP;
GroupData.WT_patC5_post_AMP = origdata_cond5_post_AMP;
origdata_cond6_post_AMP = DATA_TO_USE(1).StdWithinCond6_within_post_stdev_AMP;
GroupData.WT_patC6_post_AMP = origdata_cond6_post_AMP;
origdata_cond7_post_AMP = DATA_TO_USE(1).StdWithinCond7_within_post_stdev_AMP;
GroupData.WT_patC7_post_AMP = origdata_cond7_post_AMP;
origdata_cond8_post_AMP = DATA_TO_USE(1).StdWithinCond8_within_post_stdev_AMP;
GroupData.WT_patC8_post_AMP = origdata_cond8_post_AMP;
origdata_cond9_post_AMP = DATA_TO_USE(1).StdWithinCond9_within_post_stdev_AMP;
GroupData.WT_patC9_post_AMP = origdata_cond9_post_AMP;
origdata_cond10_post_AMP = DATA_TO_USE(1).StdWithinCond10_within_post_stdev_AMP;
GroupData.WT_patC10_post_AMP = origdata_cond10_post_AMP;

for i = 2:length(patients_included)
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_post_stdev_AMP;
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_post_stdev_AMP;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_post_stdev_AMP;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_post_stdev_AMP;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_post_stdev_AMP;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_post_stdev_AMP;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_post_stdev_AMP;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_post_stdev_AMP;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_post_stdev_AMP;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_post_stdev_AMP;
    
    GroupData.WT_patC1_post_AMP = [GroupData.WT_patC1_post_AMP dataToAppend_cond1];
    GroupData.WT_patC2_post_AMP = [GroupData.WT_patC2_post_AMP dataToAppend_cond2];
    GroupData.WT_patC3_post_AMP = [GroupData.WT_patC3_post_AMP dataToAppend_cond3];
    GroupData.WT_patC4_post_AMP = [GroupData.WT_patC4_post_AMP dataToAppend_cond4];
    GroupData.WT_patC5_post_AMP = [GroupData.WT_patC5_post_AMP dataToAppend_cond5];
    GroupData.WT_patC6_post_AMP = [GroupData.WT_patC6_post_AMP dataToAppend_cond6];
    GroupData.WT_patC7_post_AMP = [GroupData.WT_patC7_post_AMP dataToAppend_cond7];
    GroupData.WT_patC8_post_AMP = [GroupData.WT_patC8_post_AMP dataToAppend_cond8];
    GroupData.WT_patC9_post_AMP = [GroupData.WT_patC9_post_AMP dataToAppend_cond9];
    GroupData.WT_patC10_post_AMP = [GroupData.WT_patC10_post_AMP dataToAppend_cond10];
end
% 
% % check
% DATA_TO_USE(1).StdWithinCond1_within_post_stdev_AMP % subject 1
% % should be same as:
% GroupData.WT_patC1_post_AMP(1, 1:8)
% 
% DATA_TO_USE(2).StdWithinCond1_within_post_stdev_AMP % subject 2
% % should be same as:
% GroupData.WT_patC1_post_AMP(1, 9:16)


%% wholetrial window
origdata_cond1_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond1_within_wholetrial_stdev_AMP;
GroupData.WT_patC1_wholetrial_AMP = origdata_cond1_wholetrial;
origdata_cond2_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond2_within_wholetrial_stdev_AMP;
GroupData.WT_patC2_wholetrial_AMP = origdata_cond2_wholetrial;
origdata_cond3_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond3_within_wholetrial_stdev_AMP;
GroupData.WT_patC3_wholetrial_AMP = origdata_cond3_wholetrial;
origdata_cond4_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond4_within_wholetrial_stdev_AMP;
GroupData.WT_patC4_wholetrial_AMP = origdata_cond4_wholetrial;
origdata_cond5_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond5_within_wholetrial_stdev_AMP;
GroupData.WT_patC5_wholetrial_AMP = origdata_cond5_wholetrial;
origdata_cond6_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond6_within_wholetrial_stdev_AMP;
GroupData.WT_patC6_wholetrial_AMP = origdata_cond6_wholetrial;
origdata_cond7_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond7_within_wholetrial_stdev_AMP;
GroupData.WT_patC7_wholetrial_AMP = origdata_cond7_wholetrial;
origdata_cond8_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond8_within_wholetrial_stdev_AMP;
GroupData.WT_patC8_wholetrial_AMP = origdata_cond8_wholetrial;
origdata_cond9_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond9_within_wholetrial_stdev_AMP;
GroupData.WT_patC9_wholetrial_AMP = origdata_cond9_wholetrial;
origdata_cond10_wholetrial_AMP = DATA_TO_USE(1).StdWithinCond10_within_wholetrial_stdev_AMP;
GroupData.WT_patC10_wholetrial_AMP = origdata_cond10_wholetrial;

for i = 2:length(patients_included)
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_wholetrial_stdev_AMP;
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_wholetrial_stdev_AMP;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_wholetrial_stdev_AMP;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_wholetrial_stdev_AMP;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_wholetrial_stdev_AMP;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_wholetrial_stdev_AMP;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_wholetrial_stdev_AMP;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_wholetrial_stdev_AMP;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_wholetrial_stdev_AMP;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_wholetrial_stdev_AMP;
    
    GroupData.WT_patC1_wholetrial_AMP = [GroupData.WT_patC1_wholetrial dataToAppend_cond1];
    
    GroupData.WT_patC2_wholetrial_AMP = [GroupData.WT_patC2_wholetrial dataToAppend_cond2];
    GroupData.WT_patC3_wholetrial_AMP = [GroupData.WT_patC3_wholetrial dataToAppend_cond3];
    GroupData.WT_patC4_wholetrial_AMP = [GroupData.WT_patC4_wholetrial dataToAppend_cond4];
    GroupData.WT_patC5_wholetrial_AMP = [GroupData.WT_patC5_wholetrial dataToAppend_cond5];
    GroupData.WT_patC6_wholetrial_AMP = [GroupData.WT_patC6_wholetrial dataToAppend_cond6];
    GroupData.WT_patC7_wholetrial_AMP = [GroupData.WT_patC7_wholetrial dataToAppend_cond7];
    GroupData.WT_patC8_wholetrial_AMP = [GroupData.WT_patC8_wholetrial dataToAppend_cond8];
    GroupData.WT_patC9_wholetrial_AMP = [GroupData.WT_patC9_wholetrial dataToAppend_cond9];
    GroupData.WT_patC10_wholetrial_AMP = [GroupData.WT_patC10_wholetrial dataToAppend_cond10];
end

% check
DATA_TO_USE(1).StdWithinCond1_within_wholetrial_stdev % subject 1
% should be same as:
GroupData.WT_patC1_wholetrial(1, 1:8)

DATA_TO_USE(2).StdWithinCond1_within_wholetrial_stdev % subject 2
% should be same as:
GroupData.WT_patC1_wholetrial(1, 9:16)




% HCS

origdata_cond1_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond1_within_pre_stdev_AMP; % HC number 1
GroupData.WT_HCC1_pre_AMP = origdata_cond1_pre_AMP;
origdata_cond2_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond2_within_pre_stdev_AMP;
GroupData.WT_HCC2_pre_AMP = origdata_cond2_pre_AMP;
origdata_cond3_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond3_within_pre_stdev_AMP;
GroupData.WT_HCC3_pre_AMP = origdata_cond3_pre_AMP;
origdata_cond4_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond4_within_pre_stdev_AMP;
GroupData.WT_HCC4_pre_AMP = origdata_cond4_pre_AMP;
origdata_cond5_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond5_within_pre_stdev_AMP;
GroupData.WT_HCC5_pre_AMP = origdata_cond5_pre_AMP;
origdata_cond6_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond6_within_pre_stdev_AMP;
GroupData.WT_HCC6_pre_AMP = origdata_cond6_pre_AMP;
origdata_cond7_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond7_within_pre_stdev_AMP;
GroupData.WT_HCC7_pre_AMP = origdata_cond7_pre_AMP;
origdata_cond8_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond8_within_pre_stdev_AMP;
GroupData.WT_HCC8_pre_AMP = origdata_cond8_pre_AMP;
origdata_cond9_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond9_within_pre_stdev_AMP;
GroupData.WT_HCC9_pre_AMP = origdata_cond9_pre_AMP;
origdata_cond10_pre_AMP = DATA_TO_USE(numpats+1).StdWithinCond10_within_pre_stdev_AMP;
GroupData.WT_HCC10_pre_AMP = origdata_cond10_pre_AMP;

for i = numpats+1:numsubs
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_pre_stdev_AMP; %not to be 2 but to be 
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_pre_stdev_AMP;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_pre_stdev_AMP;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_pre_stdev_AMP;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_pre_stdev_AMP;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_pre_stdev_AMP;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_pre_stdev_AMP;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_pre_stdev_AMP;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_pre_stdev_AMP;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_pre_stdev_AMP;
    
    GroupData.WT_HCC1_pre_AMP = [GroupData.WT_HCC1_pre_AMP dataToAppend_cond1];
    GroupData.WT_HCC2_pre_AMP = [GroupData.WT_HCC2_pre_AMP dataToAppend_cond2];
    GroupData.WT_HCC3_pre_AMP = [GroupData.WT_HCC3_pre_AMP dataToAppend_cond3];
    GroupData.WT_HCC4_pre_AMP = [GroupData.WT_HCC4_pre_AMP dataToAppend_cond4];
    GroupData.WT_HCC5_pre_AMP = [GroupData.WT_HCC5_pre_AMP dataToAppend_cond5];
    GroupData.WT_HCC6_pre_AMP = [GroupData.WT_HCC6_pre_AMP dataToAppend_cond6];
    GroupData.WT_HCC7_pre_AMP = [GroupData.WT_HCC7_pre_AMP dataToAppend_cond7];
    GroupData.WT_HCC8_pre_AMP = [GroupData.WT_HCC8_pre_AMP dataToAppend_cond8];
    GroupData.WT_HCC9_pre_AMP = [GroupData.WT_HCC9_pre_AMP dataToAppend_cond9];
    GroupData.WT_HCC10_pre_AMP = [GroupData.WT_HCC10_pre_AMP dataToAppend_cond10];
end

DATA_TO_USE(numpats+1).StdWithinCond1_within_pre_stdev_AMP ;% subject 1
% should be same as:
GroupData.WT_HCC1_pre_AMP(1, 1:8);

DATA_TO_USE(numpats+1).StdWithinCond1_within_pre_stdev % subject 2
% should be same as:
GroupData.WT_HCC1_pre(1, 9:16)



origdata_cond1_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond1_within_post_stdev_AMP; % HC number 1
GroupData.WT_HCC1_post_AMP = origdata_cond1_post_AMP;
origdata_cond2_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond2_within_post_stdev_AMP;
GroupData.WT_HCC2_post_AMP = origdata_cond2_post_AMP;
origdata_cond3_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond3_within_post_stdev_AMP;
GroupData.WT_HCC3_post_AMP = origdata_cond3_post_AMP;
origdata_cond4_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond4_within_post_stdev_AMP;
GroupData.WT_HCC4_post_AMP = origdata_cond4_post_AMP;
origdata_cond5_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond5_within_post_stdev_AMP;
GroupData.WT_HCC5_post_AMP = origdata_cond5_post_AMP;
origdata_cond6_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond6_within_post_stdev_AMP;
GroupData.WT_HCC6_post_AMP = origdata_cond6_post_AMP;
origdata_cond7_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond7_within_post_stdev_AMP;
GroupData.WT_HCC7_post_AMP = origdata_cond7_post_AMP;
origdata_cond8_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond8_within_post_stdev_AMP;
GroupData.WT_HCC8_post_AMP = origdata_cond8_post_AMP;
origdata_cond9_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond9_within_post_stdev_AMP;
GroupData.WT_HCC9_post_AMP = origdata_cond9_post_AMP;
origdata_cond10_post_AMP = DATA_TO_USE(numpats+1).StdWithinCond10_within_post_stdev_AMP;
GroupData.WT_HCC10_post_AMP = origdata_cond10_post_AMP;

for i = numpats+1:numsubs
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_post_stdev_AMP; %not to be 2 but to be 
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_post_stdev_AMP;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_post_stdev_AMP;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_post_stdev_AMP;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_post_stdev_AMP;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_post_stdev_AMP;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_post_stdev_AMP;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_post_stdev_AMP;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_post_stdev_AMP;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_post_stdev_AMP;
    
    GroupData.WT_HCC1_post_AMP = [GroupData.WT_HCC1_post_AMP dataToAppend_cond1];
    GroupData.WT_HCC2_post_AMP = [GroupData.WT_HCC2_post_AMP dataToAppend_cond2];
    GroupData.WT_HCC3_post_AMP = [GroupData.WT_HCC3_post_AMP dataToAppend_cond3];
    GroupData.WT_HCC4_post_AMP = [GroupData.WT_HCC4_post_AMP dataToAppend_cond4];
    GroupData.WT_HCC5_post_AMP = [GroupData.WT_HCC5_post_AMP dataToAppend_cond5];
    GroupData.WT_HCC6_post_AMP = [GroupData.WT_HCC6_post_AMP dataToAppend_cond6];
    GroupData.WT_HCC7_post_AMP = [GroupData.WT_HCC7_post_AMP dataToAppend_cond7];
    GroupData.WT_HCC8_post_AMP = [GroupData.WT_HCC8_post_AMP dataToAppend_cond8];
    GroupData.WT_HCC9_post_AMP = [GroupData.WT_HCC9_post_AMP dataToAppend_cond9];
    GroupData.WT_HCC10_post_AMP = [GroupData.WT_HCC10_post_AMP dataToAppend_cond10];
end

DATA_TO_USE(numpats+1).StdWithinCond1_within_post_stdev_AMP % subject 1
% should be same as:
GroupData.WT_HCC1_post_AMP(1, 1:8)

DATA_TO_USE(numpats+1).StdWithinCond1_within_post_stdev_AMP % subject 2
% should be same as:
GroupData.WT_HCC1_post_AMP(1, 9:16)


% whole trial

origdata_cond1_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond1_within_wholetrial_stdev_AMP; % HC number 1
GroupData.WT_HCC1_wholetrial_AMP = origdata_cond1_wholetrial_AMP;
origdata_cond2_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond2_within_wholetrial_stdev_AMP;
GroupData.WT_HCC2_wholetrial_AMP = origdata_cond2_wholetrial_AMP;
origdata_cond3_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond3_within_wholetrial_stdev_AMP;
GroupData.WT_HCC3_wholetrial_AMP = origdata_cond3_wholetrial_AMP;
origdata_cond4_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond4_within_wholetrial_stdev_AMP;
GroupData.WT_HCC4_wholetrial_AMP = origdata_cond4_wholetrial_AMP;
origdata_cond5_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond5_within_wholetrial_stdev_AMP;
GroupData.WT_HCC5_wholetrial_AMP = origdata_cond5_wholetrial_AMP;
origdata_cond6_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond6_within_wholetrial_stdev_AMP;
GroupData.WT_HCC6_wholetrial_AMP = origdata_cond6_wholetrial_AMP;
origdata_cond7_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond7_within_wholetrial_stdev_AMP;
GroupData.WT_HCC7_wholetrial_AMP = origdata_cond7_wholetrial_AMP;
origdata_cond8_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond8_within_wholetrial_stdev_AMP;
GroupData.WT_HCC8_wholetrial_AMP = origdata_cond8_wholetrial_AMP;
origdata_cond9_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond9_within_wholetrial_stdev_AMP;
GroupData.WT_HCC9_wholetrial_AMP = origdata_cond9_wholetrial_AMP;
origdata_cond10_wholetrial_AMP = DATA_TO_USE(numpats+1).StdWithinCond10_within_wholetrial_stdev_AMP;
GroupData.WT_HCC10_wholetrial_AMP = origdata_cond10_wholetrial_AMP;

for i = numpats+1:numsubs
    dataToAppend_cond1 = DATA_TO_USE(i).StdWithinCond1_within_wholetrial_stdev_AMP; %not to be 2 but to be 
    dataToAppend_cond2 = DATA_TO_USE(i).StdWithinCond2_within_wholetrial_stdev_AMP;
    dataToAppend_cond3 = DATA_TO_USE(i).StdWithinCond3_within_wholetrial_stdev_AMP;
    dataToAppend_cond4 = DATA_TO_USE(i).StdWithinCond4_within_wholetrial_stdev_AMP;
    dataToAppend_cond5 = DATA_TO_USE(i).StdWithinCond5_within_wholetrial_stdev_AMP;
    dataToAppend_cond6 = DATA_TO_USE(i).StdWithinCond6_within_wholetrial_stdev_AMP;
    dataToAppend_cond7 = DATA_TO_USE(i).StdWithinCond7_within_wholetrial_stdev_AMP;
    dataToAppend_cond8 = DATA_TO_USE(i).StdWithinCond8_within_wholetrial_stdev_AMP;
    dataToAppend_cond9 = DATA_TO_USE(i).StdWithinCond9_within_wholetrial_stdev_AMP;
    dataToAppend_cond10 = DATA_TO_USE(i).StdWithinCond10_within_wholetrial_stdev_AMP;
    
    GroupData.WT_HCC1_wholetrial_AMP = [GroupData.WT_HCC1_wholetrial_AMP dataToAppend_cond1];
    GroupData.WT_HCC2_wholetrial_AMP = [GroupData.WT_HCC2_wholetrial_AMP dataToAppend_cond2];
    GroupData.WT_HCC3_wholetrial_AMP = [GroupData.WT_HCC3_wholetrial_AMP dataToAppend_cond3];
    GroupData.WT_HCC4_wholetrial_AMP = [GroupData.WT_HCC4_wholetrial_AMP dataToAppend_cond4];
    GroupData.WT_HCC5_wholetrial_AMP = [GroupData.WT_HCC5_wholetrial_AMP dataToAppend_cond5];
    GroupData.WT_HCC6_wholetrial_AMP = [GroupData.WT_HCC6_wholetrial_AMP dataToAppend_cond6];
    GroupData.WT_HCC7_wholetrial_AMP = [GroupData.WT_HCC7_wholetrial_AMP dataToAppend_cond7];
    GroupData.WT_HCC8_wholetrial_AMP = [GroupData.WT_HCC8_wholetrial_AMP dataToAppend_cond8];
    GroupData.WT_HCC9_wholetrial_AMP = [GroupData.WT_HCC9_wholetrial_AMP dataToAppend_cond9];
    GroupData.WT_HCC10_wholetrial_AMP = [GroupData.WT_HCC10_wholetrial_AMP dataToAppend_cond10];
end

DATA_TO_USE(numpats+1).StdWithinCond1_within_wholetrial_stdev_AMP % subject 1
% should be same as:
GroupData.WT_HCC1_wholetrial_AMP(1, 1:8)

DATA_TO_USE(numpats+1).StdWithinCond1_within_wholetrial_stdev_AMP % subject 2
% should be same as:
GroupData.WT_HCC1_wholetrial_AMP(1, 9:16)




%% calculate early and late distance from target

calc_early_late_distfromtarg;

save GroupData/GroupData.mat GroupData

%% plotting

    