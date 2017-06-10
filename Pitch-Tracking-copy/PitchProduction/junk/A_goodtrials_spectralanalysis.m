%% Seperates the good and bad trials for the pitch tracking experiment for the spectral analysis.
% -------------------------------------------------------------------------
% ZKA Nov 2014
% this is an automated version which looks at each trial,
% there is a option to play each trial which is commented out for now

% removes any trial with nans in the middle

%% here we go
clear all
close all

set_params;
amp_thresh=5*(10 ^ 7);                                  %amplitude threshold for cut off

% ----

cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data/';
npatients = 0;
npatients = npatients + 1; %400 and 1000 are ok
patient_info{npatients}.exprdir = 'SUB01/expr20140321T103415_SUBJ01_measurepitch/speak/';
% npatients = npatients + 1; % needs manual
% patient_info{npatients}.exprdir = 'SUB02/expr20140321T121956_Sub2_measurepitch/speak/';
% npatients = npatients + 1; % needs manual
% patient_info{npatients}.exprdir = 'SUB03/expr20140321T142416_Subj3-measurepitch/speak/';
% npatients = npatients + 1; % needs manual
% patient_info{npatients}.exprdir ='SUB04/expr20140321T170947_Subj4_measurepitch/speak/';
% npatients = npatients + 1;  %400 and 1000 are ok
% patient_info{npatients}.exprdir = 'SUB05/expr20140321T183529_Subj5_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB06/expr20140322T104901_SUB06_measurepitch/speak/';

% BAD SUBJECT
% npatients = npatients + 1; 
% patient_info{npatients}.exprdir = 'SUB07/expr20140322T115150_Sub7_measurepitch/speak/';

% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB08/expr20140322T134549_Sub08_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB09/expr20140322T154047_SUB09_measure_pitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB10/expr20140322T162455_SUB10_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB11/expr20140322T183812_Subj11_measurepitch/speak/';
% v wobbly
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB12/expr20140323T104953_Sub12_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB13/expr20140323T132703_Sub13_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB14/expr20140323T150747_subj14/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB15/expr20140323T162223_SUB15_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB16/expr20140323T180417_sub16_measurepitch/speak/';

% missing data
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC01/expr20140506T121323_ZKA/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC02/expr20140617T123801_HC02_pitchprodn/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC03/expr20140617T133413_HC03_pitchprodn/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC04/expr20140617T161417_measurepitch/speak/'; %400 to 1000 ok
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC05/expr20140618T150410_HC05_measurepitch/speak'; %400 to 1000 ok
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC06/expr20140618T160728_HC06_measurepitch/speak';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC07/expr20140725T101015_W4Z_subj25/speak';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC08/expr20140814T154458_W4Z_subj3/speak';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC09/expr20140921T133544_annette/speak';
originalFolder = pwd;

for each_subject = 1:npatients
    
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)
    
    % load the shifted_block alt from each subjects' folder. this is *not*
    % actually shifted, it is the original pert resp. See previous script for details.
