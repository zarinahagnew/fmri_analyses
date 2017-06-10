clear all
close all

set_params;

cd(cerebellar_data_rootdir)

load GroupData/SpectralAnalysis/GroupSpec_PATs
load GroupData/SpectralAnalysis/GroupSpec_HCs

figure
plot(GroupSpec_PATs, 'b');
hold 
plot(GroupSpec_HCs, 'm');
axis([0 50 0 5]);

% subplot(2,1,1)
% moo=loglog(GroupSpec_PATs, 'b')
% subplot(2,1,2)
% moo2=loglog(GroupSpec_HCs, 'm')
% plot(moo)

STATS_spectralanal=ttest2(GroupSpec_PATs, GroupSpec_HCs)
