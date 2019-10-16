function out = late0118()

load('irbcs0118.mat')

group1 = [irbc1a;irbc1b;irbc1c;irbc1d;irbc1e];
group2 = [irbc2a;irbc2b;irbc2c;irbc2d;irbc2e];
group3 = [irbc3a;irbc3b;irbc3c;irbc3d;irbc3e];

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
    %av2 = av2(av2<1500);
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