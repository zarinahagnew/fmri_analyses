
close all
clear all
set_params_pitchtracking;

cd(cerebellar_data_rootdir)
TRIALS(1) = load ('SUB01/expr2014.03.21.T10.46.03_mainrun/speak/gooddata.mat');
TRIALS(2) = load ('SUB02/expr2014.03.21.T12.33.58_mainrun/speak/gooddata.mat');
TRIALS(3) = load ('SUB03/expr2014.03.21.T14.35.35_mainrun/speak/gooddata.mat');
TRIALS(4) = load ('SUB04/expr2014.03.21.T17.20.11_mainrun/speak/gooddata.mat');
TRIALS(5) = load ('SUB05/expr2014.03.21.T18.50.52_mainrun/speak/gooddata.mat');
TRIALS(6) = load ('SUB06/expr2014.03.22.T11.05.45_mainrun/speak/gooddata.mat');
TRIALS(7) = load ('SUB07/expr2014.03.22.T12.15.42_mainrun/speak/gooddata.mat');
TRIALS(8) = load ('SUB08/expr2014.03.22.T14.01.48_mainrun/speak/gooddata.mat');
TRIALS(9) = load ('SUB09/expr2014.03.22.T15.52.01_mainrun/speak/gooddata.mat');
TRIALS(10) = load ('SUB10/expr2014.03.22.T16.37.44_mainrun/speak/gooddata.mat');
TRIALS(11) = load ('SUB11/expr2014.03.22.T18.46.44_mainrun/speak/gooddata.mat');
TRIALS(12) = load ('SUB12/expr2014.03.23.T11.03.52_mainrun/speak/gooddata.mat');
TRIALS(13) = load ('SUB13/expr2014.03.23.T13.47.01_mainrun/speak/gooddata.mat');
TRIALS(14) = load ('SUB14/expr2014.03.23.T15.21.00_mainrun/speak/gooddata.mat');
TRIALS(15) = load ('SUB15/expr2014.03.23.T16.32.53_mainrun/speak/gooddata.mat');
TRIALS(16) = load ('SUB16/expr2014.03.23.T18.16.58_mainrun/speak/gooddata.mat');

% % % % list controls here
TRIALS(17) = load ('HC01/expr2014.05.06.T12.36.43_mainrun/speak/gooddata.mat');
TRIALS(18) = load ('HC02/expr2014.06.17.T12.53.53_mainrun/speak/gooddata.mat');
TRIALS(19) = load ('HC03/expr2014.06.17.T13.50.36_mainrun/speak/gooddata.mat');
TRIALS(20) = load ('HC04/expr2014.06.17.T16.22.20_mainrun/speak/gooddata.mat');
TRIALS(21) = load ('HC05/expr2014.06.18.T15.14.02_mainrun/speak/gooddata.mat');
TRIALS(22) = load ('HC06/expr2014.06.18.T16.18.27_mainrun/speak/gooddata.mat');
TRIALS(23) = load ('HC07/expr2014.07.25.T10.29.55_mainrun/speak/gooddata.mat');
TRIALS(24) = load ('HC08/expr2014.08.14.T15.57.52_mainrun/speak/gooddata.mat');
TRIALS(25) = load ('HC09/expr2014.09.21.T14.17.36_mainrun/speak/gooddata.mat');
TRIALS(26) = load ('HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/gooddata.mat');
TRIALS(27) = load ('HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/gooddata.mat');
TRIALS(28) = load ('HC12/expr2015.05.11.T11.18.14_mainrun/speak/gooddata.mat');
TRIALS(29) = load ('HC13/expr2015.05.11.T11.53.19_mainrun/speak/gooddata.mat');
TRIALS(30) = load ('HC14/expr2015.05.11.T12.28.56_mainrun/speak/gooddata.mat');


counter=0;
counter_pre=0;
counter_post=0;

for isubj=1:length(TRIALS)
    for iblock=1:8
        counter=0;
        counter_pre=0;
        counter_post=0;
        for itrial=1:10
            if sum(isnan(TRIALS(isubj).gooddata.goodpitchdata(iblock).data(itrial,:)))==1360;
                counter=counter+1;
            end
            
            if sum(isnan(TRIALS(isubj).gooddata.prestep(iblock).data(itrial,:)))==201;
                counter_pre=counter_pre+1;
            end
            
            if sum(isnan(TRIALS(isubj).gooddata.poststep(iblock).data(itrial,:)))==201;
                counter_post=counter_post+1;
            end
        end
        block_counter(iblock)=counter;
        block_counter_pre(iblock)=counter_pre;
        block_counter_post(iblock)=counter_post;
        
        % check
        if block_counter(iblock)>10
            error('ERRMSG')
        end
        
    end
    sub_counter(isubj)=sum(block_counter);
    sub_counter_pre(isubj)=sum(block_counter_pre);
    sub_counter_post(isubj)=sum(block_counter_post);
    
    
