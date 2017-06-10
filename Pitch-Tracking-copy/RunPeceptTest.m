%% First step: Loads in perceptual test data and writes it to 
% SUBs and saves that so that the good trials script (B) remove these
% trials
% ZKA oct 2014
% -----------
% needs an excell spreadsheet called 'Goodtrials_behdata.xlsx' which has 1s and 0s
% for the correctly identified trials. Each subject has their own sheet in
% this spreadsheet. This file includes both patients and healthy controls. 

cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data_final_run/';
cd(cerebellar_data_rootdir)

for isubj=1:30
    for iblock=1:8
        if iblock==1
            SUB{isubj}.block{1}=xlsread('Goodtrials_behdata',isubj, '1:10');
        elseif iblock==2
            SUB{isubj}.block{2}=xlsread('Goodtrials_behdata',isubj, '11:20');
        elseif iblock==3
            SUB{isubj}.block{iblock}=xlsread('Goodtrials_behdata',isubj, '21:30');
        elseif iblock==4
            SUB{isubj}.block{iblock}=xlsread('Goodtrials_behdata',isubj, '31:40');
        elseif iblock==5
            SUB{isubj}.block{5}=xlsread('Goodtrials_behdata',isubj, '41:50');
        elseif iblock==6
            SUB{isubj}.block{6}=xlsread('Goodtrials_behdata',isubj, '51:60');
        elseif iblock==7
            SUB{isubj}.block{7}=xlsread('Goodtrials_behdata',isubj, '61:70');
        elseif iblock==8
            SUB{isubj}.block{8}=xlsread('Goodtrials_behdata',isubj, '71:80');
            
        end
    end
    
end

save SUB SUB


clc
disp('needs an Excell spreadsheet called *Goodtrials_behdata.xlsx* and saves data as SUB.mat')
