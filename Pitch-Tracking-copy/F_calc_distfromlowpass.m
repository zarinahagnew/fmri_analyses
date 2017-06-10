%% Calc mean distance from low pass filtered for each trial from sorted_data.m
% Takes sorted data and calculates the distance from the low pass filtered version
% ZKA Feb 2015

% does 4 things

% 1. Calculates the within trial mean distance fromlow pass filtered data (WTmeandistLPF). 
% This is a measure of the magnitude of high freq variability. 

% 2. Calculates the within trial stdev of distance from low pass filtered data (WTstddistLPF). 
% This is a measure of variability in the distance from the low pass filtered data. 

% 3. Across trial mean distance fromlow pass filtered data (AcTmeandistLPF). 

% 4. Across trial trial stdev of distance from low pass filtered data (AcTstddistLPF). 


close all
clear all
set_params_pitchtracking;

cd(cerebellar_data_rootdir);
% 
% npatients = 0;
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB02/expr2014.03.21.T12.33.58_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB03/expr2014.03.21.T14.35.35_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB04/expr2014.03.21.T17.20.11_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB05/expr2014.03.21.T18.50.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB06/expr2014.03.22.T11.05.45_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB07/expr2014.03.22.T12.15.42_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB08/expr2014.03.22.T14.01.48_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB09/expr2014.03.22.T15.52.01_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB10/expr2014.03.22.T16.37.44_mainrun/speak/';
% npatients = npatients+ 1;
% patient_info{npatients}.exprdir = 'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB12/expr2014.03.23.T11.03.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/';
% 
% % % HCS
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC01/expr2014.05.06.T12.36.43_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC02/expr2014.06.17.T12.53.53_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC03/expr2014.06.17.T13.50.36_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC04/expr2014.06.17.T16.22.20_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC05/expr2014.06.18.T15.14.02_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC06/expr2014.06.18.T16.18.27_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC07/expr2014.07.25.T10.29.55_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC08/expr2014.08.14.T15.57.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC09/expr2014.09.21.T14.17.36_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC12/expr2015.05.11.T11.18.14_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC13/expr2015.05.11.T11.53.19_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC14/expr2015.05.11.T12.28.56_mainrun/speak/';


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
%     samples2get = length(pitchdata.data(2,:));
%     fs = 11025;
%     framef = fs/32;
%     nframes_per_trial = pitchdata.nvecs;
%     taxis = (0:(samples2get-1))/fs;
%     frame_taxis = (0:(nframes_per_trial-1))/framef;
     cd (the_expr_dir);

    % writes all data into one structure called 'DATA'
    DATA_ALLSUBS(isubj).distfromlowasspass= load (sprintf('%ssorted_data.mat',patient_info{isubj}.exprdir));  
end

DATA_DIST=DATA_ALLSUBS(allincluded);

%% put all data into one matrix
for cond=1:10
Pat_data_distlowpass(cond).data=vertcat( ...
    DATA_DIST(1).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(2).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(3).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(4).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(5).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(6).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(7).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(8).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(9).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(10).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(11).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt); 
%     DATA(12).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(13).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(14).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(15).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(16).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt);

HC_data_distlowpass(cond).data=vertcat( ...
    DATA_DIST(12).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(13).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(14).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
    DATA_DIST(15).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt); 
%     DATA(16).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt);
%     
%     DATA(17).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(18).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(19).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(20).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(21).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(22).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(23).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(24).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(25).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(26).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt, ...
%     DATA(27).distfromlowasspass(1).sorted_data(cond).goodpitchdata_difflowpassfilt);

end

save DATA_DIST DATA_DIST

%plot all conds per subject
for isubj=1:15
    figure
    for icond=1:10
        subplot(5, 2, icond)
        plot(nanmean(DATA_DIST(isubj).distfromlowasspass(1).sorted_data(icond).goodpitchdata_difflowpassfilt), 'k')
        axis([0 1000 -150 150])
        goodplot
    end
    filename = sprintf('/Users/zagnew/Cereb_data/data/figures/EachSub_meandistanceLFP/EachSub_meanAcT_distLFP%d', isubj);
    %print(gcf, '-dpdf', '-r150', 'filenamemoo');
    % pause
end

