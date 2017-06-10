% FINAL: takes the mean pitch track for each subject for each condition,
% calculates the LPF version and the distance between the two. 
% -----
% 1. calculates AcT mean and stdev
% 2. calculates WT mean and stdev
% 3. does stats


% calc distance from LPF version for each subject
for isubj=1:15
    %figure
    for icond=1:10        
        %temp=nanmean(DATA(isubj).data(1).sorted_data(icond).wholetrial);
        temp=nanmean(DATA_DIST(isubj).distfromlowasspass(1).sorted_data(icond).wholetrial);
        if sum(isnan(temp(220:1200)))>0
            eachsub_meanpitch_temp(isubj).cond(icond,:)=NaN(1,1360);
            eachsub_meanpitch(isubj).cond(icond,:)= NaN(1,981);
            eachsub_LPFpitch(isubj).cond(icond,:)= NaN(1,981);
            eachsub_dist_LPF(isubj).cond(icond,:)=NaN(1,981);
        else            
            eachsub_meanpitch_temp(isubj).cond(icond,:)=nanmean(DATA_DIST(isubj).distfromlowasspass(1).sorted_data(icond).wholetrial);
            eachsub_meanpitch(isubj).cond(icond,:)=eachsub_meanpitch_temp(isubj).cond(icond, 220:1200);
            eachsub_LPFpitch(isubj).cond(icond,:)=lowpass(eachsub_meanpitch(isubj).cond(icond,:), 0.01, 3);
            eachsub_dist_LPF(isubj).cond(icond,:)=calc_distance(eachsub_LPFpitch(isubj).cond(icond,:), eachsub_meanpitch(isubj).cond(icond,:));
            % make all negative values positive
            eachsub_dist_LPF(isubj).cond(icond,:)=abs(eachsub_dist_LPF(isubj).cond(icond,:));
        end
    end
end

% separate patients from HCs
patients=eachsub_dist_LPF(1:11);
HCs=eachsub_dist_LPF(12:15);

% write out all data into one matrix for all subjects by condition
icond=1;
    patient_data_cond1=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond2=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond3=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond4=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond5=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond6=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond7=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond8=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond9=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));
icond=icond+1;    
    patient_data_cond10=vertcat(eachsub_dist_LPF(1).cond(icond,:),eachsub_dist_LPF(2).cond(icond,:),...
        eachsub_dist_LPF(3).cond(icond,:),eachsub_dist_LPF(4).cond(icond,:), ...
        eachsub_dist_LPF(5).cond(icond,:),eachsub_dist_LPF(6).cond(icond,:), ...
        eachsub_dist_LPF(7).cond(icond,:),eachsub_dist_LPF(8).cond(icond,:),...
        eachsub_dist_LPF(9).cond(icond,:),eachsub_dist_LPF(10).cond(icond,:), ...
        eachsub_dist_LPF(11).cond(icond,:));

icond=1;    
        HC_data_cond1=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));

icond=icond+1;    
        HC_data_cond2=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));

icond=icond+1;    
        HC_data_cond3=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));
icond=icond+1;    
        HC_data_cond4=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));
icond=icond+1;    
        HC_data_cond5=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));
icond=icond+1;    
        HC_data_cond6=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));
icond=icond+1;    
        HC_data_cond7=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));
icond=icond+1;    
        HC_data_cond8=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));
icond=icond+1;    
        HC_data_cond9=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));
icond=icond+1;    
        HC_data_cond10=vertcat(eachsub_dist_LPF(12).cond(icond,:),eachsub_dist_LPF(13).cond(icond,:),...
        eachsub_dist_LPF(14).cond(icond,:),eachsub_dist_LPF(15).cond(icond,:));

%calc good trials
calc_goodtrials_bycond;

% 1. calulate AcT mean and Stddev
MeanAcT_PAT(1,:)=nanmean(patient_data_cond1);
MeanAcT_PAT(2,:)=nanmean(patient_data_cond2);
MeanAcT_PAT(3,:)=nanmean(patient_data_cond3);
MeanAcT_PAT(4,:)=nanmean(patient_data_cond4);
MeanAcT_PAT(5,:)=nanmean(patient_data_cond5);
MeanAcT_PAT(6,:)=nanmean(patient_data_cond6);
MeanAcT_PAT(7,:)=nanmean(patient_data_cond7);
MeanAcT_PAT(8,:)=nanmean(patient_data_cond8);
MeanAcT_PAT(9,:)=nanmean(patient_data_cond9);
MeanAcT_PAT(10,:)=nanmean(patient_data_cond10);

MeanAcT_HC(1,:)=nanmean(HC_data_cond1);
MeanAcT_HC(2,:)=nanmean(HC_data_cond2);
MeanAcT_HC(3,:)=nanmean(HC_data_cond3);
MeanAcT_HC(4,:)=nanmean(HC_data_cond4);
MeanAcT_HC(5,:)=nanmean(HC_data_cond5);
MeanAcT_HC(6,:)=nanmean(HC_data_cond6);
MeanAcT_HC(7,:)=nanmean(HC_data_cond7);
MeanAcT_HC(8,:)=nanmean(HC_data_cond8);
MeanAcT_HC(9,:)=nanmean(HC_data_cond9);
MeanAcT_HC(10,:)=nanmean(HC_data_cond10);

% calc and plot stdev AcT 
stdAcT_PAT(1,:)=nanstd(patient_data_cond1);
stdAcT_PAT(2,:)=nanstd(patient_data_cond2);
stdAcT_PAT(3,:)=nanstd(patient_data_cond3);
stdAcT_PAT(4,:)=nanstd(patient_data_cond4);
stdAcT_PAT(5,:)=nanstd(patient_data_cond5);
stdAcT_PAT(6,:)=nanstd(patient_data_cond6);
stdAcT_PAT(7,:)=nanstd(patient_data_cond7);
stdAcT_PAT(8,:)=nanstd(patient_data_cond8);
stdAcT_PAT(9,:)=nanstd(patient_data_cond9);
stdAcT_PAT(10,:)=nanstd(patient_data_cond10);

