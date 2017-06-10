
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

GroupMeans.pat.pre_AMPWTstdev(1)=nanmean(GroupData.WT_patC1_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(2)=nanmean(GroupData.WT_patC2_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(3)=nanmean(GroupData.WT_patC3_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(4)=nanmean(GroupData.WT_patC4_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(5)=nanmean(GroupData.WT_patC5_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(6)=nanmean(GroupData.WT_patC6_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(7)=nanmean(GroupData.WT_patC7_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(8)=nanmean(GroupData.WT_patC8_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(9)=nanmean(GroupData.WT_patC9_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(10)=nanmean(GroupData.WT_patC10_pre_AMP);


GroupMeans.pat.post_AMPWTstdev(1)=nanmean(GroupData.WT_patC1_post_AMP);
GroupMeans.pat.post_AMPWTstdev(2)=nanmean(GroupData.WT_patC2_post_AMP);
GroupMeans.pat.post_AMPWTstdev(3)=nanmean(GroupData.WT_patC3_post_AMP);
GroupMeans.pat.post_AMPWTstdev(4)=nanmean(GroupData.WT_patC4_post_AMP);
GroupMeans.pat.post_AMPWTstdev(5)=nanmean(GroupData.WT_patC5_post_AMP);
GroupMeans.pat.post_AMPWTstdev(6)=nanmean(GroupData.WT_patC6_post_AMP);
GroupMeans.pat.post_AMPWTstdev(7)=nanmean(GroupData.WT_patC7_post_AMP);
GroupMeans.pat.post_AMPWTstdev(8)=nanmean(GroupData.WT_patC8_post_AMP);
GroupMeans.pat.post_AMPWTstdev(9)=nanmean(GroupData.WT_patC9_post_AMP);
GroupMeans.pat.post_AMPWTstdev(10)=nanmean(GroupData.WT_patC10_post_AMP);
        
GroupMeans.pat.wholetrial_AMPWTstdev(1)=nanmean(GroupData.WT_patC1_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(2)=nanmean(GroupData.WT_patC2_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(3)=nanmean(GroupData.WT_patC3_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(4)=nanmean(GroupData.WT_patC4_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(5)=nanmean(GroupData.WT_patC5_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(6)=nanmean(GroupData.WT_patC6_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(7)=nanmean(GroupData.WT_patC7_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(8)=nanmean(GroupData.WT_patC8_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(9)=nanmean(GroupData.WT_patC9_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(10)=nanmean(GroupData.WT_patC10_wholetrial_AMP);
       
GroupMeans.pat.pre_AMPWTstdev(1)=nanmean(GroupData.WT_patC1_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(2)=nanmean(GroupData.WT_patC2_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(3)=nanmean(GroupData.WT_patC3_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(4)=nanmean(GroupData.WT_patC4_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(5)=nanmean(GroupData.WT_patC5_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(6)=nanmean(GroupData.WT_patC6_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(7)=nanmean(GroupData.WT_patC7_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(8)=nanmean(GroupData.WT_patC8_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(9)=nanmean(GroupData.WT_patC9_pre_AMP);
GroupMeans.pat.pre_AMPWTstdev(10)=nanmean(GroupData.WT_patC10_pre_AMP);

GroupMeans.pat.post_AMPWTstdev(1)=nanmean(GroupData.WT_patC1_post_AMP);
GroupMeans.pat.post_AMPWTstdev(2)=nanmean(GroupData.WT_patC2_post_AMP);
GroupMeans.pat.post_AMPWTstdev(3)=nanmean(GroupData.WT_patC3_post_AMP);
GroupMeans.pat.post_AMPWTstdev(4)=nanmean(GroupData.WT_patC4_post_AMP);
GroupMeans.pat.post_AMPWTstdev(5)=nanmean(GroupData.WT_patC5_post_AMP);
GroupMeans.pat.post_AMPWTstdev(6)=nanmean(GroupData.WT_patC6_post_AMP);
GroupMeans.pat.post_AMPWTstdev(7)=nanmean(GroupData.WT_patC7_post_AMP);
GroupMeans.pat.post_AMPWTstdev(8)=nanmean(GroupData.WT_patC8_post_AMP);
GroupMeans.pat.post_AMPWTstdev(9)=nanmean(GroupData.WT_patC9_post_AMP);
GroupMeans.pat.post_AMPWTstdev(10)=nanmean(GroupData.WT_patC10_post_AMP);
        
GroupMeans.pat.wholetrial_AMPWTstdev(1)=nanmean(GroupData.WT_patC1_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(2)=nanmean(GroupData.WT_patC2_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(3)=nanmean(GroupData.WT_patC3_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(4)=nanmean(GroupData.WT_patC4_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(5)=nanmean(GroupData.WT_patC5_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(6)=nanmean(GroupData.WT_patC6_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(7)=nanmean(GroupData.WT_patC7_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(8)=nanmean(GroupData.WT_patC8_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(9)=nanmean(GroupData.WT_patC9_wholetrial_AMP);
GroupMeans.pat.wholetrial_AMPWTstdev(10)=nanmean(GroupData.WT_patC10_wholetrial_AMP);
        
GroupMeans.HC.pre_AMPWTstdev(1)=nanmean(GroupData.WT_HCC1_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(2)=nanmean(GroupData.WT_HCC2_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(3)=nanmean(GroupData.WT_HCC3_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(4)=nanmean(GroupData.WT_HCC4_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(5)=nanmean(GroupData.WT_HCC5_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(6)=nanmean(GroupData.WT_HCC6_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(7)=nanmean(GroupData.WT_HCC7_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(8)=nanmean(GroupData.WT_HCC8_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(9)=nanmean(GroupData.WT_HCC9_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(10)=nanmean(GroupData.WT_HCC10_pre_AMP);

GroupMeans.HC.post_AMPWTstdev(1)=nanmean(GroupData.WT_HCC1_post_AMP);
GroupMeans.HC.post_AMPWTstdev(2)=nanmean(GroupData.WT_HCC2_post_AMP);
GroupMeans.HC.post_AMPWTstdev(3)=nanmean(GroupData.WT_HCC3_post_AMP);
GroupMeans.HC.post_AMPWTstdev(4)=nanmean(GroupData.WT_HCC4_post_AMP);
GroupMeans.HC.post_AMPWTstdev(5)=nanmean(GroupData.WT_HCC5_post_AMP);
GroupMeans.HC.post_AMPWTstdev(6)=nanmean(GroupData.WT_HCC6_post_AMP);
GroupMeans.HC.post_AMPWTstdev(7)=nanmean(GroupData.WT_HCC7_post_AMP);
GroupMeans.HC.post_AMPWTstdev(8)=nanmean(GroupData.WT_HCC8_post_AMP);
GroupMeans.HC.post_AMPWTstdev(9)=nanmean(GroupData.WT_HCC9_post_AMP);
GroupMeans.HC.post_AMPWTstdev(10)=nanmean(GroupData.WT_HCC10_post_AMP);

GroupMeans.HC.wholetrial_AMPWTstdev(1)=nanmean(GroupData.WT_HCC1_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(2)=nanmean(GroupData.WT_HCC2_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(3)=nanmean(GroupData.WT_HCC3_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(4)=nanmean(GroupData.WT_HCC4_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(5)=nanmean(GroupData.WT_HCC5_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(6)=nanmean(GroupData.WT_HCC6_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(7)=nanmean(GroupData.WT_HCC7_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(8)=nanmean(GroupData.WT_HCC8_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(9)=nanmean(GroupData.WT_HCC9_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(10)=nanmean(GroupData.WT_HCC10_wholetrial_AMP);


% plot that
figx=figure;
ymin=0;
ymax=200000000;
subplot(2,2,1)
for moo=1:10
bar(moo, GroupMeans.HC.pre_AMPWTstdev(moo))
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev AMP')
title(sprintf('HC pre-WTstdev AMP across all conditions separately'));
goodplot_wide

subplot(2,2,2)
for moo=1:10
bar(moo, GroupMeans.pat.pre_AMPWTstdev(moo), 'm')
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev AMP')
title(sprintf('Pats pre -WTstdev AMP across all conditions separately'));
goodplot_wide

subplot(2,2,3)
for moo=1:10
bar(moo, GroupMeans.HC.post_AMPWTstdev(moo))
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev AMP')
title(sprintf('HC post-WTstdev AMP across all conditions separately'));
goodplot_wide

subplot(2,2,4)
for moo=1:10
bar(moo, GroupMeans.pat.post_AMPWTstdev(moo), 'm')
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev AMP')
goodplot_wide
title(sprintf('Pats post -WTstdev AMP across all conditions separately'));







GroupMeans.HC.pre_AMPWTstdev(1)=nanmean(GroupData.WT_HCC1_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(2)=nanmean(GroupData.WT_HCC2_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(3)=nanmean(GroupData.WT_HCC3_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(4)=nanmean(GroupData.WT_HCC4_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(5)=nanmean(GroupData.WT_HCC5_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(6)=nanmean(GroupData.WT_HCC6_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(7)=nanmean(GroupData.WT_HCC7_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(8)=nanmean(GroupData.WT_HCC8_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(9)=nanmean(GroupData.WT_HCC9_pre_AMP);
GroupMeans.HC.pre_AMPWTstdev(10)=nanmean(GroupData.WT_HCC10_pre_AMP);

GroupMeans.HC.post_AMPWTstdev(1)=nanmean(GroupData.WT_HCC1_post_AMP);
GroupMeans.HC.post_AMPWTstdev(2)=nanmean(GroupData.WT_HCC2_post_AMP);
GroupMeans.HC.post_AMPWTstdev(3)=nanmean(GroupData.WT_HCC3_post_AMP);
GroupMeans.HC.post_AMPWTstdev(4)=nanmean(GroupData.WT_HCC4_post_AMP);
GroupMeans.HC.post_AMPWTstdev(5)=nanmean(GroupData.WT_HCC5_post_AMP);
GroupMeans.HC.post_AMPWTstdev(6)=nanmean(GroupData.WT_HCC6_post_AMP);
GroupMeans.HC.post_AMPWTstdev(7)=nanmean(GroupData.WT_HCC7_post_AMP);
GroupMeans.HC.post_AMPWTstdev(8)=nanmean(GroupData.WT_HCC8_post_AMP);
GroupMeans.HC.post_AMPWTstdev(9)=nanmean(GroupData.WT_HCC9_post_AMP);
GroupMeans.HC.post_AMPWTstdev(10)=nanmean(GroupData.WT_HCC10_post_AMP);
        
GroupMeans.HC.wholetrial_AMPWTstdev(1)=nanmean(GroupData.WT_HCC1_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(2)=nanmean(GroupData.WT_HCC2_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(3)=nanmean(GroupData.WT_HCC3_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(4)=nanmean(GroupData.WT_HCC4_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(5)=nanmean(GroupData.WT_HCC5_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(6)=nanmean(GroupData.WT_HCC6_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(7)=nanmean(GroupData.WT_HCC7_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(8)=nanmean(GroupData.WT_HCC8_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(9)=nanmean(GroupData.WT_HCC9_wholetrial_AMP);
GroupMeans.HC.wholetrial_AMPWTstdev(10)=nanmean(GroupData.WT_HCC10_wholetrial_AMP);
        
% stdev of stdev

GroupStds.pat.pre_AMPWTstdev(1)=nanstd(GroupData.WT_patC1_pre);
GroupStds.pat.pre_AMPWTstdev(2)=nanstd(GroupData.WT_patC2_pre);
GroupStds.pat.pre_AMPWTstdev(3)=nanstd(GroupData.WT_patC3_pre);
GroupStds.pat.pre_AMPWTstdev(4)=nanstd(GroupData.WT_patC4_pre);
GroupStds.pat.pre_AMPWTstdev(5)=nanstd(GroupData.WT_patC5_pre);
GroupStds.pat.pre_AMPWTstdev(6)=nanstd(GroupData.WT_patC6_pre);
GroupStds.pat.pre_AMPWTstdev(7)=nanstd(GroupData.WT_patC7_pre);
GroupStds.pat.pre_AMPWTstdev(8)=nanstd(GroupData.WT_patC8_pre);
GroupStds.pat.pre_AMPWTstdev(9)=nanstd(GroupData.WT_patC9_pre);
GroupStds.pat.pre_AMPWTstdev(10)=nanstd(GroupData.WT_patC10_pre);

GroupStds.pat.post_AMPWTstdev(1)=nanstd(GroupData.WT_patC1_post_AMP);
GroupStds.pat.post_AMPWTstdev(2)=nanstd(GroupData.WT_patC2_post_AMP);
GroupStds.pat.post_AMPWTstdev(3)=nanstd(GroupData.WT_patC3_post_AMP);
GroupStds.pat.post_AMPWTstdev(4)=nanstd(GroupData.WT_patC4_post_AMP);
GroupStds.pat.post_AMPWTstdev(5)=nanstd(GroupData.WT_patC5_post_AMP);
GroupStds.pat.post_AMPWTstdev(6)=nanstd(GroupData.WT_patC6_post_AMP);
GroupStds.pat.post_AMPWTstdev(7)=nanstd(GroupData.WT_patC7_post_AMP);
GroupStds.pat.post_AMPWTstdev(8)=nanstd(GroupData.WT_patC8_post_AMP);
GroupStds.pat.post_AMPWTstdev(9)=nanstd(GroupData.WT_patC9_post_AMP);
GroupStds.pat.post_AMPWTstdev(10)=nanstd(GroupData.WT_patC10_post_AMP);
        
GroupStds.pat.wholetrial_AMPWTstdev(1)=nanstd(GroupData.WT_patC1_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(2)=nanstd(GroupData.WT_patC2_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(3)=nanstd(GroupData.WT_patC3_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(4)=nanstd(GroupData.WT_patC4_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(5)=nanstd(GroupData.WT_patC5_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(6)=nanstd(GroupData.WT_patC6_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(7)=nanstd(GroupData.WT_patC7_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(8)=nanstd(GroupData.WT_patC8_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(9)=nanstd(GroupData.WT_patC9_wholetrial);
GroupStds.pat.wholetrial_AMPWTstdev(10)=nanstd(GroupData.WT_patC10_wholetrial);
        


GroupStds.pat.pre_AMPWTstdev(1)=nanstd(GroupData.WT_patC1_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(2)=nanstd(GroupData.WT_patC2_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(3)=nanstd(GroupData.WT_patC3_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(4)=nanstd(GroupData.WT_patC4_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(5)=nanstd(GroupData.WT_patC5_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(6)=nanstd(GroupData.WT_patC6_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(7)=nanstd(GroupData.WT_patC7_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(8)=nanstd(GroupData.WT_patC8_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(9)=nanstd(GroupData.WT_patC9_pre_AMP);
GroupStds.pat.pre_AMPWTstdev(10)=nanstd(GroupData.WT_patC10_pre_AMP);

GroupStds.pat.post_AMPWTstdev(1)=nanstd(GroupData.WT_patC1_post_AMP);
GroupStds.pat.post_AMPWTstdev(2)=nanstd(GroupData.WT_patC2_post_AMP);
GroupStds.pat.post_AMPWTstdev(3)=nanstd(GroupData.WT_patC3_post_AMP);
GroupStds.pat.post_AMPWTstdev(4)=nanstd(GroupData.WT_patC4_post_AMP);
GroupStds.pat.post_AMPWTstdev(5)=nanstd(GroupData.WT_patC5_post_AMP);
GroupStds.pat.post_AMPWTstdev(6)=nanstd(GroupData.WT_patC6_post_AMP);
GroupStds.pat.post_AMPWTstdev(7)=nanstd(GroupData.WT_patC7_post_AMP);
GroupStds.pat.post_AMPWTstdev(8)=nanstd(GroupData.WT_patC8_post_AMP);
GroupStds.pat.post_AMPWTstdev(9)=nanstd(GroupData.WT_patC9_post_AMP);
GroupStds.pat.post_AMPWTstdev(10)=nanstd(GroupData.WT_patC10_post_AMP);
        
GroupStds.pat.wholetrial_AMPWTstdev(1)=nanstd(GroupData.WT_patC1_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(2)=nanstd(GroupData.WT_patC2_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(3)=nanstd(GroupData.WT_patC3_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(4)=nanstd(GroupData.WT_patC4_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(5)=nanstd(GroupData.WT_patC5_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(6)=nanstd(GroupData.WT_patC6_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(7)=nanstd(GroupData.WT_patC7_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(8)=nanstd(GroupData.WT_patC8_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(9)=nanstd(GroupData.WT_patC9_wholetrial_AMP);
GroupStds.pat.wholetrial_AMPWTstdev(10)=nanstd(GroupData.WT_patC10_wholetrial_AMP);
        

GroupStds.HC.pre_AMPWTstdev(1)=nanstd(GroupData.WT_HCC1_pre);
GroupStds.HC.pre_AMPWTstdev(2)=nanstd(GroupData.WT_HCC2_pre);
GroupStds.HC.pre_AMPWTstdev(3)=nanstd(GroupData.WT_HCC3_pre);
GroupStds.HC.pre_AMPWTstdev(4)=nanstd(GroupData.WT_HCC4_pre);
GroupStds.HC.pre_AMPWTstdev(5)=nanstd(GroupData.WT_HCC5_pre);
GroupStds.HC.pre_AMPWTstdev(6)=nanstd(GroupData.WT_HCC6_pre);
GroupStds.HC.pre_AMPWTstdev(7)=nanstd(GroupData.WT_HCC7_pre);
GroupStds.HC.pre_AMPWTstdev(8)=nanstd(GroupData.WT_HCC8_pre);
GroupStds.HC.pre_AMPWTstdev(9)=nanstd(GroupData.WT_HCC9_pre);
GroupStds.HC.pre_AMPWTstdev(10)=nanstd(GroupData.WT_HCC10_pre);

GroupStds.HC.post_AMPWTstdev(1)=nanstd(GroupData.WT_HCC1_post_AMP);
GroupStds.HC.post_AMPWTstdev(2)=nanstd(GroupData.WT_HCC2_post_AMP);
GroupStds.HC.post_AMPWTstdev(3)=nanstd(GroupData.WT_HCC3_post_AMP);
GroupStds.HC.post_AMPWTstdev(4)=nanstd(GroupData.WT_HCC4_post_AMP);
GroupStds.HC.post_AMPWTstdev(5)=nanstd(GroupData.WT_HCC5_post_AMP);
GroupStds.HC.post_AMPWTstdev(6)=nanstd(GroupData.WT_HCC6_post_AMP);
GroupStds.HC.post_AMPWTstdev(7)=nanstd(GroupData.WT_HCC7_post_AMP);
GroupStds.HC.post_AMPWTstdev(8)=nanstd(GroupData.WT_HCC8_post_AMP);
GroupStds.HC.post_AMPWTstdev(9)=nanstd(GroupData.WT_HCC9_post_AMP);
GroupStds.HC.post_AMPWTstdev(10)=nanstd(GroupData.WT_HCC10_post_AMP);
        
GroupStds.HC.wholetrial_AMPWTstdev(1)=nanstd(GroupData.WT_HCC1_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(2)=nanstd(GroupData.WT_HCC2_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(3)=nanstd(GroupData.WT_HCC3_wholetrial);
GroupStds.HC.wholetrial_AMPWTstdev(4)=nanstd(GroupData.WT_HCC4_wholetrial);
GroupStds.HC.wholetrial_AMPWTstdev(5)=nanstd(GroupData.WT_HCC5_wholetrial);
GroupStds.HC.wholetrial_AMPWTstdev(6)=nanstd(GroupData.WT_HCC6_wholetrial);
GroupStds.HC.wholetrial_AMPWTstdev(7)=nanstd(GroupData.WT_HCC7_wholetrial);
GroupStds.HC.wholetrial_AMPWTstdev(8)=nanstd(GroupData.WT_HCC8_wholetrial);
GroupStds.HC.wholetrial_AMPWTstdev(9)=nanstd(GroupData.WT_HCC9_wholetrial);
GroupStds.HC.wholetrial_AMPWTstdev(10)=nanstd(GroupData.WT_HCC10_wholetrial);

GroupStds.HC.pre_AMPWTstdev(1)=nanstd(GroupData.WT_HCC1_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(2)=nanstd(GroupData.WT_HCC2_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(3)=nanstd(GroupData.WT_HCC3_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(4)=nanstd(GroupData.WT_HCC4_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(5)=nanstd(GroupData.WT_HCC5_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(6)=nanstd(GroupData.WT_HCC6_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(7)=nanstd(GroupData.WT_HCC7_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(8)=nanstd(GroupData.WT_HCC8_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(9)=nanstd(GroupData.WT_HCC9_pre_AMP);
GroupStds.HC.pre_AMPWTstdev(10)=nanstd(GroupData.WT_HCC10_pre_AMP);

GroupStds.HC.post_AMPWTstdev(1)=nanstd(GroupData.WT_HCC1_post_AMP);
GroupStds.HC.post_AMPWTstdev(2)=nanstd(GroupData.WT_HCC2_post_AMP);
GroupStds.HC.post_AMPWTstdev(3)=nanstd(GroupData.WT_HCC3_post_AMP);
GroupStds.HC.post_AMPWTstdev(4)=nanstd(GroupData.WT_HCC4_post_AMP);
GroupStds.HC.post_AMPWTstdev(5)=nanstd(GroupData.WT_HCC5_post_AMP);
GroupStds.HC.post_AMPWTstdev(6)=nanstd(GroupData.WT_HCC6_post_AMP);
GroupStds.HC.post_AMPWTstdev(7)=nanstd(GroupData.WT_HCC7_post_AMP);
GroupStds.HC.post_AMPWTstdev(8)=nanstd(GroupData.WT_HCC8_post_AMP);
GroupStds.HC.post_AMPWTstdev(9)=nanstd(GroupData.WT_HCC9_post_AMP);
GroupStds.HC.post_AMPWTstdev(10)=nanstd(GroupData.WT_HCC10_post_AMP);
        
GroupStds.HC.wholetrial_AMPWTstdev(1)=nanstd(GroupData.WT_HCC1_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(2)=nanstd(GroupData.WT_HCC2_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(3)=nanstd(GroupData.WT_HCC3_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(4)=nanstd(GroupData.WT_HCC4_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(5)=nanstd(GroupData.WT_HCC5_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(6)=nanstd(GroupData.WT_HCC6_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(7)=nanstd(GroupData.WT_HCC7_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(8)=nanstd(GroupData.WT_HCC8_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(9)=nanstd(GroupData.WT_HCC9_wholetrial_AMP);
GroupStds.HC.wholetrial_AMPWTstdev(10)=nanstd(GroupData.WT_HCC10_wholetrial_AMP);
        

 
STATS.stdwithin_patHCs_pre_cond1=ttest2(GroupData.WT_patC1_pre, GroupData.WT_HCC1_pre);
STATS.stdwithin_patHCs_pre_cond2=ttest2(GroupData.WT_patC2_pre, GroupData.WT_HCC2_pre);
STATS.stdwithin_patHCs_pre_cond3=ttest2(GroupData.WT_patC3_pre, GroupData.WT_HCC3_pre);
STATS.stdwithin_patHCs_pre_cond4=ttest2(GroupData.WT_patC4_pre, GroupData.WT_HCC4_pre);
STATS.stdwithin_patHCs_pre_cond5=ttest2(GroupData.WT_patC5_pre, GroupData.WT_HCC5_pre);
STATS.stdwithin_patHCs_pre_cond6=ttest2(GroupData.WT_patC6_pre, GroupData.WT_HCC6_pre);
STATS.stdwithin_patHCs_pre_cond7=ttest2(GroupData.WT_patC7_pre, GroupData.WT_HCC7_pre);
STATS.stdwithin_patHCs_pre_cond8=ttest2(GroupData.WT_patC8_pre, GroupData.WT_HCC8_pre);
STATS.stdwithin_patHCs_pre_cond9=ttest2(GroupData.WT_patC9_pre, GroupData.WT_HCC9_pre);
STATS.stdwithin_patHCs_pre_cond10=ttest2(GroupData.WT_patC10_pre, GroupData.WT_HCC10_pre);

STATS.stdwithin_patHCs_post_cond1=ttest2(GroupData.WT_patC1_post, GroupData.WT_HCC1_post_AMP);
STATS.stdwithin_patHCs_post_cond2=ttest2(GroupData.WT_patC2_post, GroupData.WT_HCC2_post_AMP);
STATS.stdwithin_patHCs_post_cond3=ttest2(GroupData.WT_patC3_post, GroupData.WT_HCC3_post_AMP);
STATS.stdwithin_patHCs_post_cond4=ttest2(GroupData.WT_patC4_post, GroupData.WT_HCC4_post_AMP);
STATS.stdwithin_patHCs_post_cond5=ttest2(GroupData.WT_patC5_post, GroupData.WT_HCC5_post_AMP);
STATS.stdwithin_patHCs_post_cond6=ttest2(GroupData.WT_patC6_post, GroupData.WT_HCC6_post_AMP);
STATS.stdwithin_patHCs_post_cond7=ttest2(GroupData.WT_patC7_post, GroupData.WT_HCC7_post_AMP);
STATS.stdwithin_patHCs_post_cond8=ttest2(GroupData.WT_patC8_post, GroupData.WT_HCC8_post_AMP);
STATS.stdwithin_patHCs_post_cond9=ttest2(GroupData.WT_patC9_post, GroupData.WT_HCC9_post_AMP);
STATS.stdwithin_patHCs_post_cond10=ttest2(GroupData.WT_patC10_post, GroupData.WT_HCC10_post_AMP);

STATS.stdwithin_patHCs_wholetrial_cond1=ttest2(GroupData.WT_patC1_wholetrial, GroupData.WT_HCC1_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond2=ttest2(GroupData.WT_patC2_wholetrial, GroupData.WT_HCC2_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond3=ttest2(GroupData.WT_patC3_wholetrial, GroupData.WT_HCC3_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond4=ttest2(GroupData.WT_patC4_wholetrial, GroupData.WT_HCC4_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond5=ttest2(GroupData.WT_patC5_wholetrial, GroupData.WT_HCC5_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond6=ttest2(GroupData.WT_patC6_wholetrial, GroupData.WT_HCC6_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond7=ttest2(GroupData.WT_patC7_wholetrial, GroupData.WT_HCC7_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond8=ttest2(GroupData.WT_patC8_wholetrial, GroupData.WT_HCC8_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond9=ttest2(GroupData.WT_patC9_wholetrial, GroupData.WT_HCC9_wholetrial);
STATS.stdwithin_patHCs_wholetrial_cond10=ttest2(GroupData.WT_patC10_wholetrial, GroupData.WT_HCC10_wholetrial);

%% (4) STATS - comparing noise v clear trials for HC and patients
% pre

STATS.stdwithin_noise_clear_pre_cond1_HC=ttest2(GroupData.WT_HCC1_pre, GroupData.WT_HCC6_pre);
STATS.stdwithin_noise_clear_pre_cond2_HC=ttest2(GroupData.WT_HCC2_pre, GroupData.WT_HCC7_pre);
STATS.stdwithin_noise_clear_pre_cond3_HC=ttest2(GroupData.WT_HCC3_pre, GroupData.WT_HCC8_pre);
STATS.stdwithin_noise_clear_pre_cond4_HC=ttest2(GroupData.WT_HCC4_pre, GroupData.WT_HCC9_pre);
STATS.stdwithin_noise_clear_pre_cond5_HC=ttest2(GroupData.WT_HCC5_pre, GroupData.WT_HCC10_pre);

STATS.stdwithin_noise_clear_pre_cond1_pat=ttest2(GroupData.WT_patC1_pre, GroupData.WT_patC6_pre);
STATS.stdwithin_noise_clear_pre_cond2_pat=ttest2(GroupData.WT_patC2_pre, GroupData.WT_patC7_pre);
STATS.stdwithin_noise_clear_pre_cond3_pat=ttest2(GroupData.WT_patC3_pre, GroupData.WT_patC8_pre);
STATS.stdwithin_noise_clear_pre_cond4_pat=ttest2(GroupData.WT_patC4_pre, GroupData.WT_patC9_pre);
STATS.stdwithin_noise_clear_pre_cond5_pat=ttest2(GroupData.WT_patC5_pre, GroupData.WT_patC10_pre);

% post
STATS.stdwithin_noise_clear_post_cond1_HC=ttest2(GroupData.WT_HCC1_post, GroupData.WT_HCC6_post_AMP);
STATS.stdwithin_noise_clear_post_cond2_HC=ttest2(GroupData.WT_HCC2_post, GroupData.WT_HCC7_post_AMP);
STATS.stdwithin_noise_clear_post_cond3_HC=ttest2(GroupData.WT_HCC3_post, GroupData.WT_HCC8_post_AMP);
STATS.stdwithin_noise_clear_post_cond4_HC=ttest2(GroupData.WT_HCC4_post, GroupData.WT_HCC9_post_AMP);
STATS.stdwithin_noise_clear_post_cond5_HC=ttest2(GroupData.WT_HCC5_post, GroupData.WT_HCC10_post_AMP);

STATS.stdwithin_noise_clear_post_cond1_pat=ttest2(GroupData.WT_patC1_post, GroupData.WT_patC6_post_AMP);
STATS.stdwithin_noise_clear_post_cond2_pat=ttest2(GroupData.WT_patC2_post, GroupData.WT_patC7_post_AMP);
STATS.stdwithin_noise_clear_post_cond3_pat=ttest2(GroupData.WT_patC3_post, GroupData.WT_patC8_post_AMP);
STATS.stdwithin_noise_clear_post_cond4_pat=ttest2(GroupData.WT_patC4_post, GroupData.WT_patC9_post_AMP);
STATS.stdwithin_noise_clear_post_cond5_pat=ttest2(GroupData.WT_patC5_post, GroupData.WT_patC10_post_AMP);

% wholetrial
STATS.stdwithin_noise_clear_wholetrial_cond1_HC=ttest2(GroupData.WT_HCC1_wholetrial, GroupData.WT_HCC6_wholetrial);
STATS.stdwithin_noise_clear_wholetrial_cond2_HC=ttest2(GroupData.WT_HCC2_wholetrial, GroupData.WT_HCC7_wholetrial);
STATS.stdwithin_noise_clear_wholetrial_cond3_HC=ttest2(GroupData.WT_HCC3_wholetrial, GroupData.WT_HCC8_wholetrial);
STATS.stdwithin_noise_clear_wholetrial_cond4_HC=ttest2(GroupData.WT_HCC4_wholetrial, GroupData.WT_HCC9_wholetrial);
STATS.stdwithin_noise_clear_wholetrial_cond5_HC=ttest2(GroupData.WT_HCC5_wholetrial, GroupData.WT_HCC10_wholetrial);

STATS.stdwithin_noise_clear_wholetrial_cond1_pat=ttest2(GroupData.WT_patC1_wholetrial, GroupData.WT_patC6_wholetrial);
STATS.stdwithin_noise_clear_wholetrial_cond2_pat=ttest2(GroupData.WT_patC2_wholetrial, GroupData.WT_patC7_wholetrial);
STATS.stdwithin_noise_clear_wholetrial_cond3_pat=ttest2(GroupData.WT_patC3_wholetrial, GroupData.WT_patC8_wholetrial);
STATS.stdwithin_noise_clear_wholetrial_cond4_pat=ttest2(GroupData.WT_patC4_wholetrial, GroupData.WT_patC9_wholetrial);
STATS.stdwithin_noise_clear_wholetrial_cond5_pat=ttest2(GroupData.WT_patC5_wholetrial, GroupData.WT_patC10_wholetrial);


%% (5)STATS comparing all noise trials (6-10) v all clear trials (1-5)
% patients and controls
Stdwithin_allcleartrials_HCs_pre_AMP=[GroupData.WT_HCC1_pre GroupData.WT_HCC2_pre GroupData.WT_HCC3_pre GroupData.WT_HCC4_pre GroupData.WT_HCC5_pre];
Stdwithin_allnoisetrials_HCs_pre_AMP=[GroupData.WT_HCC6_pre GroupData.WT_HCC7_pre GroupData.WT_HCC8_pre GroupData.WT_HCC9_pre GroupData.WT_HCC10_pre];
STATS.stdwithin_allnoise_vs_clear_HCs_pre=ttest2(Stdwithin_allcleartrials_HCs_pre_AMP,Stdwithin_allnoisetrials_HCs_pre_AMP);
Stdwithin_allcleartrials_HCs_pre_data=nanmean(Stdwithin_allcleartrials_HCs_pre_AMP);
Stdwithin_allnoisetrials_HCs_pre_data=nanmean(Stdwithin_allnoisetrials_HCs_pre_AMP);

Stdwithin_allcleartrials_pats_pre_AMP=[GroupData.WT_patC1_pre GroupData.WT_patC2_pre GroupData.WT_patC3_pre GroupData.WT_patC4_pre GroupData.WT_patC5_pre];
Stdwithin_allnoisetrials_pats_pre_AMP=[GroupData.WT_patC6_pre GroupData.WT_patC7_pre GroupData.WT_patC8_pre GroupData.WT_patC9_pre GroupData.WT_patC10_pre];
STATS.stdwithin_allnoise_vs_clear_pats_pre=ttest2(Stdwithin_allcleartrials_pats_pre_AMP,Stdwithin_allnoisetrials_pats_pre_AMP);
Stdwithin_allcleartrials_pats_pre_data=nanmean(Stdwithin_allcleartrials_pats_pre_AMP);
Stdwithin_allnoisetrials_pats_pre_data=nanmean(Stdwithin_allnoisetrials_pats_pre_AMP);

Stdwithin_allcleartrials_HCs_post_AMP=[GroupData.WT_HCC1_post GroupData.WT_HCC2_post GroupData.WT_HCC3_post GroupData.WT_HCC4_post GroupData.WT_HCC5_post];
Stdwithin_allnoisetrials_HCs_post_AMP=[GroupData.WT_HCC6_post GroupData.WT_HCC7_post GroupData.WT_HCC8_post GroupData.WT_HCC9_post GroupData.WT_HCC10_post];
STATS.stdwithin_allnoise_vs_clear_HCs_post=ttest2(Stdwithin_allcleartrials_HCs_post_AMP,Stdwithin_allnoisetrials_HCs_post_AMP);
Stdwithin_allcleartrials_HCs_post_data=nanmean(Stdwithin_allcleartrials_HCs_post_AMP);
Stdwithin_allnoisetrials_HCs_post_data=nanmean(Stdwithin_allnoisetrials_HCs_post_AMP);

Stdwithin_allcleartrials_pats_post_AMP=[GroupData.WT_patC1_post GroupData.WT_patC2_post GroupData.WT_patC3_post GroupData.WT_patC4_post GroupData.WT_patC5_post];
Stdwithin_allnoisetrials_pats_post_AMP=[GroupData.WT_patC6_post GroupData.WT_patC7_post GroupData.WT_patC8_post GroupData.WT_patC9_post GroupData.WT_patC10_post];
STATS.stdwithin_allnoise_vs_clear_pats_post=ttest2(Stdwithin_allcleartrials_pats_post_AMP,Stdwithin_allnoisetrials_pats_post_AMP);
Stdwithin_allcleartrials_pats_post_data=nanmean(Stdwithin_allcleartrials_pats_post_AMP);
Stdwithin_allnoisetrials_pats_post_data=nanmean(Stdwithin_allnoisetrials_pats_post_AMP);

Stdwithin_allcleartrials_HCs_wholetrial_AMP=[GroupData.WT_HCC1_wholetrial GroupData.WT_HCC2_wholetrial GroupData.WT_HCC3_wholetrial GroupData.WT_HCC4_wholetrial GroupData.WT_HCC5_wholetrial];
Stdwithin_allnoisetrials_HCs_wholetrial_AMP=[GroupData.WT_HCC6_wholetrial GroupData.WT_HCC7_wholetrial GroupData.WT_HCC8_wholetrial GroupData.WT_HCC9_wholetrial GroupData.WT_HCC10_wholetrial];
STATS.stdwithin_allnoise_vs_clear_HCs_wholetrial=ttest2(Stdwithin_allcleartrials_HCs_wholetrial_AMP,Stdwithin_allnoisetrials_HCs_wholetrial_AMP);
Stdwithin_allcleartrials_HCs_wholetrial_data=nanmean(Stdwithin_allcleartrials_HCs_wholetrial_AMP);
Stdwithin_allnoisetrials_HCs_wholetrial_data=nanmean(Stdwithin_allnoisetrials_HCs_wholetrial_AMP);

Stdwithin_allcleartrials_pats_wholetrial_AMP=[GroupData.WT_patC1_wholetrial GroupData.WT_patC2_wholetrial GroupData.WT_patC3_wholetrial GroupData.WT_patC4_wholetrial GroupData.WT_patC5_wholetrial];
Stdwithin_allnoisetrials_pats_wholetrial_AMP=[GroupData.WT_patC6_wholetrial GroupData.WT_patC7_wholetrial GroupData.WT_patC8_wholetrial GroupData.WT_patC9_wholetrial GroupData.WT_patC10_wholetrial];
STATS.stdwithin_allnoise_vs_clear_pats_wholetrial=ttest2(Stdwithin_allcleartrials_pats_wholetrial_AMP,Stdwithin_allnoisetrials_pats_wholetrial_AMP);
Stdwithin_allcleartrials_pats_wholetrial_data=nanmean(Stdwithin_allcleartrials_pats_wholetrial_AMP);
Stdwithin_allnoisetrials_pats_wholetrial_data=nanmean(Stdwithin_allnoisetrials_pats_wholetrial_AMP);

% amp data
Stdwithin_allcleartrials_HCs_pre_AMP_clear=[GroupData.WT_HCC1_pre_AMP GroupData.WT_HCC2_pre_AMP GroupData.WT_HCC3_pre_AMP GroupData.WT_HCC4_pre_AMP GroupData.WT_HCC5_pre_AMP];
Stdwithin_allnoisetrials_HCs_pre_AMP_clear=[GroupData.WT_HCC6_pre_AMP GroupData.WT_HCC7_pre_AMP GroupData.WT_HCC8_pre_AMP GroupData.WT_HCC9_pre_AMP GroupData.WT_HCC10_pre_AMP];
STATS.stdwithin_allnoise_vs_clear_HCs_pre_AMP_clear=ttest2(Stdwithin_allcleartrials_HCs_pre_AMP_clear,Stdwithin_allnoisetrials_HCs_pre_AMP_clear);
Stdwithin_allcleartrials_HCs_pre_AMP_clear_data=nanmean(Stdwithin_allcleartrials_HCs_pre_AMP_clear);
Stdwithin_allnoisetrials_HCs_pre_AMP_clear_data=nanmean(Stdwithin_allnoisetrials_HCs_pre_AMP_clear);

Stdwithin_allcleartrials_pats_pre_AMP_clear=[GroupData.WT_patC1_pre_AMP GroupData.WT_patC2_pre_AMP GroupData.WT_patC3_pre_AMP GroupData.WT_patC4_pre_AMP GroupData.WT_patC5_pre_AMP];
Stdwithin_allnoisetrials_pats_pre_AMP_clear=[GroupData.WT_patC6_pre_AMP GroupData.WT_patC7_pre_AMP GroupData.WT_patC8_pre_AMP GroupData.WT_patC9_pre_AMP GroupData.WT_patC10_pre_AMP];
STATS.stdwithin_allnoise_vs_clear_pats_pre_AMP_clear=ttest2(Stdwithin_allcleartrials_pats_pre_AMP_clear,Stdwithin_allnoisetrials_pats_pre_AMP_clear);
Stdwithin_allcleartrials_pats_pre_AMP_clear_data=nanmean(Stdwithin_allcleartrials_pats_pre_AMP_clear);
Stdwithin_allnoisetrials_pats_pre_AMP_clear_data=nanmean(Stdwithin_allnoisetrials_pats_pre_AMP_clear);

Stdwithin_allcleartrials_HCs_post_AMP_clear=[GroupData.WT_HCC1_post_AMP GroupData.WT_HCC2_post_AMP GroupData.WT_HCC3_post_AMP GroupData.WT_HCC4_post_AMP GroupData.WT_HCC5_post_AMP];
Stdwithin_allnoisetrials_HCs_post_AMP_clear=[GroupData.WT_HCC6_post_AMP GroupData.WT_HCC7_post_AMP GroupData.WT_HCC8_post_AMP GroupData.WT_HCC9_post_AMP GroupData.WT_HCC10_post_AMP];
STATS.stdwithin_allnoise_vs_clear_HCs_post_AMP_clear=ttest2(Stdwithin_allcleartrials_HCs_post_AMP_clear,Stdwithin_allnoisetrials_HCs_post_AMP_clear);
Stdwithin_allcleartrials_HCs_post_AMP_clear_data=nanmean(Stdwithin_allcleartrials_HCs_post_AMP_clear);
Stdwithin_allnoisetrials_HCs_post_AMP_clear_data=nanmean(Stdwithin_allnoisetrials_HCs_post_AMP_clear);

Stdwithin_allcleartrials_pats_post_AMP_clear=[GroupData.WT_patC1_post_AMP GroupData.WT_patC2_post_AMP GroupData.WT_patC3_post_AMP GroupData.WT_patC4_post_AMP GroupData.WT_patC5_post_AMP];
Stdwithin_allnoisetrials_pats_post_AMP_clear=[GroupData.WT_patC6_post_AMP GroupData.WT_patC7_post_AMP GroupData.WT_patC8_post_AMP GroupData.WT_patC9_post_AMP GroupData.WT_patC10_post_AMP];
STATS.stdwithin_allnoise_vs_clear_pats_post_AMP_clear=ttest2(Stdwithin_allcleartrials_pats_post_AMP_clear,Stdwithin_allnoisetrials_pats_post_AMP_clear);
Stdwithin_allcleartrials_pats_post_AMP_clear_data=nanmean(Stdwithin_allcleartrials_pats_post_AMP_clear);
Stdwithin_allnoisetrials_pats_post_AMP_clear_data=nanmean(Stdwithin_allnoisetrials_pats_post_AMP_clear);

Stdwithin_allcleartrials_HCs_wholetrial_AMP_clear=[GroupData.WT_HCC1_wholetrial_AMP GroupData.WT_HCC2_wholetrial_AMP GroupData.WT_HCC3_wholetrial_AMP GroupData.WT_HCC4_wholetrial_AMP GroupData.WT_HCC5_wholetrial_AMP];
Stdwithin_allnoisetrials_HCs_wholetrial_AMP_clear=[GroupData.WT_HCC6_wholetrial_AMP GroupData.WT_HCC7_wholetrial_AMP GroupData.WT_HCC8_wholetrial_AMP GroupData.WT_HCC9_wholetrial_AMP GroupData.WT_HCC10_wholetrial_AMP];
STATS.stdwithin_allnoise_vs_clear_HCs_wholetrial_AMP_clear=ttest2(Stdwithin_allcleartrials_HCs_wholetrial_AMP_clear,Stdwithin_allnoisetrials_HCs_wholetrial_AMP_clear);
Stdwithin_allcleartrials_HCs_wholetrial_AMP_clear_data=nanmean(Stdwithin_allcleartrials_HCs_wholetrial_AMP_clear);
Stdwithin_allnoisetrials_HCs_wholetrial_AMP_clear_data=nanmean(Stdwithin_allnoisetrials_HCs_wholetrial_AMP_clear);

Stdwithin_allcleartrials_pats_wholetrial_AMP_clear=[GroupData.WT_patC1_wholetrial_AMP GroupData.WT_patC2_wholetrial_AMP GroupData.WT_patC3_wholetrial_AMP GroupData.WT_patC4_wholetrial_AMP GroupData.WT_patC5_wholetrial_AMP];
Stdwithin_allnoisetrials_pats_wholetrial_AMP_clear=[GroupData.WT_patC6_wholetrial_AMP GroupData.WT_patC7_wholetrial_AMP GroupData.WT_patC8_wholetrial_AMP GroupData.WT_patC9_wholetrial_AMP GroupData.WT_patC10_wholetrial_AMP];
STATS.stdwithin_allnoise_vs_clear_pats_wholetrial_AMP_clear=ttest2(Stdwithin_allcleartrials_pats_wholetrial_AMP_clear,Stdwithin_allnoisetrials_pats_wholetrial_AMP_clear);
Stdwithin_allcleartrials_pats_wholetrial_AMP_clear_data=nanmean(Stdwithin_allcleartrials_pats_wholetrial_AMP_clear);
Stdwithin_allnoisetrials_pats_wholetrial_AMP_clear_data=nanmean(Stdwithin_allnoisetrials_pats_wholetrial_AMP_clear);


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
title(sprintf('HCs stdev of AMP (pre window)'));

% STATS.stdwithin_allnoise_vs_clear_HCs_pre

subplot(2,2,2);
bar(1, Stdwithin_allcleartrials_HCs_post_data), 'b';
hold on
bar(2, Stdwithin_allnoisetrials_HCs_post_data, 'c');
axis([0 3 ymin ymax])
title(sprintf('HCs stdev of AMP (post window)'));

%STATS.stdwithin_allnoise_vs_clear_HCs_post

subplot(2,2,3);
bar(1, Stdwithin_allcleartrials_pats_pre_data), 'm';
hold on
bar(2, Stdwithin_allnoisetrials_pats_pre_data, 'y');
axis([0 3 ymin ymax])
title(sprintf('Patients stdev of AMP (pre window)'));

%STATS.stdwithin_allnoise_vs_clear_pats_pre

subplot(2,2,4);
bar(1, Stdwithin_allcleartrials_pats_post_data), 'm';
hold on
bar(2, Stdwithin_allnoisetrials_pats_post_data, 'y');
axis([0 3 ymin ymax])
title(sprintf('Patients stdev of AMP (post window)'));

%STATS.stdwithin_allnoise_vs_clear_pats_post

saveas(fig5, 'GROUP_meanstdev_noise_clear_HCs.jpg')


%% all conditions lumped together

% averaging across all conditions for AMP and amp
%AMP
group_pat_pre_clear=[GroupData.WT_patC1_pre GroupData.WT_patC2_pre GroupData.WT_patC3_pre GroupData.WT_patC4_pre GroupData.WT_patC5_pre];
group_HC_pre_clear=[GroupData.WT_HCC1_pre GroupData.WT_HCC2_pre GroupData.WT_HCC3_pre GroupData.WT_HCC4_pre GroupData.WT_HCC5_pre];
group_pat_post_clear=[GroupData.WT_patC1_post GroupData.WT_patC2_post GroupData.WT_patC3_post GroupData.WT_patC4_post GroupData.WT_patC5_post];
group_HC_post_clear=[GroupData.WT_HCC1_post GroupData.WT_HCC2_post GroupData.WT_HCC3_post GroupData.WT_HCC4_post GroupData.WT_HCC5_post];
group_pat_wholetrial_clear=[GroupData.WT_patC1_wholetrial GroupData.WT_patC2_wholetrial GroupData.WT_patC3_wholetrial GroupData.WT_patC4_wholetrial GroupData.WT_patC5_wholetrial];
group_HC_wholetrial_clear=[GroupData.WT_HCC1_wholetrial GroupData.WT_HCC2_wholetrial GroupData.WT_HCC3_wholetrial GroupData.WT_HCC4_wholetrial GroupData.WT_HCC5_wholetrial];


group_pat_pre_noise=[GroupData.WT_patC6_pre GroupData.WT_patC7_pre GroupData.WT_patC8_pre GroupData.WT_patC9_pre GroupData.WT_patC10_pre];
group_HC_pre_noise=[GroupData.WT_HCC6_pre GroupData.WT_HCC7_pre GroupData.WT_HCC8_pre GroupData.WT_HCC9_pre GroupData.WT_HCC10_pre];
group_pat_post_noise=[GroupData.WT_patC6_post GroupData.WT_patC7_post GroupData.WT_patC8_post GroupData.WT_patC9_post GroupData.WT_patC10_post];
group_HC_post_noise=[GroupData.WT_HCC6_post GroupData.WT_HCC7_post GroupData.WT_HCC8_post GroupData.WT_HCC9_post GroupData.WT_HCC10_post];
group_pat_wholetrial_noise=[GroupData.WT_patC6_wholetrial GroupData.WT_patC7_wholetrial GroupData.WT_patC8_wholetrial GroupData.WT_patC9_wholetrial GroupData.WT_patC10_wholetrial];
group_HC_wholetrial_noise=[GroupData.WT_HCC6_wholetrial GroupData.WT_HCC7_wholetrial GroupData.WT_HCC8_wholetrial GroupData.WT_HCC9_wholetrial GroupData.WT_HCC10_wholetrial];

%% for anova
group_pat_pre_clear_anova=[nanmean(GroupData.WT_patC1_pre) nanmean(GroupData.WT_patC2_pre) nanmean(GroupData.WT_patC3_pre) nanmean(GroupData.WT_patC4_pre) nanmean(GroupData.WT_patC5_pre)];
group_HC_pre_clear_anova= [nanmean(GroupData.WT_HCC1_pre)  nanmean(GroupData.WT_HCC2_pre) nanmean(GroupData.WT_HCC3_pre) nanmean(GroupData.WT_HCC4_pre) nanmean(GroupData.WT_HCC5_pre)];
group_pat_post_clear_anova=[nanmean(GroupData.WT_patC1_post) nanmean(GroupData.WT_patC2_post) nanmean(GroupData.WT_patC3_post) nanmean(GroupData.WT_patC4_post) nanmean(GroupData.WT_patC5_post)];
group_HC_post_clear_anova=[nanmean(GroupData.WT_HCC1_post) nanmean(GroupData.WT_HCC2_post) nanmean(GroupData.WT_HCC3_post) nanmean(GroupData.WT_HCC4_post) nanmean(GroupData.WT_HCC5_post)];
group_pat_wholetrial_clear_anova=[nanmean(GroupData.WT_patC1_wholetrial) nanmean(GroupData.WT_patC2_wholetrial) nanmean(GroupData.WT_patC3_wholetrial) nanmean(GroupData.WT_patC4_wholetrial) nanmean(GroupData.WT_patC5_wholetrial)];
group_HC_wholetrial_clear_anova= [nanmean(GroupData.WT_HCC1_wholetrial)  nanmean(GroupData.WT_HCC2_wholetrial) nanmean(GroupData.WT_HCC3_wholetrial) nanmean(GroupData.WT_HCC4_wholetrial) nanmean(GroupData.WT_HCC5_wholetrial)];


group_pat_pre_noise_anova=[nanmean(GroupData.WT_patC6_pre) nanmean(GroupData.WT_patC7_pre) nanmean(GroupData.WT_patC8_pre) nanmean(GroupData.WT_patC9_pre) nanmean(GroupData.WT_patC10_pre)];
group_HC_pre_noise_anova=[nanmean(GroupData.WT_HCC6_pre) nanmean(GroupData.WT_HCC7_pre) nanmean(GroupData.WT_HCC8_pre) nanmean(GroupData.WT_HCC9_pre) nanmean(GroupData.WT_HCC10_pre)];
group_pat_post_noise_anova=[nanmean(GroupData.WT_patC6_post) nanmean(GroupData.WT_patC7_post) nanmean(GroupData.WT_patC8_post) nanmean(GroupData.WT_patC9_post) nanmean(GroupData.WT_patC10_post)];
group_HC_post_noise_anova=[nanmean(GroupData.WT_HCC6_post) nanmean(GroupData.WT_HCC7_post) nanmean(GroupData.WT_HCC8_post) nanmean(GroupData.WT_HCC9_post) nanmean(GroupData.WT_HCC10_post)];
group_pat_wholetrial_noise_anova=[nanmean(GroupData.WT_patC6_wholetrial) nanmean(GroupData.WT_patC7_wholetrial) nanmean(GroupData.WT_patC8_wholetrial) nanmean(GroupData.WT_patC9_wholetrial) nanmean(GroupData.WT_patC10_wholetrial)];
group_HC_wholetrial_noise_anova=[nanmean(GroupData.WT_HCC6_wholetrial) nanmean(GroupData.WT_HCC7_wholetrial) nanmean(GroupData.WT_HCC8_wholetrial) nanmean(GroupData.WT_HCC9_wholetrial) nanmean(GroupData.WT_HCC10_wholetrial)];


GroupMeans.pat_ALLCONDS.pre_AMPWTstdev_clear=nanmean(group_pat_pre_clear);
GroupMeans.HC_ALLCONDS.pre_AMPWTstdev_clear=nanmean(group_HC_pre_clear);
GroupMeans.pat_ALLCONDS.post_AMPWTstdev_clear=nanmean(group_pat_post_clear);
GroupMeans.HC_ALLCONDS.post_AMPWTstdev_clear=nanmean(group_HC_post_clear);
GroupStdev.pat_ALLCONDS.pre_AMPWTstdev_clear=nanstd(group_pat_pre_clear);
GroupStdev.HC_ALLCONDS.pre_AMPWTstdev_clear=nanstd(group_HC_pre_clear);
GroupStdev.pat_ALLCONDS.post_AMPWTstdev_clear=nanstd(group_pat_post_clear);
GroupStdev.HC_ALLCONDS.post_AMPWTstdev_clear=nanstd(group_HC_post_clear);
GroupMeans.pat_ALLCONDS.pre_AMPWTstdev_noise=nanmean(group_pat_pre_noise);
GroupMeans.HC_ALLCONDS.pre_AMPWTstdev_noise=nanmean(group_HC_pre_noise);
GroupMeans.pat_ALLCONDS.post_AMPWTstdev_noise=nanmean(group_pat_post_noise);
GroupMeans.HC_ALLCONDS.post_AMPWTstdev_noise=nanmean(group_HC_post_noise);
GroupStdev.pat_ALLCONDS.pre_AMPWTstdev_noise=nanstd(group_pat_pre_noise);
GroupStdev.HC_ALLCONDS.pre_AMPWTstdev_noise=nanstd(group_HC_pre_noise);
GroupStdev.pat_ALLCONDS.post_AMPWTstdev_noise=nanstd(group_pat_post_noise);
GroupStdev.HC_ALLCONDS.post_AMPWTstdev_noise=nanstd(group_HC_post_noise);

GroupMeans.pat_ALLCONDS.wholetrial_AMPWTstdev_clear=nanmean(group_pat_wholetrial_clear);
GroupMeans.HC_ALLCONDS.wholetrial_AMPWTstdev_clear=nanmean(group_HC_wholetrial_clear);
GroupMeans.pat_ALLCONDS.post_AMPWTstdev_clear=nanmean(group_pat_post_clear);
GroupMeans.HC_ALLCONDS.post_AMPWTstdev_clear=nanmean(group_HC_post_clear);
GroupStdev.pat_ALLCONDS.wholetrial_AMPWTstdev_clear=nanstd(group_pat_wholetrial_clear);
GroupStdev.HC_ALLCONDS.wholetrial_AMPWTstdev_clear=nanstd(group_HC_wholetrial_clear);
GroupStdev.pat_ALLCONDS.post_AMPWTstdev_clear=nanstd(group_pat_post_clear);
GroupStdev.HC_ALLCONDS.post_AMPWTstdev_clear=nanstd(group_HC_post_clear);

GroupMeans.pat_ALLCONDS.wholetrial_AMPWTstdev_noise=nanmean(group_pat_wholetrial_noise);
GroupMeans.HC_ALLCONDS.wholetrial_AMPWTstdev_noise=nanmean(group_HC_wholetrial_noise);
GroupMeans.pat_ALLCONDS.post_AMPWTstdev_noise=nanmean(group_pat_post_noise);
GroupMeans.HC_ALLCONDS.post_AMPWTstdev_noise=nanmean(group_HC_post_noise);
GroupStdev.pat_ALLCONDS.wholetrial_AMPWTstdev_noise=nanstd(group_pat_wholetrial_noise);
GroupStdev.HC_ALLCONDS.wholetrial_AMPWTstdev_noise=nanstd(group_HC_wholetrial_noise);
GroupStdev.pat_ALLCONDS.post_AMPWTstdev_noise=nanstd(group_pat_post_noise);
GroupStdev.HC_ALLCONDS.post_AMPWTstdev_noise=nanstd(group_HC_post_noise);



                                                   
%% ZKA to do
%SEM: dividing the SD by the square root of N. 
GroupSEM.HC_ALLCONDS.pre_AMPWTstdev_clear=GroupStdev.HC_ALLCONDS.pre_AMPWTstdev_clear/sqrt(64); % standard error of the mean %/number trials over all subjects so this is 8 subjects x 8 trials                                                  
GroupSEM.HC_ALLCONDS.post_AMPWTstdev_clear=GroupStdev.HC_ALLCONDS.post_AMPWTstdev_clear/sqrt(64); % standard error of the mean
GroupSEM.pat_ALLCONDS.pre_AMPWTstdev_clear=GroupStdev.pat_ALLCONDS.pre_AMPWTstdev_clear/sqrt(64); % standard error of the mean
GroupSEM.pat_ALLCONDS.post_AMPWTstdev_clear=GroupStdev.pat_ALLCONDS.post_AMPWTstdev_clear/sqrt(64); % standard error of the mean
GroupSEM.HC_ALLCONDS.pre_AMPWTstdev_noise=GroupStdev.HC_ALLCONDS.pre_AMPWTstdev_noise/sqrt(64); % standard error of the mean
GroupSEM.HC_ALLCONDS.post_AMPWTstdev_noise=GroupStdev.HC_ALLCONDS.post_AMPWTstdev_noise/sqrt(64); % standard error of the mean
GroupSEM.pat_ALLCONDS.pre_AMPWTstdev_noise=GroupStdev.pat_ALLCONDS.pre_AMPWTstdev_noise/sqrt(64);% standard error of the mean
GroupSEM.pat_ALLCONDS.post_AMPWTstdev_noise=GroupStdev.pat_ALLCONDS.post_AMPWTstdev_noise/sqrt(64); % standard error of the mean
GroupSEM.HC_ALLCONDS.wholetrial_AMPWTstdev_clear=GroupStdev.HC_ALLCONDS.wholetrial_AMPWTstdev_clear/sqrt(64); % standard error of the mean %/number trials over all subjects so this is 8 subjects x 8 trials                                                  
GroupSEM.HC_ALLCONDS.post_AMPWTstdev_clear=GroupStdev.HC_ALLCONDS.post_AMPWTstdev_clear/sqrt(64); % standard error of the mean
GroupSEM.pat_ALLCONDS.wholetrial_AMPWTstdev_clear=GroupStdev.pat_ALLCONDS.wholetrial_AMPWTstdev_clear/sqrt(64); % standard error of the mean
GroupSEM.pat_ALLCONDS.post_AMPWTstdev_clear=GroupStdev.pat_ALLCONDS.post_AMPWTstdev_clear/sqrt(64); % standard error of the mean
GroupSEM.HC_ALLCONDS.wholetrial_AMPWTstdev_noise=GroupStdev.HC_ALLCONDS.wholetrial_AMPWTstdev_noise/sqrt(64); % standard error of the mean
GroupSEM.HC_ALLCONDS.post_AMPWTstdev_noise=GroupStdev.HC_ALLCONDS.post_AMPWTstdev_noise/sqrt(64); % standard error of the mean
GroupSEM.pat_ALLCONDS.wholetrial_AMPWTstdev_noise=GroupStdev.pat_ALLCONDS.wholetrial_AMPWTstdev_noise/sqrt(64);% standard error of the mean
GroupSEM.pat_ALLCONDS.post_AMPWTstdev_noise=GroupStdev.pat_ALLCONDS.post_AMPWTstdev_noise/sqrt(64); % standard error of the mean


%amp
group_pat_pre_AMP_clear=[GroupData.WT_patC1_pre_AMP GroupData.WT_patC2_pre_AMP GroupData.WT_patC3_pre_AMP GroupData.WT_patC4_pre_AMP GroupData.WT_patC5_pre_AMP];
group_HC_pre_AMP_clear=[GroupData.WT_HCC1_pre_AMP GroupData.WT_HCC2_pre_AMP GroupData.WT_HCC3_pre_AMP GroupData.WT_HCC4_pre_AMP GroupData.WT_HCC5_pre_AMP];
group_pat_post_AMP_clear=[GroupData.WT_patC1_post_AMP GroupData.WT_patC2_post_AMP GroupData.WT_patC3_post_AMP GroupData.WT_patC4_post_AMP GroupData.WT_patC5_post_AMP];
group_HC_post_AMP_clear=[GroupData.WT_HCC1_post_AMP GroupData.WT_HCC2_post_AMP GroupData.WT_HCC3_post_AMP GroupData.WT_HCC4_post_AMP GroupData.WT_HCC5_post_AMP];
group_pat_pre_AMP_noise=[GroupData.WT_patC6_pre_AMP GroupData.WT_patC7_pre_AMP GroupData.WT_patC8_pre_AMP GroupData.WT_patC9_pre_AMP GroupData.WT_patC10_pre_AMP];
group_HC_pre_AMP_noise=[GroupData.WT_HCC6_pre_AMP GroupData.WT_HCC7_pre_AMP GroupData.WT_HCC8_pre_AMP GroupData.WT_HCC9_pre_AMP GroupData.WT_HCC10_pre_AMP];
group_pat_post_AMP_noise=[GroupData.WT_patC6_post_AMP GroupData.WT_patC7_post_AMP GroupData.WT_patC8_post_AMP GroupData.WT_patC9_post_AMP GroupData.WT_patC10_post_AMP];
group_HC_post_AMP_noise=[GroupData.WT_HCC6_post_AMP GroupData.WT_HCC7_post_AMP GroupData.WT_HCC8_post_AMP GroupData.WT_HCC9_post_AMP GroupData.WT_HCC10_post_AMP];

group_pat_wholetrial_AMP_clear=[GroupData.WT_patC1_wholetrial_AMP GroupData.WT_patC2_wholetrial_AMP GroupData.WT_patC3_wholetrial_AMP GroupData.WT_patC4_wholetrial_AMP GroupData.WT_patC5_wholetrial_AMP];
group_HC_wholetrial_AMP_clear=[GroupData.WT_HCC1_wholetrial_AMP GroupData.WT_HCC2_wholetrial_AMP GroupData.WT_HCC3_wholetrial_AMP GroupData.WT_HCC4_wholetrial_AMP GroupData.WT_HCC5_wholetrial_AMP];
group_pat_post_AMP_clear=[GroupData.WT_patC1_post_AMP GroupData.WT_patC2_post_AMP GroupData.WT_patC3_post_AMP GroupData.WT_patC4_post_AMP GroupData.WT_patC5_post_AMP];
group_HC_post_AMP_clear=[GroupData.WT_HCC1_post_AMP GroupData.WT_HCC2_post_AMP GroupData.WT_HCC3_post_AMP GroupData.WT_HCC4_post_AMP GroupData.WT_HCC5_post_AMP];
group_pat_wholetrial_AMP_noise=[GroupData.WT_patC6_wholetrial_AMP GroupData.WT_patC7_wholetrial_AMP GroupData.WT_patC8_wholetrial_AMP GroupData.WT_patC9_wholetrial_AMP GroupData.WT_patC10_wholetrial_AMP];
group_HC_wholetrial_AMP_noise=[GroupData.WT_HCC6_wholetrial_AMP GroupData.WT_HCC7_wholetrial_AMP GroupData.WT_HCC8_wholetrial_AMP GroupData.WT_HCC9_wholetrial_AMP GroupData.WT_HCC10_wholetrial_AMP];
group_pat_post_AMP_noise=[GroupData.WT_patC6_post_AMP GroupData.WT_patC7_post_AMP GroupData.WT_patC8_post_AMP GroupData.WT_patC9_post_AMP GroupData.WT_patC10_post_AMP];
group_HC_post_AMP_noise=[GroupData.WT_HCC6_post_AMP GroupData.WT_HCC7_post_AMP GroupData.WT_HCC8_post_AMP GroupData.WT_HCC9_post_AMP GroupData.WT_HCC10_post_AMP];


GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_clear =nanmean(group_pat_pre_AMP_clear);
GroupMeans.HC_ALLCONDS.pre_AMP_clearWTstdev=nanmean(group_HC_pre_AMP_clear);
GroupMeans.pat_ALLCONDS.post_AMP_clearWTstdev=nanmean(group_pat_post_AMP_clear);
GroupMeans.HC_ALLCONDS.post_AMP_clearWTstdev=nanmean(group_HC_post_AMP_clear);
GroupStdev.pat_ALLCONDS.pre_AMP_clearWTstdev=nanstd(group_pat_pre_AMP_clear);
GroupStdev.HC_ALLCONDS.pre_AMP_clearWTstdev=nanstd(group_HC_pre_AMP_clear);
GroupStdev.pat_ALLCONDS.post_AMP_clearWTstdev=nanstd(group_pat_post_AMP_clear);
GroupStdev.HC_ALLCONDS.post_AMP_clearWTstdev=nanstd(group_HC_post_AMP_clear);

GroupMeans.pat_ALLCONDS.wholetrial_AMP_WTstdev_clear =nanmean(group_pat_wholetrial_AMP_clear);
GroupMeans.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=nanmean(group_HC_wholetrial_AMP_clear);
GroupMeans.pat_ALLCONDS.wholetrial_AMP_clearWTstdev=nanmean(group_pat_wholetrial_AMP_clear);
GroupMeans.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=nanmean(group_HC_wholetrial_AMP_clear);
GroupStdev.pat_ALLCONDS.wholetrial_AMP_clearWTstdev=nanstd(group_pat_wholetrial_AMP_clear);
GroupStdev.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=nanstd(group_HC_wholetrial_AMP_clear);
GroupStdev.pat_ALLCONDS.wholetrial_AMP_clearWTstdev=nanstd(group_pat_wholetrial_AMP_clear);
GroupStdev.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=nanstd(group_HC_wholetrial_AMP_clear);

GroupSEM.HC_ALLCONDS.pre_AMP_clearWTstdev=  GroupStdev.HC_ALLCONDS.pre_AMP_clearWTstdev/sqrt(64); % standard error of the mean
GroupSEM.HC_ALLCONDS.post_AMP_clearWTstdev= GroupStdev.HC_ALLCONDS.post_AMP_clearWTstdev/sqrt(64); % standard error of the mean
GroupSEM.pat_ALLCONDS.pre_AMP_clearWTstdev= GroupStdev.pat_ALLCONDS.pre_AMP_clearWTstdev/sqrt(64); % standard error of the mean
GroupSEM.pat_ALLCONDS.post_AMP_clearWTstdev=GroupStdev.pat_ALLCONDS.post_AMP_clearWTstdev/sqrt(64); % standard error of the mean

group_pat_pre_AMP_clear=[GroupData.WT_patC1_pre_AMP GroupData.WT_patC2_pre_AMP GroupData.WT_patC3_pre_AMP GroupData.WT_patC4_pre_AMP GroupData.WT_patC5_pre_AMP]
group_HC_pre_AMP_clear=[GroupData.WT_HCC1_pre_AMP GroupData.WT_HCC2_pre_AMP GroupData.WT_HCC3_pre_AMP GroupData.WT_HCC4_pre_AMP GroupData.WT_HCC5_pre_AMP]
group_pat_post_AMP_clear=[GroupData.WT_patC1_post_AMP GroupData.WT_patC2_post_AMP GroupData.WT_patC3_post_AMP GroupData.WT_patC4_post_AMP GroupData.WT_patC5_post_AMP]
group_HC_post_AMP_clear=[GroupData.WT_HCC1_post_AMP GroupData.WT_HCC2_post_AMP GroupData.WT_HCC3_post_AMP GroupData.WT_HCC4_post_AMP GroupData.WT_HCC5_post_AMP]

GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_clear =nanmean(group_pat_pre_AMP_clear)
GroupMeans.HC_ALLCONDS.pre_AMP_clearWTstdev=nanmean(group_HC_pre_AMP_clear)
GroupMeans.pat_ALLCONDS.post_AMP_clearWTstdev=nanmean(group_pat_post_AMP_clear)
GroupMeans.HC_ALLCONDS.post_AMP_clearWTstdev=nanmean(group_HC_post_AMP_clear)
GroupStdev.pat_ALLCONDS.pre_AMP_clearWTstdev=nanstd(group_pat_pre_AMP_clear)
GroupStdev.HC_ALLCONDS.pre_AMP_clearWTstdev=nanstd(group_HC_pre_AMP_clear)
GroupStdev.pat_ALLCONDS.post_AMP_clearWTstdev=nanstd(group_pat_post_AMP_clear)
GroupStdev.HC_ALLCONDS.post_AMP_clearWTstdev=nanstd(group_HC_post_AMP_clear)
GroupSEM.HC_ALLCONDS.pre_AMP_clearWTstdev=GroupStdev.HC_ALLCONDS.pre_AMP_clearWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.pre_AMP_clearWTstdev)) % standard error of the mean
GroupSEM.HC_ALLCONDS.post_AMP_clearWTstdev=GroupStdev.HC_ALLCONDS.post_AMP_clearWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.post_AMP_clearWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.pre_AMP_clearWTstdev=GroupStdev.pat_ALLCONDS.pre_AMP_clearWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.pre_AMP_clearWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.post_AMP_clearWTstdev=GroupStdev.pat_ALLCONDS.post_AMP_clearWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.post_AMP_clearWTstdev)) % standard error of the mean




GroupMeans.pat_ALLCONDS.wholetrial_AMP_WTstdev_clear =nanmean(group_pat_wholetrial_AMP_clear)
GroupMeans.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=nanmean(group_HC_wholetrial_AMP_clear)
GroupMeans.pat_ALLCONDS.wholetrial_AMP_clearWTstdev=nanmean(group_pat_wholetrial_AMP_clear)
GroupMeans.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=nanmean(group_HC_wholetrial_AMP_clear)
GroupStdev.pat_ALLCONDS.wholetrial_AMP_clearWTstdev=nanstd(group_pat_wholetrial_AMP_clear)
GroupStdev.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=nanstd(group_HC_wholetrial_AMP_clear)
GroupStdev.pat_ALLCONDS.wholetrial_AMP_clearWTstdev=nanstd(group_pat_wholetrial_AMP_clear)
GroupStdev.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=nanstd(group_HC_wholetrial_AMP_clear)
GroupSEM.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=GroupStdev.HC_ALLCONDS.wholetrial_AMP_clearWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.wholetrial_AMP_clearWTstdev)) % standard error of the mean
GroupSEM.HC_ALLCONDS.wholetrial_AMP_clearWTstdev=GroupStdev.HC_ALLCONDS.wholetrial_AMP_clearWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.wholetrial_AMP_clearWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.wholetrial_AMP_clearWTstdev=GroupStdev.pat_ALLCONDS.wholetrial_AMP_clearWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.wholetrial_AMP_clearWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.wholetrial_AMP_clearWTstdev=GroupStdev.pat_ALLCONDS.wholetrial_AMP_clearWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.wholetrial_AMP_clearWTstdev)) % standard error of the mean


GroupMeans.pat_ALLCONDS.wholetrial_AMP_WTstdev_noise =nanmean(group_pat_wholetrial_AMP_noise)
GroupMeans.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev=nanmean(group_HC_wholetrial_AMP_noise)
GroupMeans.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev=nanmean(group_pat_wholetrial_AMP_noise)
GroupMeans.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev=nanmean(group_HC_wholetrial_AMP_noise)
GroupStdev.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev=nanstd(group_pat_wholetrial_AMP_noise)
GroupStdev.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev=nanstd(group_HC_wholetrial_AMP_noise)
GroupStdev.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev=nanstd(group_pat_wholetrial_AMP_noise)
GroupStdev.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev=nanstd(group_HC_wholetrial_AMP_noise)
GroupSEM.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev=GroupStdev.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev=GroupStdev.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev=GroupStdev.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev=GroupStdev.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev)) % standard error of the mean







%% noise trials
GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_noise =nanmean(group_pat_pre_AMP_noise);
GroupMeans.HC_ALLCONDS.pre_AMP_noiseWTstdev=nanmean(group_HC_pre_AMP_noise);
GroupMeans.pat_ALLCONDS.post_AMP_noiseWTstdev=nanmean(group_pat_post_AMP_noise);
GroupMeans.HC_ALLCONDS.post_AMP_noiseWTstdev=nanmean(group_HC_post_AMP_noise);
GroupStdev.pat_ALLCONDS.pre_AMP_noiseWTstdev=nanstd(group_pat_pre_AMP_noise);
GroupStdev.HC_ALLCONDS.pre_AMP_noiseWTstdev=nanstd(group_HC_pre_AMP_noise);
GroupStdev.pat_ALLCONDS.post_AMP_noiseWTstdev=nanstd(group_pat_post_AMP_noise);
GroupStdev.HC_ALLCONDS.post_AMP_noiseWTstdev=nanstd(group_HC_post_AMP_noise);
GroupSEM.HC_ALLCONDS.pre_AMP_noiseWTstdev=GroupStdev.HC_ALLCONDS.pre_AMP_noiseWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.pre_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.HC_ALLCONDS.post_AMP_noiseWTstdev=GroupStdev.HC_ALLCONDS.post_AMP_noiseWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.post_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.pre_AMP_noiseWTstdev=GroupStdev.pat_ALLCONDS.pre_AMP_noiseWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.pre_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.post_AMP_noiseWTstdev=GroupStdev.pat_ALLCONDS.post_AMP_noiseWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.post_AMP_noiseWTstdev)) % standard error of the mean

group_pat_pre_AMP_noise=[GroupData.WT_patC6_pre_AMP GroupData.WT_patC7_pre_AMP GroupData.WT_patC8_pre_AMP GroupData.WT_patC9_pre_AMP GroupData.WT_patC10_pre_AMP]
group_HC_pre_AMP_noise=[GroupData.WT_HCC6_pre_AMP GroupData.WT_HCC7_pre_AMP GroupData.WT_HCC8_pre_AMP GroupData.WT_HCC9_pre_AMP GroupData.WT_HCC10_pre_AMP]
group_pat_post_AMP_noise=[GroupData.WT_patC6_post_AMP GroupData.WT_patC7_post_AMP GroupData.WT_patC8_post_AMP GroupData.WT_patC9_post_AMP GroupData.WT_patC10_post_AMP]
group_HC_post_AMP_noise=[GroupData.WT_HCC6_post_AMP GroupData.WT_HCC7_post_AMP GroupData.WT_HCC8_post_AMP GroupData.WT_HCC9_post_AMP GroupData.WT_HCC10_post_AMP]

GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_noise =nanmean(group_pat_pre_AMP_noise)
GroupMeans.HC_ALLCONDS.pre_AMP_noiseWTstdev=nanmean(group_HC_pre_AMP_noise)
GroupMeans.pat_ALLCONDS.post_AMP_noiseWTstdev=nanmean(group_pat_post_AMP_noise)
GroupMeans.HC_ALLCONDS.post_AMP_noiseWTstdev=nanmean(group_HC_post_AMP_noise)
GroupStdev.pat_ALLCONDS.pre_AMP_noiseWTstdev=nanstd(group_pat_pre_AMP_noise)
GroupStdev.HC_ALLCONDS.pre_AMP_noiseWTstdev=nanstd(group_HC_pre_AMP_noise)
GroupStdev.pat_ALLCONDS.post_AMP_noiseWTstdev=nanstd(group_pat_post_AMP_noise)
GroupStdev.HC_ALLCONDS.post_AMP_noiseWTstdev=nanstd(group_HC_post_AMP_noise)
GroupSEM.HC_ALLCONDS.pre_AMP_noiseWTstdev=GroupStdev.HC_ALLCONDS.pre_AMP_noiseWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.pre_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.HC_ALLCONDS.post_AMP_noiseWTstdev=GroupStdev.HC_ALLCONDS.post_AMP_noiseWTstdev/sqrt(length(GroupStdev.HC_ALLCONDS.post_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.pre_AMP_noiseWTstdev=GroupStdev.pat_ALLCONDS.pre_AMP_noiseWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.pre_AMP_noiseWTstdev)) % standard error of the mean
GroupSEM.pat_ALLCONDS.post_AMP_noiseWTstdev=GroupStdev.pat_ALLCONDS.post_AMP_noiseWTstdev/sqrt(length(GroupStdev.pat_ALLCONDS.post_AMP_noiseWTstdev)) % standard error of the mean


%% post anova t tests
STATS.cond1_pre_ttest_stdwithin=ttest2(GroupData.WT_patC1_pre, GroupData.WT_HCC1_pre);
STATS.cond2_pre_ttest_stdwithin=ttest2(GroupData.WT_patC2_pre, GroupData.WT_HCC2_pre);
STATS.cond3_pre_ttest_stdwithin=ttest2(GroupData.WT_patC3_pre, GroupData.WT_HCC3_pre);
STATS.cond4_pre_ttest_stdwithin=ttest2(GroupData.WT_patC4_pre, GroupData.WT_HCC4_pre);
STATS.cond5_pre_ttest_stdwithin=ttest2(GroupData.WT_patC5_pre, GroupData.WT_HCC5_pre);
STATS.cond6_pre_ttest_stdwithin=ttest2(GroupData.WT_patC6_pre, GroupData.WT_HCC6_pre);
STATS.cond7_pre_ttest_stdwithin=ttest2(GroupData.WT_patC7_pre, GroupData.WT_HCC7_pre);
STATS.cond8_pre_ttest_stdwithin=ttest2(GroupData.WT_patC8_pre, GroupData.WT_HCC8_pre);
STATS.cond9_pre_ttest_stdwithin=ttest2(GroupData.WT_patC9_pre, GroupData.WT_HCC9_pre);
STATS.cond10_pre_ttest_stdwithin=ttest2(GroupData.WT_patC10_pre, GroupData.WT_HCC10_pre);

STATS.cond1_post_ttest_stdwithin=ttest2(GroupData.WT_patC1_post, GroupData.WT_HCC1_post_AMP);
STATS.cond2_post_ttest_stdwithin=ttest2(GroupData.WT_patC2_post, GroupData.WT_HCC2_post_AMP);
STATS.cond3_post_ttest_stdwithin=ttest2(GroupData.WT_patC3_post, GroupData.WT_HCC3_post_AMP);
STATS.cond4_post_ttest_stdwithin=ttest2(GroupData.WT_patC4_post, GroupData.WT_HCC4_post_AMP);
STATS.cond5_post_ttest_stdwithin=ttest2(GroupData.WT_patC5_post, GroupData.WT_HCC5_post_AMP);
STATS.cond6_post_ttest_stdwithin=ttest2(GroupData.WT_patC6_post, GroupData.WT_HCC6_post_AMP);
STATS.cond7_post_ttest_stdwithin=ttest2(GroupData.WT_patC7_post, GroupData.WT_HCC7_post_AMP);
STATS.cond8_post_ttest_stdwithin=ttest2(GroupData.WT_patC8_post, GroupData.WT_HCC8_post_AMP);
STATS.cond9_post_ttest_stdwithin=ttest2(GroupData.WT_patC9_post, GroupData.WT_HCC9_post_AMP);
STATS.cond10_post_ttest_stdwithin=ttest2(GroupData.WT_patC10_post, GroupData.WT_HCC10_post_AMP);

% comparisons of interest
STATS.stdwithin_allnoise_vs_clear_HCs_pre
STATS.stdwithin_allnoise_vs_clear_pats_pre

% PLOT FINAL FIGURES
%AMP
fig6=figure;
ymin=0
ymax=80

whitebg('white')
subplot(2,2,1)
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'GROUP DATA: Within trial stdev, PATS VS HCS, PRE AND POST, clear and noise', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
% y_AMP=[GroupMeans.pat_ALLCONDS.pre_AMPWTstdev_clear GroupMeans.HC_ALLCONDS.pre_AMPWTstdev_clear; ...
%          GroupMeans.pat_ALLCONDS.post_AMPWTstdev_clear GroupMeans.HC_ALLCONDS.post_AMPWTstdev_clear ]
% errY = [GroupSEM.pat_ALLCONDS.pre_AMPWTstdev_clear GroupSEM.HC_ALLCONDS.pre_AMPWTstdev_clear; GroupSEM.pat_ALLCONDS.post_AMPWTstdev_clear GroupSEM.HC_ALLCONDS.post_AMPWTstdev_clear]          % 10% error
y_AMP2=[GroupMeans.HC_ALLCONDS.pre_AMPWTstdev_clear GroupMeans.pat_ALLCONDS.pre_AMPWTstdev_clear; ...
          GroupMeans.HC_ALLCONDS.pre_AMPWTstdev_noise GroupMeans.pat_ALLCONDS.pre_AMPWTstdev_noise]
errY2 = [ GroupSEM.HC_ALLCONDS.pre_AMPWTstdev_clear GroupSEM.pat_ALLCONDS.pre_AMPWTstdev_clear; ...
          GroupSEM.HC_ALLCONDS.pre_AMPWTstdev_noise GroupSEM.pat_ALLCONDS.pre_AMPWTstdev_noise]            
h = barwitherr(errY2, y_AMP2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
ylabel('mean stdev of AMP')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Pre Step'));
axis([0 3 ymin ymax])
goodplot

% STATS.group_pre_clear_patsVhcs=ttest2(group_pat_pre_clear, group_HC_pre_clear)
% STATS.group_pre_noise_patsVhcs=ttest2(group_pat_pre_noise, group_HC_pre_noise)
% STATS.group_post_pats_clearVnoise=ttest2(group_pat_post_clear, group_pat_pre_noise)
% STATS.group_post_HCs_clearVnoise=ttest2(group_HC_post_clear, group_HC_pre_noise)
STATS.allclearconds_pat_HCs_pre=ttest2(group_pat_pre_clear, group_HC_pre_clear)
STATS.allclearconds_pat_HCs_post=ttest2(group_pat_post_clear, group_HC_post_clear)
%STATS.allclearconds_pre_post_pats=ttest(group_pat_pre_clear, group_pat_post_clear)
% ZED: why are these different lengths?
% x/13/5
STATS.allclearconds_pre_post_HCs=ttest2(group_HC_pre_clear, group_HC_post_clear)

STATS.allnoiseconds_pat_HCs_pre=ttest2(group_pat_pre_noise, group_HC_pre_noise)
STATS.allnoiseconds_pat_HCs_post=ttest2(group_pat_post_noise, group_HC_post_noise)
STATS.allnoiseconds_pre_post_pats=ttest(group_pat_pre_noise, group_pat_post_noise)
STATS.allnoiseconds_pre_post_HCs=ttest(group_HC_pre_noise, group_HC_post_noise)

subplot(2,2,2)
% y_AMP=[GroupMeans.pat_ALLCONDS.pre_AMPWTstdev_noise GroupMeans.HC_ALLCONDS.pre_AMPWTstdev_noise; GroupMeans.pat_ALLCONDS.post_AMPWTstdev_noise GroupMeans.HC_ALLCONDS.post_AMPWTstdev_noise ]
% errY = [GroupSEM.pat_ALLCONDS.pre_AMPWTstdev_noise GroupSEM.HC_ALLCONDS.pre_AMPWTstdev_noise; GroupSEM.pat_ALLCONDS.post_AMPWTstdev_noise GroupSEM.HC_ALLCONDS.post_AMPWTstdev_noise]          % 10% error
y_AMP2=[GroupMeans.HC_ALLCONDS.post_AMPWTstdev_clear GroupMeans.pat_ALLCONDS.post_AMPWTstdev_clear ; ...
          GroupMeans.HC_ALLCONDS.post_AMPWTstdev_noise GroupMeans.pat_ALLCONDS.post_AMPWTstdev_noise]
errY2 = [ GroupSEM.HC_ALLCONDS.post_AMPWTstdev_clear GroupSEM.pat_ALLCONDS.post_AMPWTstdev_clear; ...
          GroupSEM.HC_ALLCONDS.post_AMPWTstdev_noise GroupSEM.pat_ALLCONDS.post_AMPWTstdev_noise]          % 10% error     
h = barwitherr(errY2, y_AMP2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
legend('HCs','Patients')
ylabel('mean stdev of amp')
set(h(1),'FaceColor','k'); 
set(h(2),'FaceColor','w');
title(sprintf('Post Step'));
axis([0 3 ymin ymax])
goodplot

subplot(2,2,3)
% y_AMP_clear=[GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_clear  GroupMeans.HC_ALLCONDS.pre_AMP_clearWTstdev; ...
%              GroupMeans.pat_ALLCONDS.post_AMP_clearWTstdev GroupMeans.HC_ALLCONDS.post_AMP_clearWTstdev ]
% errY = [GroupSEM.pat_ALLCONDS.pre_AMP_clearWTstdev GroupSEM.HC_ALLCONDS.pre_AMP_clearWTstdev; ...
%         GroupSEM.pat_ALLCONDS.post_AMP_clearWTstdev GroupSEM.HC_ALLCONDS.post_AMP_clearWTstdev]          % 10% error
y_AMP_clear2=[GroupMeans.HC_ALLCONDS.pre_AMP_clearWTstdev GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_clear ; ...
          GroupMeans.HC_ALLCONDS.pre_AMP_noiseWTstdev GroupMeans.pat_ALLCONDS.pre_AMP_WTstdev_noise]
errY2 = [GroupSEM.HC_ALLCONDS.pre_AMP_clearWTstdev GroupSEM.pat_ALLCONDS.pre_AMP_clearWTstdev; ...
         GroupSEM.HC_ALLCONDS.pre_AMP_noiseWTstdev GroupSEM.pat_ALLCONDS.post_AMP_noiseWTstdev]          % 10% error     
h = barwitherr(errY2, y_AMP_clear2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
%legend('Patients','HCs')
ylabel('mean stdev of amp')
set(h(1),'FaceColor','k'); 
set(h(2),'FaceColor','w');
goodplot
%amp
subplot(2,2,4)
% y_post_noise=[GroupMeans.pat_ALLCONDS.pre_post_WTstdev_noise  GroupMeans.HC_ALLCONDS.pre_post_noiseWTstdev; GroupMeans.pat_ALLCONDS.post_post_noiseWTstdev GroupMeans.HC_ALLCONDS.post_post_noiseWTstdev ]
% errY = [GroupSEM.pat_ALLCONDS.pre_post_noiseWTstdev GroupSEM.HC_ALLCONDS.pre_post_noiseWTstdev; GroupSEM.pat_ALLCONDS.post_post_noiseWTstdev GroupSEM.HC_ALLCONDS.post_post_noiseWTstdev]          % 10% error
y_AMP_noise2=[GroupMeans.HC_ALLCONDS.post_AMP_clearWTstdev GroupMeans.pat_ALLCONDS.post_AMP_clearWTstdev ; ...
          GroupMeans.HC_ALLCONDS.post_AMP_noiseWTstdev GroupMeans.pat_ALLCONDS.post_AMP_noiseWTstdev]
errY2 = [GroupSEM.HC_ALLCONDS.post_AMP_clearWTstdev GroupSEM.pat_ALLCONDS.post_AMP_clearWTstdev; ...
         GroupSEM.HC_ALLCONDS.post_AMP_noiseWTstdev GroupSEM.pat_ALLCONDS.post_AMP_noiseWTstdev]          % 10% error     

h = barwitherr(errY2, y_AMP_noise2);% Plot with errorbars
set(gca,'XTickLabel',{'pre window','post window'})
ylabel('mean stdev of amp')
set(h(1),'FaceColor','k'); 
set(h(2),'FaceColor','w');
goodplot

saveas(fig6, 'GROUP_meanstdev.jpg')




% wholetrial


fig7=figure;
ymin=0
ymax=200

whitebg('white')
subplot(2,1,1)
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'GROUP DATA: Within trial stdev, PATS VS HCS, clear and noise', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_AMP2=[GroupMeans.HC_ALLCONDS.wholetrial_AMPWTstdev_clear GroupMeans.pat_ALLCONDS.wholetrial_AMPWTstdev_clear; ...
          GroupMeans.HC_ALLCONDS.wholetrial_AMPWTstdev_noise GroupMeans.pat_ALLCONDS.wholetrial_AMPWTstdev_noise]
errY2 = [ GroupSEM.HC_ALLCONDS.wholetrial_AMPWTstdev_clear GroupSEM.pat_ALLCONDS.wholetrial_AMPWTstdev_clear; ...
          GroupSEM.HC_ALLCONDS.wholetrial_AMPWTstdev_noise GroupSEM.pat_ALLCONDS.wholetrial_AMPWTstdev_noise]            
h = barwitherr(errY2, y_AMP2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
ylabel('mean stdev of AMP (cents)')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('wholetrial'));
axis([0 3 ymin ymax])

STATS.allclearconds_pat_HCs_pre=ttest2(group_pat_wholetrial_clear, group_HC_wholetrial_clear)
STATS.allclearconds_pat_HCs_post=ttest2(group_pat_post_clear, group_HC_post_clear)
%STATS.allclearconds_wholetrial_post_pats=ttest(group_pat_wholetrial_clear, group_pat_post_clear)
% ZED: why are these different lengths?
% x/13/5
STATS.allclearconds_wholetrial_post_HCs=ttest2(group_HC_wholetrial_clear, group_HC_post_clear)

STATS.allnoiseconds_pat_HCs_wholetrial=ttest2(group_pat_wholetrial_noise, group_HC_wholetrial_noise)
STATS.allnoiseconds_pat_HCs_post=ttest2(group_pat_post_noise, group_HC_post_noise)
STATS.allnoiseconds_wholetrial_post_pats=ttest(group_pat_wholetrial_noise, group_pat_post_noise)
STATS.allnoiseconds_wholetrial_post_HCs=ttest(group_HC_wholetrial_noise, group_HC_post_noise)

subplot(2,1,2)

y_AMP_clear2=[GroupMeans.HC_ALLCONDS.wholetrial_AMP_clearWTstdev GroupMeans.pat_ALLCONDS.wholetrial_AMP_WTstdev_clear ; ...
          GroupMeans.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev GroupMeans.pat_ALLCONDS.wholetrial_AMP_WTstdev_noise]
errY2 = [GroupSEM.HC_ALLCONDS.wholetrial_AMP_clearWTstdev GroupSEM.pat_ALLCONDS.wholetrial_AMP_clearWTstdev; ...
         GroupSEM.HC_ALLCONDS.wholetrial_AMP_noiseWTstdev GroupSEM.pat_ALLCONDS.wholetrial_AMP_noiseWTstdev]          % 10% error     
h = barwitherr(errY2, y_AMP_clear2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
%legend('Patients','HCs')
ylabel('mean stdev of amp')
set(h(1),'FaceColor','k'); 
set(h(2),'FaceColor','w');


saveas(fig7, 'GROUP_meanstdev_wholetrialWTstdev.jpg')



%% anova
%factor = time window
% level = subject group


%% second attempt at anova after talking to sri and running it on the means
% not the raw data
anovandata=[group_pat_pre_clear_anova group_pat_post_clear_anova group_HC_pre_clear_anova group_HC_post_clear_anova ...
            group_pat_pre_noise_anova group_pat_post_noise_anova group_HC_pre_noise_anova group_HC_post_noise_anova];

%create subject group
test=ones(1,10);
test2=test*2;
subjectgroup=[test test2 test test2];


%create window group
pre_post = cell(1,20);
for i=1:5
    %names{i} = ['Sample Text ' num2str(i)];
    pre_post{i} = 'pre';
end
for i=6:10
    pre_post{i} = 'post';
end
for i=11:15
    %names{i} = ['Sample Text ' num2str(i)];
    pre_post{i} = 'pre';
end
for i=16:20
    pre_post{i} = 'post';
end
pre_post2=[pre_post pre_post]
pre_post=pre_post2';

%create condition group
condition = cell(1,40);
for i=1:20
    condition{i}='clear';
end
for i=21:40
    condition{i}='noise';
end
condition=condition';

group1=[subjectgroup];
group2=[pre_post];
group3=[condition];
p = anovan(anovandata,{group1 group2 group3},'model','interaction')
% p = anovan(test,{group1 group2 group3},'model','interaction')
% p = anovan(anovandata,{group1 group2 group3}, 1)
% p = anovan(anovandata,{group1 group2 group3}, 'full')

save STATS STATS

