%% All conditions separately
% ACROSS TRIAL: takes individual dist from LPF data and calulate and plot means
% all conditions separately

for icond=1:10
    pat_goodtrial_counter(icond)=0;
    for itrial=1:size(Pat_data_distlowpass(icond).data,1)
        if sum(isnan(Pat_data_distlowpass(icond).data(itrial,:)))<750
            pat_goodtrial_counter(icond)=pat_goodtrial_counter(icond)+1;
        end
    end
end

for icond=1:10
    HC_goodtrial_counter(icond)=0;
    for itrial=1:size(HC_data_distlowpass(icond).data,1)
        if sum(isnan(HC_data_distlowpass(icond).data(itrial,:)))<750
            HC_goodtrial_counter(icond)=HC_goodtrial_counter(icond)+1;
        end
    end
end

for icond=1:10
    fraction_gd_pats(icond)=(pat_goodtrial_counter(icond)/(numpats*8))*100;
    goodtrials_pat(icond)=pat_goodtrial_counter(icond); % use this as N for SEM
    fraction_gd_HCs(icond)=(HC_goodtrial_counter(icond)/(numHCs*8))*100;
    goodtrials_HC(icond)=HC_goodtrial_counter(icond); % use this as N for SEM
end

% ACROSS TRIAL mean, std and SEMs by condition
for cond=1:10
    Pats_groupmean(cond).data=nanmean(Pat_data_distlowpass(cond).data);
    Pats_groupstd(cond).data=nanstd(Pat_data_distlowpass(cond).data);
    Pats_groupSEM(cond).data=Pats_groupstd(cond).data/sqrt(goodtrials_pat(cond));
    Pats_groupSEM_forplot_pos(cond).data=Pats_groupmean(cond).data+Pats_groupSEM(cond).data;
    Pats_groupSEM_forplot_neg(cond).data=Pats_groupmean(cond).data-Pats_groupSEM(cond).data;
    
    HCs_groupmean(cond).data=nanmean(HC_data_distlowpass(cond).data);
    HCs_groupstd(cond).data=nanstd(HC_data_distlowpass(cond).data);
    HCs_groupSEM(cond).data=HCs_groupstd(cond).data/sqrt(goodtrials_HC(cond));
    HCs_groupSEM_forplot_pos(cond).data=HCs_groupmean(cond).data+HCs_groupSEM(cond).data;
    HCs_groupSEM_forplot_neg(cond).data=HCs_groupmean(cond).data-HCs_groupSEM(cond).data;
end

% plot with SEM also
figure
for cond=1:10
    subplot(2,5, cond)
    plot(frame_taxis_to_use(1:751), Pats_groupSEM_forplot_pos(cond).data,'k', 'LineWidth',0.5)
    hold on
    plot(frame_taxis_to_use(1:751), Pats_groupSEM_forplot_neg(cond).data,'k', 'LineWidth',0.5)
    plot(frame_taxis_to_use(1:751), Pats_groupmean(cond).data, ...
        'b','LineWidth',1,'Color',[patient_colour]);
    axis([0 3 0 150])
    goodplot_wide
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/Fig4e.pdf');


for icond=1:10
    subplot(5,2, icond)
a=stdAcT_PAT(icond,:)+SEM_AcT_HC(icond,:);
b=stdAcT_PAT(icond,:)-SEM_AcT_HC(icond,:);
x=frame_taxis_to_use(1:981);
[ph,msg]=jbfill(x,a,b,'k','k',0,0.3)
hold on
plot(frame_taxis_to_use(1:981),MeanAcT_PAT(icond,:), 'k','LineWidth',2)    
end





figure
for cond=1:10
    subplot(2,5, cond)
    plot(frame_taxis_to_use(1:751), HCs_groupSEM_forplot_pos(cond).data,'k', 'LineWidth',0.5)
    hold on
    plot(frame_taxis_to_use(1:751), HCs_groupSEM_forplot_pos(cond).data,'k', 'LineWidth',0.5)
    plot(frame_taxis_to_use(1:751), HCs_groupmean(cond).data, ...
        'b','LineWidth',1,'Color',[HC_colour]);
    axis([0 3 -20 20])
    goodplot_wide
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/Fig4f.pdf');

% plot patients and HCs on same graph
figure
for cond=1:10
subplot(2,5, cond)
plot(frame_taxis_to_use(1:751), HCs_groupmean(cond).data, ...
    'b','LineWidth',1,'Color',[HC_colour]);
%    'b','LineWidth',1,'Color',[HC_colour],'LineStyle','--');
hold
plot(frame_taxis_to_use(1:751), HCs_groupmean(cond).data, ...
    'b','LineWidth',1,'Color',[HC_colour]);

