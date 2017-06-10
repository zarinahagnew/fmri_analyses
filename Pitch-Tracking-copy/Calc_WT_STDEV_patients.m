%% calulate WT stdev 
% ZKA 2015
% only looks at good subjects, imports all data from sorted_data, and puts
% into one matrix and looks at mean within trial stdevs

%% edit this to indlude which ever subjects you want
patients_included=patients_included;
%patients_included=1:14;

clear all
close all

set_params;
set(0,'DefaultFigureWindowStyle','docked')


nPATs=0;
nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
meanpitchtag(nPATs)=1;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB02/expr2014.03.21.T12.33.58_mainrun/speak/';
meanpitchtag(nPATs)=2;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB03/expr2014.03.21.T14.35.35_mainrun/speak/';
meanpitchtag(nPATs)=3;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB04/expr2014.03.21.T17.20.11_mainrun/speak/';
meanpitchtag(nPATs)=4;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB05/expr2014.03.21.T18.50.52_mainrun/speak/';
meanpitchtag(nPATs)=5;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB06/expr2014.03.22.T11.05.45_mainrun/speak/';
meanpitchtag(nPATs)=6;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB07/expr2014.03.22.T12.15.42_mainrun/speak/';
meanpitchtag(nPATs)=7;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB08/expr2014.03.22.T14.01.48_mainrun/speak/';
meanpitchtag(nPATs)=8;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB09/expr2014.03.22.T15.52.01_mainrun/speak/';
meanpitchtag(nPATs)=9;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB10/expr2014.03.22.T16.37.44_mainrun/speak/';
meanpitchtag(nPATs)=10;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/';
meanpitchtag(nPATs)=11;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB12/expr2014.03.23.T11.03.52_mainrun/speak/';
meanpitchtag(nPATs)=12;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/';
meanpitchtag(nPATs)=13;

nPATs = nPATs + 1;
patient_info{nPATs}.exprdir = 'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/';
meanpitchtag(nPATs)=14;

nPATs = nPATs + 1; 
patient_info{npatients}.exprdir = 'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/';
meanpitchtag(nPATs)=15;

nPATs = nPATs + 1;
patient_info{npatients}.exprdir = 'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/';
meanpitchtag(nPATs)=16;


for isub=1:nPATs
    the_expr_dir = [cerebellar_data_rootdir (patient_info{isub}.exprdir)];
    cd (the_expr_dir)
    sorted_data(isub)=load (sprintf('%ssorted_data.mat',patient_info{isub}.exprdir));

    % take the within trial stdev data from sorted data and write into one
    % matrix
    for icond=1:10
        for itrial=1:8            
            ALLPAT(isub).cond(icond).wholetrialdata(itrial)=sorted_data(isub).sorted_data(icond).WTstd_cents_wholetrial(itrial);
            ALLPAT(isub).cond(icond).predata(itrial)=sorted_data(isub).sorted_data(icond).WTstd_cents_prestep(itrial);
            ALLPAT(isub).cond(icond).postdata(itrial)=sorted_data(isub).sorted_data(icond).WTstd_cents_poststep(itrial);
        end
    end
%     
end

% only include good subjects
PAT=ALLPAT(patients_included);

% check
%     ALLPAT(6).cond(1).wholetrialdata(2)
%     SUB(2).cond(1).wholetrialdata(2)

  
    %% list of what's what
    
    % eachsub(isub).wholetrial_WTstdev      << all conditions lumped together
    % eachsub(isub).prestep_WTstdev
    % eachsub(isub).prestep_WTstdev
    
    % eachsub(isub).wholetrial_WTstdev_allcleartrials
    
