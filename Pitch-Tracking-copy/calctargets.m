% Loads in mean pitches from a spreadsheet
% /Users/zagnew/Cereb_data/data_final_run/meanpitches.xls

% create shifts
shift(1)=1;
shift(2)=3;
shift(3)=0;
shift(4)=-1;
shift(5)=-3;

set_params_pitchtracking;

cd /Users/zagnew/Cereb_data/data_final_run

[meanpitches]=xlsread('meanpitches.xls');

% load and rename all the subject target pitches
for i=1:length(meanpitches)
    subj_MPs_allsubs(i).meanpitch = meanpitches(i);
end

% convert to cents
for isubj=1:30
    shiftinhertz_allsubs(isubj).smallstepup(1)  = (2^0.0833)^shift(1) * subj_MPs_allsubs(isubj).meanpitch; % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).bigstepup(1)    = (2^0.0833)^shift(2) * subj_MPs_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).nostep(1)       = (2^0.0833)^ shift(3)* subj_MPs_allsubs(isubj).meanpitch; % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).smallstepdown(1) = (2^0.0833)^shift(4)* subj_MPs_allsubs(isubj).meanpitch % change 1 to number of semitones
    shiftinhertz_allsubs(isubj).bigstepdown(1)  = (2^0.0833)^shift(5) * subj_MPs_allsubs(isubj).meanpitch; % change 1 to number of semitones

    shiftincents_allsubs(isubj).smallstepup(1)  = 100;
    shiftincents_allsubs(isubj).bigstepup(1)    = 300;
    shiftincents_allsubs(isubj).nostep(1)       = 0;
    shiftincents_allsubs(isubj).smallstepdown(1) = -100
    shiftincents_allsubs(isubj).bigstepdown(1)  = -300;

end

%good subs
save subj_MPs_allsubs subj_MPs_allsubs

subj_MP_goodsubjs=subj_MPs_allsubs(allincluded);

save subj_MP_goodsubjs subj_MP_goodsubjs
save SubjectShiftsAllSubs.mat shiftinhertz_allsubs
save SubjectShiftsAllSubs_cents.matshiftincents_allsubs

clc
disp('Loads mean pitches from a spreadsheet /Users/zagnew/Cereb_data/data_final_run/meanpitches.xls')
disp('saves *subj_MPs_allsubs* and *subj_MP_goodsubjs*')






