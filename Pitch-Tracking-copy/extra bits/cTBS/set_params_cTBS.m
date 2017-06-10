%% Sets parameters for all 

% dock all figures
set(0,'DefaultFigureWindowStyle','docked');
cerebellar_data_rootdir = '/Users/zagnew/cTBS_data/pitch_tracking/';

npatients = 0;
%prestim
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'cereb_TMS_pre_data/s05_pre_pitchtracking/expr2015.07.02.T15.27.58/speak/';

% post stim
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'cereb_TMS_post_data/s05_post_pitchtracking/expr2015.07.02.T16.12.52/speak/';




% pitch stuff
fs = 11025;
pitch_lims = [80 300]; % sets pitch finding limits
pitch_lims2plot = [50 300];
shift_lims2plot = [-300 300];
        


% load sub_total_goodtrial;
%% EXP INFO
fs = 11025;     
data_size = 32; 
frame_rate = fs/data_size;
framef = fs/32;
frame_fs = fs/data_size;
stepframe=413; 
amp_thresh=5*(10 ^ 7);                                  %amplitude threshold for cut off


% num trials and blocks
num_blocks= 8;
trialsperblock=10;

% cents to shift
sup=100; % small up
bup=300; % big up
nos=0;   % no shift
sdw=-100; % small down
bdw=-300; % big down
cents2shift_types = [sup bup nos sdw bdw];

% frame to seconds
% frame_num=413;
% frame_num=50;
% framestosecs=(frame_num)/frame_fs;

framestoremove=50; % frames to remove after a break in voicing (used in B file) 

seconds_per_trial_req = 4.0;
nframes_per_trial = round(seconds_per_trial_req*frame_rate);
seconds_per_trial = nframes_per_trial/frame_rate;
step_time=stepframe/frame_fs



%% TIMINGS e.g. step occurs at 413 frames.
% 
% %patients
% T1= 400; %210;                          %frames
% T2= 600; %410; % 200 frames
% % HCs
% T1= 250;                          %frames
% T2= 450; %410; % 200 frames
% T3=1000;    %3789.5ms
% T4=1200;    %4478.5ms
% 
% T1secs=(T1)/frame_fs;
% T2secs=(T2)/frame_fs;
% T3secs=(T3)/frame_fs;
% T4secs=(T4)/frame_fs;
% step_secs=(stepframe)/frame_fs;
% T_gap=T3-T2;


%% patients and HCs with separate time windows
T1_HC= 220; %210;                          %frames
T2_HC= 420; %410; % 200 frames
T3_HC=1000;    %3789.5ms
T4_HC=1200;    %4478.5ms

T1_pat= 350; %210;                          %frames
T2_pat= 550; %410; % 200 frames
T3_pat=1000;    %3789.5ms
T4_pat=1200;    %4478.5ms


T1secs_HC=(T1_HC)/frame_fs;
T2secs_HC=(T2_HC)/frame_fs;
T3secs_HC=(T3_HC)/frame_fs;
T4secs_HC=(T4_HC)/frame_fs;

T1secs_pat=(T1_pat)/frame_fs;
T2secs_pat=(T2_pat)/frame_fs;
T3secs_pat=(T3_pat)/frame_fs;
T4secs_pat=(T4_pat)/frame_fs;

T_gap_HC=T3_HC-T2_HC;
T_gap_pat=T3_pat-T2_pat;

T1secs_HC=(T1_HC)/frame_fs;
T2secs_HC=(T2_HC)/frame_fs;
T3secs_HC=(T3_HC)/frame_fs;
T4secs_HC=(T4_HC)/frame_fs;

T1secs_pat=(T1_pat)/frame_fs;
T2secs_pat=(T2_pat)/frame_fs;
T3secs_pat=(T3_pat)/frame_fs;
T4secs_pat=(T4_pat)/frame_fs;

T_gap=T3_HC-T2_HC;

step_secs=(stepframe)/frame_fs;

T=[400 1270];
start=T(1)/frame_fs;
stop=T(2)/frame_fs;
 
%% SUBJECTS TO INCLUDE

 subjects_included= [1];
 patients_included=[1];


