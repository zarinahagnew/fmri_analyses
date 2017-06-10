set_params_pitchtracking
cd /Users/zagnew/Cereb_data/data_final_run
load DATA; 
load DATA_TO_USE
DATA=DATA_TO_USE
% 
% for isubj=1:18
%     figure
%     for icond=1:10
%         subplot(2,5,icond)
%         plot(frame_taxis(1:1360),DATA(isubj).cond(icond).distfromtarg_WT)
%         axis([0 4 -100 1000])
%         goodplot
%     end
% %     pause
% %     close
% end



% create early and late time windows
start_EW=stepframe;
end_EW=stepframe+300;
start_LW=end_EW;
end_LW=start_LW+300;
step_time;
framestosecs=(frame_num)/frame_fs;

% plot time windows
figure
line1=zeros(1,1360); 
line1(start_EW:end_EW)= 1;
line1(start_LW:end_LW)= 2;
line1=line1*100;
plot(frame_taxis(1:1360),line1, 'm')
axis([0 4 0 300])


% remove infs and replace with nans
for isubj=1:length(allincluded)
    for cond=1:10
        data=DATA(isubj).cond(cond).distfromtarg_WT(start_EW:end_EW);
        data(isinf(data)) = nan;
        DATA(isubj).cond(cond).distfromtarg_WT(start_EW:end_EW)=data;    
    
        data2=DATA(isubj).cond(cond).distfromtarg_WT(start_LW:end_LW);
        data2(isinf(data2)) = nan;
        DATA(isubj).cond(cond).distfromtarg_WT(start_LW:end_LW)=data2;
    end
end



for isubj=1:length(allincluded)
    for cond=1:10
        EW_distfromtarg(isubj).cond(cond)=nanmean(DATA(isubj).cond(cond).distfromtarg_WT(start_EW:end_EW));
        LW_distfromtarg(isubj).cond(cond)=nanmean(DATA(isubj).cond(cond).distfromtarg_WT(start_LW:end_LW));            
    end
end

% 
% 
% %% check each subject visually (comment out for speed)
% cond=2
% for isubj=1:10
% figure
% goodplot
% subplot(223)
% plot(DATA(isubj).cond(cond).distfromtarg_WT)
% axis([0 1500 0 400])
% subplot(221)
% plot(DATA(isubj).cond(cond).distfromtarg_WT(start_EW:end_EW),'m');
% axis([0 1500 0 400])
% subplot(222)
% plot(DATA(isubj).cond(cond).distfromtarg_WT(start_LW:end_LW),'m');
% axis([0 1500 0 400])
% 
% subplot(224)
% bar(1,nanmean(DATA(isubj).cond(cond).distfromtarg_WT))
% hold
% bar(2,nanmean(DATA(isubj).cond(cond).distfromtarg_WT(start_EW:end_EW)))
% bar(3, nanmean(DATA(isubj).cond(cond).distfromtarg_WT(start_LW:end_LW)))
% axis([0.5 3.5 0 400])
% end
% 
% for isubj=11:18
% figure
% goodplot
% subplot(223)
% plot(DATA(isubj).cond(cond).distfromtarg_WT)
% axis([0 1500 0 400])
% subplot(221)
% plot(DATA(isubj).cond(cond).distfromtarg_WT(start_EW:end_EW),'k');
% axis([0 1500 0 400])
% subplot(222)
% plot(DATA(isubj).cond(cond).distfromtarg_WT(start_LW:end_LW),'k');
% axis([0 1500 0 400])
% 
% subplot(224)
% bar(1,nanmean(DATA(isubj).cond(cond).distfromtarg_WT),'k')
% hold
% bar(2,nanmean(DATA(isubj).cond(cond).distfromtarg_WT(start_EW:end_EW)),'k')
% bar(3, nanmean(DATA(isubj).cond(cond).distfromtarg_WT(start_LW:end_LW)),'k')
% axis([0.5 3.5 0 400])
% end
% % 
% % for isubj=1:11
% % figure
% % for cond=1:10    
% % bar(cond,nanmean(DATA(isubj).cond(cond).distfromtarg_WT))
% % hold on
% % end
% % end