% ZED issue
two=nanmean(DATA_DIST(4).distfromlowasspass(1).sorted_data(3).goodpitchdata_difflowpassfilt);
one=nanmean(DATA_DIST(4).distfromlowasspass(1).sorted_data(5).goodpitchdata_difflowpassfilt);

cd(cerebellar_data_rootdir)
save /Users/zagnew/Cereb_data/data_final_run/GroupData/distancefromtarg/DATA_DIST DATA_DIST

countgdtrials;

% all these use individial trial data and model subject as random factor. 
% calc_mean_AcT_clear_noise;
% 
% 
calc_stdev_AcT_clear_noise;

calc_stdev_WT_clear_noise;

% this was the one that finally worked. I realised that by merging all
% conditions toegether i might be loosing some result. This script takes
% the mean pitch track for each subject, for each condition, calcs the LPF
% version, and the distance between the two. It makes all the negative
% distance values positive, then looks at the across trial mean and stdev,
% and the within trial mean and standard dev. 
calc_by_cond_frommeantrack;

% this looks at distance from LPF from each individual trial. In the end
% there were too many nan trials so I decided on the next approach. 
calc_mean_AcT_allcondssep;

% 
% % perform stats on each subject mean data
% 
% %% calculate WT mean and ST on each subject mean
% 
% %% calcluate AcT mean and stdev
% for isub=1:length(allincluded)
%     for icond=1:10
%         eachsub_meandistFLP(isub).cond(icond,:)=nanmean(DATA_DIST(isub).distfromlowasspass(1).sorted_data(icond).goodpitchdata_difflowpassfilt);
%     end
% end
% 
% %separate into patients and HCs
% for isub=1:numpats
%     for icond=1:10
%         eachsub_meanWT_distFLP_pat(isub).cond(icond,:)=nanmean(eachsub_meandistFLP(isub).cond(icond,:));
%         eachsub_stdWT_distFLP_pat(isub).cond(icond,:)=nanstd(eachsub_meandistFLP(isub).cond(icond,:));
%     end
% end
% 
% for isub=1:numHCs
%     for icond=1:10
%         eachsub_meanWT_distFLP_HC(isub).cond(icond,:)=nanmean(eachsub_meandistFLP(isub+numpats).cond(icond,:));
%         eachsub_stdWT_distFLP_HC(isub).cond(icond,:)=nanstd(eachsub_meandistFLP(isub+numpats).cond(icond,:));
%     end
% end
% 
% % for anova
% for icond=1:10
%     anova_data_meanWTdist_pats(icond,:)=[eachsub_meanWT_distFLP_pat(1).cond(icond) eachsub_meanWT_distFLP_pat(2).cond(icond) ...
%         eachsub_meanWT_distFLP_pat(3).cond(icond) eachsub_meanWT_distFLP_pat(4).cond(icond) ...
%         eachsub_meanWT_distFLP_pat(5).cond(icond) eachsub_meanWT_distFLP_pat(6).cond(icond) ...
%         eachsub_meanWT_distFLP_pat(7).cond(icond) eachsub_meanWT_distFLP_pat(8).cond(icond) ...
%         eachsub_meanWT_distFLP_pat(9).cond(icond) eachsub_meanWT_distFLP_pat(10).cond(icond) ...
%         eachsub_meanWT_distFLP_pat(11).cond(icond)];
%     
%     anova_data_meanWTdist_HCs(icond,:)=[eachsub_meanWT_distFLP_HC(1).cond(icond) eachsub_meanWT_distFLP_HC(2).cond(icond) ...
%         eachsub_meanWT_distFLP_HC(3).cond(icond) eachsub_meanWT_distFLP_HC(4).cond(icond)];
%     
%     anova_data_stdWTdist_pats(icond,:)=[eachsub_stdWT_distFLP_pat(1).cond(icond) eachsub_stdWT_distFLP_pat(2).cond(icond) ...
%         eachsub_stdWT_distFLP_pat(3).cond(icond) eachsub_stdWT_distFLP_pat(4).cond(icond) ...
%         eachsub_stdWT_distFLP_pat(5).cond(icond) eachsub_stdWT_distFLP_pat(6).cond(icond) ...
%         eachsub_stdWT_distFLP_pat(7).cond(icond) eachsub_stdWT_distFLP_pat(8).cond(icond) ...
%         eachsub_stdWT_distFLP_pat(9).cond(icond) eachsub_stdWT_distFLP_pat(10).cond(icond) ...
%         eachsub_stdWT_distFLP_pat(11).cond(icond)];
%     
%     anova_data_meanWTdist_HCs(icond,:)=[eachsub_stdWT_distFLP_HC(1).cond(icond) eachsub_stdWT_distFLP_HC(2).cond(icond) ...
%         eachsub_stdWT_distFLP_HC(3).cond(icond) eachsub_stdWT_distFLP_HC(4).cond(icond)];    
% end
% 
% %check
% nanmean(eachsub_meandistFLP(12).cond(1,:))
% eachsub_meanWT_distFLP_HC(1).cond(1)
% 
% % sep patients and HCs
% % patients_meandistFLP=eachsub_meanWT_distFLP(1:11);
% % HCs_meandistFLP=eachsub_meanWT_distFLP(12:15);
% % patients_std_distFLP=eachsub_stdWT_distFLP(1:11);
% % HCs_std_distFLP=eachsub_stdWT_distFLP(12:15);
% 
% 
% % calc group mean by condition
% for icond=1:10
%     gpmean_meanWTdist_LPF_pats(icond)=nanmean(anova_data_meanWTdist_pats(icond,:));
%     gpmean_stdWTdist_LPF_pats(icond)=nanmean(anova_data_meanWTdist_pats(icond,:));
%     gpmean_meanWTdist_LPF_HCs(icond)=nanmean(anova_data_meanWTdist_HCs(icond,:));
%     gpmean_stdWTdist_LPF_HCs(icond)=nanmean(anova_data_meanWTdist_HCs(icond,:));
% end
% 
% % calculate SEM
% gpmean_SEM_dist_LPF_pats=nanstd(anova_data_meanWTdist_pats(1,:))/sqrt
% 
% anova_data_meanWTdist_pats(icond,:)
% 
% ttest2(gpmean_meanWTdist_LPF_pats,gpmean_meanWTdist_LPF_HCs)
% ttest2(gpmean_stdWTdist_LPF_pats,gpmean_stdWTdist_LPF_HCs)
% ttest(gpmean_meanWTdist_LPF_pats(1:5),gpmean_meanWTdist_LPF_pats(6:10))
% ttest(gpmean_stdWTdist_LPF_HCs(1:5),gpmean_stdWTdist_LPF_HCs(6:10))
% 
% anova_data=[gpmean_stdWTdist_LPF_HCs gpmean_meanWTdist_LPF_pats];
% 
% 
% 
% 
% nicebar(data_z, SEM_z, title_z)
% 
% data_z=[gpmean_meanWTdist_LPF_pats(1:5);gpmean_meanWTdist_LPF_pats(6:10)]
% SEM_z
% 
% figure
% subplot(211)
% bar(1:5,gpmean_meanWTdist_LPF_pats(1:5), 'k')
% hold on
% bar(6:10, gpmean_meanWTdist_LPF_pats(6:10), 'w')
% title('WT mean variability - pats')
% xlabel('conditions 1:10')
% axis([0 11 0 30])
% goodplot
% 
% subplot(212)
% bar(1:5,gpmean_meanWTdist_LPF_HCs(1:5), 'k')
% hold on
% bar(6:10, gpmean_meanWTdist_LPF_HCs(6:10), 'w')
% title('WT mean variability - HCs')
% xlabel('conditions 1:10')
% axis([0 11 0 30])
% goodplot
% 
% print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/gpmean_meanWTdist_LPF_pats.pdf');
% 
% figure
% subplot(211)
% bar(1:5,gpmean_stdWTdist_LPF_pats(1:5), 'k')
% hold on
% bar(6:10, gpmean_stdWTdist_LPF_pats(6:10), 'w')
% title('WT stdev variability - Pats')
% ylabel('                                 distance from LPF (cents)')
% xlabel('conditions 1:10')
% axis([0 11 0 30])
% 
% goodplot
% 
% subplot(212)
% bar(1:5,gpmean_stdWTdist_LPF_HCs(1:5), 'k')
% hold on
% bar(6:10, gpmean_stdWTdist_LPF_HCs(6:10), 'w')
% title('WT stdev variability - HCs')
% xlabel('conditions 1:10')
% axis([0 11 0 30])
% goodplot
% 
% print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/gpmean_stdWTdist_LPF_pats.pdf');
% 
% 