%     load (sprintf('%sshifted_blockalt.mat',patient_info{each_subject}.exprdir));
%     load (sprintf('%svoiceonsetdata.mat',patient_info{each_subject}.exprdir));
%     
    %create empty variable for the good trials
    good_trial=NaN(8,10);
    curdir=cd;
    
    %load expr_config.mat;                                   % this loads nframes_per_trial
    
    % preallocation
    for a=1:10
        pitchdatablock{a}={1:nframes_per_trial};
        pitch_data{a}=pitchdatablock;
        ampdatablock{a}=nan(1,1378);
        
    end
    
    %% block loop
    for each_block=1:8 %num_blocks;
        foldernumber=each_block-1;
        folder = sprintf('block%d', foldernumber);
        cd (folder);
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
            
            %             % play option
            %                         while 1
            %                             reply = input('play trial? y/[n]: ','s');
            %                             if isempty(reply) || strcmp(reply,'n')
            %                                 break;
            %                             else
            %                                 soundsc(y,fs);
            %                             end
            %                         end
            %             pause
            
            pitchdatablock{itrial}=ypitch_fr;               % writes trials to a block
            ampdatablock{itrial}=yampl_fr;                  % writes trials to a block
        end
        
        %preallocation
        amp_data=cell(1,8);
        pitch_data=cell(1,8);
        voiceonset_data=cell(1,8);
        voicethresh_data=cell(1,8);
        shiftedpitch_data=cell(1,8);
        
        for var=1:8
            ampdata{var}=cell(1,1378);
            pitch_data{var}=cell(1,1378);
            voiceonset_data{var}=cell(1,1378);
            voicethresh_data{var}=cell(1,1378);
            shiftedpitch_data{var}=cell(1,1378);
        end
        
        amp_data{each_block}=ampdatablock;              % writes block into one chunk ready for filtering accoridng to good or bad trial
        pitch_data{each_block}=pitchdatablock;          % writes block into one chunk ready for filtering accoridng to good or bad trial
        voiceonset_data{each_block}=voiceonset.data;
        voicethresh_data{each_block}=voicethresh.data;
        shiftedpitch_data{each_block}=pitchdatablock;
        
        %% align all trials to voice onset (by deleting the frames before voice onset)
        for iframe=1:nframes_to_use
            if iframe<=voiceonsetdata{itrial,each_block}
                shiftedpitch_data{1,each_block}{1,itrial}(iframe)=NaN;
            end
        end
        
        %% REMOVE BAD TRIALS ACCORDING TO PERCEPTUAL SCORE
        load /Users/zagnew/Cereb_data/data/SUB.mat;
        
        for d=1:10
            if SUB{each_subject}.block{each_block}(d)==1;
                temp1.goodpitchdata(each_block).data(d,:)=shiftedpitch_data{1,each_block}{1,d}(1:nframes_to_use);     % group data from ypitch_fr
                temp1.goodstd.wholetrial(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(1:nframes_to_use));          % within trial stdev
                temp1.goodpertresp(each_block).data{d}=shifted_blockalt{d,each_block}(1:nframes_to_use);
                temp1.goodpitchdata(each_block).audio(d,:)=outbuff_wav.data(d,:);
                %amp data
                temp1.goodampdata(each_block).wholetrial_amp(d,:)= amp_data{each_block}{d}(1:nframes_to_use);
                temp1.goodstd.wholetrial_amp(d)=nanstd(amp_data{each_block}{d});
                %pre step
                temp1.goodpitchdata(each_block).prestep_data(d,:)=shiftedpitch_data{1,each_block}{1, d}(T1:T2);
                temp1.goodstd.prestep(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(T1:T2));
                % amp
                temp1.goodampdata(each_block).prestep_amp(d,:)=amp_data{each_block}{d}(1,T1:T2);
                temp1.goodstd.prestep_amp(d)=nanstd(amp_data{each_block}{d}(1,T1:T2));
                %poststep
                temp1.goodstd.poststep(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(T3:T4));
                temp1.goodpitchdata(each_block).poststep_data(d,:)=shiftedpitch_data{1,each_block}{1, d}(T3:T4);
                
                temp1.goodampdata(each_block).poststep_amp(d,:)=amp_data{each_block}{d}(1,T3:T4);
                temp1.goodstd.poststep_amp(d)=nanstd(amp_data{each_block}{d}(1,T3:T4));
                
            else
                temp1.goodpitchdata(each_block).data(d,:)=[NaN(1,nframes_to_use)];
                temp1.goodpertresp(each_block).data{d}=shifted_blockalt{d,each_block}(1:nframes_to_use);
                temp1.goodpitchdata(each_block).audio(d,:)=[NaN(1,(length(outbuff_wav.data(d,:))))];
                temp1.goodstd.wholetrial(d)=[NaN];
                
                temp1.goodampdata(each_block).wholetrial_amp(d,:)=[NaN(1,nframes_to_use)];
                temp1.goodstd.wholetrial_amp(d)=[NaN];
                
                temp1.goodpitchdata(each_block).prestep_data(d,:)=[NaN(1,201)];
                temp1.goodstd.prestep(d)=[NaN];
                
                temp1.goodampdata(each_block).prestep_amp(d,:)=[NaN(1,201)];
                temp1.goodstd.prestep_amp(d)=[NaN];
                
                temp1.goodpitchdata(each_block).poststep_data(d,:)=[NaN(1,201)];
                temp1.goodstd.poststep(d)=[NaN];
                
                temp1.goodampdata(each_block).poststep_amp(d,:)=[NaN(1,201)];
                temp1.goodstd.poststep_amp(d)=[NaN];
            end
        end
        
        
        %% REMOVE BAD TRIALS ACCORDING TO STDEV:
        
        
        % wholetrial *pitch* data -----------------------------------------
        for d=1:voiceonset.ntrials % 10
            if nanstd(shiftedpitch_data{1,each_block}{1, d})<stdev_cutoff_wholetrial
                %                 goodpitchdata(each_block).data(d,:)=shiftedpitch_data{1,each_block}{1,d}(1:nframes_to_use);     % group data from ypitch_fr
                %                 goodstd.wholetrial(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(1:nframes_to_use));          % within trial stdev
                %                 goodpertresp(each_block).data{d}=shifted_blockalt{d,each_block}(1:nframes_to_use);
                %                 goodpitchdata(each_block).audio(d,:)=outbuff_wav.data(d,:);
                
                
                goodpitchdata(each_block).data(d,:)=temp1.goodpitchdata(each_block).data(d,:);     % group data from ypitch_fr
                goodstd.wholetrial(d)=temp1.goodstd.wholetrial(d);
                goodpertresp(each_block).data{d}=temp1.goodpertresp(each_block).data{d};
                goodpitchdata(each_block).audio(d,:)=temp1.goodpitchdata(each_block).audio(d,:);
            else
                goodpitchdata(each_block).data(d,:)=[NaN(1,nframes_to_use)];
                goodpertresp(each_block).data{d}=shifted_blockalt{d,each_block}(1:nframes_to_use);
                goodpitchdata(each_block).audio(d,:)=[NaN(1,(length(outbuff_wav.data(d,:))))];
                goodstd.wholetrial(d)=[NaN];
            end
        end
        
        % wholetrial *amp* data -------------------------------------------
        for d=1:voiceonset.ntrials
            if nanstd(amp.data(d,:))<stdev_cutoff_wholetrial_amp
                %                 goodampdata(each_block).wholetrial_amp(d,:)= amp_data{each_block}{d}(1:nframes_to_use);
                %                 goodstd.wholetrial_amp(d)=nanstd(amp_data{each_block}{d});
                goodampdata(each_block).wholetrial_amp(d,:)= temp1.goodampdata(each_block).wholetrial_amp(d,:);
                goodstd.wholetrial_amp(d)=temp1.goodstd.wholetrial_amp(d);
            else
                goodampdata(each_block).wholetrial_amp(d,:)=[NaN(1,nframes_to_use)];
                goodstd.wholetrial_amp(d)=[NaN];
            end
        end
        
        
        %% REMOVE BAD TRIALS ACCORDING TO WHERE THERE IS NO AMP SIGNAL =======
        % now that we have excluded trials based on their within trial stdev, now only takes data where the amplitude is greater than x
        
        % wholetrial
        for t=1:1:voiceonset.ntrials                                        %trial loop
            for s=1:nframes_to_use                                          %data point loop
                if goodampdata(1,each_block).wholetrial_amp(t,s)>amp_thresh
                    gooddata_1.wholetrial(each_block).wholetrial(t,s)=goodpitchdata(each_block).data(t,s);
                    gooddata.AMP_wholetrial(each_block).data(t,s)=goodampdata(each_block).wholetrial_amp(t,s);
                    gooddata.goodpertresp(each_block).data{t}=shifted_blockalt{t,:};
                else
                    gooddata_1.wholetrial(each_block).wholetrial(t,s)=NaN;
                    gooddata.AMP_wholetrial(each_block).data(t,s)=NaN;
                    gooddata.goodpertresp(each_block).data{t}=shifted_blockalt{t,:};
                end
                gooddata.audio(each_block).audio(t,:)=goodpitchdata(each_block).audio(t,:);
            end
            gooddata.wholetrial_std(t)=nanstd(gooddata_1.wholetrial(each_block).wholetrial(t,:));
        end
        
        
        %% calculate gaps and remove any trials with gaps in the middle
        % make copy of data
        gooddata_2=gooddata_1;
        %gooddata_2=gooddata;
        %gooddata.goodpertresp(each_block).data{t}=shifted_blockalt{t,:};
        
        for itrial=1:10
            gaps(each_block).data(itrial,:)=isnan(gooddata_1.wholetrial(each_block).wholetrial(itrial,200:end));
            for iframe=1:1159
                if gaps(each_block).data(itrial,iframe) == 1 & gaps(each_block).data(itrial,iframe+1) == 0 
                    gooddata_2.wholetrial(each_block).wholetrial(itrial,:)=nan(1, 1360)
                end
            end
            
%             % sanity check
%             subplot(3,1,1)
%             plot(gooddata_1.wholetrial(each_block).wholetrial(itrial,200:end))
%             
%             subplot(3,1,2)
%             plot(gooddata_2.wholetrial(each_block).wholetrial(itrial,200:end))
%             
%             subplot(3,1,3)
%             plot(gaps(each_block).data(itrial,:))
%             axis([0 1400 0 2])
%             
%             pause
%             
            
%             gooddata_2.wholetrial(each_block).wholetrial(6,716:850)
%             gaps(each_block).data(6,716:850)
        end
        
        %% Remove first 200 frames by replacing them with nans ===========
        for t=1:voiceonset.ntrials %trial loop
            gooddata.wholetrial(each_block).wholetrial(t,:)=gooddata_2.wholetrial(each_block).wholetrial(t,:);
            for s=1:reactiontime_frames
                gooddata.wholetrial(each_block).wholetrial(t,s)=NaN;
            end
        end
        
        close all;
        cd ..
    end
    save gooddata_spectralanalysis gooddata
    save gaps gaps
    cd(cerebellar_data_rootdir)
    
end