for isub=1:length(patients_included)
    %% all conditions
    eachpat(isub).wholetrial_WTstdev=horzcat(PAT(isub).cond(1).wholetrialdata,PAT(isub).cond(2).wholetrialdata, PAT(isub).cond(3).wholetrialdata, PAT(isub).cond(4).wholetrialdata, PAT(isub).cond(5).wholetrialdata, PAT(isub).cond(6).wholetrialdata, PAT(isub).cond(7).wholetrialdata, PAT(isub).cond(8).wholetrialdata);
    eachpat(isub).prestep_WTstdev=horzcat(PAT(isub).cond(1).predata,PAT(isub).cond(2).predata, PAT(isub).cond(3).predata, PAT(isub).cond(4).predata, PAT(isub).cond(5).predata, PAT(isub).cond(6).predata, PAT(isub).cond(7).predata, PAT(isub).cond(8).predata);
    eachpat(isub).poststep_WTstdev=horzcat(PAT(isub).cond(1).postdata,PAT(isub).cond(2).postdata, PAT(isub).cond(3).postdata, PAT(isub).cond(4).postdata, PAT(isub).cond(5).postdata, PAT(isub).cond(6).postdata, PAT(isub).cond(7).postdata, PAT(isub).cond(8).postdata);

    %% split by noise Vs no noise
    eachpat(isub).wholetrial_WTstdev_allcleartrials=horzcat(PAT(isub).cond(1).wholetrialdata,PAT(isub).cond(2).wholetrialdata, PAT(isub).cond(3).wholetrialdata, PAT(isub).cond(4).wholetrialdata, PAT(isub).cond(5).wholetrialdata);
    eachpat(isub).wholetrial_WTstdev_allnoisetrials=horzcat(PAT(isub).cond(6).wholetrialdata, PAT(isub).cond(7).wholetrialdata, PAT(isub).cond(8).wholetrialdata, PAT(isub).cond(9).wholetrialdata, PAT(isub).cond(10).wholetrialdata);
    eachpat(isub).prestep_WTstdev_allcleartrials=horzcat(PAT(isub).cond(1).predata,PAT(isub).cond(2).predata, PAT(isub).cond(3).predata, PAT(isub).cond(4).predata, PAT(isub).cond(5).predata);
    eachpat(isub).prestep_WTstdev_allnoisetrials=horzcat(PAT(isub).cond(6).predata, PAT(isub).cond(7).predata, PAT(isub).cond(8).predata,PAT(isub).cond(9).predata, PAT(isub).cond(10).predata);
    eachpat(isub).poststep_WTstdev_allcleartrials=horzcat(PAT(isub).cond(1).postdata,PAT(isub).cond(2).postdata, PAT(isub).cond(3).postdata, PAT(isub).cond(4).postdata, PAT(isub).cond(5).postdata);
    eachpat(isub).poststep_WTstdev_allnoisetrials=horzcat(PAT(isub).cond(6).postdata, PAT(isub).cond(7).postdata, PAT(isub).cond(8).postdata, PAT(isub).cond(9).postdata, PAT(isub).cond(10).postdata);
    
    %% split whole trial data by small step Vs big step conditions
    eachpat(isub).wholetrial_WTstdev_clear_smallstep=horzcat(PAT(isub).cond(1).wholetrialdata, PAT(isub).cond(4).wholetrialdata);
    eachpat(isub).wholetrial_WTstdev_clear_bigstep=horzcat(PAT(isub).cond(2).wholetrialdata, PAT(isub).cond(5).wholetrialdata);
    eachpat(isub).wholetrial_WTstdev_clear_nostep=PAT(isub).cond(3).wholetrialdata;
    
    eachpat(isub).wholetrial_WTstdev_noise_smallstep=horzcat(PAT(isub).cond(6).wholetrialdata, PAT(isub).cond(9).wholetrialdata);
    eachpat(isub).wholetrial_WTstdev_noise_bigstep=horzcat(PAT(isub).cond(7).wholetrialdata, PAT(isub).cond(10).wholetrialdata);
    eachpat(isub).wholetrial_WTstdev_noise_nostep=PAT(isub).cond(8).wholetrialdata;
    