end

sub_counter=80-sub_counter;
sub_counter_pre=80-sub_counter_pre;
sub_counter_post=80-sub_counter_post;

cd GroupData/

xlswrite('WT_validtrials',sub_counter)
xlswrite('WT_validtrials_pre',sub_counter_pre)
xlswrite('WT_validtrials_post',sub_counter_post)

% clf
% for iblock=1:8
%     for moo=1:10
%         subplot(5,2,moo)
%         plot(TRIALS(isubj).gooddata.goodpitchdata(iblock).data(moo,:))
%     end
%     pause
% end

%% gaps
close all
clear all
set_params_pitchtracking;

cd(cerebellar_data_rootdir)

GAPS(1) = load ('SUB01/expr2014.03.21.T10.46.03_mainrun/speak/gaps.mat');
GAPS(2) = load ('SUB02/expr2014.03.21.T12.33.58_mainrun/speak/gaps.mat');
GAPS(3) = load ('SUB03/expr2014.03.21.T14.35.35_mainrun/speak/gaps.mat');
GAPS(4) = load ('SUB04/expr2014.03.21.T17.20.11_mainrun/speak/gaps.mat');
GAPS(5) = load ('SUB05/expr2014.03.21.T18.50.52_mainrun/speak/gaps.mat');
GAPS(6) = load ('SUB06/expr2014.03.22.T11.05.45_mainrun/speak/gaps.mat');
GAPS(7) = load ('SUB07/expr2014.03.22.T12.15.42_mainrun/speak/gaps.mat');
GAPS(8) = load ('SUB08/expr2014.03.22.T14.01.48_mainrun/speak/gaps.mat');
GAPS(9) = load ('SUB09/expr2014.03.22.T15.52.01_mainrun/speak/gaps.mat');
GAPS(10) = load ('SUB10/expr2014.03.22.T16.37.44_mainrun/speak/gaps.mat');
GAPS(11) = load ('SUB11/expr2014.03.22.T18.46.44_mainrun/speak/gaps.mat');
GAPS(12) = load ('SUB12/expr2014.03.23.T11.03.52_mainrun/speak/gaps.mat');
GAPS(13) = load ('SUB13/expr2014.03.23.T13.47.01_mainrun/speak/gaps.mat');
GAPS(14) = load ('SUB14/expr2014.03.23.T15.21.00_mainrun/speak/gaps.mat');
GAPS(15) = load ('SUB15/expr2014.03.23.T16.32.53_mainrun/speak/gaps.mat');
GAPS(16) = load ('SUB16/expr2014.03.23.T18.16.58_mainrun/speak/gaps.mat');

% % % % list controls here
GAPS(17) = load ('HC01/expr2014.05.06.T12.36.43_mainrun/speak/gaps.mat');
GAPS(18) = load ('HC02/expr2014.06.17.T12.53.53_mainrun/speak/gaps.mat');
GAPS(19) = load ('HC03/expr2014.06.17.T13.50.36_mainrun/speak/gaps.mat');
GAPS(20) = load ('HC04/expr2014.06.17.T16.22.20_mainrun/speak/gaps.mat');
GAPS(21) = load ('HC05/expr2014.06.18.T15.14.02_mainrun/speak/gaps.mat');
GAPS(22) = load ('HC06/expr2014.06.18.T16.18.27_mainrun/speak/gaps.mat');
GAPS(23) = load ('HC07/expr2014.07.25.T10.29.55_mainrun/speak/gaps.mat');
GAPS(24) = load ('HC08/expr2014.08.14.T15.57.52_mainrun/speak/gaps.mat');
GAPS(25) = load ('HC09/expr2014.09.21.T14.17.36_mainrun/speak/gaps.mat');
GAPS(26) = load ('HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/gaps.mat');
GAPS(27) = load ('HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/gaps.mat');
GAPS(28) = load ('HC12/expr2015.05.11.T11.18.14_mainrun/speak/gaps.mat');
GAPS(29) = load ('HC13/expr2015.05.11.T11.53.19_mainrun/speak/gaps.mat');
GAPS(30) = load ('HC14/expr2015.05.11.T12.28.56_mainrun/speak/gaps.mat');


for i=1:length(GAPS)
SUMGAPS(i)=nansum([GAPS(i).gaps(1).data, GAPS(i).gaps(2).data,GAPS(i).gaps(3).data, GAPS(i).gaps(4).data, ...
    GAPS(i).gaps(5).data, GAPS(i).gaps(6).data,GAPS(i).gaps(7).data, GAPS(i).gaps(8).data])
