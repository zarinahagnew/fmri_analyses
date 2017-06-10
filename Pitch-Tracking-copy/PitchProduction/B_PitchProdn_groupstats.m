%% Calculates stdev for pitch production exp for healthy and patients
% -------------------------------------------------------------------------
% ZKA Jan 2015

% Loads goodpitchdata which contains the good data from before, both as a whole trial, a window and the stdev of the window (400 - 1000 frame as default).
% converts each trial into cents by normalising it to the mean of that
% trial
% plots each trial

clear all
close all
set_params;

cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data/';
load /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/subj_MP_allsubs

cd(cerebellar_data_rootdir)

npatients = 0;
% List directories here:-
% patients
npatients = npatients + 1; %400 and 1000 are ok
patient_info{npatients}.exprdir = 'SUB01/expr20140321T103415_SUBJ01_measurepitch/speak/';
% % %This suxxxbject is a good one for a figure:
% % %plot(frame_taxis_prod, goodpitchdata_cents(1).window{15})
meanpitchtag(npatients)=1;

npatients = npatients + 1; % needs manual
patient_info{npatients}.exprdir = 'SUB02/expr20140321T121956_Sub2_measurepitch/speak/';
meanpitchtag(npatients)=2;

npatients = npatients + 1; % needs manual
patient_info{npatients}.exprdir = 'SUB03/expr20140321T142416_Subj3-measurepitch/speak/';
%meanpitchtag(npatients)=3;

npatients = npatients + 1;
patient_info{npatients}.exprdir ='SUB04/expr20140321T170947_Subj4_measurepitch/speak/';
% meanpitchtag(npatients)=4;
%
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB05/expr20140321T183529_Subj5_measurepitch/speak/';
meanpitchtag(npatients)=5;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB06/expr20140322T104901_SUB06_measurepitch/speak/';
meanpitchtag(npatients)=6;
%BAD SUBJECT

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB07/expr20140322T115150_Sub7_measurepitch/speak/';
meanpitchtag(npatients)=7;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB08/expr20140322T134549_Sub08_measurepitch/speak/';
meanpitchtag(npatients)=8;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB09/expr20140322T154047_SUB09_measure_pitch/speak/';
meanpitchtag(npatients)=9;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB10/expr20140322T162455_SUB10_measurepitch/speak/';
meanpitchtag(npatients)=10;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB11/expr20140322T183812_Subj11_measurepitch/speak/';
meanpitchtag(npatients)=11;
% v wobbly

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB12/expr20140323T104953_Sub12_measurepitch/speak/';
meanpitchtag(npatients)=12;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB13/expr20140323T132703_Sub13_measurepitch/speak/';
meanpitchtag(npatients)=13;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB14/expr20140323T150747_subj14/speak/';
meanpitchtag(npatients)=14;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB15/expr20140323T162223_SUB15_measurepitch/speak/';
meanpitchtag(npatients)=15;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB16/expr20140323T180417_sub16_measurepitch/speak/';
meanpitchtag(npatients)=16;
%missing data
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC01/expr20140506T121323_ZKA/speak/';
meanpitchtag(npatients)=17;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC02/expr20140617T123801_HC02_pitchprodn/speak/';
meanpitchtag(npatients)=17;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC03/expr20140617T133413_HC03_pitchprodn/speak/';
meanpitchtag(npatients)=18;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC04/expr20140617T161417_measurepitch/speak/'; %400 to 1000 ok
meanpitchtag(npatients)=19;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC05/expr20140618T150410_HC05_measurepitch/speak/'; %400 to 1000 ok

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC06/expr20140618T160728_HC06_measurepitch/speak/';
meanpitchtag(npatients)=20;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC07/expr20140725T101015_W4Z_subj25/speak/';
meanpitchtag(npatients)=19;

npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC08/expr20140814T154458_W4Z_subj3/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC09/expr20140921T133544_annette/speak/';

%BAD TRACKING
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC10/expr20140921T152451_JL/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'HC11/expr20140923t151309_sn/speak/';

