%% Sets parameters for all 

% dock all figures
set(0,'DefaultFigureWindowStyle','docked');
cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data_final_run/';
stats_dir = '/Users/zagnew/Cereb_data/data_final_run/GroupData/stats/';

%% EXPERIMENTAL INFO
fs = 11025;     
data_size = 32; 
frame_rate = fs/data_size;
framef = fs/32;
frame_fs = fs/data_size;
stepframe=413; 
amp_thresh=5*(10 ^ 7);   %amplitude threshold for cut off

% number of trials and blocks
num_blocks= 8;
trialsperblock=10;

% cents to shift
sup=100; % small up
bup=300; % big up
nos=0;   % no shift
sdw=-100; % small down
bdw=-300; % big down
cents2shift_types = [sup bup nos sdw bdw];

framestoremove=50; % frames to remove after a break in voicing (used in B file) 

seconds_per_trial_req = 4.0;
nframes_per_trial = round(seconds_per_trial_req*frame_rate);
seconds_per_trial = nframes_per_trial/frame_rate;
step_time=stepframe/frame_fs;


%% create targets
test=[zeros(1, stepframe) ones(1, 1360-stepframe)];
smallup=test*100;
bigup=test*300;
smalldown=test*-100;
bigdown=test*-300;
nostep=zeros(1,1360);

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

%% patients and HCs with separate time windows
T1_HC= 220;     %210;             
T2_HC= 420;     %410;   % 200 frames
T3_HC=1000;     %3789.5
T4_HC=1200;     %4478.5

T1_pat= 350;    %210;             
T2_pat= 550;    %410;   % 200 frames
T3_pat=1000;    %3789.5
T4_pat=1200;    %4478.5

T1secs_HC=(T1_HC)/frame_fs;
T2secs_HC=(T2_HC)/frame_fs;
T3secs_HC=(T3_HC)/frame_fs;
T4secs_HC=(T4_HC)/frame_fs;

T1secs_pat=(T1_pat)/frame_fs;
T2secs_pat=(T2_pat)/frame_fs;
T3secs_pat=(T3_pat)/frame_fs;
T4secs_pat=(T4_pat)/frame_fs;

% T_gap_HC_pre=T3_HC-T2_HC;
% T_gap_pat_pre=T3_pat-T2_pat;
% 
% T_gap_HC=T3_HC-T2_HC;
% T_gap_pat=T3_pat-T2_pat;


step_secs=(stepframe)/frame_fs;

T=[400 1270];
start=T(1)/frame_fs;
stop=T(2)/frame_fs;
 
%% SUBJECTS TO INCLUDE
%assessed Oct 2015 (WORKS)
   subjects_included= [1 4 5 6 8 10 11 14];
   patients_included=[1 5 8 9 10 12 13 14 15 16];
  
  % HCS
  % bad [2 3 7 9 13]
  % 12 is ok but makes it look a bit worse..

% patients_included= [1:16];

%subjects_included= [1:14];

% original
%  subjects_included= [1 6 10 11];
%  patients_included=[1 5 8:16];

numpats=length(patients_included);
numHCs=length(subjects_included);
numsubs=numHCs+numpats;

temp=16 + subjects_included;
allincluded=[patients_included temp];
numincluded=length(allincluded);

totalpats=16;
totalHCs=14;

%% THRESHOLDS AND ARTEFACT REMOVAL
reactiontime_frames=200;

% stdev_cutoff_pre_pats =       500;
% stdev_cutoff_post_pats =      500;
% stdev_cutoff_wholetrial_pats =  500; 
% stdev_cutoff_pre_amp_pats=  500000000;
% stdev_cutoff_post_amp_pats= 500000000;
% stdev_cutoff_wholetrial_amp_pats= 500000000;
% 
% stdev_cutoff_pre_HCs =       500;
% stdev_cutoff_post_HCs =      500;
% stdev_cutoff_wholetrial_HCs =  500; 
% stdev_cutoff_pre_amp_HCs=  500000000;
% stdev_cutoff_post_amp_HCs= 500000000;
% stdev_cutoff_wholetrial_amp_HCs= 500000000;


