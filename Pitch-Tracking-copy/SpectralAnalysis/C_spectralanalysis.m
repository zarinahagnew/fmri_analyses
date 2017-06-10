
clear all
close all
set_params;
fs_spec=345;

fig1=figure;
cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data_final_run/';

npatients = 0;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB01/expr20140321T103415_SUBJ01_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB02/expr20140321T121956_Sub2_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB02/expr2014.03.21.T12.33.58_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB03/expr20140321T142416_Subj3-measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB03/expr2014.03.21.T14.35.35_mainrun/speak/';

npatients = npatients + 1; 
patient_info{npatients}.exprdir ='SUB04/expr20140321T170947_Subj4_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB04/expr2014.03.21.T17.20.11_mainrun/speak/';

npatients = npatients + 1;  %400 and 1000 are ok
patient_info{npatients}.exprdir = 'SUB05/expr20140321T183529_Subj5_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB05/expr2014.03.21.T18.50.52_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB06/expr20140322T104901_SUB06_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB06/expr2014.03.22.T11.05.45_mainrun/speak/';

% BAD SUBJECT
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB07/expr20140322T115150_Sub7_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB07/expr2014.03.22.T12.15.42_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB08/expr20140322T134549_Sub08_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB08/expr2014.03.22.T14.01.48_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB09/expr20140322T154047_SUB09_measure_pitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB09/expr2014.03.22.T15.52.01_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB10/expr20140322T162455_SUB10_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB10/expr2014.03.22.T16.37.44_mainrun/speak/';
meanpitchtag(npatients)=10;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB11/expr20140322T183812_Subj11_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/';

% v wobbly
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB12/expr20140323T104953_Sub12_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB12/expr2014.03.23.T11.03.52_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB13/expr20140323T132703_Sub13_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/';
meanpitchtag(npatients)=13; 

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB14/expr20140323T150747_subj14/speak/';
patient_info_2{npatients}.exprdir = 'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB15/expr20140323T162223_SUB15_measurepitch/speak/';
patient_info_2{npatients}.exprdir = 'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB16/expr20140323T180417_sub16_measurepitch/speak/'; 
patient_info_2{npatients}.exprdir = 'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/';

% missing data
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC01/expr20140506T121323_ZKA/speak/';
% meanpitchtag(npatients)=17

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC02/expr20140617T123801_HC02_pitchprodn/speak/';
patient_info_2{npatients}.exprdir = 'HC02/expr2014.06.17.T12.53.53_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC03/expr20140617T133413_HC03_pitchprodn/speak/';
patient_info_2{npatients}.exprdir = 'HC03/expr2014.06.17.T13.50.36_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC04/expr20140617T161417_measurepitch/speak/'; %400 to 1000 ok
patient_info_2{npatients}.exprdir = 'HC04/expr2014.06.17.T16.22.20_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC05/expr20140618T150410_HC05_measurepitch/speak'; %400 to 1000 ok
patient_info_2{npatients}.exprdir = 'HC05/expr2014.06.18.T15.14.02_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC06/expr20140618T160728_HC06_measurepitch/speak';
patient_info_2{npatients}.exprdir = 'HC06/expr2014.06.18.T16.18.27_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC07/expr20140725T101015_W4Z_subj25/speak';
patient_info_2{npatients}.exprdir = 'HC07/expr2014.07.25.T10.29.55_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC08/expr20140814T154458_W4Z_subj3/speak';
patient_info_2{npatients}.exprdir = 'HC08/expr2014.08.14.T15.57.52_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC09/expr20140921T133544_annette/speak';
patient_info_2{npatients}.exprdir = 'HC09/expr2014.09.21.T14.17.36_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC10/expr20140921T152451_JL/speak/';
patient_info_2{npatients}.exprdir = 'HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/';

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC11/expr20140923t151309_sn/speak/';
patient_info_2{npatients}.exprdir = 'HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/';



% Subject Loop - calculates spectrum for each trial, then calculates the
% mean for each condition - 'meanspec'
for isubj=1:npatients
    the_expr_dir = [cerebellar_data_rootdir (patient_info_2{isubj}.exprdir)];
    cd (the_expr_dir);    
    load (sprintf('%ssorted_data_spectral.mat',patient_info_2{isubj}.exprdir));
    for icond=1:10
        for itrial=1:8
            nfreqs=length(sorted_data(icond).wholetrial(1,250:end))/2+1;
            temp1(icond).data(itrial,:)=my_spectrum(sorted_data(icond).wholetrial(itrial,250:end),fs_spec,nfreqs);
        end
        meanspec(isubj,:).cond(icond,:)=nanmean(temp1(icond).data);        
    end
    cd(cerebellar_data_rootdir);
    save GroupData/meanspec.mat meanspec
