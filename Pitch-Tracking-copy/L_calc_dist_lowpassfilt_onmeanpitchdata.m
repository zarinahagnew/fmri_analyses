% this script takes the *individual mean responses* for each condition
% low pass filters each one and compares the distance between the
% mean responses and the filtered data.

% take mean pitch track for each subject for each condition
% calc FLP version and then distance
% do stats

%% ZKA Jan 2015

clear all
close all

set_params;

cd(cerebellar_data_rootdir);
load GroupData/distancefromtarg/DATA_DIST.mat;

npatients = 0;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB02/expr2014.03.21.T12.33.58_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB03/expr2014.03.21.T14.35.35_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB04/expr2014.03.21.T17.20.11_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB05/expr2014.03.21.T18.50.52_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB06/expr2014.03.22.T11.05.45_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB07/expr2014.03.22.T12.15.42_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB08/expr2014.03.22.T14.01.48_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB09/expr2014.03.22.T15.52.01_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB10/expr2014.03.22.T16.37.44_mainrun/speak/';
npatients = npatients+ 1;
patient_info{npatients}.exprdir = 'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB12/expr2014.03.23.T11.03.52_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/';

% % HCS
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC01/expr2014.05.06.T12.36.43_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC02/expr2014.06.17.T12.53.53_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC03/expr2014.06.17.T13.50.36_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC04/expr2014.06.17.T16.22.20_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC05/expr2014.06.18.T15.14.02_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC06/expr2014.06.18.T16.18.27_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC07/expr2014.07.25.T10.29.55_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC08/expr2014.08.14.T15.57.52_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC09/expr2014.09.21.T14.17.36_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/';

