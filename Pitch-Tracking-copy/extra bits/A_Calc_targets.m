% Calculates pitch targets in Hz
% ZKA Dec 2014
% this is now redundant as I work in cents rather than Hz



% create shifts
shift(1)=1;
shift(2)=3;
shift(3)=0;
shift(4)=-1;
shift(5)=-3;

set_params;

%load (sprintf('%sexpr_config.mat',the_expr_dir))        % condition orders from fusp

cd /Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches

% load and rename all the subject target pitches
%patients
subj_MP_allsubs(1) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140321T103415.mat');
subj_MP_allsubs(2) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140321T121956.mat');
subj_MP_allsubs(3) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140321T142416.mat');
subj_MP_allsubs(4) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140321T170947.mat');
subj_MP_allsubs(5) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140321T183529.mat');
subj_MP_allsubs(6) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140322T104901.mat');
% manually changed it to 135 Hz^^
subj_MP_allsubs(7) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140322T115150.mat');
subj_MP_allsubs(8) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140322T134549.mat');
subj_MP_allsubs(9) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140322T154047.mat');
subj_MP_allsubs(10) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140322T162455.mat');
subj_MP_allsubs(11) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140322T183812.mat');
subj_MP_allsubs(12) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140323T104953.mat');
subj_MP_allsubs(13) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140323T132703.mat');
subj_MP_allsubs(14) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140323T150747.mat');
subj_MP_allsubs(15) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140323T162223.mat');
subj_MP_allsubs(16) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140323T180417.mat');

%HCs
subj_MP_allsubs(17) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140506T121323.mat');
subj_MP_allsubs(18) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140617T123801.mat');
subj_MP_allsubs(19) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140617T133413_real.mat');
subj_MP_allsubs(20) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140617T161417.mat');
subj_MP_allsubs(21) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140618T150410.mat');
subj_MP_allsubs(22) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140618T160728.mat');
subj_MP_allsubs(23) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140814T154458.mat');
subj_MP_allsubs(24) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140915T173347.mat');
subj_MP_allsubs(25) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140921T133544.mat');
subj_MP_allsubs(26) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140921T152451.mat');
subj_MP_allsubs(27) = load('/Users/zagnew/Dropbox/cerebellum_expr_devel/Zed/meanpitches/meanpitch_20140923T151309.mat');


% convert to cents
for isubj=1:27
    shiftinhertz_allsubs(isubj).smallstepup(1)  = (2^0.0833)^shift(1) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).bigstepup(1)    = (2^0.0833)^shift(2) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).nostep(1)       = (2^0.0833)^ shift(3)* subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).smallstepdown(1) = (2^0.0833)^shift(4)* subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).bigstepdown(1)  = (2^0.0833)^shift(5) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
end
% 
% for isubj=1:27
%     shiftinhertz_allsubs(isubj).smallstepup(1)  = 1200*log2(
%     
%    log(5)
% 
% 
%      197.0561
%      208.7688
% 
%     
%     (2^0.0833)^shift(1) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
%     shiftinhertz_allsubs(isubj).bigstepup(1)    = (2^0.0833)^shift(2) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
%     shiftinhertz_allsubs(isubj).nostep(1)       = (2^0.0833)^ shift(3)* subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
%     shiftinhertz_allsubs(isubj).smallstepdown(1) = (2^0.0833)^shift(4)* subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
%     shiftinhertz_allsubs(isubj).bigstepdown(1)  = (2^0.0833)^shift(5) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
% end
% 


%good subs
subj_MP_goodsubjs=subj_MP_allsubs(allincluded);
save subj_MP_allsubs subj_MP_allsubs
save subj_MP_goodsubjs subj_MP_goodsubjs






%% (1) Calculates target shifts in Hz from each subjects' mean pitch
for isubj=1:27
    shiftinhertz_allsubs(isubj).smallstepup(1)  = (2^0.0833)^shift(1) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).bigstepup(1)    = (2^0.0833)^shift(2) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).nostep(1)       = (2^0.0833)^ shift(3)* subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).smallstepdown(1) = (2^0.0833)^shift(4)* subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).bigstepdown(1)  = (2^0.0833)^shift(5) * subj_MP_allsubs(isubj).meanpitch % change 1 to number of semitones
end
save SubjectShiftsAllSubs.mat shiftinhertz_allsubs