end
close all

%% puts all patients in one matrix and all HCs in another
for isubj=1:16        
   SPEC_cond1_pat(isubj,:)=meanspec(isubj).cond(1,:);
   SPEC_cond2_pat(isubj,:)=meanspec(isubj).cond(2,:);
   SPEC_cond3_pat(isubj,:)=meanspec(isubj).cond(3,:);
   SPEC_cond4_pat(isubj,:)=meanspec(isubj).cond(4,:);
   SPEC_cond5_pat(isubj,:)=meanspec(isubj).cond(5,:);
   SPEC_cond6_pat(isubj,:)=meanspec(isubj).cond(6,:);
   SPEC_cond7_pat(isubj,:)=meanspec(isubj).cond(7,:);
   SPEC_cond8_pat(isubj,:)=meanspec(isubj).cond(8,:);
   SPEC_cond9_pat(isubj,:)=meanspec(isubj).cond(9,:);
   SPEC_cond10_pat(isubj,:)=meanspec(isubj).cond(10,:);   
end

for isubj=1:10        
   SPEC_cond1_HC(isubj,:)=meanspec(isubj+16).cond(1,:);
   SPEC_cond2_HC(isubj,:)=meanspec(isubj).cond(2,:);
   SPEC_cond3_HC(isubj,:)=meanspec(isubj).cond(3,:);
   SPEC_cond4_HC(isubj,:)=meanspec(isubj).cond(4,:);
   SPEC_cond5_HC(isubj,:)=meanspec(isubj).cond(5,:);
   SPEC_cond6_HC(isubj,:)=meanspec(isubj).cond(6,:);
   SPEC_cond7_HC(isubj,:)=meanspec(isubj).cond(7,:);
   SPEC_cond8_HC(isubj,:)=meanspec(isubj).cond(8,:);
   SPEC_cond9_HC(isubj,:)=meanspec(isubj).cond(9,:);
   SPEC_cond10_HC(isubj,:)=meanspec(isubj).cond(10,:);   
end


%% ANOVA
% create single matrix for all clear and noise conditions
Pats_clear = vertcat(SPEC_cond1_pat, SPEC_cond2_pat, SPEC_cond3_pat, SPEC_cond4_pat, SPEC_cond5_pat);
Pats_noise = vertcat(SPEC_cond6_pat, SPEC_cond7_pat, SPEC_cond8_pat, SPEC_cond9_pat, SPEC_cond10_pat);
HCs_clear = vertcat(SPEC_cond1_HC, SPEC_cond2_HC, SPEC_cond3_HC, SPEC_cond4_HC, SPEC_cond5_HC);
HCs_noise = vertcat(SPEC_cond6_HC, SPEC_cond7_HC, SPEC_cond8_HC, SPEC_cond9_HC, SPEC_cond10_HC);