ylabel('Variability (cents)');
xlabel('Time (seconds)');
axis([0 2.5 -100 50])
goodplot_wide
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/Fig4a.pdf');


figure
for cond=1:10
subplot(2,5, cond)
plot(frame_taxis_to_use(1:751), Pats_groupstd(cond).data,'b','LineWidth',1,'Color',[patient_colour]);
hold on
plot(frame_taxis_to_use(1:751), HCs_groupstd(cond).data, 'b','LineWidth',1,'Color',[HC_colour]);
ylabel('Variability (cents)');
xlabel('Time (seconds)');
axis([0 2.5 -50 200])
goodplot_wide
end
print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/Fig4b.pdf');

% reshape data for anova
%horzcat(Pat_data_distlowpass(cond).data(1,:)

anovadata_pats_cond1=Pat_data_distlowpass(1).data(1,:);
anovadata_pats_cond2=Pat_data_distlowpass(2).data(1,:);
anovadata_pats_cond3=Pat_data_distlowpass(3).data(1,:);
anovadata_pats_cond4=Pat_data_distlowpass(4).data(1,:);
anovadata_pats_cond5=Pat_data_distlowpass(5).data(1,:);
anovadata_pats_cond6=Pat_data_distlowpass(6).data(1,:);
anovadata_pats_cond7=Pat_data_distlowpass(7).data(1,:);
anovadata_pats_cond8=Pat_data_distlowpass(8).data(1,:);
anovadata_pats_cond9=Pat_data_distlowpass(9).data(1,:);
anovadata_pats_cond10=Pat_data_distlowpass(10).data(1,:);

for i = 2:16 %length(patients_included)
        dataToAppend_cond1 = Pat_data_distlowpass(1).data(i,:);
        dataToAppend_cond2 = Pat_data_distlowpass(2).data(i,:);
        dataToAppend_cond3 = Pat_data_distlowpass(3).data(i,:);
        dataToAppend_cond4 = Pat_data_distlowpass(4).data(i,:);
        dataToAppend_cond5 = Pat_data_distlowpass(5).data(i,:);
        dataToAppend_cond6 = Pat_data_distlowpass(6).data(i,:);
        dataToAppend_cond7 = Pat_data_distlowpass(7).data(i,:);
        dataToAppend_cond8 = Pat_data_distlowpass(8).data(i,:);
        dataToAppend_cond9 = Pat_data_distlowpass(9).data(i,:);
        dataToAppend_cond10 = Pat_data_distlowpass(10).data(i,:);
        anovadata_pats_cond1 = [anovadata_pats_cond1 dataToAppend_cond1];
        anovadata_pats_cond2 = [anovadata_pats_cond2 dataToAppend_cond2];
        anovadata_pats_cond3 = [anovadata_pats_cond3 dataToAppend_cond3];
        anovadata_pats_cond4 = [anovadata_pats_cond4 dataToAppend_cond4];
        anovadata_pats_cond5 = [anovadata_pats_cond5 dataToAppend_cond5];
        anovadata_pats_cond6 = [anovadata_pats_cond6 dataToAppend_cond6];
        anovadata_pats_cond7 = [anovadata_pats_cond7 dataToAppend_cond7];
        anovadata_pats_cond8 = [anovadata_pats_cond8 dataToAppend_cond8];
        anovadata_pats_cond9 = [anovadata_pats_cond9 dataToAppend_cond9];
        anovadata_pats_cond10 = [anovadata_pats_cond10 dataToAppend_cond10];
        
end

anovadata_HCs_cond1=HC_data_distlowpass(1).data(1,:);
anovadata_HCs_cond2=HC_data_distlowpass(2).data(1,:);
anovadata_HCs_cond3=HC_data_distlowpass(3).data(1,:);
anovadata_HCs_cond4=HC_data_distlowpass(4).data(1,:);
anovadata_HCs_cond5=HC_data_distlowpass(5).data(1,:);
anovadata_HCs_cond6=HC_data_distlowpass(6).data(1,:);
anovadata_HCs_cond7=HC_data_distlowpass(7).data(1,:);
anovadata_HCs_cond8=HC_data_distlowpass(8).data(1,:);
anovadata_HCs_cond9=HC_data_distlowpass(9).data(1,:);
anovadata_HCs_cond10=HC_data_distlowpass(10).data(1,:);

for i = 2:11 %length(HCients_included)
        dataToAppend_cond1 = HC_data_distlowpass(1).data(i,:);
        dataToAppend_cond2 = HC_data_distlowpass(2).data(i,:);
        dataToAppend_cond3 = HC_data_distlowpass(3).data(i,:);
        dataToAppend_cond4 = HC_data_distlowpass(4).data(i,:);
        dataToAppend_cond5 = HC_data_distlowpass(5).data(i,:);
        dataToAppend_cond6 = HC_data_distlowpass(6).data(i,:);
        dataToAppend_cond7 = HC_data_distlowpass(7).data(i,:);
        dataToAppend_cond8 = HC_data_distlowpass(8).data(i,:);
        dataToAppend_cond9 = HC_data_distlowpass(9).data(i,:);
        dataToAppend_cond10 = HC_data_distlowpass(10).data(i,:);
        anovadata_HCs_cond1 = [anovadata_HCs_cond1 dataToAppend_cond1];
        anovadata_HCs_cond2 = [anovadata_HCs_cond2 dataToAppend_cond2];
        anovadata_HCs_cond3 = [anovadata_HCs_cond3 dataToAppend_cond3];
        anovadata_HCs_cond4 = [anovadata_HCs_cond4 dataToAppend_cond4];
        anovadata_HCs_cond5 = [anovadata_HCs_cond5 dataToAppend_cond5];
        anovadata_HCs_cond6 = [anovadata_HCs_cond6 dataToAppend_cond6];
        anovadata_HCs_cond7 = [anovadata_HCs_cond7 dataToAppend_cond7];
        anovadata_HCs_cond8 = [anovadata_HCs_cond8 dataToAppend_cond8];
        anovadata_HCs_cond9 = [anovadata_HCs_cond9 dataToAppend_cond9];
        anovadata_HCs_cond10 = [anovadata_HCs_cond10 dataToAppend_cond10];
        
end

% anova conditions modeled separately
anovadata=[anovadata_HCs_cond1 anovadata_HCs_cond2 anovadata_HCs_cond3 ...
           anovadata_HCs_cond4 anovadata_HCs_cond5 anovadata_HCs_cond6 ...
           anovadata_HCs_cond7 anovadata_HCs_cond8 anovadata_HCs_cond9 ...
           anovadata_HCs_cond10 anovadata_pats_cond1 anovadata_pats_cond2 ...
           anovadata_pats_cond3 anovadata_pats_cond4 anovadata_pats_cond5 ...
           anovadata_pats_cond6 anovadata_pats_cond7 anovadata_pats_cond8 ... 
           anovadata_pats_cond9 anovadata_pats_cond10];

HC=8261;
PAT=12016;
%create subject group
test=ones(1,HC*10);
test2=ones(1,PAT*10);
test2=test2*2;
subjectgroup=[test test2];

%create condition group
% cond_length_HC=41305;
% cond_length_pat=60080;
condition = cell(1,202770);
for i=1:HC
    condition{i}='cond1';
end
for i=HC+1:HC*2
    condition{i}='cond2';
end
for i=HC*2+1:HC*3
    condition{i}='cond3';
end
for i=HC*3+1:HC*4
    condition{i}='cond4';
end
for i=HC*4+1:HC*5
    condition{i}='cond5';
end
for i=HC*5+1:HC*6
    condition{i}='cond6';
end
for i=HC*6+1:HC*7
    condition{i}='cond7';
end
for i=HC*7+1:HC*8
    condition{i}='cond8';
end
for i=HC*8+1:HC*9
    condition{i}='cond9';
end
for i=HC*9+1:HC*10
    condition{i}='cond10';
end

Pat_start=HC*10;

for i=Pat_start+1:Pat_start+PAT
    condition{i}='cond1';
end
for i=Pat_start+PAT+1:Pat_start+(PAT*2)
    condition{i}='cond2';
end
for i=Pat_start+(PAT*2)+1:Pat_start+(PAT*3)
    condition{i}='cond3';
end
for i=Pat_start+(PAT*3)+1:Pat_start+(PAT*4)
    condition{i}='cond4';
end
for i=Pat_start+(PAT*4)+1:Pat_start+(PAT*5)
    condition{i}='cond5';
end
for i=Pat_start+(PAT*5)+1:Pat_start+(PAT*6)
    condition{i}='cond6';
end
for i=Pat_start+(PAT*2)+1:Pat_start+(PAT*7)
    condition{i}='cond7';
end
for i=Pat_start+(PAT*6)+1:Pat_start+(PAT*8)
    condition{i}='cond8';
end
for i=Pat_start+(PAT*7)+1:Pat_start+(PAT*9)
    condition{i}='cond9';
end
for i=Pat_start+(PAT*8)+1:Pat_start+(PAT*10)
    condition{i}='cond10';
end

condition=condition';
group1=[subjectgroup];
group2=[condition];
p = anovan(anovadata,{group1 group2},'model','interaction')

