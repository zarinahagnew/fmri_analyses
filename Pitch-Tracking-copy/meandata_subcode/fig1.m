
for itrial=1:3

subplot(311)
plot(gooddata(1).goodpitchdata(2).data(itrial,250:1000), 'k')
goodplot

subplot(312)
plot(lowpass(gooddata(1).goodpitchdata(2).data(itrial,250:1000), 0.01, 3), 'k')
goodplot

subplot(313)
plot(lowpass(gooddata(1).goodpitchdata(2).data(itrial,250:1000), 0.01, 3), 'k')
plot(gooddata(1).goodpitch_difflowpassfilt(2).data(itrial,:), 'k')
axis([0 800 0 50])
goodplot
pause
end

print(gcf, '-dpdf', '-r150', '/Users/zagnew/Desktop/test.pdf');



plot(gooddata(1).goodpitch_difflowpassfilt(2).data(1,:))