stdAcT_HC(1,:)=nanstd(HC_data_cond1);
stdAcT_HC(2,:)=nanstd(HC_data_cond2);
stdAcT_HC(3,:)=nanstd(HC_data_cond3);
stdAcT_HC(4,:)=nanstd(HC_data_cond4);
stdAcT_HC(5,:)=nanstd(HC_data_cond5);
stdAcT_HC(6,:)=nanstd(HC_data_cond6);
stdAcT_HC(7,:)=nanstd(HC_data_cond7);
stdAcT_HC(8,:)=nanstd(HC_data_cond8);
stdAcT_HC(9,:)=nanstd(HC_data_cond9);
stdAcT_HC(10,:)=nanstd(HC_data_cond10);


% SEM
SEM_AcT_PAT(1,:)=nanstd(patient_data_cond1)/sqrt(pat_goodtrial_counter_cond1);
SEM_AcT_PAT(2,:)=nanstd(patient_data_cond2)/sqrt(pat_goodtrial_counter_cond2);
SEM_AcT_PAT(3,:)=nanstd(patient_data_cond3)/sqrt(pat_goodtrial_counter_cond3);
SEM_AcT_PAT(4,:)=nanstd(patient_data_cond4)/sqrt(pat_goodtrial_counter_cond4);
SEM_AcT_PAT(5,:)=nanstd(patient_data_cond5)/sqrt(pat_goodtrial_counter_cond5);
SEM_AcT_PAT(6,:)=nanstd(patient_data_cond6)/sqrt(pat_goodtrial_counter_cond6);
SEM_AcT_PAT(7,:)=nanstd(patient_data_cond7)/sqrt(pat_goodtrial_counter_cond7);
SEM_AcT_PAT(8,:)=nanstd(patient_data_cond8)/sqrt(pat_goodtrial_counter_cond8);
SEM_AcT_PAT(9,:)=nanstd(patient_data_cond9)/sqrt(pat_goodtrial_counter_cond9);
SEM_AcT_PAT(10,:)=nanstd(patient_data_cond10)/sqrt(pat_goodtrial_counter_cond10);

SEM_AcT_HC(1,:)=nanstd(HC_data_cond1)/sqrt(HC_goodtrial_counter_cond1);
SEM_AcT_HC(2,:)=nanstd(HC_data_cond2)/sqrt(HC_goodtrial_counter_cond2);
SEM_AcT_HC(3,:)=nanstd(HC_data_cond3)/sqrt(HC_goodtrial_counter_cond3);
SEM_AcT_HC(4,:)=nanstd(HC_data_cond4)/sqrt(HC_goodtrial_counter_cond4);
SEM_AcT_HC(5,:)=nanstd(HC_data_cond5)/sqrt(HC_goodtrial_counter_cond5);
SEM_AcT_HC(6,:)=nanstd(HC_data_cond6)/sqrt(HC_goodtrial_counter_cond6);
SEM_AcT_HC(7,:)=nanstd(HC_data_cond7)/sqrt(HC_goodtrial_counter_cond7);
SEM_AcT_HC(8,:)=nanstd(HC_data_cond8)/sqrt(HC_goodtrial_counter_cond8);
SEM_AcT_HC(9,:)=nanstd(HC_data_cond9)/sqrt(HC_goodtrial_counter_cond9);
SEM_AcT_HC(10,:)=nanstd(HC_data_cond10)/sqrt(HC_goodtrial_counter_cond10);

% SEM of stdev
SEM_stdAcT_PAT(1,:)=nanstd(patient_data_cond1)/sqrt(pat_goodtrial_counter_cond1);
SEM_stdAcT_PAT(2,:)=nanstd(patient_data_cond2)/sqrt(pat_goodtrial_counter_cond2);
SEM_stdAcT_PAT(3,:)=nanstd(patient_data_cond3)/sqrt(pat_goodtrial_counter_cond3);
SEM_stdAcT_PAT(4,:)=nanstd(patient_data_cond4)/sqrt(pat_goodtrial_counter_cond4);
SEM_stdAcT_PAT(5,:)=nanstd(patient_data_cond5)/sqrt(pat_goodtrial_counter_cond5);
SEM_stdAcT_PAT(6,:)=nanstd(patient_data_cond6)/sqrt(pat_goodtrial_counter_cond6);
SEM_stdAcT_PAT(7,:)=nanstd(patient_data_cond7)/sqrt(pat_goodtrial_counter_cond7);
SEM_stdAcT_PAT(8,:)=nanstd(patient_data_cond8)/sqrt(pat_goodtrial_counter_cond8);
SEM_stdAcT_PAT(9,:)=nanstd(patient_data_cond9)/sqrt(pat_goodtrial_counter_cond9);
SEM_stdAcT_PAT(10,:)=nanstd(patient_data_cond10)/sqrt(pat_goodtrial_counter_cond10);

SEM_stdAcT_HC(1,:)=nanstd(HC_data_cond1)/sqrt(HC_goodtrial_counter_cond1);
SEM_stdAcT_HC(2,:)=nanstd(HC_data_cond2)/sqrt(HC_goodtrial_counter_cond2);
SEM_stdAcT_HC(3,:)=nanstd(HC_data_cond3)/sqrt(HC_goodtrial_counter_cond3);
SEM_stdAcT_HC(4,:)=nanstd(HC_data_cond4)/sqrt(HC_goodtrial_counter_cond4);
SEM_stdAcT_HC(5,:)=nanstd(HC_data_cond5)/sqrt(HC_goodtrial_counter_cond5);
SEM_stdAcT_HC(6,:)=nanstd(HC_data_cond6)/sqrt(HC_goodtrial_counter_cond6);
SEM_stdAcT_HC(7,:)=nanstd(HC_data_cond7)/sqrt(HC_goodtrial_counter_cond7);
SEM_stdAcT_HC(8,:)=nanstd(HC_data_cond8)/sqrt(HC_goodtrial_counter_cond8);
SEM_stdAcT_HC(9,:)=nanstd(HC_data_cond9)/sqrt(HC_goodtrial_counter_cond9);
SEM_stdAcT_HC(10,:)=nanstd(HC_data_cond10)/sqrt(HC_goodtrial_counter_cond10);



