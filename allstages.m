function out = allstages()

late_net = [440.202559726963;355.015938213891;324.493550040898;300.656177220341];
mlate_net = mean(late_net);
slate_net = std(late_net);
late_roi = [586.853793636481;599.636723641372;666.940543712106;454.839201021971];
mlate_roi = mean(late_roi);
slate_roi = std(late_roi);
ring_net = [237.359519358569;156.178455087330;187.898898980538;237.359519358568];
mring_net = mean(ring_net);
sring_net = std(ring_net);
ring_roi= [412.627722312515;278.373662711535;376.020001695059;557.574937387407];
mring_roi = mean(ring_roi);
sring_roi = std(ring_roi);
%uRBCs
uRBC = [159.38 182.48 262.94 178.20 157.44 236.77 241.96 157.78 180.95];
muRBC = mean(uRBC);
suRBC = std(uRBC);

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
errorbar([2 5],[mlate_net mlate_roi],[slate_net slate_roi])
errorbar([1 4],[mring_net mring_roi],[sring_net sring_roi])
hold off
figure, hold on
errorbar(1,muRBC,suRBC)
errorbar(2,mring_roi,sring_roi)
errorbar(4,mtroph,stroph)
errorbar(3,mlate_roi,slate_roi)
hold off
disp('uRBC:'),disp(muRBC)
disp('ring net iRBC:'),disp(mring_net)
disp('ring roi iRBC:'),disp(mring_roi)
disp('late net iRBC:'),disp(mlate_net)
disp('late roi iRBC:'),disp(mlate_roi)
[ss1,p1] = ttest2(late_net,ring_net);
[ss2,p2] = ttest2(late_roi,ring_roi);
%[ss3,p3] = 
out = [ss1 p1;ss2 p2];

end