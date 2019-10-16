% probability colored scatter plot

A = round(I,-1);

B = round(Chi,2);
%option 1
figure, histogram2(I,Chi,[100 100],'DisplayStyle','tile','ShowEmptyBins','on')

%option 2

% A = fix(rand(100,1)*10);
% B = fix(rand(100,1)*10);
AB =[A B];
% Find unique rows and corresponding indices
[uniqueAB, ~, n] = unique(AB, 'rows');
% Find number of occurrences
nHist = hist(n, unique(n));
mx = max(nHist);
% Create colors for each number of occurrence
colors = jet(mx);
colormap(colors);
% Construct a color matrix
cMatrix = colors(nHist, :);
% Create scatter plot
figure
scatter(uniqueAB(:, 1), uniqueAB(:, 2), 25, cMatrix, 'filled');
colorbar('YTick', linspace(1/(2*mx), 1-1/(2*mx), mx), ...
         'YTickLabel', 1:mx);