%% SIGNIFICANT RESULTS
%1. Mean AcT distance from LPF

figure
title('Mean AcT distance from LPF')
for icond=1:10
    subplot(2,5, icond)
    plot(frame_taxis_to_use(1:981), MeanAcT_PAT(icond,:), 'r', 'LineWidth', 1.5);
    hold on
    plot(frame_taxis_to_use(1:981),MeanAcT_HC(icond,:), 'k', 'LineWidth', 1.5);
    axis([0 3 0 160])
    xlabel('Time (s)')
    goodplot_wide
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Mean_bycond.pdf');

% % the bar version
figure
y_pitch2=[...
          nanmean(MeanAcT_HC(1,:)) nanmean(MeanAcT_PAT(1,:)); ...
          nanmean(MeanAcT_HC(2,:)) nanmean(MeanAcT_PAT(2,:)); ...          
          nanmean(MeanAcT_HC(3,:)) nanmean(MeanAcT_PAT(3,:)); ...
          nanmean(MeanAcT_HC(4,:)) nanmean(MeanAcT_PAT(4,:)); ...
          nanmean(MeanAcT_HC(5,:)) nanmean(MeanAcT_PAT(5,:)); ...          
          nanmean(MeanAcT_HC(6,:)) nanmean(MeanAcT_PAT(6,:)); ...
          nanmean(MeanAcT_HC(7,:)) nanmean(MeanAcT_PAT(7,:)); ...          
          nanmean(MeanAcT_HC(8,:)) nanmean(MeanAcT_PAT(8,:)); ...
          nanmean(MeanAcT_HC(9,:)) nanmean(MeanAcT_PAT(9,:)); ...
          nanmean(MeanAcT_HC(10,:)) nanmean(MeanAcT_PAT(10,:))];
          
          
errY2=[...
          nanstd(MeanAcT_HC(1,:))/sqrt(10) nanstd(MeanAcT_PAT(1,:))/sqrt(10); ...
          nanstd(MeanAcT_HC(2,:))/sqrt(10) nanstd(MeanAcT_PAT(2,:))/sqrt(10); ...          
          nanstd(MeanAcT_HC(3,:))/sqrt(10) nanstd(MeanAcT_PAT(3,:))/sqrt(10); ...
          nanstd(MeanAcT_HC(4,:))/sqrt(10) nanstd(MeanAcT_PAT(4,:))/sqrt(10); ...
          nanstd(MeanAcT_HC(5,:))/sqrt(10) nanstd(MeanAcT_PAT(5,:))/sqrt(10); ...          
          nanstd(MeanAcT_HC(6,:))/sqrt(10) nanstd(MeanAcT_PAT(6,:))/sqrt(10); ...
          nanstd(MeanAcT_HC(7,:))/sqrt(10) nanstd(MeanAcT_PAT(7,:))/sqrt(10); ...          
          nanstd(MeanAcT_HC(8,:))/sqrt(10) nanstd(MeanAcT_PAT(8,:))/sqrt(10); ...
          nanstd(MeanAcT_HC(9,:))/sqrt(10) nanstd(MeanAcT_PAT(9,:))/sqrt(10); ...
          nanstd(MeanAcT_HC(10,:))/sqrt(10) nanstd(MeanAcT_PAT(10,:))/sqrt(10)];

h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'clear','noise'})
ylabel('Mean AT var (cents)')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Mean AT variability'));
axis([0 11 0 40])
goodplot_wide
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Mean_bycond_bargraph.pdf');

% stats for and plot stdev AcT 
anova_data_MeanAcT=horzcat(...
    MeanAcT_HC(1,:), MeanAcT_HC(2,:), ...
    MeanAcT_HC(3,:), MeanAcT_HC(4,:), ...
    MeanAcT_HC(5,:), MeanAcT_HC(6,:), ...
    MeanAcT_HC(7,:), MeanAcT_HC(8,:), ...
    MeanAcT_HC(9,:), MeanAcT_HC(10,:), ...
    MeanAcT_PAT(1,:), MeanAcT_PAT(2,:), ...
    MeanAcT_PAT(3,:), MeanAcT_PAT(4,:), ...
    MeanAcT_PAT(5,:), MeanAcT_PAT(6,:), ...
    MeanAcT_PAT(7,:), MeanAcT_PAT(8,:), ...
    MeanAcT_PAT(9,:), MeanAcT_PAT(10,:));

trial=981;
test=ones(1,981*10);
test2=test*2;
subjectgroup=[test test2];

%create conditions
%condition= cell(1,19620);
clear condition;
for i=1:trial
    condition{i} = 'cond1';
end
for i=trial+1:trial*2
    condition{i}='cond2';
end
for i=trial*2+1:trial*3
    condition{i}='cond3';
end
for i=trial*3+1:trial*4
    condition{i}='cond4';
end
for i=trial*4+1:trial*5
    condition{i}='cond5';
end
for i=trial*5+1:trial*6
    condition{i}='cond6';
end
for i=trial*6+1:trial*7
    condition{i}='cond7';
end
for i=trial*7+1:trial*8
    condition{i}='cond8';
end
for i=trial*8+1:trial*9
    condition{i}='cond9';
end
for i=trial*9+1:trial*10
    condition{i}='cond10';
end

condition=[condition condition];
condition=condition';

group1=[subjectgroup];
group2=[condition];

anova_data_stdAcT=horzcat(...
    stdAcT_HC(1,:), stdAcT_HC(2,:), ...
    stdAcT_HC(3,:), stdAcT_HC(4,:), ...
    stdAcT_HC(5,:), stdAcT_HC(6,:), ...
    stdAcT_HC(7,:), stdAcT_HC(8,:), ...
    stdAcT_HC(9,:), stdAcT_HC(10,:), ...
    stdAcT_PAT(1,:), stdAcT_PAT(2,:), ...
    stdAcT_PAT(3,:), stdAcT_PAT(4,:), ...
    stdAcT_PAT(5,:), stdAcT_PAT(6,:), ...
    stdAcT_PAT(7,:), stdAcT_PAT(8,:), ...
    stdAcT_PAT(9,:), stdAcT_PAT(10,:));

