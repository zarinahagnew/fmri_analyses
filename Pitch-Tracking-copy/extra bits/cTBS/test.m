
clear all;
close all;

cerebellar_data_rootdir = '/Users/zagnew/cTBS_data/pitch_tracking/';
npatients = 0;
%prestim
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'cereb_TMS_pre_data/s05_pre_pitchtracking/expr2015.07.02.T15.27.58/speak/';

% % post stim
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'cereb_TMS_post_data/s05_post_pitchtracking/expr2015.07.02.T16.12.52/speak/';

z=0

originalFolder = pwd;
shifted_blockalt={}

% subject Loop
for each_subject = 1:2
    z=z+1
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)  
    load expr_config.mat %this has the order of conditions       
    
% block loop
    for each_block=1:8
        foldernumber=each_block-1;
        folder = sprintf('block%d', foldernumber);
        cd (folder);
        
        % import data using get_vec_hist6
        pitch=get_vec_hist6('pitch2',3); %two arguments are file name and then file type (float vec)
        block=get_vec_hist6('blockalt',3); %pert response (needs to be shifted in time as only begins in response to voice onsett detect
        voiceonset=get_vec_hist6('voice_onset_detect',2); %voice detect
        outbuff_wav=get_vec_hist6('outbuffer', 3); % playable waveform
        outbuff_pitch=get_vec_hist6('output_pitch', 3); % pich of outbuffer is the target
        
        % sort out x axis
        samples2get = length(pitch.data(2,:));
        fs = 11025;
        framef = fs/32;
        nframes_per_trial = pitch.nvecs;
        taxis = (0:(samples2get-1))/fs;
        frame_taxis = (0:(nframes_per_trial-1))/framef;
        
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

    end
    
    cd(cerebellar_data_rootdir); % go home ready for next subject
    close all;
end

fprintf(' \n \n \n \n \n \n \n \n \n \n \n \n Creates shifted_blockalt.mat');

%% sanity check
% % format is shifted_blockalt{trial, block}
% shifted_blockalt - 10 down is the ten conditions
% figure
% subplot(211)
% plot(shifted_blockalt{1,1}) % should be flat
% axis([ 0 1500 -150 150])
% subplot(212)
% plot(shifted_blockalt{2,1}) % should be small down
% axis([ 0 1500 -150 150])
% 
% 
% fprintf(' \n \n \n \n \n \n \n \n \n \n \n \n Red lines show the shift so must come AFTER the green \n \n')
