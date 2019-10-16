function drugeffect()

tDg = [419.909525668554;399.065010321973;416.513579326624];
iCt = [453.714302819056;505.247277005235;586.853793636481];
aRt = [367.033775037070;360.530813505884;393.6042;441.068];

miCt = mean(iCt);
siCt = std(iCt);
mtDg = mean(tDg);
smtDg = std(tDg);
maRt = mean(aRt);
saRt = std(aRt);
%uRBCs
uRBC = [159.38 182.48 262.94 178.20 157.44 236.77 241.96 157.78 180.95];
muRBC = mean(uRBC);
suRBC = std(uRBC);

figure, hold on
errorbar(1,muRBC,suRBC);
errorbar(2,miCt,siCt);
errorbar(3,mtDg,smtDg);
errorbar(4,maRt,saRt);
hold off

end
