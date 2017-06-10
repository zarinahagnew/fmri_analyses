%% calculates the mean spectrum for all trials of main experiment
 
clear all
close all
set_params;

% ----

cerebellar_data_rootdir = '/Users/zagnew/Cereb_data/data/';
npatients = 0;
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB01/expr2014.03.21.T10.46.03_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB02/expr2014.03.21.T12.33.58_mainrun/speak/';
npatients = npatients + 1;
patient_info{npatients}.exprdir = 'SUB03/expr2014.03.21.T14.35.35_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB04/expr2014.03.21.T17.20.11_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB05/expr2014.03.21.T18.50.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB06/expr2014.03.22.T11.05.45_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB07/expr2014.03.22.T12.15.42_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB08/expr2014.03.22.T14.01.48_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB09/expr2014.03.22.T15.52.01_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB10/expr2014.03.22.T16.37.44_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB11/expr2014.03.22.T18.46.44_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB12/expr2014.03.23.T11.03.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB13/expr2014.03.23.T13.47.01_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB14/expr2014.03.23.T15.21.00_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB15/expr2014.03.23.T16.32.53_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB16/expr2014.03.23.T18.16.58_mainrun/speak/';

% % % list controls here
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC01/expr2014.05.06.T12.36.43_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC02/expr2014.06.17.T12.53.53_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC03/expr2014.06.17.T13.50.36_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC04/expr2014.06.17.T16.22.20_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC05/expr2014.06.18.T15.14.02_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC06/expr2014.06.18.T16.18.27_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC07/expr2014.07.25.T10.29.55_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC08/expr2014.08.14.T15.57.52_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC09/expr2014.09.21.T14.17.36_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC10/expr2014.09.21.T15.35.54_JL_mainrun/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC11/expr2014.09.23.t15.27.32_sn_mainrun/speak/';

originalFolder = pwd;
figure
for each_subject = 1:npatients
    
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)
    
    load (sprintf('%sgooddata_spectralanalysis.mat',patient_info{each_subject}.exprdir));
    
    
    
    % replace nans with zeros
    for iblock=1:8
        %nfreqs=length(gooddata.wholetrial(iblock).wholetrial)/2+1;
        nfreqs=length(gooddata_spec.goodpitchdata(1).data)/2+1;
%         for itrial=1:10
%             meanpitch(itrial)=(nanmean(gooddata.wholetrial(iblock).wholetrial(itrial,:)))
%         end
%         meanpitch=meanpitch'
%         
        for itrial=1:10
            gooddata.wholetrial(iblock).wholetrial(isnan(gooddata.wholetrial(iblock).wholetrial)) = 0 ;
            
            
            
            spectrum(iblock).data=my_spectrum(gooddata.wholetrial(iblock).wholetrial,fs,nfreqs)
        end
    end

% Patients
SUB(each_subject,:)=mean(spectrum(1).data);
subplot(4, 5, each_subject)
plot(SUB(each_subject,:));
axis([0 20 0 5]);

% % HCs
% SUB(each_subject,:)=mean(spectrum(1).data);
% subplot(4, 4, each_subject)
% plot(SUB(each_subject,:), 'm');
% axis([0 20 0 5]);
end

GroupSpec_PATs=mean(SUB);
subplot(4, 5, each_subject+1)
plot(GroupSpec_PATs, 'r','LineWidth',1.3);
axis([0 20 0 5]);
cd(cerebellar_data_rootdir)
cd GroupData/SpectralAnalysis
save GroupSpec_PATs GroupSpec_PATs


% 
% t = 0:0.001:0.6;
% x = sin(2*pi*10*t);
% y = abs(fft(x));
% 
% 
% 
% 
% fs = 1000;
% t = 0:1/fs:0.601;
% N = length(t);
% x = sin(2*pi*10*t);
% 
% y = fftshift(abs(fft(x)));
%  
% if(rem(N,2) == 0)
%   % N is even
%   f = linspace(-fs/2, (fs/2) - (fs/N), N);
% else
%   % N is odd
%   f = linspace(-fs/2, (fs/2), N);
% end
% 
% plot(f, y);