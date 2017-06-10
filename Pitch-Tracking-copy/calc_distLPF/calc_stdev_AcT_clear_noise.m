%% called from E_calcfromlowpass

% 2. calculate stdev across trial dist for clear and noise trials
GpStd_AcT.HC_clear=nanstd(HC_alltrials_clear);
GpStd_AcT.HC_noise=nanstd(HC_alltrials_noise);
GpStd_AcT.PAT_clear=nanstd(PAT_alltrials_clear);
GpStd_AcT.PAT_noise=nanstd(PAT_alltrials_noise);

figure
subplot(211)
plot(GpStd_AcT.HC_clear)
hold on
plot(GpStd_AcT.HC_noise, 'm')
axis([0 800 -100 50])
title('HCs - Stdev Distance AcT')
goodplot
% ttest(GpStd_AcT.HC_clear, GpStd_AcT.HC_noise)
% ttest(GpStd_AcT.PAT_clear, GpStd_AcT.PAT_noise)

subplot(212)
plot(GpStd_AcT.PAT_clear)
hold on
plot(GpStd_AcT.PAT_noise, 'm')
axis([0 800 -100 50])
title('Patients - Stdev Distance AcT')
goodplot

%anova
GpStd_AcT.HC_clear_horz=horzcat(...
    nanstd(HC_data_distlowpass(1).data), nanstd(HC_data_distlowpass(2).data), nanstd(HC_data_distlowpass(3).data), ...
    nanstd(HC_data_distlowpass(4).data), nanstd(HC_data_distlowpass(5).data));

GpStd_AcT.HC_noise_horz=horzcat(...
    nanstd(HC_data_distlowpass(6).data), nanstd(HC_data_distlowpass(7).data), nanstd(HC_data_distlowpass(8).data), ...
    nanstd(HC_data_distlowpass(9).data), nanstd(HC_data_distlowpass(10).data));

GpStd_AcT.PAC_clear_horz=horzcat(...
    nanstd(Pat_data_distlowpass(1).data), nanstd(Pat_data_distlowpass(2).data), nanstd(Pat_data_distlowpass(3).data), ...
    nanstd(Pat_data_distlowpass(4).data), nanstd(Pat_data_distlowpass(5).data));

GpStd_AcT.PAC_noise_horz=horzcat(...
    nanstd(Pat_data_distlowpass(6).data), nanstd(Pat_data_distlowpass(7).data), nanstd(Pat_data_distlowpass(8).data), ...
    nanstd(Pat_data_distlowpass(9).data), nanstd(Pat_data_distlowpass(10).data));


anovadata_GpStd_AcT=[GpStd_AcT.HC_clear_horz GpStd_AcT.HC_noise_horz GpStd_AcT.PAC_clear_horz GpStd_AcT.PAC_noise_horz];

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
%[~,~,stats] = anovan(anovadata_GpStd_AcT,{group1 group2}, 'model','interaction','varnames',{'subjectgroup' 'condition'});

% significant
%[~,~,stats] = anovan(anovadata_GpStd_AcT,{group1 group2},'random',1, 'model','interaction','varnames',{'subjectgroup' 'condition'});
STATS.anova_data_AcTstd=anovan(anovadata_GpStd_AcT,{group1 group2},'random',1, 'model','interaction','varnames',{'subjectgroup' 'condition'});