%% split pre and post step data by small step Vs big step conditions    
    eachpat(isub).prestep_WTstdev_clear_smallstep=horzcat(PAT(isub).cond(1).predata,PAT(isub).cond(4).predata);
    eachpat(isub).prestep_WTstdev_clear_bigstep=horzcat(PAT(isub).cond(2).predata, PAT(isub).cond(5).predata);
    eachpat(isub).prestep_WTstdev_clear_nostep=horzcat(PAT(isub).cond(3).predata);
    
    eachpat(isub).prestep_WTstdev_noise_smallstep=horzcat(PAT(isub).cond(6).predata,PAT(isub).cond(9).predata);
    eachpat(isub).prestep_WTstdev_noise_bigstep=horzcat(PAT(isub).cond(7).predata, PAT(isub).cond(10).predata);
    eachpat(isub).prestep_WTstdev_noise_nostep=horzcat(PAT(isub).cond(8).predata);

    eachpat(isub).poststep_WTstdev_clear_smallstep=horzcat(PAT(isub).cond(1).postdata,PAT(isub).cond(4).postdata);
    eachpat(isub).poststep_WTstdev_clear_bigstep=horzcat(PAT(isub).cond(2).postdata, PAT(isub).cond(5).postdata);
    eachpat(isub).poststep_WTstdev_clear_nostep=horzcat(PAT(isub).cond(3).postdata);
    
    eachpat(isub).poststep_WTstdev_noise_smallstep=horzcat(PAT(isub).cond(6).postdata,PAT(isub).cond(9).postdata);
    eachpat(isub).poststep_WTstdev_noise_bigstep=horzcat(PAT(isub).cond(7).postdata, PAT(isub).cond(10).postdata);
    eachpat(isub).poststep_WTstdev_noise_nostep=horzcat(PAT(isub).cond(8).postdata);
    
end
% small step conditions

prestep_WTstdev_clear_smallstep=eachpat(1).prestep_WTstdev_clear_smallstep;
prestep_WTstdev_noise_smallstep=eachpat(1).prestep_WTstdev_noise_smallstep;
poststep_WTstdev_clear_smallstep=eachpat(1).poststep_WTstdev_clear_smallstep;
poststep_WTstdev_noise_smallstep=eachpat(1).poststep_WTstdev_noise_smallstep;

prestep_WTstdev_clear_bigstep=eachpat(1).prestep_WTstdev_clear_bigstep;
prestep_WTstdev_noise_bigstep=eachpat(1).prestep_WTstdev_noise_bigstep;
poststep_WTstdev_clear_bigstep=eachpat(1).poststep_WTstdev_clear_bigstep;
poststep_WTstdev_noise_bigstep=eachpat(1).poststep_WTstdev_noise_bigstep;

prestep_WTstdev_clear_nostep=eachpat(1).prestep_WTstdev_clear_nostep;
prestep_WTstdev_noise_nostep=eachpat(1).prestep_WTstdev_noise_nostep;
poststep_WTstdev_clear_nostep=eachpat(1).poststep_WTstdev_clear_nostep;
poststep_WTstdev_noise_nostep=eachpat(1).poststep_WTstdev_noise_nostep;

