%% Seperates the good and bad trials for the pitch tracking experiment for HCs


% load /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/subj_MP_allsubs
% subj_MP_allsubs_HC=subj_MP_allsubs(17:end);


for icond=1
sorted_data(icond).wholetrial(itrial,:)

figure
for itrial=1:10
plot(voiceonset_data{1, iblock}(itrial,:))
hold on
end



%% 1. align all trials to voice onset (by deleting the frames before voice onset)



end


%% align all trials to voice onset (by deleting the frames before voice onset)
        for d=1:trialsperblock
            for iframe=1:nframes_to_use
                if iframe<=voiceonsetdata{d,each_block}
                    shiftedpitch_data{1,each_block}{1,d}(iframe)=NaN;
                end
            end
        end


        



        
        
        
        
        
        
        
        
        
        


% Subject Loop
for isubj = 1:1
    
    the_expr_dir = [cerebellar_data_rootdir (patient_info{isubj}.exprdir)];
    cd (the_expr_dir)
    
    % load the shifted_block alt from each subjects' folder. this is *not*
    % actually shifted, it is the original pert resp. See previous script for details.
%    load (sprintf('%svoiceonsetdata.mat',patient_info{isubj}.exprdir));
    load (sprintf('%sALLDATA.mat',patient_info{isubj}.exprdir));            % from C_WriteDataout.m
    load expr_config.mat;                                                   % this loads nframes_per_trial
    
    %% block loop
    for each_block=1:num_blocks;
        
        % create condition orders
        blockcondname=NaN(8,10);
        for each_block=1:num_blocks;
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
        end
        
        %blockx=blockcondname(each_block,:);
        
        %load singlesubdata
        foldernumber=each_block-1;
        cd (the_expr_dir)
        
        folder = sprintf('block%d', foldernumber);
        cd (folder);
        
        
        %% align all trials to voice onset (by deleting the frames before voice onset)
        for d=1:trialsperblock
            for iframe=1:nframes_to_use
                if iframe<=voiceonsetdata{d,each_block}
                    shiftedpitch_data{1,each_block}{1,d}(iframe)=NaN;
                end
            end
        end
        
        %% REMOVE BAD TRIALS ACCORDING TO PERCEPTUAL SCORE
        %         load /Users/zagnew/Cereb_data/data/SUB.mat;
        %         for each_block=1:num_blocks;
        %             for d=1:trialsperblock
        %                 %if SUB{isubj}.block{each_block}(d)==1;
        %                 if SUB{meanpitchtag(isubj)}.block{each_block}(d)==1;
        %                     data_1.goodpitchdata(each_block).data(d,:)=shiftedpitch_data{1,each_block}{1,d}(1:nframes_to_use);     % group data from ypitch_fr
        %                     %shiftedpitch_data{1,each_block}{1,d}
        %                     data_1.goodstd.wholetrial(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(1:nframes_to_use));          % within trial stdev
        %                     data_1.goodpertresp(each_block).data{d}=shifted_blockalt{d,each_block}(1:nframes_to_use);
        %                     %data_1.goodpitchdata(each_block).audio(d,:)=outbuff_wav.data(d,:);
        %                     data_1.goodpitchdata(each_block).audio(d,:)=outbuff_wav_data{each_block}{d};
        %
        %                     %amp data
        %                     data_1.goodampdata(each_block).wholetrial_amp(d,:)= amp_data{each_block}{d}(1:nframes_to_use);
        %                     data_1.goodstd.wholetrial_amp(d)=nanstd(amp_data{each_block}{d});
        %                     %pre step
        %                     data_1.goodpitchdata(each_block).prestep_data(d,:)=shiftedpitch_data{1,each_block}{1, d}(T1_HC:T2_HC);
        %                     data_1.goodstd.prestep(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(T1_HC:T2_HC));
        %                     % amp
        %                     data_1.goodampdata(each_block).prestep_amp(d,:)=amp_data{each_block}{d}(1,T1_HC:T2_HC);
        %                     data_1.goodstd.prestep_amp(d)=nanstd(amp_data{each_block}{d}(1,T1_HC:T2_HC));
        %                     %poststep
        %                     data_1.goodstd.poststep(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(T3_HC:T4_HC));
        %                     data_1.goodpitchdata(each_block).poststep_data(d,:)=shiftedpitch_data{1,each_block}{1, d}(T3_HC:T4_HC);
        %
        %                     data_1.goodampdata(each_block).poststep_amp(d,:)=amp_data{each_block}{d}(1,T3_HC:T4_HC);
        %                     data_1.goodstd.poststep_amp(d)=nanstd(amp_data{each_block}{d}(1,T3_HC:T4_HC));
        %
        %                 else
        %                     data_1.goodpitchdata(each_block).data(d,:)=nan(1,nframes_to_use);
        %                     data_1.goodpertresp(each_block).data{d}=shifted_blockalt{d,each_block}(1:nframes_to_use);
        %                     data_1.goodpitchdata(each_block).audio(d,:)=outbuff_wav_data{each_block}{d};
        %                     data_1.goodstd.wholetrial(d)=[NaN];
        %                     data_1.goodampdata(each_block).wholetrial_amp(d,:)=[NaN(1,nframes_to_use)];
        %                     data_1.goodstd.wholetrial_amp(d)=[NaN];
        %                     data_1.goodpitchdata(each_block).prestep_data(d,:)=[NaN(1,201)];
        %                     data_1.goodstd.prestep(d)=[NaN];
        %                     data_1.goodampdata(each_block).prestep_amp(d,:)=[NaN(1,201)];
        %                     data_1.goodstd.prestep_amp(d)=[NaN];
        %                     data_1.goodpitchdata(each_block).poststep_data(d,:)=[NaN(1,201)];
        %                     data_1.goodstd.poststep(d)=[NaN];
        %                     data_1.goodampdata(each_block).poststep_amp(d,:)=[NaN(1,201)];
        %                     data_1.goodstd.poststep_amp(d)=[NaN];
        %
        %
        %                 end
        %             end
        %         end
        
        % write data out into one structure called data_1
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                data_1.goodpitchdata(each_block).data(d,:)=shiftedpitch_data{1,each_block}{1,d}(1:nframes_to_use);     % group data from ypitch_fr
                %shiftedpitch_data{1,each_block}{1,d}
                data_1.goodstd.wholetrial(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(1:nframes_to_use));          % within trial stdev
                data_1.goodpertresp(each_block).data{d}=shifted_blockalt{d,each_block}(1:nframes_to_use);
                %data_1.goodpitchdata(each_block).audio(d,:)=outbuff_wav.data(d,:);
                data_1.goodpitchdata(each_block).audio(d,:)=outbuff_wav_data{each_block}{d};
                
                %amp data
                data_1.goodampdata(each_block).wholetrial_amp(d,:)= amp_data{each_block}{d}(1:nframes_to_use);
                data_1.goodstd.wholetrial_amp(d)=nanstd(amp_data{each_block}{d});
                %pre step
                data_1.goodpitchdata(each_block).prestep_data(d,:)=shiftedpitch_data{1,each_block}{1, d}(T1_HC:T2_HC);
                data_1.goodstd.prestep(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(T1_HC:T2_HC));
                % amp
                data_1.goodampdata(each_block).prestep_amp(d,:)=amp_data{each_block}{d}(1,T1_HC:T2_HC);
                data_1.goodstd.prestep_amp(d)=nanstd(amp_data{each_block}{d}(1,T1_HC:T2_HC));
                %poststep
                data_1.goodstd.poststep(d)=nanstd(shiftedpitch_data{1,each_block}{1, d}(T3_HC:T4_HC));
                data_1.goodpitchdata(each_block).poststep_data(d,:)=shiftedpitch_data{1,each_block}{1, d}(T3_HC:T4_HC);
                
                data_1.goodampdata(each_block).poststep_amp(d,:)=amp_data{each_block}{d}(1,T3_HC:T4_HC);
                data_1.goodstd.poststep_amp(d)=nanstd(amp_data{each_block}{d}(1,T3_HC:T4_HC));
                
            end
        end
        
        %% REMOVE FIRST 200 FRAMES (REACTION TIME)
        data_2=data_1; % make copy
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                data_2.goodpitchdata(each_block).data(d,1:reactiontime_frames)=NaN;
            end
        end
        
        %% REMOVE BAD TRIALS ACCORDING TO WHERE THERE IS NO AMP SIGNAL
        data_3=data_2;
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                for s=1:nframes_to_use                                          %data point loop
                    if data_1.goodampdata(each_block).wholetrial_amp(d,s)<amp_thresh
                        data_3.goodpitchdata(each_block).data(d,s)=NaN;
                    end
                end
            end
        end
        
        %% REMOVE FIRST 10 FRAMES AFTER BREAK IN VOICING
        % 1. create binary marker array and call it B
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                for i=1:length(data_1.goodampdata(each_block).wholetrial_amp(d,:))
                    if data_1.goodampdata(each_block).wholetrial_amp(d,i)>amp_thresh;
                        marker.data(each_block).data(d,i)=80;
                    end
                end
            end
        end
        
        % 2. make marker trials the same length as nframstouse
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                padding=nframes_to_use-length(marker.data(each_block).data(d,:));
                marker2.data(each_block).data(d,:) = padarray(marker.data(each_block).data(d,:),[0 padding],'post');
            end
        end
        
        %3. create a copy of the data from the last stage above and replace the
        data_4=data_3;
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                for i=1:nframes_to_use-framestoremove
                    if marker2.data(each_block).data(d,i)<10
                        data_4.goodpitchdata(each_block).data(d,i:i+framestoremove)=NaN;
                    end
                end
            end
        end
        
        %% create pre and post windows at this point
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                data_4.prestep(each_block).data(d,:)=data_4.goodpitchdata(each_block).data(d, T1_HC:T2_HC);
                data_4.poststep(each_block).data(d,:)=data_4.goodpitchdata(each_block).data(d, T3_HC:T4_HC);
            end
        end
        
        
        %% convert to cents
        data_5=data_4; % make copy
        
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                for iframe=1:nframes_to_use
                    if isnan(data_4.goodpitchdata(each_block).data(d,iframe))==1;
                        data_5.goodpitchdata(each_block).data(d,iframe)=NaN;
                    else
                        data_5.goodpitchdata(each_block).data(d,iframe)=1200*log2(data_4.goodpitchdata(each_block).data(d,iframe)/subj_MP_allsubs_HC(meanpitchtag(isubj)).meanpitch);
                    end
                end
                
                for iframe=1:201
                    if isnan(data_4.prestep(each_block).data(d,iframe))==1;
                        data_5.prestep(each_block).data(d,iframe)=NaN;
                    else
                        data_5.prestep(each_block).data(d,iframe)=1200*log2(data_4.prestep(each_block).data(d,iframe)/subj_MP_allsubs_HC(meanpitchtag(isubj)).meanpitch);
                    end
                end
                
                for iframe=1:201
                    if isnan(data_4.poststep(each_block).data(d,iframe))==1
                        data_5.poststep(each_block).data(d,iframe)=NaN;
                    else
                        data_5.poststep(each_block).data(d,iframe)=1200*log2(data_4.poststep(each_block).data(d,iframe)/subj_MP_allsubs_HC(meanpitchtag(isubj)).meanpitch);
                    end
                end
            end
        end
        
        %% REMOVE BAD TRIALS ACCORDING TO STDEV:
        data_6=data_5; % make copy
        %pitch data
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                if nanstd(data_5.goodpitchdata(each_block).data(d,:))>stdev_cutoff_wholetrial_HCs
                    data_6.goodpitchdata(each_block).data(d,:)=NaN(1,nframes_to_use);
                end
                
                if nanstd(data_5.prestep(each_block).data(d,:))>stdev_cutoff_pre_HCs
                    data_6.prestep(each_block).data(d,:)=nan(1,201);
                end
                
                if nanstd(data_5.poststep(each_block).data(d,:))>stdev_cutoff_post_HCs
                    data_6.poststep(each_block).data(d,:)=nan(1,201);
                end
            end
        end
        
        % amp data
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                if nanstd(data_5.goodampdata(each_block).wholetrial_amp(d,:))>stdev_cutoff_wholetrial_amp_HCs
                    data_6.goodampdata(each_block).wholetrial_amp(d,:)=NaN(1,nframes_to_use);
                end
                
                if nanstd(data_5.goodampdata(each_block).prestep_amp(d,:))>stdev_cutoff_pre_amp_HCs
                    data_6.goodampdata(each_block).prestep_amp(d,:)=nan(1,201);
                end
                
                if nanstd(data_5.goodampdata(each_block).poststep_amp(d,:))>stdev_cutoff_post_amp_HCs
                    data_6.goodampdata(each_block).poststep_amp(d,:)=nan(1,201);
                end
            end
        end
        
        
        %% REMOVE ACCORDING TO MOTOR PERFORMANCE (cents)
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                % if blockx(d)==1 | blockx(d)==6
                if blockcondname(each_block,d)==1 | blockcondname(each_block,d)==6
                    pre_target(each_block).data(d)= shiftinhertz_allsubs(isubj).nostep;
                    post_target(each_block).data(d)=shiftinhertz_allsubs(isubj).smallstepup;
                    pre_target_cents(each_block).data(d)= 0;
                    post_target_cents(each_block).data(d)=100;
                    
                elseif blockcondname(each_block,d)==2 | blockcondname(each_block,d)==7
                    pre_target(each_block).data(d)= shiftinhertz_allsubs(isubj).nostep;
                    post_target(each_block).data(d)=shiftinhertz_allsubs(isubj).bigstepup;
                    pre_target_cents(each_block).data(d)= 0;
                    post_target_cents(each_block).data(d)=300;
                    
                elseif blockcondname(each_block,d)==3 | blockcondname(each_block,d)==8
                    pre_target(each_block).data(d)= shiftinhertz_allsubs(isubj).nostep;
                    post_target(each_block).data(d)=shiftinhertz_allsubs(isubj).nostep;
                    pre_target_cents(each_block).data(d)= 0;
                    post_target_cents(each_block).data(d)=0;
                    
                elseif blockcondname(each_block,d)==4 | blockcondname(each_block,d)==9
                    pre_target(each_block).data(d)= shiftinhertz_allsubs(isubj).nostep;
                    post_target(each_block).data(d)=shiftinhertz_allsubs(isubj).smallstepdown;
                    pre_target_cents(each_block).data(d)= 0;
                    post_target_cents(each_block).data(d)=-100;
                    
                elseif blockcondname(each_block,d)==5 | blockcondname(each_block,d)==10
                    pre_target(each_block).data(d)= shiftinhertz_allsubs(isubj).nostep;
                    post_target(each_block).data(d)=shiftinhertz_allsubs(isubj).bigstepdown;
                    pre_target_cents(each_block).data(d)= 0;
                    post_target_cents(each_block).data(d)=-300;
                    
                else
                    error('something wrong with condition orders..')
                end
            end
        end
        
        
        clear pre_counter;
        data_7=data_6; % data_7 pitch in cents with motor performance removed
        for each_block=1:num_blocks;
            pre_counter(each_block).data=0;
            post_counter(each_block).data=0;
            
            for d=1:trialsperblock
                data_7.pre_distfromtarget(each_block).data(d)=nanmean(data_6.prestep(each_block).data(d,:)) - pre_target_cents(each_block).data(d);
                data_7.post_distfromtarget(each_block).data(d)=nanmean(data_6.poststep(each_block).data(d,:))- post_target_cents(each_block).data(d);
                
                %if they don't hit the prestep target write nans into the whole trial and prestep data
                if data_7.pre_distfromtarget(each_block).data(d)> perf_thresh_pos_cents || data_7.pre_distfromtarget(each_block).data(d)<perf_thresh_neg_cents
                    data_7.prestep(each_block).data(d,:)=nan(1,201);
                    data_7.goodpitchdata(each_block).data(d,:)=nan(1,1360);
                    pre_counter(each_block).data=pre_counter(each_block).data+1;
                end
                
                if data_7.post_distfromtarget(each_block).data(d) > perf_thresh_pos_cents || data_7.post_distfromtarget(each_block).data(d)<perf_thresh_neg_cents
                    data_7.poststep(each_block).data(d,:)=nan(1,201);
                    post_counter(each_block).data=post_counter(each_block).data+1;
                    
                    
                    %                     subplot(4,1,1)
                    %                     plot(data_7.goodpitchdata(each_block).data(d,:))
                    %                     subplot(4,1,2)
                    %                     plot(data_7.goodpertresp(each_block).data{d})
                    %                     axis([1 1400 -350 350])
                    
                end
            end
        end
        
        %% calculate WT devs for each subject
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                data_7.WTstd(each_block).wholetrial(d)=nanstd(data_7.goodpitchdata(each_block).data(d,:));          % within trial stdev
                data_7.WTstd(each_block).prestep(d)=nanstd(data_7(1).goodpitchdata(each_block).prestep_data(d,:));          % within trial stdev
                data_7.WTstd(each_block).poststep(d)=nanstd(data_7(1).goodpitchdata(each_block).poststep_data(d,:));          % within trial stdev
                
                data_7.wholetrial_WTstd_amp(each_block).wholetrial(d)=nanstd(data_7.goodampdata(each_block).wholetrial_amp(d,:));          % within trial stdev
                data_7.prestep_WTstd_amp(each_block).wholetrial(d)=nanstd(data_7.goodampdata(each_block).prestep_amp(d,:));          % within trial stdev
                data_7.proststep_WTstd_amp(each_block).wholetrial(d)=nanstd(data_7.goodampdata(each_block).poststep_amp(d,:));          % within trial stdev
                
                data_7.WTstd_cents(each_block).wholetrial(d)=nanstd(data_7.goodpitchdata(each_block).data(d,:));          % within trial stdev
                data_7.WTstd_cents(each_block).prestep(d)=nanstd(data_7(1).goodpitchdata(each_block).prestep_data(d,:));          % within trial stdev
                data_7.WTstd_cents(each_block).poststep(d)=nanstd(data_7(1).goodpitchdata(each_block).poststep_data(d,:));          % within trial stdev
                
            end
        end
        
        % write out into 'gooddata.mat'
        gooddata2=data_7;
        
        % eliminate trials with a break in voicing for spectral analysis
        for each_block=1:num_blocks
            for itrial=1:trialsperblock
                for iframe=250:1300
                    if sum(isnan(gooddata2(1).goodpitchdata(each_block).data(itrial,201:1360)))>0
                        %gooddata_spec(1).goodpitchdata(each_block).data(itrial,:)=NaN(1,1360);
                        gooddata2(1).goodpitchdata_spectral(each_block).data(itrial,:)=NaN(1,1360);
                    else
                        gooddata2(1).goodpitchdata_spectral(each_block).data(itrial,:)=gooddata2(1).goodpitchdata(each_block).data(itrial,:);
                        
                    end
                end
            end
        end
        
        % write out difference between each trial and low pass filtered
        gooddata=gooddata2;
        trialdata=250:1000;
        numframes_data=length(trialdata);
        for each_block=1:num_blocks
            for itrial=1:trialsperblock
                if sum(isnan(gooddata(1).goodpitchdata(each_block).data(itrial,trialdata)))>0
                    lowpassdata(1).goodpitchdata(each_block).data(itrial,:)=nan(1, numframes_data);
                    gooddata(1).goodpitch_difflowpassfilt(each_block).data(itrial,:)=nan(1, numframes_data);
                else
                    lowpassdata(1).goodpitchdata(each_block).data(itrial,:)=lowpass(gooddata(1).goodpitchdata(each_block).data(itrial,trialdata), 0.01, 3);
                    gooddata(1).goodpitch_difflowpassfilt(each_block).data(itrial,:)=calc_distance(gooddata(1).goodpitchdata(each_block).data(itrial,trialdata), lowpassdata(1).goodpitchdata(each_block).data(itrial,:))
                    gooddata(1).goodpitch_difflowpassfilt(each_block).data(itrial,:)=abs(gooddata(1).goodpitch_difflowpassfilt(each_block).data(itrial,:));
                    
                end
            end
        end
        
        % eliminate trials with a break in voicing for spectral analysis
        for each_block=1:num_blocks
            for itrial=1:trialsperblock
                for iframe=250:1300
                    if sum(isnan(gooddata(1).goodpitchdata(each_block).data(itrial,201:1360)))>0
                        %gooddata_spec(1).goodpitchdata(each_block).data(itrial,:)=NaN(1,1360);
                        gooddata(1).goodpitchdata_spectral(each_block).data(itrial,:)=NaN(1,1360);
                    else
                        gooddata(1).goodpitchdata_spectral(each_block).data(itrial,:)=gooddata(1).goodpitchdata(each_block).data(itrial,:);
                        
                    end
                end
            end
        end
        
        
        %% calculate gaps
        for each_block=1:num_blocks;
            for d=1:trialsperblock
                gaps(each_block).data(d)=countgaps(data_6.goodpitchdata(each_block).data(d,:), 9);
            end
        end
        
        
    end
    
    %
    % %% plot all dis so you can see each step as you go (comment out for speed)
    %             for each_block=1:num_blocks;
    %                 for d=1:trialsperblock
    %
    %                 subplot(5,2,1)
    %                 plot(data_1.goodpitchdata(each_block).data(d,:))
    %                 axis([1 1500 70 350])
    %                 title('Raw Data (Hz)')
    %
    %                 subplot(5,2,3)
    %                 plot(data_2.goodpitchdata(each_block).data(d,:))
    %                 axis([1 1500 70 350])
    %                 title('First 200 frames removed (Hz)')
    %
    %                 subplot(5,2,5)
    %                 plot(data_3.goodpitchdata(each_block).data(d,:))
    %                 axis([1 1500 70 350])
    %                 title('Thresholded by amp signal (Hz)')
    %
    %                 subplot(5,2,7)
    %                 plot(data_4.goodpitchdata(each_block).data(d,:))
    %                 axis([1 1500 70 350])
    %                 title('Voice onset artifact removed (Hz)')
    %
    %                 subplot(5,2,9)
    %                 plot(data_4.prestep(each_block).data(d,:), 'c')
    %                 hold
    %                 plot(data_4.poststep(each_block).data(d,:), 'm')
    %                 axis([1 201 70 350])
    %                 title('Pre and Post step (Hz)')
    %
    %                 subplot(5,2,2)
    %                 plot(data_5.prestep(each_block).data(d,:), 'c')
    %                 hold
    %                 plot(data_5.poststep(each_block).data(d,:), 'm')
    %                 axis([1 201 -350 350])
    %                 title('pre and post step (cents)')
    %
    %                 subplot(5,2,4)
    %                 bar(1, data_7.pre_distfromtarget(each_block).data(d), 'c')
    %                 hold
    %                 bar(2, data_7.post_distfromtarget(each_block).data(d), 'm')
    %                 moo=ones(1,3);
    %                 plot(moo*perf_thresh_pos_cents, 'r')
    %                 plot(moo*perf_thresh_neg_cents, 'r')
    %                 axis([0 3 -60 60])
    %                 title('Mean distance from target - cents (red line = thresh)')
    %
    %                 subplot(5,2,6)
    %                 plot(data_7.prestep(each_block).data(d,:), 'c')
    %                 hold
    %                 plot(data_7.poststep(each_block).data(d,:), 'm')
    %                 axis([1 201 -350 350])
    %                 title('Pre and Post step (cents) after motor thresholding')
    %
    %                 subplot(5,2,8)
    %                 plot(data_1.goodpertresp(each_block).data{d}, 'r')
    %                 hold
    %                 moo1=NaN(1,T1_HC);
    %                 moo=ones(1,200);
    %                 moo=moo*150;
    %                 moo3=NaN(1,550);
    %                 moo2=[moo1 moo moo3 moo];
    %                 plot(moo2);
    %                 plot(data_7.goodpitchdata(each_block).data(d,:), 'c')
    %                 axis([1 1500 -350 350])
    %                 title('With the step')
    %
    %                 subplot(5,2,10)
    %                 plot(data_7.goodpitchdata(each_block).data(d,:), 'c')
    %                 hold
    %                 plot(moo2);
    %                 axis([1 1500 -350 350])
    %                 title('pitch in cents')
    %
    %     %
    %     % %             % check
    %     % %             % trial 1, block 1
    %     % %             % PRE: should be the same
    %     % %
    %     % %             nanmean(data_6b.prestep(each_block).data(d,:))
    %     % %             data_7.pre_distfromtarget(each_block).data(d)
    %     % %
    %     % %             % POST - trialscript_expr(1) is condition 2, a big step up so
    %     % %             % this target should be 300 c
    %     % %             nanmean(data_6b.poststep(each_block).data(d,:))
    %     % %             data_7.post_distfromtarget(each_block).data(d)
    %
    %                 pause
    %                 clf
    %                 end
    %             end
    
    cd (the_expr_dir)
    save gaps gaps
    save pre_counter pre_counter
    save post_counter post_counter
    save gooddata gooddata
end

close all

cd ..



