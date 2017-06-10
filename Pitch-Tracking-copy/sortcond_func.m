% sort conditions function

for each_subject = 1:1
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)
    
    load (sprintf('%sexpr_config.mat',the_expr_dir))        % condition orders from fusp
    
    %creates 'blockcondname' each row of which is the conditions in a block
    blockcondname=NaN(8,10);
    for each_block=1:8;
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
    
    % go through each trial of each block and seperate out the data according
    % to condition number.
    counter=0;
    extra_trials=0;
    line_counter1=1;
    line_counter2=1;
    line_counter3=1;
    line_counter4=1;
    line_counter5=1;
    line_counter6=1;
    line_counter7=1;
    line_counter8=1;
    line_counter9=1;
    line_counter10=1;
    
%    preallocation
    for q=1:10
%         A=zeros(8, nframes_to_use);
%         A(:,:) = (NaN);
%         B=length(gooddata.prestep(1,1).data(1,:));
        %data_6.poststep(each_block).data(d,:)
%         sorted_data(q).wholetrial=[zeros(8,nframes_to_use)];
%         sorted_data(q).prestep=[zeros(8,B)];
%         sorted_data(q).poststep=[zeros(8,B)];
%         sorted_data(q).ampsig=A;
%         sorted_data(q).audiodata=[zeros(8,44096)];
%         sorted_data(q).finalpitch_ampthresh={zeros(8,3000)};
        sorted_data(q).pertresp={zeros(8,3000)};
        %sorted_data(q).AMP_wholetrial=zeros(8,nframes_to_use);
        %sorted_data(q).AMP_prestep=zeros(8,B);
        %sorted_data(q).AMP_poststep=zeros(8,B);
    end
    
    %looks at the trial order and writes each trial type to a different matrix
    %in sorted_data. Takes with it the other relevent data.
    line_counter=ones(1,10);
    for each_block=1:8
        blockx=blockcondname(each_block,:);
        for trial=1:10
            sorted_data(blockx(trial)).wholetrial(line_counter(blockx(trial)),:)=gooddata(1).goodpitchdata(each_block).data(trial,:);
            sorted_data(blockx(trial)).goodpitchdata_difflowpassfilt(line_counter(blockx(trial)),:)=gooddata(1).goodpitch_difflowpassfilt(1).data(trial,:);            
            sorted_data(blockx(trial)).prestep(line_counter(blockx(trial)),:)=gooddata(1).prestep(each_block).data(trial,:);
            sorted_data(blockx(trial)).poststep(line_counter(blockx(trial)),:)=gooddata(1).poststep(each_block).data(trial,:);            
            sorted_data(blockx(trial)).AMP_wholetrial(line_counter(blockx(trial)),:)=gooddata(1).goodampdata(1).wholetrial_amp(trial,:);                                                                                     
            sorted_data(blockx(trial)).AMP_prestep(line_counter(blockx(trial)),:)=gooddata(1).goodampdata(1).prestep_amp(trial,:);
            sorted_data(blockx(trial)).AMP_poststep(line_counter(blockx(trial)),:)=gooddata(1).goodampdata(1).poststep_amp(trial,:);
            sorted_data(blockx(trial)).wholetrial_spectral(line_counter(blockx(trial)),:)=gooddata(1).goodpitchdata_spectral(each_block).data(trial,:);
            sorted_data(blockx(trial)).distfromtarg_pre=gooddata(1).pre_distfromtarget(1).data(trial);
            sorted_data(blockx(trial)).distfromtarg_post=gooddata(1).post_distfromtarget(1).data(trial);
            sorted_data(blockx(trial)).pertresp{line_counter(blockx(trial)),:}=shifted_blockalt{trial, each_block};
            sorted_data(blockx(trial)).goodstdwholetrial(line_counter(blockx(trial)),:)=gooddata(1).goodstd(1).wholetrial;
            sorted_data(blockx(trial)).goodstdprestep(line_counter(blockx(trial)),:)=gooddata(1).goodstd(1).prestep;
            sorted_data(blockx(trial)).goodstdpoststep(line_counter(blockx(trial)),:)=gooddata(1).goodstd(1).poststep;
            sorted_data(blockx(trial)).mean_goodstdwholetrial(line_counter(blockx(trial)),:)=nanmean(gooddata(1).goodstd(1).wholetrial);
            sorted_data(blockx(trial)).mean_goodstdprestep(line_counter(blockx(trial)),:)=nanmean(gooddata(1).goodstd(1).prestep);
            sorted_data(blockx(trial)).mean_goodstdpoststep(line_counter(blockx(trial)),:)=nanmean(gooddata(1).goodstd(1).poststep);
            sorted_data(blockx(trial)).goodstdwholetrial_amp(line_counter(blockx(trial)),:)=gooddata(1).goodstd(1).wholetrial_amp;
            sorted_data(blockx(trial)).goodstdprestep_amp(line_counter(blockx(trial)),:)=gooddata(1).goodstd(1).prestep_amp;
            sorted_data(blockx(trial)).goodstdpoststep_amp(line_counter(blockx(trial)),:)=gooddata(1).goodstd(1).poststep_amp;
            
            sorted_data(blockx(trial)).mean_goodstdwholetrial_amp(line_counter(blockx(trial)),:)=nanmean(gooddata(1).goodstd(1).wholetrial_amp);
            sorted_data(blockx(trial)).mean_goodstdprestep_amp(line_counter(blockx(trial)),:)=nanmean(gooddata(1).goodstd(1).prestep_amp);
            sorted_data(blockx(trial)).mean_goodstdpoststep_amp(line_counter(blockx(trial)),:)=nanmean(gooddata(1).goodstd(1).poststep_amp);
            %sorted_data(blockx(trial)).audiodata(line_counter(blockx(trial)),:)=gooddata.audio(each_block).audio(trial,:);
            line_counter(blockx(trial))=line_counter(blockx(trial))+1;
        end
    end
    
    close
    
    %% ------------------------------------------------------------------------
%         for cond=1:10
%             for itrial=1:8
%                 subplot(2,5,cond)
%                 for one=1:8
%                 plot(sorted_data(cond).wholetrial(itrial,:))
%                 hold all
%                 plot(nanmean(sorted_data(cond).wholetrial),'k','LineWidth',1.1);
%                 axis([1 1500 -350 350])
%                 end
%             end
%         end
%        saveas(fig1, 'sorted_trials.jpg')
    
    %pause
    
    
    % calculate how many nan trials
    
    
for cond=1:10
goodtrial_counter(cond)=0;    
    for itrial=1:8
        if sum(isnan(sorted_data(cond).wholetrial(itrial,:)))<1360
            goodtrial_counter(cond)=goodtrial_counter(cond)+1;
        end
    end
end

sub_total_goodtrial(each_subject)=sum(goodtrial_counter);
    
    clc
    display('dont be fooled by thinking this is wrong before checking the Y axis..')
    save sorted_data sorted_data
    cd(cerebellar_data_rootdir)
    total_trials_included=sum(sub_total_goodtrial);
    save sub_total_goodtrial sub_total_goodtrial
    save total_trials_included total_trials_included
    
end