for i = 1:length(patients_included)-1
    dataToAppend1 = eachpat(i+1).prestep_WTstdev_clear_smallstep;
    prestep_WTstdev_clear_smallstep = [prestep_WTstdev_clear_smallstep dataToAppend1];

    dataToAppend2 = eachpat(i+1).poststep_WTstdev_clear_smallstep;
    poststep_WTstdev_clear_smallstep = [poststep_WTstdev_clear_smallstep dataToAppend2];

    dataToAppend3 = eachpat(i+1).prestep_WTstdev_noise_smallstep;
    prestep_WTstdev_noise_smallstep = [prestep_WTstdev_noise_smallstep dataToAppend3];

    dataToAppend4 = eachpat(i+1).poststep_WTstdev_noise_smallstep;
    poststep_WTstdev_noise_smallstep = [poststep_WTstdev_noise_smallstep dataToAppend4];


    dataToAppend5 = eachpat(i+1).prestep_WTstdev_clear_bigstep;
    prestep_WTstdev_clear_bigstep = [prestep_WTstdev_clear_bigstep dataToAppend5];

    dataToAppend6 = eachpat(i+1).poststep_WTstdev_clear_bigstep;
    poststep_WTstdev_clear_bigstep = [poststep_WTstdev_clear_bigstep dataToAppend6];

    dataToAppend7 = eachpat(i+1).prestep_WTstdev_noise_bigstep;
    prestep_WTstdev_noise_bigstep = [prestep_WTstdev_noise_bigstep dataToAppend7];

    dataToAppend8 = eachpat(i+1).poststep_WTstdev_noise_bigstep;
    poststep_WTstdev_noise_bigstep = [poststep_WTstdev_noise_bigstep dataToAppend8];
    
    dataToAppend9 = eachpat(i+1).prestep_WTstdev_clear_nostep;
    prestep_WTstdev_clear_nostep = [prestep_WTstdev_clear_nostep dataToAppend9];

    dataToAppend10 = eachpat(i+1).poststep_WTstdev_clear_nostep;
    poststep_WTstdev_clear_nostep = [poststep_WTstdev_clear_nostep dataToAppend10];
    
    dataToAppend11 = eachpat(i+1).prestep_WTstdev_noise_nostep;
    prestep_WTstdev_noise_nostep = [prestep_WTstdev_noise_nostep dataToAppend11];

    dataToAppend12 = eachpat(i+1).poststep_WTstdev_noise_nostep;
    poststep_WTstdev_noise_nostep = [poststep_WTstdev_noise_nostep dataToAppend12];
    
 
end


allcleartrials=[prestep_WTstdev_clear_nostep prestep_WTstdev_clear_smallstep prestep_WTstdev_clear_bigstep ...
                poststep_WTstdev_clear_nostep poststep_WTstdev_clear_smallstep poststep_WTstdev_clear_bigstep];

allnoisetrials=[prestep_WTstdev_noise_nostep prestep_WTstdev_noise_smallstep prestep_WTstdev_noise_bigstep ...
                poststep_WTstdev_noise_nostep poststep_WTstdev_noise_smallstep poststep_WTstdev_noise_bigstep];

clear_noise_ttest=ttest(allcleartrials, allnoisetrials);

%% calc group means and stdevs
% sem=std of mean/sqrt(n)

prestep_WTstdev_clear_smallstep_mean_total=nanmean(prestep_WTstdev_clear_smallstep);
prestep_WTstdev_clear_smallstep_stdev_total=nanstd(prestep_WTstdev_clear_smallstep);
prestep_WTstdev_clear_smallstep_sem_total= prestep_WTstdev_clear_smallstep_mean_total/(sqrt(length(prestep_WTstdev_clear_smallstep)));

prestep_WTstdev_noise_smallstep_mean_total=nanmean(prestep_WTstdev_noise_smallstep);
prestep_WTstdev_noise_smallstep_stdev_total=nanstd(prestep_WTstdev_noise_smallstep);
prestep_WTstdev_noise_smallstep_sem_total= prestep_WTstdev_noise_smallstep_mean_total/(sqrt(length(prestep_WTstdev_noise_smallstep)));

prestep_WTstdev_clear_bigstep_mean_total=nanmean(prestep_WTstdev_clear_bigstep);
prestep_WTstdev_clear_bigstep_stdev_total=nanstd(prestep_WTstdev_clear_bigstep);
prestep_WTstdev_clear_bigstep_sem_total= prestep_WTstdev_clear_bigstep_mean_total/(sqrt(length(prestep_WTstdev_clear_bigstep)));

