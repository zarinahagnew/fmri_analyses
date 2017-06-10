%   pre_spec = abs(fft(sig2use(i,:),nfft));
%   To do
%   swap nans with zeros

% % works using myspectrum
% specdata=gooddata.wholetrial(1).wholetrial
% specdata(isnan(specdata)) = 0 ;
% moo=my_spectrum(specdata,fs,nfreqs)
% for itrial=1:10
% plot(moo(itrial,:))
% hold all
% end

clear all
close all

set_params;

% ----
cd(cerebellar_data_rootdir)
load GP_goodpitchdata


npatients = 0;
npatients = npatients + 1; %400 and 1000 are ok
patient_info{npatients}.exprdir = 'SUB01/expr20140321T103415_SUBJ01_measurepitch/speak/';
npatients = npatients + 1; % needs manual
patient_info{npatients}.exprdir = 'SUB02/expr20140321T121956_Sub2_measurepitch/speak/';
npatients = npatients + 1; % needs manual
patient_info{npatients}.exprdir = 'SUB03/expr20140321T142416_Subj3-measurepitch/speak/';
%npatients = npatients + 1; % needs manual
% patient_info{npatients}.exprdir ='SUB04/expr20140321T170947_Subj4_measurepitch/speak/';
% npatients = npatients + 1;  %400 and 1000 are ok
% patient_info{npatients}.exprdir = 'SUB05/expr20140321T183529_Subj5_measurepitch/speak/';
% npatients = npatients + 1;
% 
% patient_info{npatients}.exprdir = 'SUB06/expr20140322T104901_SUB06_measurepitch/speak/';
% 
% %BAD SUBJECT
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB07/expr20140322T115150_Sub7_measurepitch/speak/';
% 
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB08/expr20140322T134549_Sub08_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB09/expr20140322T154047_SUB09_measure_pitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB10/expr20140322T162455_SUB10_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB11/expr20140322T183812_Subj11_measurepitch/speak/';
% %v wobbly
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB12/expr20140323T104953_Sub12_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB13/expr20140323T132703_Sub13_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB14/expr20140323T150747_subj14/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB15/expr20140323T162223_SUB15_measurepitch/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'SUB16/expr20140323T180417_sub16_measurepitch/speak/';
% % 
% %missing data
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC01/expr20140506T121323_ZKA/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC02/expr20140617T123801_HC02_pitchprodn/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC03/expr20140617T133413_HC03_pitchprodn/speak/';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC04/expr20140617T161417_measurepitch/speak/'; %400 to 1000 ok
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC05/expr20140618T150410_HC05_measurepitch/speak'; %400 to 1000 ok
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC06/expr20140618T160728_HC06_measurepitch/speak';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC07/expr20140725T101015_W4Z_subj25/speak';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC08/expr20140814T154458_W4Z_subj3/speak';
% npatients = npatients + 1;
% patient_info{npatients}.exprdir = 'HC09/expr20140921T133544_annette/speak';

originalFolder = pwd;
figure
for each_subject = 1:npatients
    the_expr_dir = [cerebellar_data_rootdir (patient_info{each_subject}.exprdir)];
    cd (the_expr_dir)
     load (sprintf('%sgoodpitchdata.mat',patient_info{each_subject}.exprdir));

%% convert to cents
    goodpitchdata_cents=goodpitchdata;
    for d=1:15
        if isnan(goodpitchdata(1).window{d})
            goodpitchdata(1).window{d}=NaN(1,871);
        end
    end
    
    for d=1:15
        for iframe=1:length(goodpitchdata(1).window{1})
            if isnan(goodpitchdata(1).window{d}(iframe))==1;
                goodpitchdata_cents(1).window{d}(iframe)=NaN; 
            else
                goodpitchdata_cents(1).window{d}(iframe)=1200*log2(goodpitchdata(1).window{d}(iframe)/nanmean(goodpitchdata(1).window{d}));
            end
        end        
    end
    
    % calculate spectrum of each trial and plot that
    for d=1:15
    nfreqs=length(goodpitchdata_cents(1).window{d})/2+1;
    moo(d,:)=my_spectrum(goodpitchdata_cents(1).window{d},fs,nfreqs);
    subplot(5,3,d)
    plot(moo(d,:))
    axis([0 10 0 1])
    end
    
    meanspec(each_subject,:)=nanmean(moo);
% 
%     
% fig1=figure   
% ymin=-20
% ymax=20
% 
% 
% annotation('textbox', [0 0.9 1 0.1], ...
%     'String', 'All production trials', ...
%     'EdgeColor', 'none', ...
%     'HorizontalAlignment', 'center')
% 
% for d=1:15;
% whitebg('white')
% subplot(5,3,d)
% plot(goodpitchdata_cents(1).window{d})
% 
% ylabel('Pitch (cents)')
% title(sprintf('trial'));
% %axis([0 3 ymin ymax])
% end
    
% %% replace nans with zeros
%     for itrial=1:15
%         pitchprod_data(itrial,:)=goodpitchdata(1).window{itrial}; % write data into one matrix
%         nfreqs=length(goodpitchdata(1).window{itrial})/2+1;
%         %pitchprod_data(isnan(pitchprod_data)) = 0 ;
%         spectrum(itrial).data=my_spectrum(pitchprod_data,fs,nfreqs);
%     end
%     
%     mean_spec(each_subject,:)=mean(spectrum(itrial).data);
%     figure
%     plot(mean_spec(each_subject,:))
%     axis([0 5 0 5])
%     %     %test2(each_subject,:)=mean(spectrum(itrial).data);
%     
end

for each_subject=1:3
%plot each subject
    subplot(3,1,each_subject)
    plot(meanspec(each_subject,:),'b','LineWidth',1.3)
    hold
    line(100,100:200)
 plot(line,'r','LineWidth',1.3)

    
    axis([0 20 0 1])
end
 
t=1

hline2 = line(t+.06,sin(t)),...
   'LineWidth',4,...
   'Color',[.8 .8 .8],...
   'Parent');
plot(line)

% GroupSpec_HCs=mean(SUB);
% subplot(4, 4, each_subject+1)

% plot(GroupSpec_HCs, 'b','LineWidth',1.3);
%axis([0 50 0 10]);
cd(cerebellar_data_rootdir)
cd GroupData/SpectralAnalysis
%save GroupSpec_HCs GroupSpec_HCs
 
 