end

cd GroupData/

xlswrite('gapsbysubject',SUMGAPS)

%% mean pitch
clear all
cd /Users/zagnew/Cereb_data/data_final_run
[meanpitches]=xlsread('meanpitches.xls');

%% 

close all
clear all
set_params_pitchtracking
cd(cerebellar_data_rootdir)
load DATA_TO_USE.mat

%%  #result
  
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_1(isub)=DATA_TO_USE(isub).StdWithinCond1_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_1(isub)=DATA_TO_USE(isub).StdWithinCond1_within_pre_meanstdev;
    patients_meanWTstdev_post_1(isub)=DATA_TO_USE(isub).StdWithinCond1_within_post_meanstdev;
    
    patients_semWTstdev_wholetrial_1(isub,:)=nanmean(DATA_TO_USE(isub).StdWithinCond1_within_wholetrial_stdev);
    patients_semWTstdev_pre_1(isub)=nanmean(DATA_TO_USE(isub).StdWithinCond1_within_pre_meanstdev);
    patients_semWTstdev_post_1(isub)=nanmean(DATA_TO_USE(isub).StdWithinCond1_within_post_meanstdev);
    
    patients_stdevWTstdev_wholetrial_1(isub)=DATA_TO_USE(isub).StdWithinCond1_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_1(isub)=DATA_TO_USE(isub).StdWithinCond1_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_1(isub)=DATA_TO_USE(isub).StdWithinCond1_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_2(isub)=DATA_TO_USE(isub).StdWithinCond2_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_2(isub)=DATA_TO_USE(isub).StdWithinCond2_within_pre_meanstdev;
    patients_meanWTstdev_post_2(isub)=DATA_TO_USE(isub).StdWithinCond2_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_2(isub)=DATA_TO_USE(isub).StdWithinCond2_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_2(isub)=DATA_TO_USE(isub).StdWithinCond2_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_2(isub)=DATA_TO_USE(isub).StdWithinCond2_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_3(isub)=DATA_TO_USE(isub).StdWithinCond3_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_3(isub)=DATA_TO_USE(isub).StdWithinCond3_within_pre_meanstdev;
    patients_meanWTstdev_post_3(isub)=DATA_TO_USE(isub).StdWithinCond3_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_3(isub)=DATA_TO_USE(isub).StdWithinCond3_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_3(isub)=DATA_TO_USE(isub).StdWithinCond3_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_3(isub)=DATA_TO_USE(isub).StdWithinCond3_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_4(isub)=DATA_TO_USE(isub).StdWithinCond4_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_4(isub)=DATA_TO_USE(isub).StdWithinCond4_within_pre_meanstdev;
    patients_meanWTstdev_post_4(isub)=DATA_TO_USE(isub).StdWithinCond4_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_4(isub)=DATA_TO_USE(isub).StdWithinCond4_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_4(isub)=DATA_TO_USE(isub).StdWithinCond4_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_4(isub)=DATA_TO_USE(isub).StdWithinCond4_within_wholetrial_stdevstdev;
    end

    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_5(isub)=DATA_TO_USE(isub).StdWithinCond5_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_5(isub)=DATA_TO_USE(isub).StdWithinCond5_within_pre_meanstdev;
    patients_meanWTstdev_post_5(isub)=DATA_TO_USE(isub).StdWithinCond5_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_5(isub)=DATA_TO_USE(isub).StdWithinCond5_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_5(isub)=DATA_TO_USE(isub).StdWithinCond5_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_5(isub)=DATA_TO_USE(isub).StdWithinCond5_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_6(isub)=DATA_TO_USE(isub).StdWithinCond6_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_6(isub)=DATA_TO_USE(isub).StdWithinCond6_within_pre_meanstdev;
    patients_meanWTstdev_post_6(isub)=DATA_TO_USE(isub).StdWithinCond6_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_6(isub)=DATA_TO_USE(isub).StdWithinCond6_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_6(isub)=DATA_TO_USE(isub).StdWithinCond6_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_6(isub)=DATA_TO_USE(isub).StdWithinCond6_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_7(isub)=DATA_TO_USE(isub).StdWithinCond7_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_7(isub)=DATA_TO_USE(isub).StdWithinCond7_within_pre_meanstdev;
    patients_meanWTstdev_post_7(isub)=DATA_TO_USE(isub).StdWithinCond7_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_7(isub)=DATA_TO_USE(isub).StdWithinCond7_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_7(isub)=DATA_TO_USE(isub).StdWithinCond7_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_7(isub)=DATA_TO_USE(isub).StdWithinCond7_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_8(isub)=DATA_TO_USE(isub).StdWithinCond8_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_8(isub)=DATA_TO_USE(isub).StdWithinCond8_within_pre_meanstdev;
    patients_meanWTstdev_post_8(isub)=DATA_TO_USE(isub).StdWithinCond8_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_8(isub)=DATA_TO_USE(isub).StdWithinCond8_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_8(isub)=DATA_TO_USE(isub).StdWithinCond8_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_8(isub)=DATA_TO_USE(isub).StdWithinCond8_within_wholetrial_stdevstdev;
    end

    
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_9(isub)=DATA_TO_USE(isub).StdWithinCond9_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_9(isub)=DATA_TO_USE(isub).StdWithinCond9_within_pre_meanstdev;
    patients_meanWTstdev_post_9(isub)=DATA_TO_USE(isub).StdWithinCond9_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_9(isub)=DATA_TO_USE(isub).StdWithinCond9_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_9(isub)=DATA_TO_USE(isub).StdWithinCond9_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_9(isub)=DATA_TO_USE(isub).StdWithinCond9_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(patients_included)
    patients_meanWTstdev_wholetrial_10(isub)=DATA_TO_USE(isub).StdWithinCond10_within_wholetrial_meanstdev;
    patients_meanWTstdev_pre_10(isub)=DATA_TO_USE(isub).StdWithinCond10_within_pre_meanstdev;
    patients_meanWTstdev_post_10(isub)=DATA_TO_USE(isub).StdWithinCond10_within_post_meanstdev;
    
    patients_stdevWTstdev_wholetrial_10(isub)=DATA_TO_USE(isub).StdWithinCond10_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_pre_10(isub)=DATA_TO_USE(isub).StdWithinCond10_within_wholetrial_stdevstdev;
    patients_stdevWTstdev_post_10(isub)=DATA_TO_USE(isub).StdWithinCond10_within_wholetrial_stdevstdev;
    end    

    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_1(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond1_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_1(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond1_within_pre_meanstdev;
    hcs_meanWTstdev_post_1(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond1_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_1(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond1_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_1(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond1_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_1(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond1_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_2(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond2_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_2(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond2_within_pre_meanstdev;
    hcs_meanWTstdev_post_2(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond2_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_2(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond2_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_2(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond2_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_2(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond2_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_3(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond3_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_3(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond3_within_pre_meanstdev;
    hcs_meanWTstdev_post_3(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond3_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_3(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond3_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_3(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond3_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_3(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond3_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_4(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond4_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_4(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond4_within_pre_meanstdev;
    hcs_meanWTstdev_post_4(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond4_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_4(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond4_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_4(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond4_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_4(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond4_within_wholetrial_stdevstdev;
    end

    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_5(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond5_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_5(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond5_within_pre_meanstdev;
    hcs_meanWTstdev_post_5(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond5_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_5(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond5_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_5(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond5_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_5(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond5_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_6(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond6_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_6(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond6_within_pre_meanstdev;
    hcs_meanWTstdev_post_6(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond6_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_6(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond6_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_6(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond6_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_6(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond6_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_7(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond7_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_7(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond7_within_pre_meanstdev;
    hcs_meanWTstdev_post_7(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond7_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_7(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond7_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_7(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond7_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_7(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond7_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_8(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond8_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_8(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond8_within_pre_meanstdev;
    hcs_meanWTstdev_post_8(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond8_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_8(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond8_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_8(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond8_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_8(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond8_within_wholetrial_stdevstdev;
    end

    
    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_9(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond9_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_9(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond9_within_pre_meanstdev;
    hcs_meanWTstdev_post_9(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond9_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_9(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond9_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_9(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond9_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_9(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond9_within_wholetrial_stdevstdev;
    end
    
    for isub=1:length(subjects_included)
    hcs_meanWTstdev_wholetrial_10(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond10_within_wholetrial_meanstdev;
    hcs_meanWTstdev_pre_10(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond10_within_pre_meanstdev;
    hcs_meanWTstdev_post_10(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond10_within_post_meanstdev;
    
    hcs_stdevWTstdev_wholetrial_10(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond10_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_pre_10(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond10_within_wholetrial_stdevstdev;
    hcs_stdevWTstdev_post_10(isub)=DATA_TO_USE(isub+length(subjects_included)).StdWithinCond10_within_wholetrial_stdevstdev;
    end    
   
cd GroupData/

xlswrite('patients_meanWTstdev_wholetrial_1',patients_meanWTstdev_wholetrial_1);
xlswrite('patients_meanWTstdev_pre_1',patients_meanWTstdev_pre_1);
xlswrite('patients_meanWTstdev_post_1',patients_meanWTstdev_post_1);

xlswrite('patients_stdevWTstdev_wholetrial_1',patients_stdevWTstdev_wholetrial_1);
xlswrite('patients_stdevWTstdev_pre_1',patients_stdevWTstdev_pre_1);
xlswrite('patients_stdevWTstdev_post_1',patients_stdevWTstdev_post_1);


%plot this
figure
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'WTstdev across groups', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[nanmean(patients_meanWTstdev_pre_1) nanmean(patients_meanWTstdev_pre_2) nanmean(patients_meanWTstdev_pre_3) nanmean(patients_meanWTstdev_pre_4) nanmean(patients_meanWTstdev_pre_5); nanmean(patients_meanWTstdev_pre_6) nanmean(patients_meanWTstdev_pre_7) nanmean(patients_meanWTstdev_pre_8) nanmean(patients_meanWTstdev_pre_9) nanmean(patients_meanWTstdev_pre_10); ...
    nanmean(patients_meanWTstdev_post_1) nanmean(patients_meanWTstdev_post_2) nanmean(patients_meanWTstdev_post_3) nanmean(patients_meanWTstdev_post_4) nanmean(patients_meanWTstdev_post_5); nanmean(patients_meanWTstdev_post_6) nanmean(patients_meanWTstdev_post_7) nanmean(patients_meanWTstdev_post_8) nanmean(patients_meanWTstdev_post_9) nanmean(patients_meanWTstdev_post_10)];
errY2 =[nanstd(patients_meanWTstdev_pre_1) nanstd(patients_meanWTstdev_pre_2) nanstd(patients_meanWTstdev_pre_3) nanstd(patients_meanWTstdev_pre_4) nanstd(patients_meanWTstdev_pre_5); nanstd(patients_meanWTstdev_pre_6) nanstd(patients_meanWTstdev_pre_7) nanstd(patients_meanWTstdev_pre_8) nanstd(patients_meanWTstdev_pre_9) nanstd(patients_meanWTstdev_pre_10); ...
    nanstd(patients_meanWTstdev_post_1) nanstd(patients_meanWTstdev_post_2) nanstd(patients_meanWTstdev_post_3) nanstd(patients_meanWTstdev_post_4) nanstd(patients_meanWTstdev_post_5); nanstd(patients_meanWTstdev_post_6) nanstd(patients_meanWTstdev_post_7) nanstd(patients_meanWTstdev_post_8) nanstd(patients_meanWTstdev_post_9) nanstd(patients_meanWTstdev_post_10)];


h = barwitherr(errY2, y_pitch2);% Plot with errorbars

set(gca,'XTickLabel',{'clear','masked'})
ylabel('WTstd F0')
set(h(1),'FaceColor',standardgrey,'EdgeColor', standardgrey ,'LineWidth',1.5);
set(h(2),'FaceColor',down_gs,'EdgeColor', down_gs ,'LineWidth',1.5);
set(h(3),'FaceColor',flat_gs,'EdgeColor', flat_gs ,'LineWidth',1.5);
set(h(4),'FaceColor',up_gs,'EdgeColor', up_gs ,'LineWidth',1.5);
set(h(4),'FaceColor',bigup_gs,'EdgeColor', bigup_gs ,'LineWidth',1.5);

goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/WTstddev_pre_post.pdf');


% 
% nanmean(patients_meanWTstdev_pre_1)
% patients_meanWTstdev_post_1_mean=nanmean(patients_meanWTstdev_post_1)


nanmean([hcs_meanWTstdev_pre_6 hcs_meanWTstdev_pre_7 hcs_meanWTstdev_pre_8 hcs_meanWTstdev_pre_9 hcs_meanWTstdev_pre_10])
nanmean([hcs_meanWTstdev_pre_1 hcs_meanWTstdev_pre_2 hcs_meanWTstdev_pre_3 hcs_meanWTstdev_pre_4 hcs_meanWTstdev_pre_5])
nanmean([patients_meanWTstdev_pre_6 patients_meanWTstdev_pre_7 patients_meanWTstdev_pre_8 patients_meanWTstdev_pre_9 patients_meanWTstdev_pre_10])
nanmean([patients_meanWTstdev_pre_1 patients_meanWTstdev_pre_2 patients_meanWTstdev_pre_3 patients_meanWTstdev_pre_4 patients_meanWTstdev_pre_5])