%% calc means for E and LW
for isubj=1:length(allincluded)
    EW_distfromtarg_clear(isubj)=nanmean(EW_distfromtarg(isubj).cond(1:5));
    EW_distfromtarg_noise(isubj)=nanmean(EW_distfromtarg(isubj).cond(6:10));
    EW_distfromtarg_clear_sem(isubj)=nanstd(EW_distfromtarg(isubj).cond(1:5))/sqrt(length(EW_distfromtarg(isubj).cond(1:5)));
    EW_distfromtarg_noise_sem(isubj)=nanstd(EW_distfromtarg(isubj).cond(6:10))/sqrt(length(EW_distfromtarg(isubj).cond(1:5)));

    LW_distfromtarg_clear(isubj)=nanmean(LW_distfromtarg(isubj).cond(1:5));
    LW_distfromtarg_noise(isubj)=nanmean(LW_distfromtarg(isubj).cond(6:10));
    LW_distfromtarg_clear_sem(isubj)=nanstd(LW_distfromtarg(isubj).cond(1:5))/sqrt(length(LW_distfromtarg(isubj).cond(1:5)));
    LW_distfromtarg_noise_sem(isubj)=nanstd(LW_distfromtarg(isubj).cond(6:10))/sqrt(length(EW_distfromtarg(isubj).cond(1:5)));
        
end

EW_distfromtarg_clear_patients=nanmean(EW_distfromtarg_clear(1:numpats));
EW_distfromtarg_noise_patients=nanmean(EW_distfromtarg_noise(1:numpats));
EW_distfromtarg_clear_controls=nanmean(EW_distfromtarg_clear(numpats+1:end));
EW_distfromtarg_noise_controls=nanmean(EW_distfromtarg_noise(numpats+1:end));

EW_distfromtarg_clear_patients_sem=nanstd(EW_distfromtarg_clear(1:numpats)/sqrt(numpats));
EW_distfromtarg_noise_patients_sem=nanstd(EW_distfromtarg_noise(1:numpats)/sqrt(numpats));
EW_distfromtarg_clear_controls_sem=nanstd(EW_distfromtarg_clear(numpats+1:end)/sqrt(numHCs));
EW_distfromtarg_noise_controls_sem=nanstd(EW_distfromtarg_noise(numpats+1:end)/sqrt(numHCs));

LW_distfromtarg_clear_patients=nanmean(LW_distfromtarg_clear(1:numpats));
LW_distfromtarg_noise_patients=nanmean(LW_distfromtarg_noise(1:numpats));
LW_distfromtarg_clear_controls=nanmean(LW_distfromtarg_clear(numpats+1:end));
LW_distfromtarg_noise_controls=nanmean(LW_distfromtarg_noise(numpats+1:end));

LW_distfromtarg_clear_patients_sem=nanstd(LW_distfromtarg_clear(1:numpats)/sqrt(numpats));
LW_distfromtarg_noise_patients_sem=nanstd(LW_distfromtarg_noise(1:numpats)/sqrt(numpats));
LW_distfromtarg_clear_controls_sem=nanstd(LW_distfromtarg_clear(numpats+1:end)/sqrt(numHCs));
LW_distfromtarg_noise_controls_sem=nanstd(LW_distfromtarg_noise(numpats+1:end)/sqrt(numHCs));



