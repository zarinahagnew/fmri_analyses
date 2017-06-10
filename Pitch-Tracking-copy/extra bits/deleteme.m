%% Writes data oiut from vec_hist to arrays
% -------------------------------------------------------------------------
% ZKA March 2014
% loads the vec hists from each subject and converts them to

%% here we go
clear all
close all

set_params_pitchtracking

load /Users/zagnew/Cereb_data/data_final_run/subj_MPs

npatients = 0;

% list controls here
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC01/expr2014.05.06.T12.36.43_mainrun/speak/';

originalFolder = pwd;
%load /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/SubjectShiftsAllSubs

each_subject = 1;
the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
cd (the_expr_dir)

load (sprintf('%sshifted_blockalt.mat',patient_info{each_subject}.exprdir));
load (sprintf('%svoiceonsetdata_fake.mat',patient_info{each_subject}.exprdir));
load expr_config.mat;                                   % this loads nframes_per_trial

%% block loop
for each_block=1:num_blocks;
    
    each_block=1
    % create condition orders
    if  each_block == 1
        blockcondname(each_block,:)=trialscript_expr(1:10);
    elseif each_block == 2
        blockcondname(each_block,:)=trialscript_expr(11:20);
    elseif each_block == 3
        blockcondname(each_block,:)=trialscript_expr(21:30);
    elseif each_block == 4
        blockcondname(each_block,:)=trialscript_expr(31:40);
    elseif each_block == 5
        blockcondname(each_block,:)=trialscript_expr(41:50);
    elseif each_block == 6
        blockcondname(each_block,:)=trialscript_expr(51:60);
    elseif each_block == 7
        blockcondname(each_block,:)=trialscript_expr(61:70);
    elseif each_block == 8
        blockcondname(each_block,:)=trialscript_expr(71:80);
    else pwd
    end  
        blockx=blockcondname(each_block,:);
     
    
        foldernumber=each_block-1;
        folder = sprintf('block%d', foldernumber);
        cd (the_expr_dir)
        cd (folder);
        
        
        pitchdata_old=get_vec_hist6('pitch2',3);            % two arguments are file name and then file type (float vec)
        orig_pertresp=get_vec_hist6('blockalt',3);          % pert response (needs to be shifted in time as only begins in response to voice onsett detect
        voiceonset=get_vec_hist6('voice_onset_detect',2);   % voice detect
        outbuff_wav=get_vec_hist6('outbuffer', 3);          % ZKA: playable waveform - do spectral analysis on this signal
        outbuff_pitch=get_vec_hist6('output_pitch', 3);     % pitch of outbuffer is the target
        amp=get_vec_hist6('weighted_mean_abs_inbuffer2', 3);
        audio=get_vec_hist6('inbuffer2',3);
        voicethresh=get_vec_hist6('thresh_inbuffer_state',2);
        %
%         fs = 11025;
         pitch_lims = [80 300]; % sets pitch finding limits
%         pitch_lims2plot = [50 300];
%         shift_lims2plot = [-300 300];
        vhs = [];
        vhs = add2vechists(vhs,'inbuffer2');
        vhs = add2vechists(vhs,'pitch2');
        ntrials = vhs.inbuffer2.ntrials;
        
        y = play_vec_hist6(vhs.inbuffer2,1,fs, 0);
        
        nsamps = length(y);
        taxis = (0:(nsamps-1))/fs;
        nframes = vhs.pitch2.nvecs;
        data_size = vhs.inbuffer2.vec_size;
        frame_fs = fs/data_size;
        frame_taxis = (0:(nframes-1))/frame_fs;
        frame_taxis_to_use = (0:(nframes_to_use-1))/frame_fs;
        frame_taxis_window = (0:201)/frame_fs;
        
        clear pitchdatablock
        clear ampdatablock
        
        %for each_block=1:10
        for itrial = 1:ntrials      
            
            
            ypitch(itrial,:) = get_sig_pitch(y,fs,pitch_lims);        % new and improved pitch tracking
            ypitch_fr(itrial,:) = interp1(taxis,ypitch(itrial,:),frame_taxis);  % pitch tracking in seconds
            yampl(itrial,:)  = get_sig_ampl( y,fs);
            yampl_fr(itrial,:) = interp1(taxis,yampl(itrial,:),frame_taxis);
            ypitch2(itrial,:) = vhs.pitch2.data(itrial,:);            %forget me
            % writes trials to a block
        end
        
        pitchdatablock{itrial}=ypitch_fr;               % writes trials to a block
        ampdatablock{itrial}=yampl_fr;
        outbuff_wav_block{itrial}=outbuff_wav.data(itrial,:);
        
        amp_data{each_block}=ampdatablock;              % writes block into one chunk ready for filtering accoridng to good or bad trial
        pitch_data{each_block}=pitchdatablock;          % writes block into one chunk ready for filtering accoridng to good or bad trial
        voiceonset_data{each_block}=voiceonset.data;
        voicethresh_data{each_block}=voicethresh.data;
        shiftedpitch_data{each_block}=pitchdatablock;
        outbuff_wav_data{each_block}=outbuff_wav_block;
        
        cd ..
        
        save ALLDATA.mat shiftedpitch_data amp_data pitch_data outbuff_wav_data voiceonset_data voicethresh_data blockcondname
    
    
end