STATS.anova_data_MeanAcT = anovan(anova_data_MeanAcT,{group1 group2 },'model','interaction');
STATS.anova_data_stdAcT = anovan(anova_data_stdAcT,{group1 group2 },'model','interaction');

figure
title('Std AcT distance from LPF')
for icond=1:10
    subplot(2,5, icond)
    plot(frame_taxis_to_use(1:981), stdAcT_PAT(icond,:), 'r', 'LineWidth', 1.5);
    hold on
    plot(frame_taxis_to_use(1:981),stdAcT_HC(icond,:), 'k', 'LineWidth', 1.5);
    axis([0 3 0 160])
    xlabel('Time (s)')
    goodplot_wide
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Stdev_bycond.pdf');

% calculate significant difference along the time frame
STATS.cond1_AcT=ttest2(patient_data_cond1, HC_data_cond1);
STATS.cond2_AcT=ttest2(patient_data_cond2, HC_data_cond2);
STATS.cond3_AcT=ttest2(patient_data_cond3, HC_data_cond3);
STATS.cond4_AcT=ttest2(patient_data_cond4, HC_data_cond4);
STATS.cond5_AcT=ttest2(patient_data_cond5, HC_data_cond5);
STATS.cond6_AcT=ttest2(patient_data_cond6, HC_data_cond6);
STATS.cond7_AcT=ttest2(patient_data_cond7, HC_data_cond7);
STATS.cond8_AcT=ttest2(patient_data_cond8, HC_data_cond8);
STATS.cond9_AcT=ttest2(patient_data_cond9, HC_data_cond9);
STATS.cond10_AcT=ttest2(patient_data_cond10, HC_data_cond10);

% do noise v clear

figure
title('Stdev AcT distance from LPF_noisevclear')
subplot(211)
plot(frame_taxis_to_use(1:981),nanmean(stdAcT_HC(1:5,:)), 'r', 'LineWidth', 1.5);
hold on
plot(frame_taxis_to_use(1:981),nanmean(stdAcT_HC(6:10,:)), 'k', 'LineWidth', 1.5);
axis([0 3 0 80])
goodplot

subplot(212)
plot(frame_taxis_to_use(1:981),nanmean(stdAcT_PAT(1:5,:)), 'r', 'LineWidth', 1.5);
hold on
plot(frame_taxis_to_use(1:981),nanmean(stdAcT_PAT(6:10,:)), 'k', 'LineWidth', 1.5);
axis([0 3 0 80])
goodplot
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Stdev_clearvnoise.pdf');

%bar
      HC_clear=nanmean([stdAcT_HC(1,:) stdAcT_HC(2,:) stdAcT_HC(3,:) stdAcT_HC(4,:) stdAcT_HC(5,:)]);
      HC_noise= nanmean([stdAcT_HC(6,:) stdAcT_HC(7,:) stdAcT_HC(8,:) stdAcT_HC(9,:) stdAcT_HC(10,:)]);
      PAT_clear=nanmean([stdAcT_PAT(1,:) stdAcT_PAT(2,:) stdAcT_PAT(3,:) stdAcT_PAT(4,:) stdAcT_PAT(5,:)]);
      PAT_noise= nanmean([stdAcT_PAT(6,:) stdAcT_PAT(7,:) stdAcT_PAT(8,:) stdAcT_PAT(9,:) stdAcT_PAT(10,:)]);      

      HC_clear_stdev=nanstd([stdAcT_HC(1,:) stdAcT_HC(2,:) stdAcT_HC(3,:) stdAcT_HC(4,:) stdAcT_HC(5,:)]/sqrt(50));
      HC_noise_stdev= nanstd([stdAcT_HC(6,:) stdAcT_HC(7,:) stdAcT_HC(8,:) stdAcT_HC(9,:) stdAcT_HC(10,:)]/sqrt(50));
      PAT_clear_stdev=nanstd([stdAcT_PAT(1,:) stdAcT_PAT(2,:) stdAcT_PAT(3,:) stdAcT_PAT(4,:) stdAcT_PAT(5,:)]/sqrt(50));
      PAT_noise_stdev= nanstd([stdAcT_PAT(6,:) stdAcT_PAT(7,:) stdAcT_PAT(8,:) stdAcT_PAT(9,:) stdAcT_PAT(10,:)]/sqrt(50));      

figure
y_pitch2=[HC_clear HC_noise; PAT_clear PAT_noise];
errY2=[HC_clear_stdev HC_noise_stdev; PAT_clear_stdev PAT_noise_stdev];
      
h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'controls','patients'})
ylabel('Mean AT var (cents)')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Across trial std in vocal variability'));
axis([0 11 0 40])
goodplot
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Mean_bycond_bargraph.pdf');




figure
title('Mean AcT distance from LPF_noisevclear')
subplot(211)
plot(frame_taxis_to_use(1:981),nanmean(MeanAcT_HC(1:5,:)), 'r', 'LineWidth', 1.5);
hold on
plot(frame_taxis_to_use(1:981),nanmean(MeanAcT_HC(6:10,:)), 'k', 'LineWidth', 1.5);
axis([0 3 0 60])
goodplot

subplot(212)
plot(frame_taxis_to_use(1:981),nanmean(MeanAcT_PAT(1:5,:)), 'r', 'LineWidth', 1.5);
hold on
plot(frame_taxis_to_use(1:981),nanmean(MeanAcT_PAT(6:10,:)), 'k', 'LineWidth', 1.5);
axis([0 3 0 60])
goodplot
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Mean_clearvnoise.pdf');






%anova

