%% Tips for good coding
% //www.mathworks.com/help/matlab/matlab_prog/techniques-for-improving-performance.html?s_tid=doc_12b

%% saving varibles in a loop
for k = 1:10
        filename = [ 'myDataFile' num2str(k) '.mat' ];
        save(filename);
end

%% saving figures in a loop
for i = 1:10
  figure;
  plot(i, i)

  filename = sprintf('address/test_image_%d.png', i);
  saveas(gcf, filename, 'png')
end

%1. Preallocating arrays 
tic
x = zeros(1, 1000000);
for k = 2:1000000
   x(k) = x(k-1) + 5;
end
toc


tic
x = 0;
for k = 2:1000000
   x(k) = x(k-1) + 5;
end
toc


2. 
A = int8(zeros(100));


3. Timing

http://www.mathworks.com/help/matlab/matlab_prog/analyzing-your-programs-performance.html


% plot bar graph with error bars


y_pitch=[GroupMeans.pat_ALLCONDS.pre_pitchWTstdev_clear GroupMeans.HC_ALLCONDS.pre_pitchWTstdev_clear; GroupMeans.pat_ALLCONDS.post_pitchWTstdev_clear GroupMeans.HC_ALLCONDS.post_pitchWTstdev_clear ]
%errY = 0.1.*y;          % 10% error
errY = [GroupSEM.pat_ALLCONDS.pre_pitchWTstdev_clear GroupSEM.HC_ALLCONDS.pre_pitchWTstdev_clear; GroupSEM.pat_ALLCONDS.post_pitchWTstdev_clear GroupSEM.HC_ALLCONDS.post_pitchWTstdev_clear]          % 10% error
h = barwitherr(errY, y_pitch);% Plot with errorbars
set(gca,'XTickLabel',{'pre window','post window'})
legend('Patients','HCs')
ylabel('mean stdev of pitch')
set(h(1),'FaceColor','k');
set(h(2),'FaceColor','w');
title(sprintf('clear'));
 %% colours
 
 figure
 whitebg
set(gcf,'Color',[1,1,1])        % white
set(gcf,'Color',[0.5,0.5,0.5])  % grey
set(gcf,'Color',[1,0.4,0.6])    % pink
set(gcf,'Color',[0 0.1 0.5])        % blue

% isubj = 9;
% for ii=1:isubj
%   eval(['S0' num2str(ii) '=[];'])
% end
% for ii=9:16
%   eval(['S' num2str(ii) '=[];'])
% end
% 
% for xx=1:10
% test=['S' num2str(ii)]
% GroupData.pat_std_withintrial_cond1_pre(1,:)=[test].std_withintrial_cond1_pre
% end
% 

%5. reshape

A=[2 3;4 5;6 7]
B=reshape(A',6,1)
B=B'

% tight plot

% ha = tight_subplot(Nh, Nw, gap, marg_h, marg_w)
%ha=tight_subplot(3, 3, [1,3], [1,3],[1,3])
% for iplot=1:20
%     axes(ha(iplot))
%     plot(frame_taxis_to_use, smallup,  'r --', 'LineWidth', 1.1)
%     hold on
%     plot(frame_taxis_to_use,group_cond1_HCs_to_use_mean, 'k', 'LineWidth', 1.3)
%     axis([0 3 -200 200])
%     goodplot
% end


