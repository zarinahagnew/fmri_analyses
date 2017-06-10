%% Checks the conditions against the pert responses
% ZKA April 2014
% plots each trial against the target sound. 
% needs good data so that is run after scripts B and C are done. 

clear all
close all
set_params_pitchtracking;

npatients = 0;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
patientdir= '/Users/zagnew/Cereb_data/data_final_run/SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
homedir='/Users/zagnew/Cereb_data/data/'
cd(patientdir)

load (sprintf('%sshifted_blockalt.mat',patient_info{1}.exprdir))
load (sprintf('%sexpr_config.mat',patient_info{1}.exprdir))
load (sprintf('%sgooddata.mat',patient_info{1}.exprdir))


%creates a variable called blockcondname each row of which is the
%conditions in a block (ten trials)
for each_block=1:8;
    if  each_block == 1
        blockcondname(each_block,:)=trialscript_expr(1:10);
    elseif each_block == 2
        blockcondname(each_block,:)=trialscript_expr(11:20);
    elseif each_block == 3
        blockcondname(each_block,:)=trialscript_expr(21:30);
    elseif each_block == 4
        blockcondname(each_block,:)=trialscript_expr(31:40);
    elseif each_block == 5
        blockcondname(each_block,:)=trialscript_expr(41:50);
    elseif each_block == 6
        blockcondname(each_block,:)=trialscript_expr(51:60);
    elseif each_block == 7
        blockcondname(each_block,:)=trialscript_expr(61:70);
    elseif each_block == 8
        blockcondname(each_block,:)=trialscript_expr(71:80);
    else pwd
    end
end

cd block2

pitchdata=get_vec_hist6('pitch2',3); %two arguments are file name and then file type (float vec)
block=get_vec_hist6('blockalt',3); %pert response (needs to be shifted in time as only begins in response to voice onsett detect
voiceonset=get_vec_hist6('voice_onset_detect',2); %voice detect
outbuff_wav=get_vec_hist6('outbuffer', 3); % playable waveform
outbuff_pitch=get_vec_hist6('output_pitch', 3); % pich of outbuffer is the target
amp=get_vec_hist6('weighted_mean_abs_inbuffer2', 3)
audio=get_vec_hist6('inbuffer2',3)


%% plot all dis
for iblock=1:8
    a=figure
    for moo=1:10
        c=subplot(2,5,moo)
        annotation('textbox', [0 0.9 1 0.1], ...
            'String', 'pert responses for each block', ...
            'EdgeColor', 'none', ...
            'HorizontalAlignment', 'center')
        title(c,'All trials')
        text(-10,10.2,'Clear     Noise')
        
        one=gooddata(1).goodpitchdata(iblock).data(moo,:)
        two=shifted_blockalt{moo, iblock}
        plot(one,'k','LineWidth',1.3)
        hold on
        plot(two,'b','LineWidth',1.1);
        axis([0 2000 -400 400])
        
    end
end

blockcondname;
