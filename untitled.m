group_cond1_HCs_to_use_mean
data=group_cond1_HCs_to_use_mean(300:400)
windsize=3
% inputs = data
% arguments = window size

clear temp

%chop data in to windows 
% temp is one mean data point for each window
for iwindow=1:90 % length(data)/windsize    90
temp(iwindow)=nanmean(data(iwindow:iwindow+windsize))
end

% calculate mean trial
meantrial=nanmean(data)
moo=ones(1,length(data))
meantrial=meantrial*moo

%plot that all to check
subplot(3,1,1)
plot(data)
hold on
plot(meantrial, 'm')
title('raw data and mean')

subplot(3,1,2)
plot(temp)
title('smoothed line (moving average)')

subplot(3,1,3)
plot(distance)
title('distance from mean over 10 frame moving window')








moo=ones(1,windsize+1)

for iframe=1:90
temp1(iframe,:)=moo*temp(iframe)
end

iframe=1
plotsmoothedline=[temp1,:)]


for i = 2:10
    dataToAppend_cond1 = temp1(iframe+1,:)
end













nanmean(data(1:4))
temp(1)

% calculate and plot moving average

save temp temp

for iframe=1:length(data)
    distance(iframe)=data(iframe)-nanmean(temp(iframe,:))
end




distance

window_size=10

simple = tsmovavg(data,'s',window_size,1)