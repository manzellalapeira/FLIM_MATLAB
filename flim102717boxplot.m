function flim102717boxplot()

load('FLIMiRBC2g102617.mat')
load('FLIMiRBC102617.mat')
group_i = [i1;i2;i3;i4;i5];
i_group = group_i(:,1);
i_group = cell2mat(i_group);
%r1 = size(i_group,1);

group_i2g = [ig1;ig2;ig3;ig4;ig5;ig6;ig7;ig8;ig9;ig10];
i2g_group = group_i2g(:,1);
i2g_group = cell2mat(i2g_group);
%r2 = size(i2g_group,1);

i_group(i_group<250) = [];
i2g_group(i2g_group<250) = [];
figure, hold on
h1 = histogram(i_group);
h1.Normalization = 'probability';
h1.BinWidth = 1;
h2 = histogram(i2g_group);
h2.Normalization = 'probability';
h2.BinWidth = 1;
hold off

%spread = [i_group' i2g_group'];
%spread = double(spread);
%grp = [zeros(1,r1) ones(1,r2)];

%boxplot(spread,grp,'ColorGroup',grp)
