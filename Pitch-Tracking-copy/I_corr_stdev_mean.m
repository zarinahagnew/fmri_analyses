clear all
close all
set_params;
home=pwd

cd /Users/zagnew/Cereb_data/data/SUB01/expr2014.03.21.T10.46.03_mainrun/speak/block0

pitchdata_old=get_vec_hist6('pitch2',3);            % two arguments are file name and then file type (float vec)
orig_pertresp=get_vec_hist6('blockalt',3);          % pert response (needs to be shifted in time as only begins in response to voice onsett detect
voiceonset=get_vec_hist6('voice_onset_detect',2);   % voice detect
outbuff_wav=get_vec_hist6('outbuffer', 3);          % ZKA: playable waveform - do spectral analysis on this signal
outbuff_pitch=get_vec_hist6('output_pitch', 3);     % pitch of outbuffer is the target
amp=get_vec_hist6('weighted_mean_abs_inbuffer2', 3);
audio=get_vec_hist6('inbuffer2',3);
voicethresh=get_vec_hist6('thresh_inbuffer_state',2);

fs = 11025;
pitch_lims = [90 250]; % sets pitch finding limits
pitch_lims2plot = [50 300];
shift_lims2plot = [-300 300];
vhs = [];
vhs = add2vechists(vhs,'inbuffer2');
vhs = add2vechists(vhs,'pitch2');
ntrials = vhs.inbuffer2.ntrials;
y = play_vec_hist6(vhs.inbuffer2,1,fs,0);
nsamps = length(y);
taxis = (0:(nsamps-1))/fs;
nframes = vhs.pitch2.nvecs;
data_size = vhs.inbuffer2.vec_size;
frame_fs = fs/data_size;
frame_taxis = (0:(nframes-1))/frame_fs;
frame_taxis_to_use = (0:(nframes_to_use-1))/frame_fs;
frame_taxis_window = (0:201)/frame_fs;

% create shifts
shift(1)=1;
shift(2)=2;
shift(3)=0;
shift(4)=-1;
shift(5)=-2;


load /Users/zagnew/Cereb_data/data/TrialData.mat
load /Users/zagnew/Cereb_data/data/GroupData.mat
cd /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches



%subject 1, condition 1:
DATA(1).StdWithinCond1_within_pre_stdev
shiftinhertz_all(1)
meanpitch by trial

% calculate distance from target for each trial for each subject
for isubj=1:27
    for itrial=1:8
Diff_allsubs_alltrials(isubj).cond1_pre(itrial)=  shiftinhertz_all(isubj).smallstepup - DATA(isubj).StdWithinCond1_within_pre_stdev(itrial)
Diff_allsubs_alltrials(isubj).cond1_post(itrial)=  shiftinhertz_all(isubj).smallstepup - DATA(isubj).StdWithinCond1_within_post_stdev(itrial)




Diff_allsubs_alltrials(isubj).cond1_post= shiftinhertz_all(isubj).smallstepup -  DATA(isubj).mean_cond1_post)   %small up
Diff_allsubs_alltrials(isubj).cond2_pre=  shiftinhertz_all(isubj).bigstepup -  DATA(isubj).mean_cond2_pre)    %big up 
Diff_allsubs_alltrials(isubj).cond2_post= shiftinhertz_all(isubj).bigstepup -  DATA(isubj).mean_cond2_post)
Diff_allsubs_alltrials(isubj).cond3_pre=  shiftinhertz_all(isubj).nostep -  DATA(isubj).mean_cond3_pre)    % flat
Diff_allsubs_alltrials(isubj).cond3_post= shiftinhertz_all(isubj).nostep -  DATA(isubj).mean_cond3_post)
Diff_allsubs_alltrials(isubj).cond4_pre=  shiftinhertz_all(isubj).smallstepdown -  DATA(isubj).mean_cond4_pre)
Diff_allsubs_alltrials(isubj).cond4_post= shiftinhertz_all(isubj).smallstepdown-  DATA(isubj).mean_cond4_post)
Diff_allsubs_alltrials(isubj).cond5_pre=  shiftinhertz_all(isubj).bigstepdown -  DATA(isubj).mean_cond5_pre)
Diff_allsubs_alltrials(isubj).cond5_post= shiftinhertz_all(isubj).bigstepdown -  DATA(isubj).mean_cond5_post)
Diff_allsubs_alltrials(isubj).cond6_pre=  shiftinhertz_all(isubj).smallstepup -  DATA(isubj).mean_cond6_pre)
Diff_allsubs_alltrials(isubj).cond6_post= shiftinhertz_all(isubj).smallstepup -  DATA(isubj).mean_cond6_post)
Diff_allsubs_alltrials(isubj).cond7_pre=  shiftinhertz_all(isubj).bigstepup -  DATA(isubj).mean_cond7_pre)
Diff_allsubs_alltrials(isubj).cond7_post= shiftinhertz_all(isubj).bigstepup -  DATA(isubj).mean_cond7_post)
Diff_allsubs_alltrials(isubj).cond8_pre=  shiftinhertz_all(isubj).nostep -  DATA(isubj).mean_cond8_pre)
Diff_allsubs_alltrials(isubj).cond8_post= shiftinhertz_all(isubj).nostep -  DATA(isubj).mean_cond8_post)
Diff_allsubs_alltrials(isubj).cond9_post= shiftinhertz_all(isubj).smallstepdown -  DATA(isubj).mean_cond8_post)
Diff_allsubs_alltrials(isubj).cond9_pre=  shiftinhertz_all(isubj).smallstepdown -  DATA(isubj).mean_cond9_pre)
Diff_allsubs_alltrials(isubj).cond10_pre= shiftinhertz_all(isubj).bigstepdown -  DATA(isubj).mean_cond10_pre)
Diff_allsubs_alltrials(isubj).cond10_post=shiftinhertz_all(isubj).bigstepdown -  DATA(isubj).mean_cond10_post)
end