stdev_cutoff_pre_pats= 58.8452;
stdev_cutoff_post_pats= 56.3249;
stdev_cutoff_wholetrial_pats= 222.4990;

stdev_cutoff_pre_HCs= 38.5696;
stdev_cutoff_post_HCs= 29.5519;
stdev_cutoff_wholetrial_HCs= 151.8048;

stdev_cutoff_pre_amp_pats= 8.1437e+07;
stdev_cutoff_post_amp_pats= 5.9068e+07;
stdev_cutoff_wholetrial_amp_pats= 222.4990;
    
stdev_cutoff_pre_amp_HCs=1.0354e+08;
stdev_cutoff_post_amp_HCs= 6.2216e+07;
stdev_cutoff_wholetrial_amp_HCs= NaN;

% stdev_cutoff_pre_pats= 63.1873;
% stdev_cutoff_post_pats= 59.3270;
% stdev_cutoff_wholetrial_pats= 226.7540;
% 
% stdev_cutoff_pre_HCs= 28.9399;
% stdev_cutoff_post_HCs= 23.4410;
% stdev_cutoff_wholetrial_HCs= 139.7333;
% 
% stdev_cutoff_pre_amp_pats= 1.1910e+08;
% stdev_cutoff_post_amp_pats=  9.0705e+07;
% stdev_cutoff_wholetrial_amp_pats= 226.7540;
%  
% stdev_cutoff_pre_amp_HCs= 1.3881e+08;
% stdev_cutoff_post_amp_HCs= 1.0684e+08;
% stdev_cutoff_wholetrial_amp_HCs= 4.2688e+08;


perf_thresh_pos=100;
perf_thresh_neg=-100;

% perf_thresh_pos_cents=50;
% perf_thresh_neg_cents=-50;

perf_thresh_pos_cents=2000;
perf_thresh_neg_cents=-2000;


% perf_thresh_pos_cents=2000;
% perf_thresh_neg_cents=-2000;

%% for plotting
nframes_to_plot= 1378-5;     %nframes_per_trial-5;
nframes_to_use=1360;         %nframes_per_trial-18;
frame_taxis = (0:(nframes_per_trial-1))/framef;
frame_taxis_to_use = (0:(nframes_to_use-1))/frame_fs;

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

%% for plotting consistent graphs colours
% patient_colour=[.49 1 .63];
% HC_colour=[.4 .4 .4];

% patient_colour='r';
% HC_colour='k';
% sig_colour=[.3 .3 .8];


% greyscale colours
% bigdown_gs= 'r';
% down_gs='y';
% bigup_gs='b';
% up_gs='c';
% flat_gs='k';

z_colours;

% % greyscale
% bigdown_gs=[0 0 0]+0.2;
% down_gs=[0 0 0]+0.4;
% bigup_gs=[0 0 0]+0.8;
% up_gs=[0 0 0]+0.6;
% flat_gs=[0 0 0]+0.5;
 
% plot(ones(1,10)*3,'linewidth',2,'Color',[0 0 0]+bigup)
% hold
% axis([0 10 -5 5])
% plot(ones(1,10)*2,'linewidth',2,'Color',[0 0 0]+up)
% plot(ones(1,10)*1,'linewidth',2,'Color',[0 0 0]+flat)
% plot(ones(1,10)*-1,'linewidth',2,'Color',[0 0 0]+bigdown)
% plot(ones(1,10)*-2,'linewidth',2,'Color',[0 0 0]+down)

%% Useful notes
% frame to seconds
 frame_num=413;
 framestosecs=(frame_num)/frame_fs;

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

% 'Color',[HC_colour]

%% TIMINGS e.g. step occurs at 413 frames.
% patients
% T1= 400; %210;                          %frames
% T2= 600; %410; % 200 frames

% HCs
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


%% convert frames to seconds
% 1 frame=3.445 ms
% 1ms = 0.29 frames
% 200 frames = 670 ms
% 1s/1000ms = 290 frames
% STEP: 413 frames=3.445*413            = 1422 ms/ 1.4 secs
% usable trial length: 1360 frames      = 4685 ms/ 4.685 secs
% full trial length: 3.445*1378           = 4747 ms/ 4.747 secs

