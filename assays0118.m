function out = assays0118()

load('assay010918.mat')
load('assay011618.mat')
load('assay011718.mat')

gCtl1 = [ctl1_10918;ctl2_10918;ctl3_10918;ctl4_10918];
g2Dg1 = [twodg1_10918;twodg2_10918;twodg3_10918;twodg4_10918;twodg5_10918;twodg6_10918;twodg7_10918;twodg8_10918;twodg9_10918;twodg10_10918];
gArt1 = [art1_10918;art2_10918;art3_10918;art4_10918;art5_10918;art6_10918;art7_10918;art8_10918;art9_10918;art10_10918];

gCtl2 = [ctl1_11618;ctl2_11618;ctl3_11618;ctl4_11618;ctl5_11618;ctl6_11618];
g2Dg2 = [twoDG1_11618;twoDG2_11618;twoDG3_11618;twoDG4_11618;twoDG5_11618];
gArt2 = [art1_11618;art2_11618;art3_11618;art4_11618;art5_11618];

gCtl3 = [ctl1_11718;ctl2_11718;ctl3_11718;ctl4_11718;ctl5_11718;ctl6_11718;ctl7_11718;ctl8_11718;ctl9_11718;ctl10_11718];
g2Dg3 = [twoDG1_11718;twoDG2_11718;twoDG3_11718;twoDG4_11718;twoDG5_11718;twoDG6_11718;twoDG7_11718;twoDG8_11718;twoDG9_11718];
gArt3 = [art1_11718;art2_11718;art3_11718;art4_11718;art5_11718;art6_11718];

grCtl = [ctl1_10918;ctl2_10918;ctl3_10918;ctl4_10918;ctl1_11618;ctl2_11618;ctl3_11618;ctl4_11618;ctl5_11618;ctl6_11618;ctl1_11718;ctl2_11718;ctl3_11718;ctl4_11718;ctl5_11718;ctl6_11718;ctl7_11718;ctl8_11718;ctl9_11718;ctl10_11718];
gr2Dg = [twodg1_10918;twodg2_10918;twodg3_10918;twodg4_10918;twodg5_10918;twodg6_10918;twodg7_10918;twodg8_10918;twodg9_10918;twodg10_10918;twoDG1_11618;twoDG2_11618;twoDG3_11618;twoDG4_11618;twoDG5_11618;twoDG1_11718;twoDG2_11718;twoDG3_11718;twoDG4_11718;twoDG5_11718;twoDG6_11718;twoDG7_11718;twoDG8_11718;twoDG9_11718];
grArt = [art1_10918;art2_10918;art3_10918;art4_10918;art5_10918;art6_10918;art7_10918;art8_10918;art9_10918;art10_10918;art1_11618;art2_11618;art3_11618;art4_11618;art5_11618;art1_11718;art2_11718;art3_11718;art4_11718;art5_11718;art6_11718];

groups2 = {grCtl;gr2Dg;grArt};
grp2 = cell(3,1);
for g = 1:3
    gr = groups2{g,1};
    gr = gr(:,3);
    gr = cell2mat(gr);
    gr = gr(1:2:end);
    grp2{g,1} = (ones(1,numel(gr)).*(g-1))';
    groups2{g,1} = gr;
end
spread2 = cell2mat(groups2);
grp2 = cell2mat(grp2);
figure
boxplot(spread2,grp2,'ColorGroup',grp2,'Labels',{'iRBCs','2DG','Art'},'Symbol','')

groups = {gCtl1;gCtl2;gCtl3;g2Dg1;g2Dg2;g2Dg3;gArt1;gArt2;gArt3};
grp = cell(9,1);
avgs = zeros(9,2);

for g = 1:9
    gr = groups{g,1};
    grav = gr(:,1);
    grav = cell2mat(grav);
    grav = grav(~isnan(grav));
    avgs(g,1) = mean(grav);
    av2 = grav(grav>200);
    if g > 3
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
boxplot(spread,grp,'ColorGroup',grp,'Labels',{'iRBCs','iRBCs2','iRBCs3','2DG','2DG2','2DG3','Art','Art2','Art3'},'Symbol','')