anovadata_meandist_clearnoise=[...
    MeanAcT_HC(1,:) MeanAcT_HC(2,:) MeanAcT_HC(3,:) MeanAcT_HC(4,:) MeanAcT_HC(5,:) ...
    MeanAcT_HC(6,:) MeanAcT_HC(7,:) MeanAcT_HC(8,:) MeanAcT_HC(9,:) MeanAcT_HC(10,:) ...    
    MeanAcT_PAT(1,:) MeanAcT_PAT(2,:) MeanAcT_PAT(3,:) MeanAcT_PAT(4,:) MeanAcT_PAT(5,:) ...
    MeanAcT_PAT(6,:) MeanAcT_PAT(7,:) MeanAcT_PAT(8,:) MeanAcT_PAT(9,:) MeanAcT_PAT(10,:)];    

anovadata_stddist_clearnoise=[...
    stdAcT_HC(1,:) stdAcT_HC(2,:) stdAcT_HC(3,:) stdAcT_HC(4,:) stdAcT_HC(5,:) ...
    stdAcT_HC(6,:) stdAcT_HC(7,:) stdAcT_HC(8,:) stdAcT_HC(9,:) stdAcT_HC(10,:) ...    
    stdAcT_PAT(1,:) stdAcT_PAT(2,:) stdAcT_PAT(3,:) stdAcT_PAT(4,:) stdAcT_PAT(5,:) ...
    stdAcT_PAT(6,:) stdAcT_PAT(7,:) stdAcT_PAT(8,:) stdAcT_PAT(9,:) stdAcT_PAT(10,:)];    

trial=4905;
test=ones(1,19620/2);
test2=test*2;
subjectgroup=[test test2];

%create conditions
clear condition;
for i=1:trial
    condition{i} = 'clear';
end
for i=trial+1:trial*2
    condition{i}='noise';
end

condition=[condition condition];
condition=condition';

group1=[subjectgroup];
group2=[condition];

STATS.anova_data_MeanAcT_clearnoise = anovan(anovadata_meandist_clearnoise,{group1 group2 },'model','interaction');
STATS.anova_data_stdAcT_clearnoise = anovan(anovadata_stddist_clearnoise,{group1 group2 },'model','interaction');




% a=ones(1,10)    % upper line
% b=a*4           %bottom line
% x=[1:10]        %frame_taxis
% [ph,msg]=jbfill(x,a,b,rand(1,3),rand(1,3),0,rand(1,1))

figure
title('Mean AcT variability - patients')
for icond=1:10
    subplot(5,2, icond)
    a=MeanAcT_PAT(icond,:)+SEM_AcT_PAT(icond,:);
    b=MeanAcT_PAT(icond,:)-SEM_AcT_PAT(icond,:);
    x=frame_taxis_to_use(1:981);
    [ph,msg]=jbfill(x,a,b,'k','k',0,0.3)
    hold on
    plot(frame_taxis_to_use(1:981),MeanAcT_PAT(icond,:), 'k','LineWidth',1.1)
    axis([0 3.5 0 200])
    set(gca,'LineWidth',2.0)
    goodplot
end

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Mean.pdf');


% figure
% for icond=1:10
%     subplot(5,2, icond)
%     a=MeanAcT_PAT(icond,:)+SEM_AcT_PAT(icond,:);
%     b=MeanAcT_PAT(icond,:)-SEM_AcT_PAT(icond,:);
%     x=frame_taxis_to_use(1:981);
%     [ph,msg]=jbfill(x,a,b,'k','w',0,0.3)
%     hold on
%     plot(frame_taxis_to_use(1:981),MeanAcT_PAT(icond,:), 'k','LineWidth',1.3)
%     axis([0 3 0 150])
%     goodplot
%     set(gca,'LineWidth',2.0)
% end
% print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Mean_patients.pdf');

figure
for icond=1:10
    subplot(5,2, icond)
    a=MeanAcT_HC(icond,:)+SEM_AcT_HC(icond,:);
    b=MeanAcT_HC(icond,:)-SEM_AcT_HC(icond,:);
    x=frame_taxis_to_use(1:981);
    [ph,msg]=jbfill(x,a,b,'k','w',0,0.3)
    hold on
    plot(frame_taxis_to_use(1:981),MeanAcT_HC(icond,:), 'k','LineWidth',1.3)
    axis([0 3 0 50])
    goodplot
    set(gca,'LineWidth',2.0)
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Mean_HCs.pdf');


figure
for icond=1:10
    subplot(5,2, icond)
    a=stdAcT_PAT(icond,:)+SEM_AcT_PAT(icond,:);
    b=stdAcT_PAT(icond,:)-SEM_AcT_PAT(icond,:);
    x=frame_taxis_to_use(1:981);
    [ph,msg]=jbfill(x,a,b,'k','w',0,0.3)
    hold on
    plot(frame_taxis_to_use(1:981),stdAcT_PAT(icond,:), 'k','LineWidth',1.3)
    axis([0 3 0 180])
    goodplot
    set(gca,'LineWidth',2.0)
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_stdev_patients.pdf');


figure
for icond=1:10
    subplot(5,2, icond)
    a=stdAcT_HC(icond,:)+SEM_AcT_HC(icond,:);
    b=stdAcT_HC(icond,:)-SEM_AcT_HC(icond,:);
    x=frame_taxis_to_use(1:981);
    [ph,msg]=jbfill(x,a,b,'k','w',0,0.3)
    hold on
    plot(frame_taxis_to_use(1:981),stdAcT_HC(icond,:), 'k','LineWidth',1.3)
    axis([0 3 0 180])
    goodplot
    set(gca,'LineWidth',2.0)
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_stdev_HCs.pdf');








figure
title('Std AcT distance from LPF')
for icond=1:10
    subplot(5,2, icond)
    plot(frame_taxis_to_use(1:981),stdAcT_PAT(icond,:), 'k')
    hold on
    plot(frame_taxis_to_use(1:981),stdAcT_HC(icond,:), 'm')
    axis([0 3 -20 200])
    xlabel('Time (s)')
    goodplot
end

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/AcT_Stddev.pdf');


