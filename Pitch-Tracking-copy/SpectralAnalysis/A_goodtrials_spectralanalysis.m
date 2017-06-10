%% Seperates the good and bad trials for the pitch tracking experiment for the spectral analysis.
% -------------------------------------------------------------------------
% ZKA Jan 2015
% loads in the good trials from the main analysis and just removes any trials where there is a gap in voicing
% saves the data in each subject's folder as
% 'gooddata_spectralanalysis.mat'

%% here we go
clear all
close all

set_params;
amp_thresh=5*(10 ^ 7);                                  %amplitude threshold for cut off
load /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/subj_MP_allsubs

% ----

cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data/';
npatients = 0;
npatients = npatients + 1; %400 and 1000 are ok
patient_info{npatients}.exprdir = 'SUB01/expr20140321T103415_SUBJ01_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
meanpitchtag(npatients)=1;

npatients = npatients + 1; 
patient_info{npatients}.exprdir = 'SUB02/expr20140321T121956_Sub2_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB02/expr2014.03.21.T12.33.58_mainrun/speak/';
meanpitchtag(npatients)=2;

npatients = npatients + 1; 
patient_info{npatients}.exprdir = 'SUB03/expr20140321T142416_Subj3-measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB03/expr2014.03.21.T14.35.35_mainrun/speak/';
meanpitchtag(npatients)=3;

npatients = npatients + 1; 
patient_info{npatients}.exprdir ='SUB04/expr20140321T170947_Subj4_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB04/expr2014.03.21.T17.20.11_mainrun/speak/';
meanpitchtag(npatients)=4;

npatients = npatients + 1;  %400 and 1000 are ok
patient_info{npatients}.exprdir = 'SUB05/expr20140321T183529_Subj5_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB05/expr2014.03.21.T18.50.52_mainrun/speak/';
meanpitchtag(npatients)=5;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB06/expr20140322T104901_SUB06_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB06/expr2014.03.22.T11.05.45_mainrun/speak/';
meanpitchtag(npatients)=6;

% BAD SUBJECT
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB07/expr20140322T115150_Sub7_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB07/expr2014.03.22.T12.15.42_mainrun/speak/';
meanpitchtag(npatients)=7;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB08/expr20140322T134549_Sub08_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB08/expr2014.03.22.T14.01.48_mainrun/speak/';
meanpitchtag(npatients)=8;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB09/expr20140322T154047_SUB09_measure_pitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB09/expr2014.03.22.T15.52.01_mainrun/speak/';
meanpitchtag(npatients)=9;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB10/expr20140322T162455_SUB10_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB10/expr2014.03.22.T16.37.44_mainrun/speak/';
meanpitchtag(npatients)=10;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB11/expr20140322T183812_Subj11_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/';
meanpitchtag(npatients)=11;

% v wobbly
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB12/expr20140323T104953_Sub12_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB12/expr2014.03.23.T11.03.52_mainrun/speak/';
meanpitchtag(npatients)=12;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB13/expr20140323T132703_Sub13_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/';
meanpitchtag(npatients)=13; 

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB14/expr20140323T150747_subj14/speak/';
patient_info_2{npatients}.exprdir = 'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/';
meanpitchtag(npatients)=14;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB15/expr20140323T162223_SUB15_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/';
meanpitchtag(npatients)=15;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB16/expr20140323T180417_sub16_measurepitch/speak/'; 
patient_info_2{npatients}.exprdir = 'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/';
meanpitchtag(npatients)=16;

% missing data
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC01/expr20140506T121323_ZKA/speak/';
% meanpitchtag(npatients)=17

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC02/expr20140617T123801_HC02_pitchprodn/speak/';
patient_info_2{npatients}.exprdir = 'HC02/expr2014.06.17.T12.53.53_mainrun/speak/';
meanpitchtag(npatients)=18;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC03/expr20140617T133413_HC03_pitchprodn/speak/';
patient_info_2{npatients}.exprdir = 'HC03/expr2014.06.17.T13.50.36_mainrun/speak/';
meanpitchtag(npatients)=19;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC04/expr20140617T161417_measurepitch/speak/'; %400 to 1000 ok
patient_info_2{npatients}.exprdir = 'HC04/expr2014.06.17.T16.22.20_mainrun/speak/';
meanpitchtag(npatients)=20;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC05/expr20140618T150410_HC05_measurepitch/speak'; %400 to 1000 ok
patient_info_2{npatients}.exprdir = 'HC05/expr2014.06.18.T15.14.02_mainrun/speak/';
meanpitchtag(npatients)=21;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC06/expr20140618T160728_HC06_measurepitch/speak';
patient_info_2{npatients}.exprdir = 'HC06/expr2014.06.18.T16.18.27_mainrun/speak/';
meanpitchtag(npatients)=22;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC07/expr20140725T101015_W4Z_subj25/speak';
patient_info_2{npatients}.exprdir = 'HC07/expr2014.07.25.T10.29.55_mainrun/speak/';
meanpitchtag(npatients)=23;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC08/expr20140814T154458_W4Z_subj3/speak';
patient_info_2{npatients}.exprdir = 'HC08/expr2014.08.14.T15.57.52_mainrun/speak/';
meanpitchtag(npatients)=24;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC09/expr20140921T133544_annette/speak';
patient_info_2{npatients}.exprdir = 'HC09/expr2014.09.21.T14.17.36_mainrun/speak/';
meanpitchtag(npatients)=25;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC10/expr20140921T152451_JL/speak/';
patient_info_2{npatients}.exprdir = 'HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/';
meanpitchtag(npatients)=26;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC11/expr20140923t151309_sn/speak/';
patient_info_2{npatients}.exprdir = 'HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/';
meanpitchtag(npatients)=27;




originalFolder = pwd;
for each_subject = 1:npatients
    
    the_expr_dir2 = [cerebellar_data_rootdir (patient_info_2{each_subject}.exprdir)];
    cd (the_expr_dir2)
    load gooddata.mat
    
    
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)
    
    %if there are breaks remove trial
    gooddata_spec=gooddata;
    for each_block=1:num_blocks
        for itrial=1:trialsperblock
            for iframe=250:1300
                if sum(isnan(gooddata(1).goodpitchdata(each_block).data(itrial,201:1360)))>0
                    gooddata_spec(1).goodpitchdata(each_block).data(itrial,:)=NaN(1,1360);
                    %                     plot(gooddata_spec(1).goodpitchdata(each_block).data(itrial,:))
                    %                     pause
                end
            end
        end
    end

end

cd(the_expr_dir2)
save gooddata_spectralanalysis gooddata_spec

cd(cerebellar_data_rootdir)




