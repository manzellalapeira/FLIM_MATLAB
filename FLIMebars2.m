ydata = [nanmean(uRBCs) nanmean(iRBCs) nanmean(mer) nanmean(hz)];
y1 = [nanmean(uRBCs) nanmean(iRBCs) nanmean(mer) nanmean(hz)];
d1 = [nanstd(uRBCs) nanstd(iRBCs) nanstd(mer) nanstd(hz)];

FLIMebars(ydata,y1,d1)