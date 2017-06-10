%% Calulates the number of gaps in a trial.
% loads gaps.mat which is produced by B_good trials_allsubs.m
% gaps.m is abinary array where 1's are break in voicing and nans are
% voicing. This  


close all
clear all
set_params;

cd(cerebellar_data_rootdir)
SUB_GAPS(1) = load ('SUB01/expr2014.03.21.T10.46.03_mainrun/speak/gaps.mat');
SUB_GAPS(2) = load ('SUB02/expr2014.03.21.T12.33.58_mainrun/speak/gaps.mat');
SUB_GAPS(3) = load ('SUB03/expr2014.03.21.T14.35.35_mainrun/speak/gaps.mat');
SUB_GAPS(4) = load ('SUB04/expr2014.03.21.T17.20.11_mainrun/speak/gaps.mat'); 
SUB_GAPS(5) = load ('SUB05/expr2014.03.21.T18.50.52_mainrun/speak/gaps.mat');
SUB_GAPS(6) = load ('SUB06/expr2014.03.22.T11.05.45_mainrun/speak/gaps.mat');
SUB_GAPS(7) = load ('SUB07/expr2014.03.22.T12.15.42_mainrun/speak/gaps.mat');
SUB_GAPS(8) = load ('SUB08/expr2014.03.22.T14.01.48_mainrun/speak/gaps.mat');
SUB_GAPS(9) = load ('SUB09/expr2014.03.22.T15.52.01_mainrun/speak/gaps.mat');
SUB_GAPS(10) = load ('SUB10/expr2014.03.22.T16.37.44_mainrun/speak/gaps.mat');
SUB_GAPS(11) = load ('SUB11/expr2014.03.22.T18.46.44_mainrun/speak/gaps.mat');
SUB_GAPS(12) = load ('SUB12/expr2014.03.23.T11.03.52_mainrun/speak/gaps.mat');
SUB_GAPS(13) = load ('SUB13/expr2014.03.23.T13.47.01_mainrun/speak/gaps.mat');
SUB_GAPS(14) = load ('SUB14/expr2014.03.23.T15.21.00_mainrun/speak/gaps.mat');
SUB_GAPS(15) = load ('SUB15/expr2014.03.23.T16.32.53_mainrun/speak/gaps.mat');
SUB_GAPS(16) = load ('SUB16/expr2014.03.23.T18.16.58_mainrun/speak/gaps.mat');

% % % list controls here
SUB_GAPS(17) = load ('HC01/expr2014.05.06.T12.36.43_mainrun/speak/gaps.mat');
SUB_GAPS(18) = load ('HC02/expr2014.06.17.T12.53.53_mainrun/speak/gaps.mat');
SUB_GAPS(19) = load ('HC03/expr2014.06.17.T13.50.36_mainrun/speak/gaps.mat');
SUB_GAPS(20) = load ('HC04/expr2014.06.17.T16.22.20_mainrun/speak/gaps.mat');
SUB_GAPS(21) = load ('HC05/expr2014.06.18.T15.14.02_mainrun/speak/gaps.mat');
SUB_GAPS(22) = load ('HC06/expr2014.06.18.T16.18.27_mainrun/speak/gaps.mat');
SUB_GAPS(23) = load ('HC07/expr2014.07.25.T10.29.55_mainrun/speak/gaps.mat');
SUB_GAPS(24) = load ('HC08/expr2014.08.14.T15.57.52_mainrun/speak/gaps.mat');
SUB_GAPS(25) = load ('HC09/expr2014.09.21.T14.17.36_mainrun/speak/gaps.mat');
SUB_GAPS(26) = load ('HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/gaps.mat');
SUB_GAPS(27) = load ('HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/gaps.mat');



for ipat=1:16
GAPS.pat_gaps(ipat)=nansum(SUB_GAPS(ipat).gaps(1).data);
end

GAPS.pat_gaps_total=nansum(GAPS.pat_gaps);
GAPS.pat_gaps_mean=nanmean(GAPS.pat_gaps);
GAPS.pat_gaps_std=nanstd(GAPS.pat_gaps);

GAPS.HC_gaps(1:16)=NaN;
    for isub=17:27
        GAPS.HC_gaps(isub)=nansum(SUB_GAPS(isub).gaps(1).data);
    end
GAPS.HC_gaps=GAPS.HC_gaps(17:end);
GAPS.HC_gaps_total=nansum(GAPS.HC_gaps);
GAPS.HC_gaps_mean=nanmean(GAPS.HC_gaps);
GAPS.HC_gaps_std=nanstd(GAPS.HC_gaps);


GAPS

GAPS.ttest=ttest2(GAPS.HC_gaps, GAPS.pat_gaps)

% good subjects

GAPS.pat_gaps_gdpats=GAPS.pat_gaps(patients_included);
GAPS.HC_gaps_gdsubs=GAPS.HC_gaps(subjects_included);
GAPS.pat_meangaps_gdpats=mean(GAPS.pat_gaps_gdpats)
GAPS.HC_meangaps_gdsubs=mean(GAPS.HC_gaps_gdsubs)

figure;
bar(1, GAPS.HC_gaps_mean);
hold on
bar(2, GAPS.pat_gaps_mean);

figure;
bar(1, nanmean(GAPS.pat_gaps_gdpats));
hold on
bar(2, nanmean(GAPS.HC_gaps_gdsubs));

GAPS.ttest_gdsubs=ttest2(GAPS.HC_gaps_gdsubs, GAPS.pat_gaps_gdpats)



