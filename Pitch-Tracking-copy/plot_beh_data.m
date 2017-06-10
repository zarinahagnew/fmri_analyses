clear all
close all
set_params_pitchtracking;
cd (cerebellar_data_rootdir)

%load gaps

patientaxis=ones(1, 16);
HCaxis=ones(1,11);
HCaxis=HCaxis*2;

markersize=ones(1,28);
markersize=markersize*30

% gaps in voicing
gaps_in_voicing_patients=xlsread('behdataformatlab','D1:D17')
gaps_in_voicing_HCs=xlsread('behdataformatlab','D18:D28')

fig1=figure
scatter(patientaxis,gaps_in_voicing_patients, markersize(1:16), 'b','filled')
hold all
scatter(1, mean(gaps_in_voicing_patients), markersize(1), 'm','filled')
scatter(HCaxis,gaps_in_voicing_HCs,markersize(1:11), 'c','filled')
scatter(2, mean(gaps_in_voicing_HCs),markersize(1), 'm','filled')
axis([0 3 -3 65 ])
title('gaps in voicing')
ylabel('number of gaps')
xlabel('                                           patients                                                      HCs')
goodplot

% good trials 
goodtrials_WT_patients=xlsread('behdataformatlab','C1:C17');
goodtrials_WT_HCs=xlsread('behdataformatlab','C18:C28');
goodtrials_pre_patients=xlsread('behdataformatlab','D1:D17');
goodtrials_pre_HCs=xlsread('behdataformatlab','D18:D28');
goodtrials_post_patients=xlsread('behdataformatlab','E1:E17');
goodtrials_post_HCs=xlsread('behdataformatlab','E18:E28');


fig2=figure
clf
title('good trials                                                                                                    ')
subplot(1,3,1)
scatter(patientaxis,goodtrials_WT_patients,markersize(1:16),'b','filled')
hold on
scatter(1, mean(goodtrials_WT_patients),markersize(1), 'm','filled')
scatter(HCaxis,goodtrials_WT_HCs, markersize(1:11),'c','filled')
scatter(2, mean(goodtrials_WT_HCs),markersize(1), 'm','filled')
axis([0 3 0 85 ])
title('good trials WT')
ylabel('number of good trials')
xlabel('     patients       HCs')

subplot(1,3,2)
scatter(patientaxis,goodtrials_pre_patients,markersize(1:16), 'b','filled')
hold on
scatter(1, mean(goodtrials_pre_patients),markersize(1), 'm','filled')
scatter(HCaxis,goodtrials_pre_HCs, markersize(1:11), 'c','filled')
scatter(2, mean(goodtrials_pre_HCs),markersize(1), 'm','filled')
axis([0 3 0 85 ])
title('good trials pre')
ylabel('number of good trials')
xlabel('     patients       HCs')

subplot(1,3,3)
scatter(patientaxis,goodtrials_post_patients, markersize(1:16),'b','filled')
hold on
scatter(1, mean(goodtrials_post_patients),markersize(1), 'm','filled')
scatter(HCaxis,goodtrials_post_HCs,markersize(1:11), 'c','filled')
scatter(2, mean(goodtrials_post_HCs),markersize(1), 'm','filled')
axis([0 3 0 85 ])
title('good trials post')
ylabel('number of good trials')
xlabel('     patients       HCs')

ttest2(goodtrials_WT_patients,goodtrials_WT_HCs)
ttest2(goodtrials_pre_patients,goodtrials_pre_HCs)
ttest2(goodtrials_post_patients,goodtrials_post_HCs)

axis([1 3 0 85 ])

% percep score
goodtrials_percptscore_patients=xlsread('behdataformatlab','F1:F15');
fig3=figure
scatter(patientaxis(1:14),goodtrials_percptscore_patients,markersize(1:14), 'b','filled')
hold
scatter(1, mean(goodtrials_percptscore_patients), markersize(1),'m','filled')
ylabel('% correct')
xlabel('Patients')
title('Perceptual Score')

% mean pitch
goodtrials_pitch_patients=xlsread('behdataformatlab','G1:G17');
goodtrials_pitch_HCs=xlsread('behdataformatlab','G18:G28');
fig4=figure
scatter(patientaxis,goodtrials_pitch_patients, markersize(1:16),'b','filled')
hold
scatter(1, mean(goodtrials_pitch_patients),markersize(1), 'm','filled')
ylabel('mean pitch (Hz)')
scatter(HCaxis,goodtrials_pitch_HCs,markersize(1:11), 'b','filled')
scatter(2, mean(goodtrials_pitch_patients),markersize(1), 'm','filled')
axis([0 3 80 260])
title('Mean Pitches')
xlabel('                          patients                                 HCs')
goodplot