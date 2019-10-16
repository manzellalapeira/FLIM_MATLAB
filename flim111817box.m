function out = flim111817box()

load('FLIMiRBC111817.mat')
load('FLIMiRBC2g102617.mat')
load('FLIMiRBC102617.mat')

group_A = [A1;A2;A3;A4;A5];%i1;i2;i3;i4;i5];
group_B = [B1;B2;B3;B4;B5];
group_C = [ig1;ig2;ig3;ig4;ig5;ig6;ig7;ig8;ig9;ig10];
group_D = [D1;D2;D3;D4;D5];
group_E = [E1;E2;E3;E4;E5;E6;E7;E8;E9;E10];

groups = {group_A;group_C;group_B;group_D;group_E};
grp = cell(5,1);
avgs = zeros(5,2);

for g = 1:5
    gr = groups{g,1};
    grav = gr(:,1);
    grav = cell2mat(grav);
    grav = grav(~isnan(grav));
    avgs(g,1) = mean(grav);
    av2 = grav(grav>200);
    if g > 1
        av2 = av2(av2<1500);
    end
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
boxplot(spread,grp,'ColorGroup',grp,'Labels',{'iRBC control','4h 2DG','Artem','Blast','Chlor'},'Symbol','')