prestep_WTstdev_noise_bigstep_mean_total=nanmean(prestep_WTstdev_noise_bigstep);
prestep_WTstdev_noise_bigstep_stdev_total=nanstd(prestep_WTstdev_noise_bigstep);
prestep_WTstdev_noise_bigstep_sem_total= prestep_WTstdev_noise_bigstep_mean_total/(sqrt(length(prestep_WTstdev_noise_bigstep)));

%post
poststep_WTstdev_clear_smallstep_mean_total=nanmean(poststep_WTstdev_clear_smallstep);
poststep_WTstdev_clear_smallstep_stdev_total=nanstd(poststep_WTstdev_clear_smallstep);
poststep_WTstdev_clear_smallstep_sem_total= poststep_WTstdev_clear_smallstep_mean_total/(sqrt(length(poststep_WTstdev_clear_smallstep)));

poststep_WTstdev_noise_smallstep_mean_total=nanmean(poststep_WTstdev_noise_smallstep);
poststep_WTstdev_noise_smallstep_stdev_total=nanstd(poststep_WTstdev_noise_smallstep);
poststep_WTstdev_noise_smallstep_sem_total= poststep_WTstdev_noise_smallstep_mean_total/(sqrt(length(poststep_WTstdev_noise_smallstep)));

poststep_WTstdev_clear_bigstep_mean_total=nanmean(poststep_WTstdev_clear_bigstep);
poststep_WTstdev_clear_bigstep_stdev_total=nanstd(poststep_WTstdev_clear_bigstep);
poststep_WTstdev_clear_bigstep_sem_total= poststep_WTstdev_clear_bigstep_mean_total/(sqrt(length(poststep_WTstdev_clear_bigstep)));

poststep_WTstdev_noise_bigstep_mean_total=nanmean(poststep_WTstdev_noise_bigstep);
poststep_WTstdev_noise_bigstep_stdev_total=nanstd(poststep_WTstdev_noise_bigstep);
poststep_WTstdev_noise_bigstep_sem_total= poststep_WTstdev_noise_bigstep_mean_total/(sqrt(length(poststep_WTstdev_noise_bigstep)));

%no step
prestep_WTstdev_clear_nostep_mean_total=nanmean(prestep_WTstdev_clear_nostep);
prestep_WTstdev_noise_nostep_mean_total=nanmean(prestep_WTstdev_noise_nostep);

poststep_WTstdev_clear_nostep_mean_total=nanmean(poststep_WTstdev_clear_nostep);
poststep_WTstdev_noise_nostep_mean_total=nanmean(poststep_WTstdev_noise_nostep);

prestep_WTstdev_clear_nostep_stdev_total=nanstd(prestep_WTstdev_clear_nostep);
prestep_WTstdev_noise_nostep_stdev_total=nanstd(prestep_WTstdev_noise_nostep);

poststep_WTstdev_clear_nostep_stdev_total=nanstd(poststep_WTstdev_clear_nostep);
poststep_WTstdev_noise_nostep_stdev_total=nanstd(poststep_WTstdev_noise_nostep);

prestep_WTstdev_clear_nostep_sem_total= prestep_WTstdev_clear_nostep_mean_total/(sqrt(length(prestep_WTstdev_clear_nostep)));
prestep_WTstdev_noise_nostep_sem_total= prestep_WTstdev_noise_nostep_mean_total/(sqrt(length(prestep_WTstdev_noise_nostep)));

poststep_WTstdev_clear_nostep_sem_total= poststep_WTstdev_clear_nostep_mean_total/(sqrt(length(poststep_WTstdev_clear_nostep)));
poststep_WTstdev_noise_nostep_sem_total= poststep_WTstdev_noise_nostep_mean_total/(sqrt(length(poststep_WTstdev_noise_nostep)));



%% calc group means and stdevs
% sem= std of mean/sqrt(n)

prestep_WTstdev_clear_smallstep_mean_total=nanmean(prestep_WTstdev_clear_smallstep);
prestep_WTstdev_clear_smallstep_stdev_total=nanstd(prestep_WTstdev_clear_smallstep);
prestep_WTstdev_clear_smallstep_sem_total= prestep_WTstdev_clear_smallstep_mean_total/(sqrt(length(prestep_WTstdev_clear_smallstep)));