% calulate and plot WT mean and stdev
for itrial=1:size(patient_data_cond1,1)
    MeanWT_PAT_cond1(itrial)=nanmean(patient_data_cond1(itrial,:));
    MeanWT_PAT_cond2(itrial)=nanmean(patient_data_cond2(itrial,:));
    MeanWT_PAT_cond3(itrial)=nanmean(patient_data_cond3(itrial,:));
    MeanWT_PAT_cond4(itrial)=nanmean(patient_data_cond4(itrial,:));
    MeanWT_PAT_cond5(itrial)=nanmean(patient_data_cond5(itrial,:));
    MeanWT_PAT_cond6(itrial)=nanmean(patient_data_cond6(itrial,:));
    MeanWT_PAT_cond7(itrial)=nanmean(patient_data_cond7(itrial,:))
    MeanWT_PAT_cond8(itrial)=nanmean(patient_data_cond8(itrial,:));
    MeanWT_PAT_cond9(itrial)=nanmean(patient_data_cond9(itrial,:));
    MeanWT_PAT_cond10(itrial)=nanmean(patient_data_cond10(itrial,:));
    
    stdWT_PAT_cond1(itrial)=nanstd(patient_data_cond1(itrial,:));
    stdWT_PAT_cond2(itrial)=nanstd(patient_data_cond2(itrial,:));
    stdWT_PAT_cond3(itrial)=nanstd(patient_data_cond3(itrial,:));
    stdWT_PAT_cond4(itrial)=nanstd(patient_data_cond4(itrial,:));
    stdWT_PAT_cond5(itrial)=nanstd(patient_data_cond5(itrial,:));
    stdWT_PAT_cond6(itrial)=nanstd(patient_data_cond6(itrial,:));
    stdWT_PAT_cond7(itrial)=nanstd(patient_data_cond7(itrial,:));
    stdWT_PAT_cond8(itrial)=nanstd(patient_data_cond8(itrial,:))
    stdWT_PAT_cond9(itrial)=nanstd(patient_data_cond9(itrial,:));
    stdWT_PAT_cond10(itrial)=nanstd(patient_data_cond10(itrial,:));

end

for itrial=1:size(HC_data_cond1,1)
    MeanWT_HC_cond1(itrial)=nanmean(HC_data_cond1(itrial,:));
    MeanWT_HC_cond2(itrial)=nanmean(HC_data_cond2(itrial,:));
    MeanWT_HC_cond3(itrial)=nanmean(HC_data_cond3(itrial,:));
    MeanWT_HC_cond4(itrial)=nanmean(HC_data_cond4(itrial,:));
    MeanWT_HC_cond5(itrial)=nanmean(HC_data_cond5(itrial,:));
    MeanWT_HC_cond6(itrial)=nanmean(HC_data_cond6(itrial,:));
    MeanWT_HC_cond7(itrial)=nanmean(HC_data_cond7(itrial,:));
    MeanWT_HC_cond8(itrial)=nanmean(HC_data_cond8(itrial,:));
    MeanWT_HC_cond9(itrial)=nanmean(HC_data_cond9(itrial,:));
    MeanWT_HC_cond10(itrial)=nanmean(HC_data_cond10(itrial,:));

    stdWT_HC_cond1(itrial)=nanstd(HC_data_cond1(itrial,:));
    stdWT_HC_cond2(itrial)=nanstd(HC_data_cond2(itrial,:));
    stdWT_HC_cond3(itrial)=nanstd(HC_data_cond3(itrial,:));
    stdWT_HC_cond4(itrial)=nanstd(HC_data_cond4(itrial,:));
    stdWT_HC_cond5(itrial)=nanstd(HC_data_cond5(itrial,:));
    stdWT_HC_cond6(itrial)=nanstd(HC_data_cond6(itrial,:));
    stdWT_HC_cond7(itrial)=nanstd(HC_data_cond7(itrial,:));
    stdWT_HC_cond8(itrial)=nanstd(HC_data_cond8(itrial,:));
    stdWT_HC_cond9(itrial)=nanstd(HC_data_cond9(itrial,:));
    stdWT_HC_cond10(itrial)=nanstd(HC_data_cond10(itrial,:));
end

%plot these
figure
subplot(211)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Mean WT dist from LPF_clear conds', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[...    
nanmean(MeanWT_HC_cond1), nanmean(MeanWT_PAT_cond1); ...
nanmean(MeanWT_HC_cond2), nanmean(MeanWT_PAT_cond2); ...
nanmean(MeanWT_HC_cond3), nanmean(MeanWT_PAT_cond3); ...
nanmean(MeanWT_HC_cond4), nanmean(MeanWT_PAT_cond4); ...
nanmean(MeanWT_HC_cond5), nanmean(MeanWT_PAT_cond5) ...
];

errY2 = [...
nanstd(MeanWT_HC_cond1)/sqrt(HC_goodtrial_counter_cond1), nanstd(MeanWT_PAT_cond1)/sqrt(pat_goodtrial_counter_cond1); ...
nanstd(MeanWT_HC_cond2)/sqrt(HC_goodtrial_counter_cond2), nanstd(MeanWT_PAT_cond2)/sqrt(pat_goodtrial_counter_cond2); ...
nanstd(MeanWT_HC_cond3)/sqrt(HC_goodtrial_counter_cond3), nanstd(MeanWT_PAT_cond3)/sqrt(pat_goodtrial_counter_cond3); ...
nanstd(MeanWT_HC_cond4)/sqrt(HC_goodtrial_counter_cond4), nanstd(MeanWT_PAT_cond4)/sqrt(pat_goodtrial_counter_cond4); ...
nanstd(MeanWT_HC_cond5)/sqrt(HC_goodtrial_counter_cond5), nanstd(MeanWT_PAT_cond5)/sqrt(pat_goodtrial_counter_cond5); ...
];

h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'cond1','cond2','cond3','cond4','cond5'})
ylabel('WT mean variability (cents)')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Clear Trials'));
axis([0.5 5.5 0 45])
goodplot


subplot(212)
whitebg('white')
y_pitch2=[...    
nanmean(MeanWT_HC_cond6), nanmean(MeanWT_PAT_cond6); ...
nanmean(MeanWT_HC_cond7), nanmean(MeanWT_PAT_cond7); ...
nanmean(MeanWT_HC_cond8), nanmean(MeanWT_PAT_cond8); ...
nanmean(MeanWT_HC_cond9), nanmean(MeanWT_PAT_cond9); ...
nanmean(MeanWT_HC_cond10), nanmean(MeanWT_PAT_cond10) ...
];