%% plot E and LW for each subject by condition
% 
% for isubj=1:18
%     figure
%     for icond=1:2
%                
%         distfromtarg=[EW_distfromtarg_clear; EW_distfromtarg_noise]
%         subplot(2,1,1) 
%         bar(1,distfromtarg(1,isubj))
%         hold on
%         bar(2,distfromtarg(2,isubj))
%         axis([0 3 -100 700])
%         
%         subplot(2,1,2)
%         bar(1,distfromtarg(2,isubj))
%         hold on
%         bar(2,distfromtarg(2,isubj))
%         axis([0 3 -100 700])
%     end
% %     pause
% %     close
% end

% figure
% whitebg('white')
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'Distance from target', ...
%     'EdgeColor', 'none', ...
%     'HorizontalAlignment', 'center')
% 
% distfromtarg=[EW_distfromtarg_clear_controls EW_distfromtarg_clear_patients;EW_distfromtarg_noise_controls EW_distfromtarg_noise_patients; ...
%     LW_distfromtarg_clear_controls LW_distfromtarg_clear_patients;LW_distfromtarg_noise_controls LW_distfromtarg_noise_patients];
% errY2 = [EW_distfromtarg_clear_controls_sem EW_distfromtarg_clear_patients_sem;EW_distfromtarg_noise_controls_sem EW_distfromtarg_noise_patients_sem; ...
%     LW_distfromtarg_clear_controls_sem LW_distfromtarg_clear_patients_sem;LW_distfromtarg_noise_controls_sem LW_distfromtarg_noise_patients_sem];
% 
% 
% h = barwitherr(errY2, distfromtarg);% Plot with errorbars
% set(gca,'XTickLabel',{'Clear','Masked','Clear','Masked'})
% ylabel('Distance from target')
% set(h(1),'FaceColor',hc_colour,'EdgeColor', hc_colour ,'LineWidth',1.5);
% set(h(2),'FaceColor',pat_colour,'EdgeColor', pat_colour ,'LineWidth',1.5);
% goodplot
% legend('controls', 'patients')
% print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Group Variability_bar.pdf');
% 

%% final figure
distfromtarg_EW_controls=[EW_distfromtarg_clear_controls EW_distfromtarg_noise_controls];
distfromtarg_EW_patients=[EW_distfromtarg_clear_patients EW_distfromtarg_noise_patients];
distfromtarg_LW_controls=[LW_distfromtarg_clear_controls LW_distfromtarg_noise_controls];
distfromtarg_LW_patients=[LW_distfromtarg_clear_patients LW_distfromtarg_noise_patients];

err_EW_controls=[EW_distfromtarg_clear_controls_sem EW_distfromtarg_noise_controls_sem];
err_EW_patients=[EW_distfromtarg_clear_patients_sem EW_distfromtarg_noise_patients_sem];
err_LW_controls=[LW_distfromtarg_clear_controls_sem LW_distfromtarg_noise_controls_sem];
err_LW_patients=[LW_distfromtarg_clear_patients_sem LW_distfromtarg_noise_patients_sem];

figure
subplot(221)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Distance from target', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
h = barwitherr(err_EW_controls, distfromtarg_EW_controls);% Plot with errorbars
set(gca,'XTickLabel',{'clear','masked'})
ylabel('Distance from target')
set(h(1),'FaceColor',hc_colour,'EdgeColor', hc_colour ,'LineWidth',1.5);
goodplot
axis([0.5 2.5 0 400])

subplot(222)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Distance from target', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
h = barwitherr(err_EW_patients, distfromtarg_EW_patients);% Plot with errorbars
set(gca,'XTickLabel',{'clear','masked'})
set(h(1),'FaceColor',pat_colour,'EdgeColor', pat_colour ,'LineWidth',1.5);
goodplot
axis([0.5 2.5 0 400])

subplot(223)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Distance from target', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
h = barwitherr(err_LW_controls, distfromtarg_LW_controls);% Plot with errorbars
set(gca,'XTickLabel',{'clear','masked'})
set(h(1),'FaceColor',hc_colour,'EdgeColor', hc_colour ,'LineWidth',1.5);
goodplot
axis([0.5 2.5 0 400])