% calc mean initial target
for isubj=1:27
temp_1(isubj)=shiftinhertz_allsubs(isubj).smallstepup;
temp_2(isubj)=shiftinhertz_allsubs(isubj).bigstepup;
temp_3(isubj)=shiftinhertz_allsubs(isubj).nostep;
temp_4(isubj)=shiftinhertz_allsubs(isubj).smallstepdown;
temp_5(isubj)=shiftinhertz_allsubs(isubj).bigstepdown;
end

temp1_gdsubs=temp_1(allincluded);
temp2_gdsubs=temp_2(allincluded);
temp3_gdsubs=temp_3(allincluded);
temp4_gdsubs=temp_4(allincluded);
temp5_gdsubs=temp_5(allincluded);

meanpresteptarget=mean(temp_3);
meanpoststeptarget_smallstep=mean(temp_1);
meanpoststeptarget_bigstep=mean(temp_2);
meanpoststeptarget_nostep=mean(temp_3);
meanpoststeptarget_smallstepdown=mean(temp_4);
meanpoststeptarget_smallstepdown=mean(temp_5);

meanpresteptarget_gdsubs=mean(temp3_gdsubs);
meanpoststeptarget_smallstep_gdsubs=mean(temp1_gdsubs);
meanpoststeptarget_bigstep_gdsubs=mean(temp2_gdsubs);
meanpoststeptarget_nostep_gdsubs=mean(temp3_gdsubs);
meanpoststeptarget_smallstepdown_gdsubs=mean(temp4_gdsubs);
meanpoststeptarget_bigstepdown_gdsubs=mean(temp5_gdsubs);


% make targets
poststep_temp=1360-stepframe;
targtoplot_pre=ones(1,stepframe);
targtoplot_pre=targtoplot_pre*meanpresteptarget_gdsubs;

targtoplot_post=ones(1,poststep_temp);
targtoplot_post_smallstep=targtoplot_post*meanpoststeptarget_smallstep_gdsubs;
targtoplot_post_bigstep=targtoplot_post*meanpoststeptarget_bigstep_gdsubs;
targtoplot_post_nostep=targtoplot_post*meanpoststeptarget_nostep_gdsubs;
targtoplot_post_smallstepdown=targtoplot_post*meanpoststeptarget_smallstepdown_gdsubs;
targtoplot_post_bigstepdown=targtoplot_post*meanpoststeptarget_bigstepdown_gdsubs;

smallstepup=[targtoplot_pre targtoplot_post_smallstep];
bigstepup=[targtoplot_pre targtoplot_post_bigstep];
nostep=[targtoplot_pre targtoplot_post_nostep];
smallstepdown=[targtoplot_pre targtoplot_post_smallstepdown];
bigstepdown=[targtoplot_pre targtoplot_post_bigstepdown];

% divide by std no minus ZED
% smallstepup_norm=(smallstepup-mean(meanpresteptarget_gdsubs))/std(meanpresteptarget_gdsubs)
% bigstepup_norm=(bigstepup-mean(meanpresteptarget_gdsubs))/std(meanpresteptarget_gdsubs)
% nostep_norm=(nostep-mean(meanpresteptarget_gdsubs))/std(meanpresteptarget_gdsubs)
% smallstepdown_norm=(smallstepdown-mean(meanpresteptarget_gdsubs))/std(meanpresteptarget_gdsubs)
% bigstepdown_norm=(bigstepdown-mean(meanpresteptarget_gdsubs))/std(meanpresteptarget_gdsubs)

%% targets in cents

%% make targets

test=[zeros(1, stepframe) ones(1, 1360-stepframe)];
smallup=test*100;
bigup=test*300;
smalldown=test*-100;
bigdown=test*-300;
no_step=zeros(1,1360);

figure
subplot(2,1,1)
plot(smallstepup)
hold all
plot(bigstepup)
plot(nostep)
plot(smallstepdown)
plot(bigstepdown)
% 
subplot(2,1,2)
plot(smallup)
hold all
plot(bigup)
plot(no_step)
plot(smalldown)
plot(bigdown)
axis([0 1400 -350 350])

targets_cents.smallstepup_cents=smallup
targets_cents.bigstepup_cents=bigup
targets_cents.nostep_cents=no_step
targets_cents.smallstepdown_cents=smalldown
targets_cents.bigstepdown_norm=bigdown


targets.smallstepup_norm=smallstepup;
targets.bigstepup_norm=bigstepup;
targets.nostep=nostep;
targets.smallstepdown_norm=smallstepdown;
targets.bigstepdown=bigstepdown;

save targets_cents targets_cents
save targets targets