errY2 = [...
nanstd(MeanWT_HC_cond6)/sqrt(HC_goodtrial_counter_cond6), nanstd(MeanWT_PAT_cond6)/sqrt(pat_goodtrial_counter_cond6); ...
nanstd(MeanWT_HC_cond7)/sqrt(HC_goodtrial_counter_cond7), nanstd(MeanWT_PAT_cond7)/sqrt(pat_goodtrial_counter_cond7); ...
nanstd(MeanWT_HC_cond8)/sqrt(HC_goodtrial_counter_cond8), nanstd(MeanWT_PAT_cond8)/sqrt(pat_goodtrial_counter_cond8); ...
nanstd(MeanWT_HC_cond9)/sqrt(HC_goodtrial_counter_cond9), nanstd(MeanWT_PAT_cond9)/sqrt(pat_goodtrial_counter_cond9); ...
nanstd(MeanWT_HC_cond10)/sqrt(HC_goodtrial_counter_cond10), nanstd(MeanWT_PAT_cond10)/sqrt(pat_goodtrial_counter_cond10); ...
];

h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'cond6','cond7','cond8','cond9','cond10'})
ylabel('WT mean variability (cents)')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Noise Trials'));
axis([0.5 5.5 0 45])
goodplot
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/WT_Mean.pdf');


figure
subplot(211)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Mean WT dist from LPF_clear conds', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
y_pitch2=[...    
nanmean(stdWT_HC_cond1), nanmean(stdWT_PAT_cond1); ...
nanmean(stdWT_HC_cond2), nanmean(stdWT_PAT_cond2); ...
nanmean(stdWT_HC_cond3), nanmean(stdWT_PAT_cond3); ...
nanmean(stdWT_HC_cond4), nanmean(stdWT_PAT_cond4); ...
nanmean(stdWT_HC_cond5), nanmean(stdWT_PAT_cond5) ...
];

errY2 = [...
nanstd(stdWT_HC_cond1)/sqrt(HC_goodtrial_counter_cond1), nanstd(stdWT_PAT_cond1)/sqrt(pat_goodtrial_counter_cond1); ...
nanstd(stdWT_HC_cond2)/sqrt(HC_goodtrial_counter_cond2), nanstd(stdWT_PAT_cond2)/sqrt(pat_goodtrial_counter_cond2); ...
nanstd(stdWT_HC_cond3)/sqrt(HC_goodtrial_counter_cond3), nanstd(stdWT_PAT_cond3)/sqrt(pat_goodtrial_counter_cond3); ...
nanstd(stdWT_HC_cond4)/sqrt(HC_goodtrial_counter_cond4), nanstd(stdWT_PAT_cond4)/sqrt(pat_goodtrial_counter_cond4); ...
nanstd(stdWT_HC_cond5)/sqrt(HC_goodtrial_counter_cond5), nanstd(stdWT_PAT_cond5)/sqrt(pat_goodtrial_counter_cond5); ...
];

h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'cond1','cond2','cond3','cond4','cond5'})
ylabel('WT std variability (cents)')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Clear Trials'));
axis([0.5 5.5 0 55])
goodplot

subplot(212)
whitebg('white')
y_pitch2=[...    
nanmean(stdWT_HC_cond6), nanmean(stdWT_PAT_cond6); ...
nanmean(stdWT_HC_cond7), nanmean(stdWT_PAT_cond7); ...
nanmean(stdWT_HC_cond8), nanmean(stdWT_PAT_cond8); ...
nanmean(stdWT_HC_cond9), nanmean(stdWT_PAT_cond9); ...
nanmean(stdWT_HC_cond10), nanmean(stdWT_PAT_cond10) ...
];

errY2 = [...
nanstd(stdWT_HC_cond6)/sqrt(HC_goodtrial_counter_cond6), nanstd(stdWT_PAT_cond6)/sqrt(pat_goodtrial_counter_cond6); ...
nanstd(stdWT_HC_cond7)/sqrt(HC_goodtrial_counter_cond7), nanstd(stdWT_PAT_cond7)/sqrt(pat_goodtrial_counter_cond7); ...
nanstd(stdWT_HC_cond8)/sqrt(HC_goodtrial_counter_cond8), nanstd(stdWT_PAT_cond8)/sqrt(pat_goodtrial_counter_cond8); ...
nanstd(stdWT_HC_cond9)/sqrt(HC_goodtrial_counter_cond9), nanstd(stdWT_PAT_cond9)/sqrt(pat_goodtrial_counter_cond9); ...
nanstd(stdWT_HC_cond10)/sqrt(HC_goodtrial_counter_cond10), nanstd(stdWT_PAT_cond10)/sqrt(pat_goodtrial_counter_cond10); ...
];

h = barwitherr(errY2, y_pitch2);% Plot with errorbars
set(gca,'XTickLabel',{'cond6','cond7','cond8','cond9','cond10'})
ylabel('WT mean variability (cents)')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('Noise Trials'));
axis([0.5 5.5 0 55])
goodplot

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/WT_stdev.pdf');

% anova WT mean and stdev
anova_data_MeanWT=horzcat(...
    MeanWT_HC_cond1, MeanWT_HC_cond2, ...
    MeanWT_HC_cond3, MeanWT_HC_cond4, ...
    MeanWT_HC_cond5, MeanWT_HC_cond6, ...
    MeanWT_HC_cond7, MeanWT_HC_cond8, ...    
    MeanWT_HC_cond9, MeanWT_HC_cond10, ...    
    MeanWT_PAT_cond1, MeanWT_PAT_cond2, ...
    MeanWT_PAT_cond3, MeanWT_PAT_cond4, ...
    MeanWT_PAT_cond5, MeanWT_PAT_cond6, ...
    MeanWT_PAT_cond7, MeanWT_PAT_cond8, ...    
    MeanWT_PAT_cond9, MeanWT_PAT_cond10); 

