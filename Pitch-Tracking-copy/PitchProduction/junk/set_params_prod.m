%% Sets parameters for all 

% dock all figures
set(0,'DefaultFigureWindowStyle','docked');
cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data/';

%% EXP INFO
fs = 11025;     
data_size = 32; 
frame_rate = fs/data_size;
framef = fs/32;
frame_fs = fs/data_size;

trialsperblock_prod=15;

nframes_per_trial_prod=871;

%% for plotting
nframes_to_plot= 1378-5;     %nframes_per_trial-5;
nframes_to_use=1360;         %nframes_per_trial-18;
frame_taxis_prod = (0:(nframes_per_trial_prod-1))/framef;

%% convert frames to seconds
% 1 frame=3.445 ms
% 1ms = 0.29 frames
% 200 frames = 670 ms
% 1s/1000ms = 290 frames
% STEP: 413 frames=3.445*413            = 1422 ms/ 1.4 secs
% usable trial length: 1360 frames      = 4685 ms/ 4.685 secs
% full trial length: 3.445*1378           = 4747 ms/ 4.747 secs

