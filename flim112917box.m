function out = flim112917box()

load('FLIMiRBC111817.mat')
load('FLIMiRBCr112917.mat')
load('rings0118.mat')

group1 = [early1;early2;early3;early4;early5;early6;early7;early8;early9;early10;early11;early12;early13];
group2 = [rings1a;rings1b;rings1c;rings1d;rings1e];
group3 = [rings2a;rings2b;rings2c;rings2d;rings2e;rings2f];

groups = {group1;group2;group3};
grp = cell(3,1);
avgs = zeros(3,2);

for g = 1:3
    gr = groups{g,1};
    grav = gr(:,1);
    grav = cell2mat(grav);
    grav = grav(~isnan(grav));
    avgs(g,1) = mean(grav);
    av2 = grav(grav>200);
    av2 = av2(av2<1500);
    avgs(g,2) = mean(av2);
    gr = gr(:,3);
    gr = cell2mat(gr);
    gr = gr(1:2:end);
    grp{g,1} = (ones(1,numel(gr)).*(g-1))';
    groups{g,1} = gr;
end

out = avgs;
spread = cell2mat(groups);
grp = cell2mat(grp);

figure
boxplot(spread,grp,'ColorGroup',grp,'Labels',{'1','2','3'},'Symbol','')