anova_data_stdWT=horzcat(...
    stdWT_HC_cond1, stdWT_HC_cond2, ...
    stdWT_HC_cond3, stdWT_HC_cond4, ...
    stdWT_HC_cond5, stdWT_HC_cond6, ...
    stdWT_HC_cond7, stdWT_HC_cond8, ...    
    stdWT_HC_cond9, stdWT_HC_cond10, ...    
    stdWT_PAT_cond1, stdWT_PAT_cond2, ...
    stdWT_PAT_cond3, stdWT_PAT_cond4, ...
    stdWT_PAT_cond5, stdWT_PAT_cond6, ...
    stdWT_PAT_cond7, stdWT_PAT_cond8, ...    
    stdWT_PAT_cond9, stdWT_PAT_cond10);    

test=ones(1,4*10);
test1=ones(1,11*10);
test2=test1*2;
subjectgroup_WT=[test test2];

trial=4;
%create conditions
condition_WT= cell(1,150);
for i=1:trial
    condition_WT{i} = 'cond1';
end
for i=trial+1:trial*2
    condition_WT{i}='cond2';
end
for i=trial*2+1:trial*3
    condition_WT{i}='cond3';
end
for i=trial*3+1:trial*4
    condition_WT{i}='cond4';
end
for i=trial*4+1:trial*5
    condition_WT{i}='cond5';
end
for i=trial*5+1:trial*6
    condition_WT{i}='cond6';
end
for i=trial*6+1:trial*7
    condition_WT{i}='cond7';
end
for i=trial*7+1:trial*8
    condition_WT{i}='cond8';
end
for i=trial*8+1:trial*9
    condition_WT{i}='cond9';
end
for i=trial*9+1:trial*10
    condition_WT{i}='cond10';
end
temp=trial*10;
trial2=11;

for i=41:trial*10+trial2
    condition_WT{i} = 'cond1';
end
for i=temp+trial2+1:temp+trial2*2
    condition_WT{i}='cond2';
end
for i=temp+trial2*2+1:temp+trial2*3
    condition_WT{i}='cond3';
end
for i=temp+trial2*3+1:temp+trial2*4
    condition_WT{i}='cond4';
end
for i=temp+trial2*4+1:temp+trial2*5
    condition_WT{i}='cond5';
end
for i=temp+trial2*5+1:temp+trial2*6
    condition_WT{i}='cond6';
end
for i=temp+trial2*6+1:temp+trial2*7
    condition_WT{i}='cond7';
end
for i=temp+trial2*7+1:temp+trial2*8
    condition_WT{i}='cond8';
end
for i=temp+trial2*8+1:temp+trial2*9
    condition_WT{i}='cond9';
end
for i=temp+trial2*9+1:temp+trial2*10
    condition_WT{i}='cond10';
end

condition_WT=condition_WT';
group1=[subjectgroup_WT];
group2=[condition_WT];

STATS.anova_data_MeanWT = anovan(anova_data_MeanWT,{group1 group2 },'model','interaction');
STATS.anova_data_stdWT = anovan(anova_data_stdWT,{group1 group2 },'model','interaction');

%WT ttests

ttest_data_MeanWT_HC_clear=horzcat(...
    MeanWT_HC_cond1, MeanWT_HC_cond2, ...
    MeanWT_HC_cond3, MeanWT_HC_cond4, ...
    MeanWT_HC_cond5);

ttest_data_MeanWT_HC_noise=horzcat(...
    MeanWT_HC_cond6, ...
    MeanWT_HC_cond7, MeanWT_HC_cond8, ...    
    MeanWT_HC_cond9, MeanWT_HC_cond10);

ttest_data_MeanWT_PAT_clear=horzcat(...
    MeanWT_PAT_cond1, MeanWT_PAT_cond2, ...
    MeanWT_PAT_cond3, MeanWT_PAT_cond4, ...
    MeanWT_PAT_cond5);

ttest_data_MeanWT_PAT_noise=horzcat(...
    MeanWT_PAT_cond6, ...
    MeanWT_PAT_cond7, MeanWT_PAT_cond8, ...    
    MeanWT_PAT_cond9, MeanWT_PAT_cond10);

% WT stdev
ttest_data_stdWT_HC_clear=horzcat(...
    stdWT_HC_cond1, stdWT_HC_cond2, ...
    stdWT_HC_cond3, stdWT_HC_cond4, ...
    stdWT_HC_cond5);

ttest_data_stdWT_HC_noise=horzcat(...
    stdWT_HC_cond6, ...
    stdWT_HC_cond7, stdWT_HC_cond8, ...    
    stdWT_HC_cond9, stdWT_HC_cond10);

ttest_data_stdWT_PAT_clear=horzcat(...
    stdWT_PAT_cond1, stdWT_PAT_cond2, ...
    stdWT_PAT_cond3, stdWT_PAT_cond4, ...
    stdWT_PAT_cond5);

ttest_data_stdWT_PAT_noise=horzcat(...
    stdWT_PAT_cond6, ...
    stdWT_PAT_cond7, stdWT_PAT_cond8, ...    
    stdWT_PAT_cond9, stdWT_PAT_cond10);

STATS.ttestpatvHC_meanWT=ttest2(anova_data_MeanWT(1:40),anova_data_MeanWT(41:end))
STATS.ttestpat_clVnoise_meanWT=ttest(ttest_data_MeanWT_PAT_clear, ttest_data_MeanWT_PAT_noise)
STATS.ttestHC_clVnoise_meanWT=ttest(ttest_data_MeanWT_HC_clear, ttest_data_MeanWT_HC_noise)
STATS.ttestpat_clVnoise_stdWT=ttest(ttest_data_stdWT_PAT_clear, ttest_data_stdWT_PAT_noise)
STATS.ttestHC_clVnoise_stdWT=ttest(ttest_data_stdWT_HC_clear, ttest_data_stdWT_HC_noise)


% random factor
% STATS.anova_data_MeanWT = anovan(anova_data_MeanWT,{group1 group2 },'model','interaction');


cd(cerebellar_data_rootdir)
cd LFP_STATS/
save STATS STATS
