%% called from E_calcfromlowpass
% 1. calculate mean across trial dist for clear and noise trials - on
% individual trial


GpMean_AcT.HC_clear=nanmean(HC_alltrials_clear);
GpMean_AcT.HC_noise=nanmean(HC_alltrials_noise);
GpMean_AcT.PAT_clear=nanmean(PAT_alltrials_clear);
GpMean_AcT.PAT_noise=nanmean(PAT_alltrials_noise);

%anova
GpMean_AcT.HC_clear_horz=horzcat(...
    nanmean(HC_data_distlowpass(1).data), nanmean(HC_data_distlowpass(2).data), nanmean(HC_data_distlowpass(3).data), ...
    nanmean(HC_data_distlowpass(4).data), nanmean(HC_data_distlowpass(5).data));

GpMean_AcT.HC_noise_horz=horzcat(...
    nanmean(HC_data_distlowpass(6).data), nanmean(HC_data_distlowpass(7).data), nanmean(HC_data_distlowpass(8).data), ...
    nanmean(HC_data_distlowpass(9).data), nanmean(HC_data_distlowpass(10).data));

GpMean_AcT.PAC_clear_horz=horzcat(...
    nanmean(Pat_data_distlowpass(1).data), nanmean(Pat_data_distlowpass(2).data), nanmean(Pat_data_distlowpass(3).data), ...
    nanmean(Pat_data_distlowpass(4).data), nanmean(Pat_data_distlowpass(5).data));

GpMean_AcT.PAC_noise_horz=horzcat(...
    nanmean(Pat_data_distlowpass(6).data), nanmean(Pat_data_distlowpass(7).data), nanmean(Pat_data_distlowpass(8).data), ...
    nanmean(Pat_data_distlowpass(9).data), nanmean(Pat_data_distlowpass(10).data));

anovadata_GpMean_AcT=[GpMean_AcT.HC_clear_horz GpMean_AcT.HC_noise_horz GpMean_AcT.PAC_clear_horz GpMean_AcT.PAC_noise_horz];

%create subject group
test=ones(1,3755*2);
test2=test*2;
subjectgroup=[test test2];

%create condition group
condition = cell(1,3755*4);
for i=1:3755
    condition{i}='clear';
end
for i=3756:3755*2
    condition{i}='noise';
end
for i=7511:3755*3
    condition{i}='clear';
end
for i=11266:3755*4
    condition{i}='noise';
end
condition=condition';

group1=[subjectgroup];
group2=[condition];

% not significant
%[~,~,stats] = anovan(anovadata_GpMean_AcT,{group1 group2},'model','interaction','varnames',{'subjectgroup' 'condition'});
% significant
%[pvals,tbl,stats] = anovan(anova_data_WTstdev,{group1 group2}, 'model','interaction','varnames',{'subjectgroup' 'condition'});
STATS.anova_data_AcTmean = anovan(anovadata_GpMean_AcT,{group1 group2},'random',1, 'model','interaction','varnames',{'subjectgroup' 'condition'});
STATS.anova_data_AcTmean = anovan(anovadata_GpMean_AcT,{group1 group2}, 'model','interaction','varnames',{'subjectgroup' 'condition'});


figure
subplot(211)
plot(GpMean_AcT.HC_clear)
hold on
plot(GpMean_AcT.HC_noise, 'm')
axis([0 800 -100 50])
title('HCs - Mean Distance AcT')
goodplot
% ttest(GpMean_AcT.HC_clear, GpMean_AcT.HC_noise)
% ttest(GpMean_AcT.PAT_clear, GpMean_AcT.PAT_noise)

subplot(212)
plot(GpMean_AcT.PAT_clear)
hold on
plot(GpMean_AcT.PAT_noise, 'm')
axis([0 800 -100 50])
title('Patients - Mean Distance AcT')
goodplot
