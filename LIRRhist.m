all = cell(4,1);
for i = 1:4
    fr = ctl(:,2);
    fr = cell2mat(fr);
    fr(isnan(fr)) = [];
    fr(fr==0) = [];
    all{i} = fr;
end
allm = cell2mat(all);
%hold on, histogram(allm,'BinLimits',[0 1],'Normalization','probability')