patients=[1:16];
HCs=[17:26];


% Subject Loop
for subj=1:npatients
    cd(cerebellar_data_rootdir);
    load (sprintf('%sgoodpitchdata.mat',patient_info{subj}.exprdir));
    
    %% convert to cents
    goodpitchdata_cents=goodpitchdata;
    % nans for bad trials
    for d=1:15
        if isnan(goodpitchdata(1).window{d})
            goodpitchdata(1).window{d}=NaN(1,871);
        end
    end
    
    for d=1:15
        for iframe=1:length(goodpitchdata(1).window{1})
            if isnan(goodpitchdata(1).window{d}(iframe))==1;
                goodpitchdata_cents(1).window{d}(iframe)=NaN; %(1, length(goodpitchdata(1).window{1}))
            else
                goodpitchdata_cents(1).window{d}(iframe)=1200*log2(goodpitchdata(1).window{d}(iframe)/nanmean(goodpitchdata(1).window{d}));
            end
        end
    end
    
    %% calc mean pitch in cents for each sub
    for d=1:15
        temp_a(d,:)=goodpitchdata_cents(1).window{d};
    end
    goodpitchdata_cents(1).meanpitch=nanmean(temp_a);
    goodpitchdata_cents_alldata(subj)=goodpitchdata_cents;
    
    %% calculate mean spectrum
    for d=1:15
        nfreqs=length(goodpitchdata_cents(1).window{d})/2+1;
        temp1(d,:)=my_spectrum(goodpitchdata_cents(1).window{d},fs,nfreqs);
        %         subplot(5,3,d)
        %         plot(temp1(d,:))
        %         axis([0 10 0 1])
    end
    
    meanspec(subj,:)=nanmean(temp1);
    
    %% plot mean pitch productions
    %     figure
    %     for d= 1:15
    %         plot(goodpitchdata_cents_alldata(subj).window{d});
    %         plot(goodpitchdata_cents_alldata(subj).meanpitch, 'y','LineWidth',1.3);
    %         hold all
    %         axis([0 900 -300 300])
    %     end
    
    % calculate stdev for each trial
    for a=1:15
        DATA(subj).trialstdev(a)=nanstd(goodpitchdata_cents_alldata(subj).window{a});
    end
    
    % calculate stdev for each subject
    GP_DATA(subj)=nanmean(DATA(subj).trialstdev(a)); %write HC data and subject data in one structure
    
end

% split patients and HCs
pat_meanspec=meanspec(1:16,:)
mean_pat_meanspec=nanmean(pat_meanspec)
HC_meanspec=meanspec(17:end,:)
mean_HC_meanspec=nanmean(HC_meanspec)

patients=DATA(1:16);
hcs=DATA(17:end);
patient_mean=GP_DATA(1:16);
HC_mean=GP_DATA(17:end);

patient_overall_mean=nanmean(patient_mean);
HC_overall_mean=nanmean(HC_mean);
stats=ttest2(patient_mean,HC_mean)

%plot all patients
fig1=figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'All production trials - patients', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

for moo=1:16
    for d= 1:15
        subplot(4,4,moo)
        plot(goodpitchdata_cents_alldata(moo).window{d});
        plot(goodpitchdata_cents_alldata(moo).meanpitch, 'y','LineWidth',1.3);
        ylabel('Pitch (cents)')
        title(sprintf('each patient'));
        hold all
        axis([0 900 -300 300])
    end
end

saveas(fig1, '/Users/zagnew/Cereb_data/data/GroupData/pitchprodn/GROUP_pitchproduction_allpatients.jpg')

%plot all HCs
fig2=figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'All production trials - HCs', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

for moo=1:10
    subplot(3,4,moo)
    for d=1:15
        plot(goodpitchdata_cents_alldata(moo+16).window{d})
        hold all
    end
    plot(goodpitchdata_cents_alldata(moo+16).meanpitch, 'y','LineWidth',1.3);
    ylabel('Pitch (cents)')
    title(sprintf('each HC'));
    
    axis([0 900 -300 300])
