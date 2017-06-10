clear all
set_params_pitchtracking;


%motor errors
subj_motor_errors_pre(1)=load('/Users/zagnew/Cereb_data/data_final_run/HC01/expr2014.05.06.T12.36.43_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(2)=load('/Users/zagnew/Cereb_data/data_final_run/HC02/expr2014.06.17.T12.53.53_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(3)=load('/Users/zagnew/Cereb_data/data_final_run/HC03/expr2014.06.17.T13.50.36_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(4)=load('/Users/zagnew/Cereb_data/data_final_run/HC04/expr2014.06.17.T16.22.20_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(5)=load('/Users/zagnew/Cereb_data/data_final_run/HC05/expr2014.06.18.T15.14.02_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(6)=load('/Users/zagnew/Cereb_data/data_final_run/HC06/expr2014.06.18.T16.18.27_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(7)=load('/Users/zagnew/Cereb_data/data_final_run/HC07/expr2014.07.25.T10.29.55_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(8)=load('/Users/zagnew/Cereb_data/data_final_run/HC08/expr2014.08.14.T15.57.52_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(9)=load('/Users/zagnew/Cereb_data/data_final_run/HC09/expr2014.09.21.T14.17.36_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(10)=load('/Users/zagnew/Cereb_data/data_final_run/HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(11)=load('/Users/zagnew/Cereb_data/data_final_run/HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(12)=load('/Users/zagnew/Cereb_data/data_final_run/HC12/expr2015.05.11.T11.18.14_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(13)=load('/Users/zagnew/Cereb_data/data_final_run/HC13/expr2015.05.11.T11.53.19_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(14)=load('/Users/zagnew/Cereb_data/data_final_run/HC14/expr2015.05.11.T12.28.56_mainrun/speak/pre_counter.mat');

subj_motor_errors_post(1)=load('/Users/zagnew/Cereb_data/data_final_run/HC01/expr2014.05.06.T12.36.43_mainrun/speak/post_counter.mat');
subj_motor_errors_post(2)=load('/Users/zagnew/Cereb_data/data_final_run/HC02/expr2014.06.17.T12.53.53_mainrun/speak/post_counter.mat');
subj_motor_errors_post(3)=load('/Users/zagnew/Cereb_data/data_final_run/HC03/expr2014.06.17.T13.50.36_mainrun/speak/post_counter.mat');
subj_motor_errors_post(4)=load('/Users/zagnew/Cereb_data/data_final_run/HC04/expr2014.06.17.T16.22.20_mainrun/speak/post_counter.mat');
subj_motor_errors_post(5)=load('/Users/zagnew/Cereb_data/data_final_run/HC05/expr2014.06.18.T15.14.02_mainrun/speak/post_counter.mat');
subj_motor_errors_post(6)=load('/Users/zagnew/Cereb_data/data_final_run/HC06/expr2014.06.18.T16.18.27_mainrun/speak/post_counter.mat');
subj_motor_errors_post(7)=load('/Users/zagnew/Cereb_data/data_final_run/HC07/expr2014.07.25.T10.29.55_mainrun/speak/post_counter.mat');
subj_motor_errors_post(8)=load('/Users/zagnew/Cereb_data/data_final_run/HC08/expr2014.08.14.T15.57.52_mainrun/speak/post_counter.mat');
subj_motor_errors_post(9)=load('/Users/zagnew/Cereb_data/data_final_run/HC09/expr2014.09.21.T14.17.36_mainrun/speak/post_counter.mat');
subj_motor_errors_post(10)=load('/Users/zagnew/Cereb_data/data_final_run/HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/post_counter.mat');
subj_motor_errors_post(11)=load('/Users/zagnew/Cereb_data/data_final_run/HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/post_counter.mat');
subj_motor_errors_post(12)=load('/Users/zagnew/Cereb_data/data_final_run/HC12/expr2015.05.11.T11.18.14_mainrun/speak/post_counter.mat');
subj_motor_errors_post(13)=load('/Users/zagnew/Cereb_data/data_final_run/HC13/expr2015.05.11.T11.53.19_mainrun/speak/post_counter.mat');
subj_motor_errors_post(14)=load('/Users/zagnew/Cereb_data/data_final_run/HC14/expr2015.05.11.T12.28.56_mainrun/speak/post_counter.mat');


for iblock=1:8
HC01_pre(iblock)=subj_motor_errors_pre(1).pre_counter(iblock).data
HC01_post(iblock)=subj_motor_errors_post(1).post_counter(iblock).data
HC02_pre(iblock)=subj_motor_errors_pre(2).pre_counter(iblock).data
HC02_post(iblock)=subj_motor_errors_post(2).post_counter(iblock).data
HC03_pre(iblock)=subj_motor_errors_pre(3).pre_counter(iblock).data
HC03_post(iblock)=subj_motor_errors_post(3).post_counter(iblock).data
HC04_pre(iblock)=subj_motor_errors_pre(4).pre_counter(iblock).data
HC04_post(iblock)=subj_motor_errors_post(4).post_counter(iblock).data
HC05_pre(iblock)=subj_motor_errors_pre(5).pre_counter(iblock).data
HC05_post(iblock)=subj_motor_errors_post(5).post_counter(iblock).data
HC06_pre(iblock)=subj_motor_errors_pre(6).pre_counter(iblock).data
HC06_post(iblock)=subj_motor_errors_post(6).post_counter(iblock).data
HC07_pre(iblock)=subj_motor_errors_pre(7).pre_counter(iblock).data
HC07_post(iblock)=subj_motor_errors_post(7).post_counter(iblock).data
HC08_pre(iblock)=subj_motor_errors_pre(8).pre_counter(iblock).data
HC08_post(iblock)=subj_motor_errors_post(8).post_counter(iblock).data
HC09_pre(iblock)=subj_motor_errors_pre(9).pre_counter(iblock).data
HC09_post(iblock)=subj_motor_errors_post(9).post_counter(iblock).data
HC10_pre(iblock)=subj_motor_errors_pre(10).pre_counter(iblock).data
HC10_post(iblock)=subj_motor_errors_post(10).post_counter(iblock).data
HC11_pre(iblock)=subj_motor_errors_pre(11).pre_counter(iblock).data
HC11_post(iblock)=subj_motor_errors_post(11).post_counter(iblock).data
HC12_pre(iblock)=subj_motor_errors_pre(12).pre_counter(iblock).data
HC12_post(iblock)=subj_motor_errors_post(12).post_counter(iblock).data
HC13_pre(iblock)=subj_motor_errors_pre(13).pre_counter(iblock).data
HC13_post(iblock)=subj_motor_errors_post(13).post_counter(iblock).data
HC14_pre(iblock)=subj_motor_errors_pre(14).pre_counter(iblock).data
HC14_post(iblock)=subj_motor_errors_post(14).post_counter(iblock).data
end

HC_motor_errors_pre(1,:)=HC01_pre
HC_motor_errors_pre(2,:)=HC02_pre
HC_motor_errors_pre(3,:)=HC03_pre
HC_motor_errors_pre(4,:)=HC04_pre
HC_motor_errors_pre(5,:)=HC05_pre
HC_motor_errors_pre(6,:)=HC06_pre
HC_motor_errors_pre(7,:)=HC07_pre
HC_motor_errors_pre(8,:)=HC08_pre
HC_motor_errors_pre(9,:)=HC09_pre
HC_motor_errors_pre(10,:)=HC10_pre
HC_motor_errors_pre(11,:)=HC11_pre
HC_motor_errors_pre(12,:)=HC12_pre
HC_motor_errors_pre(13,:)=HC13_pre
HC_motor_errors_pre(14,:)=HC14_pre

HC_motor_errors_post(1,:)=HC01_post
HC_motor_errors_post(2,:)=HC02_post
HC_motor_errors_post(3,:)=HC03_post
HC_motor_errors_post(4,:)=HC04_post
HC_motor_errors_post(5,:)=HC05_post
HC_motor_errors_post(6,:)=HC06_post
HC_motor_errors_post(7,:)=HC07_post
HC_motor_errors_post(8,:)=HC08_post
HC_motor_errors_post(9,:)=HC09_post
HC_motor_errors_post(10,:)=HC10_post
HC_motor_errors_post(11,:)=HC11_post
HC_motor_errors_post(12,:)=HC12_post
HC_motor_errors_post(13,:)=HC13_post
HC_motor_errors_post(14,:)=HC14_post

for isub=1:14
totalHC_motor_errors_pre(isub)=sum(HC_motor_errors_pre(isub,:))
totalHC_motor_errors_post(isub)=sum(HC_motor_errors_post(isub,:))
end

% patients
subj_motor_errors_pre(1)=load('/Users/zagnew/Cereb_data/data_final_run/SUB01/expr2014.03.21.T10.46.03_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(2)=load('/Users/zagnew/Cereb_data/data_final_run/SUB02/expr2014.03.21.T12.33.58_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(3)=load('/Users/zagnew/Cereb_data/data_final_run/SUB03/expr2014.03.21.T14.35.35_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(4)=load('/Users/zagnew/Cereb_data/data_final_run/SUB04/expr2014.03.21.T17.20.11_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(5)=load('/Users/zagnew/Cereb_data/data_final_run/SUB05/expr2014.03.21.T18.50.52_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(6)=load('/Users/zagnew/Cereb_data/data_final_run/SUB06/expr2014.03.22.T11.05.45_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(7)=load('/Users/zagnew/Cereb_data/data_final_run/SUB07/expr2014.03.22.T12.15.42_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(8)=load('/Users/zagnew/Cereb_data/data_final_run/SUB08/expr2014.03.22.T14.01.48_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(9)=load('/Users/zagnew/Cereb_data/data_final_run/SUB09/expr2014.03.22.T15.52.01_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(10)=load('/Users/zagnew/Cereb_data/data_final_run/SUB10/expr2014.03.22.T16.37.44_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(11)=load('/Users/zagnew/Cereb_data/data_final_run/SUB11/expr2014.03.22.T18.46.44_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(12)=load('/Users/zagnew/Cereb_data/data_final_run/SUB12/expr2014.03.23.T11.03.52_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(13)=load('/Users/zagnew/Cereb_data/data_final_run/SUB13/expr2014.03.23.T13.47.01_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(14)=load('/Users/zagnew/Cereb_data/data_final_run/SUB14/expr2014.03.23.T15.21.00_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(15)=load('/Users/zagnew/Cereb_data/data_final_run/SUB15/expr2014.03.23.T16.32.53_mainrun/speak/pre_counter.mat');
subj_motor_errors_pre(16)=load('/Users/zagnew/Cereb_data/data_final_run/SUB16/expr2014.03.23.T18.16.58_mainrun/speak/pre_counter.mat');


subj_motor_errors_post(1)=load('/Users/zagnew/Cereb_data/data_final_run/SUB01/expr2014.03.21.T10.46.03_mainrun/speak/post_counter.mat');
subj_motor_errors_post(2)=load('/Users/zagnew/Cereb_data/data_final_run/SUB02/expr2014.03.21.T12.33.58_mainrun/speak/post_counter.mat');
subj_motor_errors_post(3)=load('/Users/zagnew/Cereb_data/data_final_run/SUB03/expr2014.03.21.T14.35.35_mainrun/speak/post_counter.mat');
subj_motor_errors_post(4)=load('/Users/zagnew/Cereb_data/data_final_run/SUB04/expr2014.03.21.T17.20.11_mainrun/speak/post_counter.mat');
subj_motor_errors_post(5)=load('/Users/zagnew/Cereb_data/data_final_run/SUB05/expr2014.03.21.T18.50.52_mainrun/speak/post_counter.mat');
subj_motor_errors_post(6)=load('/Users/zagnew/Cereb_data/data_final_run/SUB06/expr2014.03.22.T11.05.45_mainrun/speak/post_counter.mat');
subj_motor_errors_post(7)=load('/Users/zagnew/Cereb_data/data_final_run/SUB07/expr2014.03.22.T12.15.42_mainrun/speak/post_counter.mat');
subj_motor_errors_post(8)=load('/Users/zagnew/Cereb_data/data_final_run/SUB08/expr2014.03.22.T14.01.48_mainrun/speak/post_counter.mat');
subj_motor_errors_post(9)=load('/Users/zagnew/Cereb_data/data_final_run/SUB09/expr2014.03.22.T15.52.01_mainrun/speak/post_counter.mat');
subj_motor_errors_post(10)=load('/Users/zagnew/Cereb_data/data_final_run/SUB10/expr2014.03.22.T16.37.44_mainrun/speak/post_counter.mat');
subj_motor_errors_post(11)=load('/Users/zagnew/Cereb_data/data_final_run/SUB11/expr2014.03.22.T18.46.44_mainrun/speak/post_counter.mat');
subj_motor_errors_post(12)=load('/Users/zagnew/Cereb_data/data_final_run/SUB12/expr2014.03.23.T11.03.52_mainrun/speak/post_counter.mat');
subj_motor_errors_post(13)=load('/Users/zagnew/Cereb_data/data_final_run/SUB13/expr2014.03.23.T13.47.01_mainrun/speak/post_counter.mat');
subj_motor_errors_post(14)=load('/Users/zagnew/Cereb_data/data_final_run/SUB14/expr2014.03.23.T15.21.00_mainrun/speak/post_counter.mat');
subj_motor_errors_post(15)=load('/Users/zagnew/Cereb_data/data_final_run/SUB15/expr2014.03.23.T16.32.53_mainrun/speak/post_counter.mat');
subj_motor_errors_post(16)=load('/Users/zagnew/Cereb_data/data_final_run/SUB16/expr2014.03.23.T18.16.58_mainrun/speak/post_counter.mat');




for iblock=1:8
PAT01_pre(iblock)=subj_motor_errors_pre(1).pre_counter(iblock).data
PAT01_post(iblock)=subj_motor_errors_post(1).post_counter(iblock).data
PAT02_pre(iblock)=subj_motor_errors_pre(2).pre_counter(iblock).data
PAT02_post(iblock)=subj_motor_errors_post(2).post_counter(iblock).data
PAT03_pre(iblock)=subj_motor_errors_pre(3).pre_counter(iblock).data
PAT03_post(iblock)=subj_motor_errors_post(3).post_counter(iblock).data
PAT04_pre(iblock)=subj_motor_errors_pre(4).pre_counter(iblock).data
PAT04_post(iblock)=subj_motor_errors_post(4).post_counter(iblock).data
PAT05_pre(iblock)=subj_motor_errors_pre(5).pre_counter(iblock).data
PAT05_post(iblock)=subj_motor_errors_post(5).post_counter(iblock).data
PAT06_pre(iblock)=subj_motor_errors_pre(6).pre_counter(iblock).data
PAT06_post(iblock)=subj_motor_errors_post(6).post_counter(iblock).data
PAT07_pre(iblock)=subj_motor_errors_pre(7).pre_counter(iblock).data
PAT07_post(iblock)=subj_motor_errors_post(7).post_counter(iblock).data
PAT08_pre(iblock)=subj_motor_errors_pre(8).pre_counter(iblock).data
PAT08_post(iblock)=subj_motor_errors_post(8).post_counter(iblock).data
PAT09_pre(iblock)=subj_motor_errors_pre(9).pre_counter(iblock).data
PAT09_post(iblock)=subj_motor_errors_post(9).post_counter(iblock).data
PAT10_pre(iblock)=subj_motor_errors_pre(10).pre_counter(iblock).data
PAT10_post(iblock)=subj_motor_errors_post(10).post_counter(iblock).data
PAT11_pre(iblock)=subj_motor_errors_pre(11).pre_counter(iblock).data
PAT11_post(iblock)=subj_motor_errors_post(11).post_counter(iblock).data
PAT12_pre(iblock)=subj_motor_errors_pre(12).pre_counter(iblock).data
PAT12_post(iblock)=subj_motor_errors_post(12).post_counter(iblock).data
PAT13_pre(iblock)=subj_motor_errors_pre(13).pre_counter(iblock).data
PAT13_post(iblock)=subj_motor_errors_post(13).post_counter(iblock).data
PAT14_pre(iblock)=subj_motor_errors_pre(14).pre_counter(iblock).data
PAT14_post(iblock)=subj_motor_errors_post(14).post_counter(iblock).data
PAT15_pre(iblock)=subj_motor_errors_pre(15).pre_counter(iblock).data
PAT15_post(iblock)=subj_motor_errors_post(15).post_counter(iblock).data
PAT16_pre(iblock)=subj_motor_errors_pre(16).pre_counter(iblock).data
PAT16_post(iblock)=subj_motor_errors_post(16).post_counter(iblock).data
end

PAT_motor_errors_pre(1,:)=PAT01_pre
PAT_motor_errors_pre(2,:)=PAT02_pre
PAT_motor_errors_pre(3,:)=PAT03_pre
PAT_motor_errors_pre(4,:)=PAT04_pre
PAT_motor_errors_pre(5,:)=PAT05_pre
PAT_motor_errors_pre(6,:)=PAT06_pre
PAT_motor_errors_pre(7,:)=PAT07_pre
PAT_motor_errors_pre(8,:)=PAT08_pre
PAT_motor_errors_pre(9,:)=PAT09_pre
PAT_motor_errors_pre(10,:)=PAT10_pre
PAT_motor_errors_pre(11,:)=PAT11_pre
PAT_motor_errors_pre(12,:)=PAT12_pre
PAT_motor_errors_pre(13,:)=PAT13_pre
PAT_motor_errors_pre(14,:)=PAT14_pre
PAT_motor_errors_pre(15,:)=PAT15_pre
PAT_motor_errors_pre(16,:)=PAT16_pre

















for iblock=1:8
PAT01_pre(iblock)=subj_motor_errors_pre(1).pre_counter(iblock).data
PAT01_post(iblock)=subj_motor_errors_post(1).post_counter(iblock).data
PAT02_pre(iblock)=subj_motor_errors_pre(2).pre_counter(iblock).data
PAT02_post(iblock)=subj_motor_errors_post(2).post_counter(iblock).data
PAT03_pre(iblock)=subj_motor_errors_pre(3).pre_counter(iblock).data
PAT03_post(iblock)=subj_motor_errors_post(3).post_counter(iblock).data
PAT04_pre(iblock)=subj_motor_errors_pre(4).pre_counter(iblock).data
PAT04_post(iblock)=subj_motor_errors_post(4).post_counter(iblock).data
PAT05_pre(iblock)=subj_motor_errors_pre(5).pre_counter(iblock).data
PAT05_post(iblock)=subj_motor_errors_post(5).post_counter(iblock).data
PAT06_pre(iblock)=subj_motor_errors_pre(6).pre_counter(iblock).data
PAT06_post(iblock)=subj_motor_errors_post(6).post_counter(iblock).data
PAT07_pre(iblock)=subj_motor_errors_pre(7).pre_counter(iblock).data
PAT07_post(iblock)=subj_motor_errors_post(7).post_counter(iblock).data
PAT08_pre(iblock)=subj_motor_errors_pre(8).pre_counter(iblock).data
PAT08_post(iblock)=subj_motor_errors_post(8).post_counter(iblock).data
PAT09_pre(iblock)=subj_motor_errors_pre(9).pre_counter(iblock).data
PAT09_post(iblock)=subj_motor_errors_post(9).post_counter(iblock).data
PAT10_pre(iblock)=subj_motor_errors_pre(10).pre_counter(iblock).data
PAT10_post(iblock)=subj_motor_errors_post(10).post_counter(iblock).data
PAT11_pre(iblock)=subj_motor_errors_pre(11).pre_counter(iblock).data
PAT11_post(iblock)=subj_motor_errors_post(11).post_counter(iblock).data
PAT12_pre(iblock)=subj_motor_errors_pre(12).pre_counter(iblock).data
PAT12_post(iblock)=subj_motor_errors_post(12).post_counter(iblock).data
PAT13_pre(iblock)=subj_motor_errors_pre(13).pre_counter(iblock).data
PAT13_post(iblock)=subj_motor_errors_post(13).post_counter(iblock).data
PAT14_pre(iblock)=subj_motor_errors_pre(14).pre_counter(iblock).data
PAT14_post(iblock)=subj_motor_errors_post(14).post_counter(iblock).data
PAT15_pre(iblock)=subj_motor_errors_pre(15).pre_counter(iblock).data
PAT15_post(iblock)=subj_motor_errors_post(15).post_counter(iblock).data
PAT16_pre(iblock)=subj_motor_errors_pre(16).pre_counter(iblock).data
PAT16_post(iblock)=subj_motor_errors_post(16).post_counter(iblock).data

end
PAT_motor_errors_pre(1,:)=PAT01_pre
PAT_motor_errors_pre(2,:)=PAT02_pre
PAT_motor_errors_pre(3,:)=PAT03_pre
PAT_motor_errors_pre(4,:)=PAT04_pre
PAT_motor_errors_pre(5,:)=PAT05_pre
PAT_motor_errors_pre(6,:)=PAT06_pre
PAT_motor_errors_pre(7,:)=PAT07_pre
PAT_motor_errors_pre(8,:)=PAT08_pre
PAT_motor_errors_pre(9,:)=PAT09_pre
PAT_motor_errors_pre(10,:)=PAT10_pre
PAT_motor_errors_pre(11,:)=PAT11_pre
PAT_motor_errors_pre(12,:)=PAT12_pre
PAT_motor_errors_pre(13,:)=PAT13_pre
PAT_motor_errors_pre(14,:)=PAT14_pre
PAT_motor_errors_pre(15,:)=PAT15_pre
PAT_motor_errors_pre(16,:)=PAT16_pre

PAT_motor_errors_post(1,:)=PAT01_post
PAT_motor_errors_post(2,:)=PAT02_post
PAT_motor_errors_post(3,:)=PAT03_post
PAT_motor_errors_post(4,:)=PAT04_post
PAT_motor_errors_post(5,:)=PAT05_post
PAT_motor_errors_post(6,:)=PAT06_post
PAT_motor_errors_post(7,:)=PAT07_post
PAT_motor_errors_post(8,:)=PAT08_post
PAT_motor_errors_post(9,:)=PAT09_post
PAT_motor_errors_post(10,:)=PAT10_post
PAT_motor_errors_post(11,:)=PAT11_post
PAT_motor_errors_post(12,:)=PAT12_post
PAT_motor_errors_post(13,:)=PAT13_post
PAT_motor_errors_post(14,:)=PAT14_post
PAT_motor_errors_post(15,:)=PAT15_post
PAT_motor_errors_post(16,:)=PAT16_post

for isub=1:16
totalPAT_motor_errors_pre(isub)=sum(PAT_motor_errors_pre(isub,:))
totalPAT_motor_errors_post(isub)=sum(PAT_motor_errors_post(isub,:))
end

%% gaps
subj_gaps(1)=load('/Users/zagnew/Cereb_data/data_final_run/HC01/expr2014.05.06.T12.36.43_mainrun/speak/gaps.mat');
subj_gaps(2)=load('/Users/zagnew/Cereb_data/data_final_run/HC02/expr2014.06.17.T12.53.53_mainrun/speak/gaps.mat');
subj_gaps(3)=load('/Users/zagnew/Cereb_data/data_final_run/HC03/expr2014.06.17.T13.50.36_mainrun/speak/gaps.mat');
subj_gaps(4)=load('/Users/zagnew/Cereb_data/data_final_run/HC04/expr2014.06.17.T16.22.20_mainrun/speak/gaps.mat');
subj_gaps(5)=load('/Users/zagnew/Cereb_data/data_final_run/HC05/expr2014.06.18.T15.14.02_mainrun/speak/gaps.mat');
subj_gaps(6)=load('/Users/zagnew/Cereb_data/data_final_run/HC06/expr2014.06.18.T16.18.27_mainrun/speak/gaps.mat');
subj_gaps(7)=load('/Users/zagnew/Cereb_data/data_final_run/HC07/expr2014.07.25.T10.29.55_mainrun/speak/gaps.mat');
subj_gaps(8)=load('/Users/zagnew/Cereb_data/data_final_run/HC08/expr2014.08.14.T15.57.52_mainrun/speak/gaps.mat');
subj_gaps(9)=load('/Users/zagnew/Cereb_data/data_final_run/HC09/expr2014.09.21.T14.17.36_mainrun/speak/gaps.mat');
subj_gaps(10)=load('/Users/zagnew/Cereb_data/data_final_run/HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/gaps.mat');
subj_gaps(11)=load('/Users/zagnew/Cereb_data/data_final_run/HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/gaps.mat');
subj_gaps(12)=load('/Users/zagnew/Cereb_data/data_final_run/HC12/expr2015.05.11.T11.18.14_mainrun/speak/gaps.mat');
subj_gaps(13)=load('/Users/zagnew/Cereb_data/data_final_run/HC13/expr2015.05.11.T11.53.19_mainrun/speak/gaps.mat');
subj_gaps(14)=load('/Users/zagnew/Cereb_data/data_final_run/HC14/expr2015.05.11.T12.28.56_mainrun/speak/gaps.mat');

pat_gaps(1)=load('/Users/zagnew/Cereb_data/data_final_run/SUB01/expr2014.03.21.T10.46.03_mainrun/speak/gaps.mat');
pat_gaps(2)=load('/Users/zagnew/Cereb_data/data_final_run/SUB02/expr2014.03.21.T12.33.58_mainrun/speak/gaps.mat');
pat_gaps(3)=load('/Users/zagnew/Cereb_data/data_final_run/SUB03/expr2014.03.21.T14.35.35_mainrun/speak/gaps.mat');
pat_gaps(4)=load('/Users/zagnew/Cereb_data/data_final_run/SUB04/expr2014.03.21.T17.20.11_mainrun/speak/gaps.mat');
pat_gaps(5)=load('/Users/zagnew/Cereb_data/data_final_run/SUB05/expr2014.03.21.T18.50.52_mainrun/speak/gaps.mat');
pat_gaps(6)=load('/Users/zagnew/Cereb_data/data_final_run/SUB06/expr2014.03.22.T11.05.45_mainrun/speak/gaps.mat');
pat_gaps(7)=load('/Users/zagnew/Cereb_data/data_final_run/SUB07/expr2014.03.22.T12.15.42_mainrun/speak/gaps.mat');
pat_gaps(8)=load('/Users/zagnew/Cereb_data/data_final_run/SUB08/expr2014.03.22.T14.01.48_mainrun/speak/gaps.mat');
pat_gaps(9)=load('/Users/zagnew/Cereb_data/data_final_run/SUB09/expr2014.03.22.T15.52.01_mainrun/speak/gaps.mat');
pat_gaps(10)=load('/Users/zagnew/Cereb_data/data_final_run/SUB10/expr2014.03.22.T16.37.44_mainrun/speak/gaps.mat');
pat_gaps(11)=load('/Users/zagnew/Cereb_data/data_final_run/SUB11/expr2014.03.22.T18.46.44_mainrun/speak/gaps.mat');
pat_gaps(12)=load('/Users/zagnew/Cereb_data/data_final_run/SUB12/expr2014.03.23.T11.03.52_mainrun/speak/gaps.mat');
pat_gaps(13)=load('/Users/zagnew/Cereb_data/data_final_run/SUB13/expr2014.03.23.T13.47.01_mainrun/speak/gaps.mat');
pat_gaps(14)=load('/Users/zagnew/Cereb_data/data_final_run/SUB14/expr2014.03.23.T15.21.00_mainrun/speak/gaps.mat');
pat_gaps(15)=load('/Users/zagnew/Cereb_data/data_final_run/SUB15/expr2014.03.23.T16.32.53_mainrun/speak/gaps.mat');
pat_gaps(16)=load('/Users/zagnew/Cereb_data/data_final_run/SUB16/expr2014.03.23.T18.16.58_mainrun/speak/gaps.mat');


for iblock=1:8
SUB01_gaps(iblock,:)=subj_gaps(1).gaps(iblock).data
SUB02_gaps(iblock, :)=subj_gaps(2).gaps(iblock).data
SUB03_gaps(iblock, :)=subj_gaps(3).gaps(iblock).data
SUB04_gaps(iblock, :)=subj_gaps(4).gaps(iblock).data
SUB05_gaps(iblock, :)=subj_gaps(5).gaps(iblock).data
SUB06_gaps(iblock, :)=subj_gaps(6).gaps(iblock).data
SUB07_gaps(iblock, :)=subj_gaps(7).gaps(iblock).data
SUB08_gaps(iblock, :)=subj_gaps(8).gaps(iblock).data
SUB09_gaps(iblock, :)=subj_gaps(9).gaps(iblock).data
SUB10_gaps(iblock, :)=subj_gaps(10).gaps(iblock).data
SUB11_gaps(iblock, :)=subj_gaps(11).gaps(iblock).data
SUB12_gaps(iblock, :)=subj_gaps(12).gaps(iblock).data
SUB13_gaps(iblock, :)=subj_gaps(13).gaps(iblock).data
SUB14_gaps(iblock, :)=subj_gaps(14).gaps(iblock).data

PAT01_gaps(iblock, :)=pat_gaps(1).gaps(iblock).data
PAT02_gaps(iblock, :)=pat_gaps(2).gaps(iblock).data
PAT03_gaps(iblock, :)=pat_gaps(3).gaps(iblock).data
PAT04_gaps(iblock, :)=pat_gaps(4).gaps(iblock).data
PAT05_gaps(iblock, :)=pat_gaps(5).gaps(iblock).data
PAT06_gaps(iblock, :)=pat_gaps(6).gaps(iblock).data
PAT07_gaps(iblock, :)=pat_gaps(7).gaps(iblock).data
PAT08_gaps(iblock, :)=pat_gaps(8).gaps(iblock).data
PAT09_gaps(iblock, :)=pat_gaps(9).gaps(iblock).data
PAT10_gaps(iblock, :)=pat_gaps(10).gaps(iblock).data
PAT11_gaps(iblock, :)=pat_gaps(11).gaps(iblock).data
PAT12_gaps(iblock, :)=pat_gaps(12).gaps(iblock).data
PAT13_gaps(iblock, :)=pat_gaps(13).gaps(iblock).data
PAT14_gaps(iblock, :)=pat_gaps(14).gaps(iblock).data
PAT15_gaps(iblock, :)=pat_gaps(15).gaps(iblock).data
PAT16_gaps(iblock, :)=pat_gaps(16).gaps(iblock).data
end

for isubj=1:16
PAT_gaps(isubj,:)=pat_gaps(isubj).gaps(iblock).data
end

for isubj=1:14
HC_gaps(isubj,:)=subj_gaps(isubj).gaps(iblock).data
end

%%
totalHC_motor_errors_pre
totalHC_motor_errors_post

totalPAT_motor_errors_pre
totalPAT_motor_errors_post

HC_gaps
PAT_gaps

cd (cerebellar_data_rootdir)
xlswrite('motorerrors_gaps/totalHC_motor_errors_pre',totalHC_motor_errors_pre,1)
xlswrite('motorerrors_gaps/totalHC_motor_errors_post',totalHC_motor_errors_post,1)
xlswrite('motorerrors_gaps/totalPAT_motor_errors_pre',totalPAT_motor_errors_pre,1)
xlswrite('motorerrors_gaps/totalPAT_motor_errors_post',totalPAT_motor_errors_post,1)
xlswrite('motorerrors_gaps/HC_gaps',totalHC_motor_errors_pre,1)
xlswrite('motorerrors_gaps/PAT_gaps',totalHC_motor_errors_pre,1)