prestep_WTstdev_noise_smallstep_mean_total=nanmean(prestep_WTstdev_noise_smallstep);
prestep_WTstdev_noise_smallstep_stdev_total=nanstd(prestep_WTstdev_noise_smallstep);
prestep_WTstdev_noise_smallstep_sem_total= prestep_WTstdev_noise_smallstep_mean_total/(sqrt(length(prestep_WTstdev_noise_smallstep)));

prestep_WTstdev_clear_bigstep_mean_total=nanmean(prestep_WTstdev_clear_bigstep);
prestep_WTstdev_clear_bigstep_stdev_total=nanstd(prestep_WTstdev_clear_bigstep);
prestep_WTstdev_clear_bigstep_sem_total= prestep_WTstdev_clear_bigstep_mean_total/(sqrt(length(prestep_WTstdev_clear_bigstep)));

prestep_WTstdev_noise_bigstep_mean_total=nanmean(prestep_WTstdev_noise_bigstep);
prestep_WTstdev_noise_bigstep_stdev_total=nanstd(prestep_WTstdev_noise_bigstep);
prestep_WTstdev_noise_bigstep_sem_total= prestep_WTstdev_noise_bigstep_mean_total/(sqrt(length(prestep_WTstdev_noise_bigstep)));

%post
poststep_WTstdev_clear_smallstep_mean_total=nanmean(poststep_WTstdev_clear_smallstep);
poststep_WTstdev_clear_smallstep_stdev_total=nanstd(poststep_WTstdev_clear_smallstep);
poststep_WTstdev_clear_smallstep_sem_total= poststep_WTstdev_clear_smallstep_mean_total/(sqrt(length(poststep_WTstdev_clear_smallstep)));

poststep_WTstdev_noise_smallstep_mean_total=nanmean(poststep_WTstdev_noise_smallstep);
poststep_WTstdev_noise_smallstep_stdev_total=nanstd(poststep_WTstdev_noise_smallstep);
poststep_WTstdev_noise_smallstep_sem_total= poststep_WTstdev_noise_smallstep_mean_total/(sqrt(length(poststep_WTstdev_noise_smallstep)));

poststep_WTstdev_clear_bigstep_mean_total=nanmean(poststep_WTstdev_clear_bigstep);
poststep_WTstdev_clear_bigstep_stdev_total=nanstd(poststep_WTstdev_clear_bigstep);
poststep_WTstdev_clear_bigstep_sem_total= poststep_WTstdev_clear_bigstep_mean_total/(sqrt(length(poststep_WTstdev_clear_bigstep)));

poststep_WTstdev_noise_bigstep_mean_total=nanmean(poststep_WTstdev_noise_bigstep);
poststep_WTstdev_noise_bigstep_stdev_total=nanstd(poststep_WTstdev_noise_bigstep);
poststep_WTstdev_noise_bigstep_sem_total= poststep_WTstdev_noise_bigstep_mean_total/(sqrt(length(poststep_WTstdev_noise_bigstep)));

%no step
prestep_WTstdev_clear_nostep_mean_total=nanmean(prestep_WTstdev_clear_nostep);
prestep_WTstdev_noise_nostep_mean_total=nanmean(prestep_WTstdev_noise_nostep);

poststep_WTstdev_clear_nostep_mean_total=nanmean(poststep_WTstdev_clear_nostep);
poststep_WTstdev_noise_nostep_mean_total=nanmean(poststep_WTstdev_noise_nostep);

prestep_WTstdev_clear_nostep_stdev_total=nanstd(prestep_WTstdev_clear_nostep);
prestep_WTstdev_noise_nostep_stdev_total=nanstd(prestep_WTstdev_noise_nostep);