end

saveas(fig2, '/Users/zagnew/Cereb_data/data/GroupData/pitchprodn/GROUP_pitchproduction_allHCs.jpg')



%% group mean pitch prod cents
for moo=1:16
test_pats(moo,:)=goodpitchdata_cents_alldata(moo).meanpitch;
end
temp_a=goodpitchdata_cents_alldata(17:end);
for moop=1:10
test_HCs(moop,:)=temp_a(moop).meanpitch;
end

patgroupmean=nanmean(test_pats);
patgroupstdev=nanstd(test_pats);
pat_sem=patgroupstdev/sqrt(16*15);

HCgroupmean=nanmean(test_HCs);
HCgroupstdev=nanstd(test_HCs);
HC_sem=HCgroupstdev/sqrt(10*15);

upperlimit_pats=patgroupmean+pat_sem;
lowerlimit_pats=patgroupmean-pat_sem;
upperlimit_HCs=HCgroupmean+HC_sem;
lowerlimit_HCs=HCgroupmean-HC_sem;

fig4=figure
subplot(2,1,1)
plot(patgroupmean, 'm','LineWidth',1.8);
hold all
plot(upperlimit_pats, 'k','LineWidth',0.8);
plot(lowerlimit_pats, 'k','LineWidth',0.8);
axis([0 900 -60 60])
subplot(2,1,2)
plot(HCgroupmean, 'm','LineWidth',1.8);
hold all
plot(upperlimit_HCs, 'k','LineWidth',0.8);
plot(lowerlimit_HCs, 'k','LineWidth',0.8);
axis([0 900 -60 60])



%% do a ttest at each frame between patients and HC spectrum
        for d=1:15
            for iframe=1:436
            ttest_spec(:, iframe)=ttest2(meanspec(1:16,iframe), meanspec(17:end,iframe));            
            end
        end
    
% plot the spectal data
fig3=figure
annotation('textbox', [0 0.9 1 0.1], ...
    'String', 'All production trials - spectrum', ...
    'EdgeColor', 'none', ...
    'HorizontalAlignment', 'center')

subplot(2,2,1)
for moo=1:16
    plot(pat_meanspec(moo,:), 'k')
    hold on
    plot(mean_pat_meanspec, 'y','LineWidth',1.3);
    plot(ttest_spec(1:6),'r','LineWidth',1.3);
    axis([0 100 0 2])
    ylabel('Pitch (cents)')
    xlabel('Hz')    
    title(sprintf('Patients'));
        
end


subplot(2,2,2)
for moo=1:16
    plot(pat_meanspec(moo,:), 'k')
    hold on
    plot(mean_pat_meanspec, 'y','LineWidth',1.3);
    plot(ttest_spec(1:6),'r','LineWidth',1.3);
    axis([0 10 0 2])
    ylabel('Pitch (cents)')
    xlabel('Hz')    
    title(sprintf('Patients'));
        
end

subplot(2,2,3)
for moo=1:10
    plot(HC_meanspec(moo,:), 'k')
    hold on
    plot(mean_HC_meanspec, 'm','LineWidth',1.3);
    axis([0 100 0 2])
    ylabel('Pitch (cents)')
    xlabel('Hz')
    title(sprintf('HCs'));
    
end

subplot(2,2,4)
for moo=1:10
    plot(HC_meanspec(moo,:), 'k')
    hold on
    plot(mean_HC_meanspec, 'm','LineWidth',1.3);
    axis([0 10 0 2])
    ylabel('Pitch (cents)')
    xlabel('Hz')    
    title(sprintf('HCs'));
    
end

STATS.meanspec_pats_HC=ttest2(mean_pat_meanspec, mean_HC_meanspec)

saveas(fig3, '/Users/zagnew/Cereb_data/data/GroupData/pitchprodn/GROUP_pitchproduction_spec.jpg')