for isubj = 1:npatients
    the_expr_dir = [cerebellar_data_rootdir (patient_info{isubj}.exprdir)];
    cd (the_expr_dir);
    cd block0
    pitchdata=get_vec_hist6('pitch2',3);                                    %two arguments are file name and then file type (float vec)
    block=get_vec_hist6('blockalt',3);                                      %pert response (needs to be shifted in time as only begins in response to voice onsett detect
    voiceonset=get_vec_hist6('voice_onset_detect',2);                       %voice detect
    outbuff_wav=get_vec_hist6('outbuffer', 3);                              % playable waveform
    outbuff_pitch=get_vec_hist6('output_pitch', 3);                         % pich of outbuffer is the target
    amp=get_vec_hist6('weighted_mean_abs_inbuffer2', 3);
    audio=get_vec_hist6('inbuffer2',3);
    
    % sort out x axis
    samples2get = length(pitchdata.data(2,:));
    fs = 11025;
    framef = fs/32;
    nframes_per_trial = pitchdata.nvecs;
    taxis = (0:(samples2get-1))/fs;
    frame_taxis = (0:(nframes_per_trial-1))/framef;
    cd (the_expr_dir);

    % writes all data into one structure called 'DATA'
    DATA_ALLSUBS(isubj).data= load (sprintf('%ssorted_data.mat',patient_info{isubj}.exprdir));  
end

DATA=DATA_ALLSUBS(allincluded);


cd (cerebellar_data_rootdir)
calc_by_cond_frommeantrack;


%% is the distance from the mean different in patients and controls across clear and noise trials
patients=eachsub_dist_LPF(1:11);
HCs=eachsub_dist_LPF(12:15);
    
pat_clear_dist_LPF=vertcat(eachsub_dist_LPF(1).cond(1:5,:),eachsub_dist_LPF(2).cond(1:5,:),...
    eachsub_dist_LPF(3).cond(1:5,:),eachsub_dist_LPF(4).cond(1:5,:), ...
    eachsub_dist_LPF(5).cond(1:5,:),eachsub_dist_LPF(6).cond(1:5,:), ...
    eachsub_dist_LPF(7).cond(1:5,:),eachsub_dist_LPF(8).cond(1:5,:),...
    eachsub_dist_LPF(9).cond(1:5,:),eachsub_dist_LPF(10).cond(1:5,:), ...
    eachsub_dist_LPF(11).cond(1:5,:));

pat_noise_dist_LPF=vertcat(eachsub_dist_LPF(1).cond(6:10,:),eachsub_dist_LPF(2).cond(6:10,:),...
    eachsub_dist_LPF(3).cond(6:10,:),eachsub_dist_LPF(4).cond(6:10,:), ...
    eachsub_dist_LPF(5).cond(6:10,:),eachsub_dist_LPF(6).cond(6:10,:), ...
    eachsub_dist_LPF(7).cond(6:10,:),eachsub_dist_LPF(8).cond(6:10,:),...
    eachsub_dist_LPF(9).cond(6:10,:),eachsub_dist_LPF(10).cond(6:10,:), ...
    eachsub_dist_LPF(11).cond(6:10,:));
    
HC_clear_dist_LPF=vertcat(eachsub_dist_LPF(12).cond(1:5,:),eachsub_dist_LPF(13).cond(1:5,:),...
    eachsub_dist_LPF(14).cond(1:5,:),eachsub_dist_LPF(15).cond(1:5,:));

HC_noise_dist_LPF=vertcat(eachsub_dist_LPF(12).cond(6:10,:),eachsub_dist_LPF(13).cond(6:10,:),...
    eachsub_dist_LPF(14).cond(6:10,:),eachsub_dist_LPF(15).cond(6:10,:));

figure
title('mean variability')
subplot(221)
plot(frame_taxis_to_use(1:981),nanmean(pat_clear_dist_LPF), 'k', 'LineWidth', 1.5)
axis([0 3 0 60])
goodplot
xlabel('time (s)')
ylabel('variability (cents)')

subplot(222)
plot(frame_taxis_to_use(1:981),nanmean(pat_noise_dist_LPF),'k', 'LineWidth', 1.5)
axis([0 3 0 60])
xlabel('time (s)')
ylabel('variability (cents)')
goodplot

subplot(223)
plot(frame_taxis_to_use(1:981),nanmean(HC_clear_dist_LPF), 'r', 'LineWidth', 1.5)
axis([0 3 0 60])
xlabel('time (s)')
ylabel('variability (cents)')
goodplot

subplot(224)
plot(frame_taxis_to_use(1:981), nanmean(HC_noise_dist_LPF), 'r', 'LineWidth', 1.5)
axis([0 3 0 60])
xlabel('time (s)')
ylabel('variability (cents)')
goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/MeanDistfromLPF.pdf');

%ttest
ttest((HC_noise_dist_LPF),(HC_clear_dist_LPF))
ttest((pat_noise_dist_LPF),(pat_clear_dist_LPF))
ttest(nanmean(HC_clear_dist_LPF), nanmean(HC_noise_dist_LPF))
ttest(nanmean(pat_clear_dist_LPF), nanmean(pat_noise_dist_LPF))


%anova:
temp1=HC_clear_dist_LPF;
temp2=HC_noise_dist_LPF;
temp3=pat_clear_dist_LPF;
temp4=pat_noise_dist_LPF;

temp1b = reshape( temp1.' ,1,numel(temp1));
temp2b = reshape( temp2.' ,1,numel(temp2));
temp3b = reshape( temp3.' ,1,numel(temp3));
temp4b = reshape( temp4.' ,1,numel(temp4));

anova_data_meandist_LFP=[temp1b temp2b temp3b temp4b];

test=ones(1,19620*2);
test2=ones(1,53955*2);
test2=test2*2;
subjectgroup=[test test2];

%create conditions
condition= cell(1,147150);
for i=1:19620
    condition{i} = 'clear';
end
for i=19621:19620*2
    condition{i} = 'noise';
end
for i=19620*2+1:19620*2+53955
    condition{i} = 'clear';
end
for i=19620*2+53955+1:147150
    condition{i} = 'noise';
end
condition=condition';

group1=[subjectgroup];
group2=[condition];
p = anovan(anova_data_meandist_LFP,{group1 group2 },'model','interaction')

% RESULT: patients are worse than controls but there is no interaction

%% is the WT mean distance from the LPF different in patients and controls across clear and noise trials
pat_clear_dist_LPF_WTmean=vertcat(nanmean(eachsub_dist_LPF(1).cond(1:5,:)),nanmean(eachsub_dist_LPF(2).cond(1:5,:)),...
    nanmean(eachsub_dist_LPF(3).cond(1:5,:)),nanmean(eachsub_dist_LPF(4).cond(1:5,:)), ...
    nanmean(eachsub_dist_LPF(5).cond(1:5,:)),nanmean(eachsub_dist_LPF(6).cond(1:5,:)), ...
    nanmean(eachsub_dist_LPF(7).cond(1:5,:)),nanmean(eachsub_dist_LPF(8).cond(1:5,:)),...
    nanmean(eachsub_dist_LPF(9).cond(1:5,:)),nanmean(eachsub_dist_LPF(10).cond(1:5,:)), ...
    nanmean(eachsub_dist_LPF(11).cond(1:5,:)));

pat_noise_dist_LPF_WTmean=vertcat(nanmean(eachsub_dist_LPF(1).cond(6:10,:)),nanmean(eachsub_dist_LPF(2).cond(6:10,:)),...
    nanmean(eachsub_dist_LPF(3).cond(6:10,:)),nanmean(eachsub_dist_LPF(4).cond(6:10,:)), ...
    nanmean(eachsub_dist_LPF(5).cond(6:10,:)),nanmean(eachsub_dist_LPF(6).cond(6:10,:)), ...
    nanmean(eachsub_dist_LPF(7).cond(6:10,:)),nanmean(eachsub_dist_LPF(8).cond(6:10,:)),...
    nanmean(eachsub_dist_LPF(9).cond(6:10,:)),nanmean(eachsub_dist_LPF(10).cond(6:10,:)), ...
    nanmean(eachsub_dist_LPF(11).cond(6:10,:)));

HC_clear_dist_LPF_WTmean=vertcat(nanmean(eachsub_dist_LPF(12).cond(1:5,:)),nanmean(eachsub_dist_LPF(13).cond(1:5,:)),...
    nanmean(eachsub_dist_LPF(14).cond(1:5,:)),nanmean(eachsub_dist_LPF(15).cond(1:5,:)));

HC_noise_dist_LPF_WTmean=vertcat(nanmean(eachsub_dist_LPF(12).cond(6:10,:)),nanmean(eachsub_dist_LPF(13).cond(6:10,:)),...
    nanmean(eachsub_dist_LPF(14).cond(6:10,:)),nanmean(eachsub_dist_LPF(15).cond(6:10,:)));



%WT std
    
pat_clear_dist_LPF_WTstd=vertcat(nanstd(eachsub_dist_LPF(1).cond(1:5,:)),nanstd(eachsub_dist_LPF(2).cond(1:5,:)),...
    nanstd(eachsub_dist_LPF(3).cond(1:5,:)),nanstd(eachsub_dist_LPF(4).cond(1:5,:)), ...
    nanstd(eachsub_dist_LPF(5).cond(1:5,:)),nanstd(eachsub_dist_LPF(6).cond(1:5,:)), ...
    nanstd(eachsub_dist_LPF(7).cond(1:5,:)),nanstd(eachsub_dist_LPF(8).cond(1:5,:)),...
    nanstd(eachsub_dist_LPF(9).cond(1:5,:)),nanstd(eachsub_dist_LPF(10).cond(1:5,:)), ...
    nanstd(eachsub_dist_LPF(11).cond(1:5,:)));

pat_noise_dist_LPF_WTstd=vertcat(nanstd(eachsub_dist_LPF(1).cond(6:10,:)),nanstd(eachsub_dist_LPF(2).cond(6:10,:)),...
    nanstd(eachsub_dist_LPF(3).cond(6:10,:)),nanstd(eachsub_dist_LPF(4).cond(6:10,:)), ...
    nanstd(eachsub_dist_LPF(5).cond(6:10,:)),nanstd(eachsub_dist_LPF(6).cond(6:10,:)), ...
    nanstd(eachsub_dist_LPF(7).cond(6:10,:)),nanstd(eachsub_dist_LPF(8).cond(6:10,:)),...
    nanstd(eachsub_dist_LPF(9).cond(6:10,:)),nanstd(eachsub_dist_LPF(10).cond(6:10,:)), ...
    nanstd(eachsub_dist_LPF(11).cond(6:10,:)));

HC_clear_dist_LPF_WTstd=vertcat(nanstd(eachsub_dist_LPF(12).cond(1:5,:)),nanstd(eachsub_dist_LPF(13).cond(1:5,:)),...
    nanstd(eachsub_dist_LPF(14).cond(1:5,:)),nanstd(eachsub_dist_LPF(15).cond(1:5,:)));

HC_noise_dist_LPF_WTstd=vertcat(nanstd(eachsub_dist_LPF(12).cond(6:10,:)),nanstd(eachsub_dist_LPF(13).cond(6:10,:)),...
    nanstd(eachsub_dist_LPF(14).cond(6:10,:)),nanstd(eachsub_dist_LPF(15).cond(6:10,:)));

for itrial=1:size(pat_clear_dist_LPF,1)
    WTmean_clear_pat_anova(itrial)=nanmean(pat_clear_dist_LPF(itrial,:));
    WTstd_clear_pat_anova(itrial)=nanstd(pat_clear_dist_LPF(itrial,:));
    WTmean_noise_pat_anova(itrial)=nanmean(pat_noise_dist_LPF(itrial,:));
    WTstd_noise_pat_anova(itrial)=nanstd(pat_noise_dist_LPF(itrial,:));
end

for itrial=1:size(HC_clear_dist_LPF,1)
    WTmean_clear_HC_anova(itrial)=nanmean(HC_clear_dist_LPF(itrial,:));
    WTstd_clear_HC_anova(itrial)=nanstd(HC_clear_dist_LPF(itrial,:));
    WTmean_noise_HC_anova(itrial)=nanmean(HC_noise_dist_LPF(itrial,:));
    WTstd_noise_HC_anova(itrial)=nanstd(HC_noise_dist_LPF(itrial,:));
end


pat_clear_goodtrial_counter=0;
for itrial=1:size(pat_clear_dist_LPF,1)
    if sum(isnan(pat_clear_dist_LPF(itrial,:)))<size(pat_clear_dist_LPF,2)-1
        pat_clear_goodtrial_counter=pat_clear_goodtrial_counter+1;
    end
end
fraction_gd_pats_clear=(pat_clear_goodtrial_counter/size(pat_clear_dist_LPF,1))*100;
goodtrials_pat_clear=pat_clear_goodtrial_counter; % use this as N for SEM

pat_noise_goodtrial_counter=0;
for itrial=1:size(pat_noise_dist_LPF,1)
    if sum(isnan(pat_noise_dist_LPF(itrial,:)))<size(pat_noise_dist_LPF,2)-1
        pat_noise_goodtrial_counter=pat_noise_goodtrial_counter+1;
    end
end

fraction_gd_pats_noise=(pat_noise_goodtrial_counter/size(pat_noise_dist_LPF,1))*100;
goodtrials_pat_noise=pat_noise_goodtrial_counter; % use this as N for SEM

HC_clear_goodtrial_counter=0;
for itrial=1:size(HC_clear_dist_LPF,1)
    if sum(isnan(HC_clear_dist_LPF(itrial,:)))<size(HC_clear_dist_LPF,2)-1
        HC_clear_goodtrial_counter=HC_clear_goodtrial_counter+1;
    end
end
fraction_gd_HCs_clear=(HC_clear_goodtrial_counter/size(HC_clear_dist_LPF,1))*100;
goodtrials_HC_clear=HC_clear_goodtrial_counter; % use this as N for SEM

HC_noise_goodtrial_counter=0;
for itrial=1:size(HC_noise_dist_LPF,1)
    if sum(isnan(HC_noise_dist_LPF(itrial,:)))<size(HC_noise_dist_LPF,2)-1
        HC_noise_goodtrial_counter=HC_noise_goodtrial_counter+1;
    end
end
fraction_gd_HCs_noise=(HC_noise_goodtrial_counter/size(HC_noise_dist_LPF,1))*100;
goodtrials_HC_noise=HC_noise_goodtrial_counter; % use this as N for SEM

%plot WTmean distance
figure
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Mean WT dist from LPF', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[nanmean(WTmean_clear_HC_anova) nanmean(WTmean_clear_pat_anova); ...
          nanmean(WTmean_noise_HC_anova) nanmean(WTmean_noise_pat_anova)]
errY2 = [ nanstd(WTmean_clear_HC_anova)/sqrt(goodtrials_HC_clear) nanstd(WTmean_clear_pat_anova)/sqrt(goodtrials_pat_clear); ...
          nanstd(WTmean_noise_HC_anova)/sqrt(goodtrials_HC_noise) nanstd(WTmean_noise_pat_anova)/sqrt(goodtrials_pat_noise)]            
h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
ylabel('mean stdev of pitch')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Pre Step'));
axis([0.5 2.5 -1.5 0.5])
goodplot

% plot std WT dist
figure
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'STdev WT dist from LPF', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[nanmean(WTstd_clear_HC_anova) nanmean(WTstd_clear_pat_anova); ...
          nanmean(WTstd_noise_HC_anova) nanmean(WTstd_noise_pat_anova)]
errY2 = [ nanstd(WTstd_clear_HC_anova)/sqrt(goodtrials_HC_clear) nanstd(WTstd_clear_pat_anova)/sqrt(goodtrials_pat_clear); ...
          nanstd(WTstd_noise_HC_anova)/sqrt(goodtrials_HC_noise) nanstd(WTstd_noise_pat_anova)/sqrt(goodtrials_pat_noise)]            
h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
ylabel('mean stdev of pitch')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
axis([0.5 2.5 0 40])
goodplot

ttest(WTstd_clear_HC_anova, WTstd_noise_HC_anova)
ttest(WTstd_clear_pat_anova, WTstd_noise_pat_anova)
ttest2(WTstd_clear_HC_anova, WTstd_clear_pat_anova)
ttest2(WTstd_noise_HC_anova, WTstd_noise_pat_anova)


