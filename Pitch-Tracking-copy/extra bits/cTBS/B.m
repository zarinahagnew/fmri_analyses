%% Writes data oiut from vec_hist to arrays

clear all;
close all;
set_params_cTBS

load /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/subj_MP_allsubs
%load /Users/zagnew/cTBS_data/pitch_tracking/cereb_TMS_pre_data/s05_pre_pitchtracking/expr2015.07.02.T15.27.58/speak
%meanpitch_20150702T151508.mat


for each_subject = 1:1
    
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)
    load expr_config.mat;                                   % this loads nframes_per_trial
    
    %% block loop
    for each_block=1:num_blocks;
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

        orig_pertresp=get_vec_hist6('blockalt',3);          % pert response (needs to be shifted in time as only begins in response to voice onsett detect
        voiceonset=get_vec_hist6('voice_onset_detect',2);   % voice detect
        outbuff_wav=get_vec_hist6('outbuffer', 3);          % ZKA: playable waveform - do spectral analysis on this signal
        outbuff_pitch=get_vec_hist6('output_pitch', 3);     % pitch of outbuffer is the target
        amp=get_vec_hist6('weighted_mean_abs_inbuffer2', 3);
        audio=get_vec_hist6('inbuffer2',3);
        voicethresh=get_vec_hist6('thresh_inbuffer_state',2);        
        pitch=get_vec_hist6('pitch2',3); %two arguments are file name and then file type (float vec)
        block=get_vec_hist6('blockalt',3); %pert response (needs to be shifted in time as only begins in response to voice onsett detect


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
        
        clear pitchdatablock
        clear ampdatablock
        
        for itrial = 1:ntrials
            % improved pitch tracking through get_sig_pitch6
            y = play_vec_hist6(vhs.inbuffer2,itrial,fs,0);  % does something that needs to be done in the play function, without actually playing the track (see last argument)
            ypitch = get_sig_pitch(y,fs,pitch_lims);        % new and improved pitch tracking
            ypitch_fr = interp1(taxis,ypitch,frame_taxis);  % pitch tracking in seconds
            yampl  = get_sig_ampl( y,fs);
            yampl_fr = interp1(taxis,yampl,frame_taxis);
            ypitch2 = vhs.pitch2.data(itrial,:);            %forget me
            
            pitchdatablock{itrial}=ypitch_fr;               % writes trials to a block
            ampdatablock{itrial}=yampl_fr; 
            outbuff_wav_block{itrial}=outbuff_wav.data(itrial,:);
            % writes trials to a block
        end
        
        amp_data{each_block}=ampdatablock;              % writes block into one chunk ready for filtering accoridng to good or bad trial
        pitch_data{each_block}=pitchdatablock;          % writes block into one chunk ready for filtering accoridng to good or bad trial        
        
        voiceonset_data{each_block}=voiceonset.data;
        voicethresh_data{each_block}=voicethresh.data;
        shiftedpitch_data{each_block}=pitchdatablock;
        outbuff_wav_data{each_block}=outbuff_wav_block;
 
        
%% find voice onset: look in the voice onset data and find the position 
% where the value is not zero, record this frame number in voiceframe(w)
        for w=1:voiceonset.ntrials
            x = voiceonset.data(w, :);
            if sum(x)>1
                a = find( x == 1 );
                voiceframe(w)= a(1);
            else
                voiceframe(w)= 1378 
                % check this as ultimately may cause problems, on trials with no voice onset detect it marks voice onset at the end of the trial..                
            end
        end
        
%         
%         % go though each trial and write the data to shifted block alt and
%         % voiceonsetdata (frames)
%         for i=1:voiceonset.ntrials
%             trial=num2str(i);
%             blockalt1=block.data(i,:,2);
%             voiceframe(i);
%             a=zeros(1,(voiceframe(i)));
%             shifted_blockalt{i, each_block}=[a blockalt1];             
%             voiceonsetdata{i, each_block}=voiceframe(i);
%         end        

        voiceframe_fake=ones(1,10);        
        % creates fake voice onset 
        % becuase this was originally written to shift the pert_resp 
        % by the voice onset, but in the end I decided to do it 
        % another way so this is a fake voice onset of '0'. 
        % URGH SORRY FUTURE ME. 
        
        %figure;
        for i=1:voiceonset.ntrials
            blockalt1=block.data(i,:,2); % pert resp
            shifted_blockalt{i, each_block}=blockalt1;                        

            
            trial=num2str(i);
            blockalt1=block.data(i,:,2); % pert resp
            voiceframe_fake(i);
            a=zeros(1,(voiceframe_fake(i)));
            shifted_blockalt{i, each_block}=[a blockalt1];
            voiceonsetdata_fake{i, each_block}=voiceframe_fake(i);
            voiceonsetdata{i, each_block}=voiceframe(i);
            
    
        end
        
        cd .. % into block parent ('speak') folder and save data there
        
        save shifted_blockalt shifted_blockalt
        save voiceonsetdata voiceonsetdata
        save voiceonsetdata_fake voiceonsetdata_fake
             voiceonsetdata

        
        cd ..

        save ALLDATA.mat shiftedpitch_data amp_data pitch_data outbuff_wav_data voiceonset_data voicethresh_data blockcondname
    end

end