subplot(224)
whitebg('white')
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'Distance from target', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')
h = barwitherr(err_LW_patients, distfromtarg_LW_patients);% Plot with errorbars
set(gca,'XTickLabel',{'clear','masked'})
set(h(1),'FaceColor',pat_colour,'EdgeColor', pat_colour ,'LineWidth',1.5);
goodplot
axis([0.5 2.5 0 400])


legend('clear', 'noise')

subplot(212)
distfromtarg_LW=[LW_distfromtarg_clear_controls LW_distfromtarg_noise_controls; LW_distfromtarg_clear_patients LW_distfromtarg_noise_patients];
err_LW=[LW_distfromtarg_clear_controls_sem LW_distfromtarg_noise_controls_sem; LW_distfromtarg_clear_patients_sem LW_distfromtarg_noise_patients_sem];    
h = barwitherr(err_LW, distfromtarg_LW);% Plot with errorbars
set(gca,'XTickLabel',{'controls LW','patients LW'})
ylabel('Distance from target')
set(h(1),'FaceColor','w','EdgeColor', hc_colour ,'LineWidth',2.5);
set(h(2),'FaceColor','w','EdgeColor', pat_colour ,'LineWidth',2.5);
goodplot
legend('clear', 'noise')

axis([0.5 2.5 0 400])

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Cereb_data/data_final_run/figures/Distancefromtarg_bar.pdf');







%% anova
anovandata_distfromtarg=[...
    EW_distfromtarg_clear(1:numpats) EW_distfromtarg_noise(1:numpats) LW_distfromtarg_clear(1:numpats) LW_distfromtarg_noise(1:numpats) ...
    EW_distfromtarg_clear(numpats+1:end) EW_distfromtarg_noise(numpats+1:end) LW_distfromtarg_clear(numpats+1:end) LW_distfromtarg_noise(numpats+1:end)];

%create condition group
condition=[ones(1,10) ones(1,10)*2 ones(1,10) ones(1,10)*2 ones(1,8) ones(1,8)*2 ones(1,8) ones(1,8)*2];

% create timewindow group
timewindow=[ones(1,10) ones(1,10) ones(1,10)*2 ones(1,10)*2 ones(1,8) ones(1,8) ones(1,8)*2 ones(1,8)*2];

% create group group
group=[ones(1,40) ones(1,8*4)*2]; 

distfromtarg.factor1_condition=[condition];
distfromtarg.factor2_timewindows=[timewindow];
distfromtarg.factor3_group=[group];

[distfromtarg.p_interaction,distfromtarg.table,distfromtarg.stats,distfromtarg.terms]= anovan(anovandata_distfromtarg,{distfromtarg.factor1_condition distfromtarg.factor2_timewindows distfromtarg.factor3_group},'full')

save /Users/zagnew/Cereb_data/data_final_run/GroupData/stats/distfromtarg distfromtarg


%% withing group anova
anovandata_distfromtarg_controls=[EW_distfromtarg_clear(numpats+1:end) EW_distfromtarg_noise(numpats+1:end) LW_distfromtarg_clear(numpats+1:end) LW_distfromtarg_noise(numpats+1:end)];

%create condition group
condition=[ones(1,8) ones(1,8)*2]
condition=[condition condition]

% create timewindow group
timewindow=[ones(1,16) ones(1,16)*2];

distfromtarg_controls.factor1_condition=[condition];
distfromtarg_controls.factor2_timewindows=[timewindow];

[distfromtarg_controls.p_interaction,distfromtarg_controls.table,distfromtarg_controls.stats,distfromtarg.terms]= ...
    anovan(anovandata_distfromtarg_controls,{distfromtarg_controls.factor1_condition distfromtarg_controls.factor2_timewindows},'full')

save /Users/zagnew/Cereb_data/data_final_run/GroupData/stats/distfromtarg_controls distfromtarg_controls


ttest2=

