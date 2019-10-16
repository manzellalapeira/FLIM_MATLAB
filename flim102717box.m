function flim102717box()

load('FLIMiRBC2g102617.mat')
load('FLIMiRBC102617.mat')

group1 = [A1;A2;A3;A4;A5];
group2 = [early1;early2;early3;early4;early5;early6;early7;early8;early9;early10;early11;early12;early13];

groups = {group1;group2};
grp = cell(2,1);

for g = 1:2
        gr = groups{g,1};
    gr = gr(:,3);
    gr = cell2mat(gr);
    gr = gr(:,1);
    grp{g,1} = (ones(1,numel(gr)).*(g-1))';
    groups{g,1} = gr;
end

spread = cell2mat(groups);
grp = cell2mat(grp);

figure
boxplot(spread,grp,'ColorGroup',grp,'Labels',{'iRBC control','4h 2DG'},'Symbol','')
