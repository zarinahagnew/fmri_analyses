%% (2) plot mean WT stdev by trial separately
figx=figure;
ymin=0;
ymax=40;
subplot(2,2,1)
for moo=1:10
bar(moo, GroupMeans.HC.pre_pitchWTstdev(moo))
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')
title(sprintf('HC pre-WTstdev pitch across all conditions separately'));


subplot(2,2,2)
for moo=1:10
bar(moo, GroupMeans.pat.pre_pitchWTstdev(moo), 'm')
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')
title(sprintf('Pats pre -WTstdev pitch across all conditions separately'));

subplot(2,2,3)
for moo=1:10
bar(moo, GroupMeans.HC.post_pitchWTstdev(moo))
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')
title(sprintf('HC post-WTstdev pitch across all conditions separately'));

subplot(2,2,4)
for moo=1:10
bar(moo, GroupMeans.pat.post_pitchWTstdev(moo), 'm')
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')
goodplot_wide
title(sprintf('Pats post -WTstdev pitch across all conditions separately'));


% ---

% plot stdevs for whole trial data
figxx=figure;
ymin=0;
ymax=200;
subplot(1,2,1)
title(sprintf('WTstdev pitch across all conditions separately - whole trial (HCs)'));
for moo=1:10
bar(moo, GroupMeans(1).HC(1).wholetrial_pitchWTstdev(moo))
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')

subplot(1,2,2)
for moo=1:10
bar(moo, GroupMeans(1).pat(1).wholetrial_pitchWTstdev(moo), 'm')
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')

% plot wt stdev for flat trials only
figxxx=figure;
ymin=0;
ymax=40;
subplot(2,2,1)
title(sprintf('WTstdev pitch flat trials only'));
bar(1, GroupMeans.HC.pre_pitchWTstdev(3))
hold all
bar(2, GroupMeans.HC.pre_pitchWTstdev(8))
bar(3, GroupMeans.pat.pre_pitchWTstdev(3))
bar(4, GroupMeans.pat.pre_pitchWTstdev(8))

axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')

subplot(2,2,2)
for moo=1:10
bar(moo, GroupMeans.pat.pre_pitchWTstdev(moo), 'm')
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')

subplot(2,2,3)
for moo=1:10
bar(moo, GroupMeans.HC.post_pitchWTstdev(moo))
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')

subplot(2,2,4)
for moo=1:10
bar(moo, GroupMeans.pat.post_pitchWTstdev(moo), 'm')
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')


subplot(2,2,3)
for moo=1:10
bar(moo, GroupMeans.HC.post_pitchWTstdev(moo))
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')

subplot(2,2,4)
for moo=1:10
bar(moo, GroupMeans.pat.post_pitchWTstdev(moo), 'm')
hold all
end
axis([0 11 ymin ymax])
xlabel('condition (1:10)')
ylabel('WT stdev pitch')




