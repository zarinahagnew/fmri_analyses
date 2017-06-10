%% play trials
% -------------------------------------------------------------------------
% ZKA Sept 2015

clear all;
close all;
set_params_pitchtracking

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
npatients = npatients + 1;
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

% list controls here
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


% subject Loop
for each_subject = 1:npatients    
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)
    load expr_config.mat %this has the order of conditions
    
    % block loop
    for each_block=1:1
        foldernumber=each_block-1;
        folder = sprintf('block%d', foldernumber);
        cd (folder);
        
        % import data using get_vec_hist6
        pitch=get_vec_hist6('pitch2',3); %two arguments are file name and then file type (float vec)
        block=get_vec_hist6('blockalt',3); %pert response (needs to be shifted in time as only begins in response to voice onsett detect
        voiceonset=get_vec_hist6('voice_onset_detect',2); %voice detect
        outbuff_wav=get_vec_hist6('outbuffer', 3); % playable waveform
        outbuff_pitch=get_vec_hist6('output_pitch', 3); % pich of outbuffer is the target
        
        vhs = [];
        vhs = add2vechists(vhs,'inbuffer2');
        vhs = add2vechists(vhs,'pitch2');
        ntrials = vhs.inbuffer2.ntrials;
        % y = play_vec_hist6(vhs.inbuffer2,1,fs,0); (needs diff
        % play_vec_hist6.m)
        y = play_vec_hist6(vhs.inbuffer2,1,fs);
%         
%         % sort out x axis
%         samples2get = length(pitch.data(2,:));
%         fs = 11025;
%         framef = fs/32;
%         nframes_per_trial = pitch.nvecs;
%         taxis = (0:(samples2get-1))/fs;
%         frame_taxis = (0:(nframes_per_trial-1))/framef;
        
        %% play option
        % while 1
        %     reply = input('play trial? y/[n]: ','s');
        %     if isempty(reply) || strcmp(reply,'n')
        %         break;
        %     else
        %         soundsc(y,fs);
        %     end
        % end
        % pause
        
    end
    
    cd(cerebellar_data_rootdir); % go home ready for next subject
    close all;
end

