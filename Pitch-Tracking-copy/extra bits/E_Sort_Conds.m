%% Sort trials by condition for each subject
% -------------------------------------------------------------------------
% ZKA March 2014
clear all;
close all;
set_params

set(0,'DefaultFigureWindowStyle','docked')

% npatients = 0;
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB02/expr2014.03.21.T12.33.58_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB03/expr2014.03.21.T14.35.35_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB04/expr2014.03.21.T17.20.11_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB05/expr2014.03.21.T18.50.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB06/expr2014.03.22.T11.05.45_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB07/expr2014.03.22.T12.15.42_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB08/expr2014.03.22.T14.01.48_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB09/expr2014.03.22.T15.52.01_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB10/expr2014.03.22.T16.37.44_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB12/expr2014.03.23.T11.03.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/';

% list controls here
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC01/expr2014.05.06.T12.36.43_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC02/expr2014.06.17.T12.53.53_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC03/expr2014.06.17.T13.50.36_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC04/expr2014.06.17.T16.22.20_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC05/expr2014.06.18.T15.14.02_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC06/expr2014.06.18.T16.18.27_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC07/expr2014.07.25.T10.29.55_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC08/expr2014.08.14.T15.57.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC09/expr2014.09.21.T14.17.36_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC12/expr2015.05.11.T11.18.14_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC13/expr2015.05.11.T11.53.19_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC14/expr2015.05.11.T12.28.56_mainrun/speak/';
% 


for each_subject = 1:npatients
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)
    
    load (sprintf('%sgooddata.mat',the_expr_dir))           % pitchdata from B_goodtrials_allsubs
    load (sprintf('%sexpr_config.mat',the_expr_dir))        % condition orders from fusp
    load (sprintf('%sshifted_blockalt.mat',the_expr_dir))   % pert resps (original, unshifted, despite the name)
    
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
        sorted_data(q).pertresp={zeros(8,3000)};
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
            
            sorted_data(blockx(trial)).WTstd_cents_wholetrial(line_counter(blockx(trial)),:)=gooddata(1).WTstd_cents(each_block).wholetrial(trial)
            sorted_data(blockx(trial)).WTstd_cents_prestep(line_counter(blockx(trial)),:)=gooddata(1).WTstd_cents(each_block).prestep(trial)
            sorted_data(blockx(trial)).WTstd_cents_poststep(line_counter(blockx(trial)),:)=gooddata(1).WTstd_cents(each_block).poststep(trial)
            
            
%             nanstd(gooddata(1).goodpitchdata(each_block).data(trial,:))
%             gooddata(1).WTstd_cents(each_block).wholetrial(trial)
%             
            gooddata.WTstd_cents(each_block).prestep
            
            
            
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