% for vocal tremor
%patients_included=[2 12];

numpats1=size(patients_included);
numpats=numpats1(2);
numHCs1=size(subjects_included);
numHCs=numHCs1(2);
numsubs=numHCs+numpats;

temp=16 + subjects_included;
allincluded=[patients_included temp];
totalpats=16;
totalHCs=11;

%% THERSHOLDS AND ARTEFACT REMOVAL
reactiontime_frames=200;

stdev_cutoff_pre_pats =       500;
stdev_cutoff_post_pats =      500;
stdev_cutoff_wholetrial_pats =  500; 
stdev_cutoff_pre_amp_pats=  500000000;
stdev_cutoff_post_amp_pats= 500000000;
stdev_cutoff_wholetrial_amp_pats= 500000000;

stdev_cutoff_pre_HCs =       500;
stdev_cutoff_post_HCs =      500;
stdev_cutoff_wholetrial_HCs =  500; 
stdev_cutoff_pre_amp_HCs=  500000000;
stdev_cutoff_post_amp_HCs= 500000000;
stdev_cutoff_wholetrial_amp_HCs= 500000000;

% 
% stdev_cutoff_pre_pats =  62.9157;
% stdev_cutoff_post_pats =      57.7590;
% stdev_cutoff_wholetrial_pats =  220.3432;
% 
% stdev_cutoff_pre_amp_pats=  1.2451e+08;
% stdev_cutoff_post_amp_pats= 9.1693e+07;
% stdev_cutoff_wholetrial_amp_pats= 3.7081e+06;
% 
% stdev_cutoff_pre_HCs =   25.3077;
% stdev_cutoff_post_HCs =   22.7825;
% stdev_cutoff_wholetrial_HCs = 133.1304;
%              
% stdev_cutoff_pre_amp_HCs=  1.4719e+08;
% stdev_cutoff_post_amp_HCs= 8.5181e+07;
% stdev_cutoff_wholetrial_amp_HCs=5.5091e+08;



perf_thresh_pos=100;
perf_thresh_neg=-100;

perf_thresh_pos_cents=50;
perf_thresh_neg_cents=-50;

% perf_thresh_pos_cents=10;
% perf_thresh_neg_cents=-10;

%% for plotting
nframes_to_plot= 1378-5;     %nframes_per_trial-5;
nframes_to_use=1360;         %nframes_per_trial-18;
frame_taxis = (0:(nframes_per_trial-1))/framef;
frame_taxis_to_use = (0:(nframes_to_use-1))/frame_fs;

%% convert frames to seconds
% 1 frame=3.445 ms
% 1ms = 0.29 frames
% 200 frames = 670 ms
% 1s/1000ms = 290 frames
% STEP: 413 frames=3.445*413            = 1422 ms/ 1.4 secs
% usable trial length: 1360 frames      = 4685 ms/ 4.685 secs
% full trial length: 3.445*1378           = 4747 ms/ 4.747 secs

%% Experimental info for reference:

% http://members.efn.org/~qehn/global/building/cents.htm
%     1 - Clear small up
%     2 - Clear big up
%     3 - Clear flat
%     4 - Clear small down
%     5 - Clear big down
%     6 - Masked small up
%     7 - Masked big up
%     8 - Masked flat
%     9 - Masked small down
%     10 - Masked big downs

% times to step
tbase = 1.2; tinc = 0.2;
tstep(1) = tbase;
tstep(2) = tstep(1) + tinc;
tstep(3) = tstep(2) + tinc;
tstep(4) = tstep(3) + tinc;
tstep(5) = tstep(4) + tinc;
istep = round(tstep*frame_rate);


%% FOR SEMS: ZKA to do BY TRIALS INCLUDED NOT TOTAL TRIALS
%SEM: dividing the SD by the square root of N. 
forstdev_HCs=numHCs*8;
forstdev_PATs=numpats*8;

%% for ploting graphs
%patient_colour=[.49 1 .63];
patient_colour='r';
HC_colour='k';
% HC_colour=[.4 .4 .4];
sig_colour=[.3 .3 .8];


% 'Color',[HC_colour]
