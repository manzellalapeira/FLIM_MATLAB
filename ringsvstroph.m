function ringsvstroph()

ring_net = [237.359519358569;156.178455087330;187.898898980538;237.359519358568];
mring_net = mean(ring_net);
sring_net = std(ring_net);
ring_roi= [412.627722312515;278.373662711535;376.020001695059;557.574937387407];
mring_roi = mean(ring_roi);
sring_roi = std(ring_roi);

load('assay010918.mat')
load('assay011618.mat')
load('assay011718.mat')
iCt = [453.714302819056;505.247277005235;586.853793636481];
gCtl1 = [ctl1_10918;ctl2_10918;ctl3_10918;ctl4_10918];
gCtl2 = [ctl1_11618;ctl2_11618;ctl3_11618;ctl4_11618;ctl5_11618;ctl6_11618];
gCtl3 = [ctl1_11718;ctl2_11718;ctl3_11718;ctl4_11718;ctl5_11718;ctl6_11718;ctl7_11718;ctl8_11718;ctl9_11718;ctl10_11718];
grCtl = [ctl1_10918;ctl2_10918;ctl3_10918;ctl4_10918;ctl1_11618;ctl2_11618;ctl3_11618;ctl4_11618;ctl5_11618;ctl6_11618;ctl1_11718;ctl2_11718;ctl3_11718;ctl4_11718;ctl5_11718;ctl6_11718;ctl7_11718;ctl8_11718;ctl9_11718;ctl10_11718];
troph = cell2mat(grCtl(:,3));
troph = troph(1:2:end,:);
mtroph = mean(iCt);
stroph = std(iCt);

figure, hold on
errorbar(1,mtroph,stroph)
errorbar(2,mring_net,sring_net)
errorbar(3,mring_roi,sring_roi)
hold off