% create single array for clear and noise conditions for anova
Pats_clear_anova=reshape(Pats_clear',44480,1);
Pats_clear_anova=Pats_clear_anova';

Pats_noise_anova=reshape(Pats_noise',44480,1);
Pats_noise_anova=Pats_noise_anova';

HCs_clear_anova=reshape(HCs_clear',27800,1);
HCs_clear_anova=HCs_clear_anova';

HCs_noise_anova=reshape(HCs_noise',27800,1);
HCs_noise_anova=HCs_noise_anova';


anovadata=[HCs_clear_anova HCs_noise_anova Pats_clear_anova Pats_noise_anova]

subgp_1=2*length(HCs_clear_anova);
subgp_2=2*length(Pats_clear_anova);

condgp_1=length(HCs_clear_anova);
condgp_2=length(Pats_clear_anova);

%create subject group
test=ones(1,subgp_1);
testz=ones(1,subgp_2);
test2=testz*2;
subjectgroup=[test test2];

%create condition group
condition = cell(1,144560);
for i=1:27800
    condition{i}='clear';
end
for i=27800+1:55600
    condition{i}='noise';
end
for i=55600+1:55600+length(Pats_clear_anova)
    condition{i}='clear';
end
for i=100080+1:100080+length(Pats_clear_anova)
    condition{i}='noise';
end

condition=condition';

group1=[subjectgroup];
group2=[condition];
p = anovan(anovadata,{group1 group2 },'model','interaction')


% ttest between patients clear and noise
for iframe=1:length(SPEC_cond3_pat)
    ttestspec_alltrials_pats(:, iframe)=ttest(Pats_clear(1:80,iframe), Pats_noise(1:80,iframe));            
    ttestspec_alltrials_HCs(:, iframe)=ttest(HCs_clear(1:50,iframe), HCs_noise(1:50,iframe));            
end

ttestspec_alltrials_pats(1:7)
ttestspec_alltrials_HCs(1:7)

% ttest between patients clear and noise
for iframe=1:length(SPEC_cond3_pat)
    ttestspec_cleartrials(:, iframe)=ttest2(Pats_clear(1:80,iframe), HCs_clear(1:50,iframe));            
    ttestspec_noisetrials(:, iframe)=ttest2(HCs_noise(1:50,iframe), Pats_noise(1:50,iframe));            
end

ttestspec_cleartrials(1:7)
ttestspec_noisetrials(1:7)


%% anova on raw data


GpMean_cond1_pat=nanmean(SPEC_cond1_pat);
GpMean_cond2_pat=nanmean(SPEC_cond2_pat);
GpMean_cond3_pat=nanmean(SPEC_cond3_pat);
GpMean_cond4_pat=nanmean(SPEC_cond4_pat);
GpMean_cond5_pat=nanmean(SPEC_cond5_pat);
GpMean_cond6_pat=nanmean(SPEC_cond6_pat);
GpMean_cond7_pat=nanmean(SPEC_cond7_pat);
GpMean_cond8_pat=nanmean(SPEC_cond8_pat);
GpMean_cond9_pat=nanmean(SPEC_cond9_pat);
GpMean_cond10_pat=nanmean(SPEC_cond10_pat);

GpMean_cond1_HC=nanmean(SPEC_cond1_HC);
GpMean_cond2_HC=nanmean(SPEC_cond2_HC);
GpMean_cond3_HC=nanmean(SPEC_cond3_HC);
GpMean_cond4_HC=nanmean(SPEC_cond4_HC);
GpMean_cond5_HC=nanmean(SPEC_cond5_HC);
GpMean_cond6_HC=nanmean(SPEC_cond6_HC);
GpMean_cond7_HC=nanmean(SPEC_cond7_HC);
GpMean_cond8_HC=nanmean(SPEC_cond8_HC);
GpMean_cond9_HC=nanmean(SPEC_cond9_HC);
GpMean_cond10_HC=nanmean(SPEC_cond10_HC);

subplot(5,2,1)
plot(GpMean_cond1_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,2)
plot(GpMean_cond2_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,3)
plot(GpMean_cond3_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,4)
plot(GpMean_cond4_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,5)
plot(GpMean_cond5_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,6)
plot(GpMean_cond6_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,7)
plot(GpMean_cond7_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,8)
plot(GpMean_cond8_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,9)
plot(GpMean_cond9_pat)
axis([2 7 0 100]);
goodplot

subplot(5,2,10)
plot(GpMean_cond10_pat)
axis([2 7 0 100]);
goodplot


subplot(5,2,1)
plot(GpMean_cond1_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,2)
plot(GpMean_cond2_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,3)
plot(GpMean_cond3_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,4)
plot(GpMean_cond4_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,5)
plot(GpMean_cond5_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,6)
plot(GpMean_cond6_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,7)
plot(GpMean_cond7_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,8)
plot(GpMean_cond8_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,9)
plot(GpMean_cond9_HC)
axis([2 7 0 100]);
goodplot

subplot(5,2,10)
plot(GpMean_cond10_HC)
axis([2 7 0 100]);
goodplot


%% all noise v clear
HC_clear(1,:)=GpMean_cond1_HC(1:7);
HC_clear(2,:)=GpMean_cond2_HC(1:7);
HC_clear(3,:)=GpMean_cond3_HC(1:7);
HC_clear(4,:)=GpMean_cond4_HC(1:7) ;
HC_clear(5,:)=GpMean_cond5_HC(1:7);
mean_HC_clear=nanmean(HC_clear)

HC_noise(1,:)=GpMean_cond6_HC(1:7);
HC_noise(2,:)=GpMean_cond7_HC(1:7);
HC_noise(3,:)=GpMean_cond8_HC(1:7);
HC_noise(4,:)=GpMean_cond9_HC(1:7);
HC_noise(5,:)=GpMean_cond10_HC(1:7);
mean_HC_noise=nanmean(HC_noise)


pat_clear(1,:)=GpMean_cond1_pat(1:7);
pat_clear(2,:)=GpMean_cond2_pat(1:7);
pat_clear(3,:)=GpMean_cond3_pat(1:7);
pat_clear(4,:)=GpMean_cond4_pat(1:7);
pat_clear(5,:)=GpMean_cond5_pat(1:7);
mean_pat_clear=nanmean(pat_clear)

pat_noise(1,:)=GpMean_cond6_pat(1:7);
pat_noise(2,:)=GpMean_cond7_pat(1:7);
pat_noise(3,:)=GpMean_cond8_pat(1:7);
pat_noise(4,:)=GpMean_cond9_pat(1:7);
pat_noise(5,:)=GpMean_cond10_pat(1:7);
mean_pat_noise=nanmean(pat_noise)



%% flat trials only
% running ttest - flat trials only
% pats v HCs - clear
for iframe=1:length(SPEC_cond3_pat)
    ttest_spec_clearflattrials(:, iframe)=ttest2(SPEC_cond3_pat(1:16,iframe), SPEC_cond3_HC(1:end,iframe));            
end
ttest_spec_clearflattrials=ttest_spec_clearflattrials(1:7)

% pats v HCs - noise
for iframe=1:length(SPEC_cond3_pat)
    ttest_spec_noiseflattrials(:, iframe)=ttest2(SPEC_cond8_pat(1:16,iframe), SPEC_cond8_HC(1:end,iframe));            
end
ttest_spec_noiseflattrials=ttest_spec_noiseflattrials(1:7)

% pats - clear vs noise
for iframe=1:length(SPEC_cond3_pat)
    ttest_spec_pats_clearvnoise(:, iframe)=ttest(SPEC_cond3_pat(1:16,iframe), SPEC_cond8_pat(1:16,iframe));            
end
ttest_spec_pats_clearvnoise=ttest_spec_pats_clearvnoise(1:7)

% pats - clear vs noise
for iframe=1:length(SPEC_cond8_HC)
    ttest_spec_HCs_clearvnoise(:, iframe)=ttest(SPEC_cond3_HC(1:end,iframe), SPEC_cond8_HC(1:end,iframe));            
end
ttest_spec_HCs_clearvnoise=ttest_spec_HCs_clearvnoise(1:7)

% print out
ttest_spec_clearflattrials
ttest_spec_noiseflattrials
ttest_spec_pats_clearvnoise
ttest_spec_HCs_clearvnoise





fig1=figure
clf
subplot(1,2,1)
patch([0.5 1.5 1.5 0.5], [1.1 1.1 70 70 ], [0.8500    0.8500    0.8500],'EdgeColor', 'none');
hold on
patch([4.5 5.5 5.5 4.5], [1.1 1.1 70 70 ], [0.8500    0.8500    0.8500],'EdgeColor', 'none');

plot(mean_HC_clear, '-o', 'Color',[HC_colour],'LineWidth',1.3);
plot(mean_HC_noise, '--o', 'Color',[HC_colour],'LineWidth',1.3);
goodplot
axis([0 7 0 100]);
title('HCs')


subplot(1,2,2)
plot(mean_pat_clear, '-o', 'Color',[patient_colour],'LineWidth',1.3);
hold on
plot(mean_pat_noise, '--o', 'Color',[patient_colour],'LineWidth',1.3);
goodplot
axis([2 7 0 100]);
title('Patients')

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/Fig3a.pdf');


fig2=figure
subplot(2,2,1)
plot(mean_HC_clear, 'Color',[HC_colour],'LineWidth',1.3);
goodplot
axis([0 10 0 250]);
title('HC clear')
goodplot

subplot(2,2,2)
plot(mean_HC_noise, 'Color',[HC_colour],'LineWidth',1.3);
goodplot
axis([0 10 0 250]);
title('HC noise')

subplot(2,2,3)
plot(mean_pat_clear, 'Color',[patient_colour],'LineWidth',1.3);
goodplot
axis([0 10 0 250]);
title('Patients clear')

subplot(2,2,4)
plot(mean_pat_noise, 'Color',[patient_colour],'LineWidth',1.3);
goodplot
axis([0 10 0 250]);
title('Patients noise')
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/Fig3b.pdf');


ttest(mean_HC_clear, mean_HC_noise)
ttest(mean_pat_clear, mean_pat_noise)
ttest2(mean_HC_clear, mean_pat_clear)
ttest2(mean_HC_noise, mean_pat_noise)

figure 
plot(mean_pat_noise, 'Color',[patient_colour],'LineWidth',1.3);
hold on
plot(mean_pat_clear, '--','Color',[patient_colour],'LineWidth',1.3);
axis([0 8 0 200]);
title('Patients noise vs clear')
goodplot
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/Fig3c.pdf');