poststep_WTstdev_clear_nostep_stdev_total=nanstd(poststep_WTstdev_clear_nostep);
poststep_WTstdev_noise_nostep_stdev_total=nanstd(poststep_WTstdev_noise_nostep);

prestep_WTstdev_clear_nostep_sem_total= prestep_WTstdev_clear_nostep_mean_total/(sqrt(length(prestep_WTstdev_clear_nostep)));
prestep_WTstdev_noise_nostep_sem_total= prestep_WTstdev_noise_nostep_mean_total/(sqrt(length(prestep_WTstdev_noise_nostep)));

poststep_WTstdev_clear_nostep_sem_total= poststep_WTstdev_clear_nostep_mean_total/(sqrt(length(poststep_WTstdev_clear_nostep)));
poststep_WTstdev_noise_nostep_sem_total= poststep_WTstdev_noise_nostep_mean_total/(sqrt(length(poststep_WTstdev_noise_nostep)));


% noise/clear
clear_mean_total=nanmean(allcleartrials);
noise_mean_total=nanmean(allnoisetrials);

clear_stdev_total=nanstd(allcleartrials);
noise_stdev_total=nanstd(allnoisetrials);

clear_sem_total=clear_mean_total/(sqrt(length(allcleartrials)));
noise_sem_total=noise_mean_total/(sqrt(length(allnoisetrials)));

%plot these 
figure
ymin=0;
ymax=15;
bardata=[...
          prestep_WTstdev_clear_bigstep_mean_total prestep_WTstdev_clear_smallstep_mean_total prestep_WTstdev_clear_nostep_mean_total;...
          prestep_WTstdev_noise_bigstep_mean_total prestep_WTstdev_noise_smallstep_mean_total prestep_WTstdev_noise_nostep_mean_total;...
          poststep_WTstdev_clear_bigstep_mean_total poststep_WTstdev_clear_smallstep_mean_total poststep_WTstdev_clear_nostep_mean_total; ...
          poststep_WTstdev_noise_bigstep_mean_total poststep_WTstdev_noise_smallstep_mean_total poststep_WTstdev_noise_nostep_mean_total ...
          ];
      
errY2 = [... 
          prestep_WTstdev_clear_bigstep_sem_total prestep_WTstdev_clear_smallstep_sem_total prestep_WTstdev_clear_nostep_sem_total;...
          prestep_WTstdev_noise_bigstep_sem_total prestep_WTstdev_noise_smallstep_sem_total prestep_WTstdev_noise_nostep_sem_total;...
          poststep_WTstdev_clear_bigstep_sem_total poststep_WTstdev_clear_smallstep_sem_total poststep_WTstdev_clear_nostep_sem_total; ...
          poststep_WTstdev_noise_bigstep_sem_total poststep_WTstdev_noise_smallstep_sem_total poststep_WTstdev_noise_nostep_sem_total ...
          ];

h = barwitherr(errY2, bardata);% Plot with errorbars
set(gca,'XTickLabel',{'pre clear','pre noise' 'post clear','post noise'})
ylabel('mean stdev of pitch')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
set(h(3),'FaceColor','r');
title(sprintf('Pre and post step WT stdev by small or big step'));
legend('Big step','Small step', 'No step')

axis([0 5 ymin ymax])
goodplot


%% clear v noise figure
figure
ymin=0;
ymax=15;
bardata=[clear_mean_total noise_mean_total];

errY2 = [clear_sem_total noise_sem_total];

h = barwitherr(errY2, bardata);% Plot with errorbars

set(gca,'XTickLabel',{'all clear','all noise' 'post clear','post noise'})
ylabel('mean stdev of pitch')
set(h(1),'FaceColor','w');

title(sprintf('WT stdev in clear and noise trials'));

axis([0 3 ymin ymax])
goodplot

%% anovas

% anova_1 - pre/post clear/noise big/small/step
anova_1;

% anova_2 - clear/noise big/small/step
anova_2;

anova_3;

anova_4;

cd(cerebellar_data_rootdir);
save patient_WTstdev_data











