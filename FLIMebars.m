function FLIMebars(ymatrix1, Y1, D1)
%CREATEFIGURE(YMATRIX1, Y1, D1, YMATRIX2, Y2, D2)
%  YMATRIX1:  bar matrix data
%  Y1:  errorbar y vector data
%  D1:  errorbar delta vector data

%  Auto-generated by MATLAB on 02-Oct-2017 16:37:23

% Create figure
figure

% Create multiple lines using matrix input to bar
bar1 = bar(1,ymatrix1(1));
hold on
bar2 = bar(2,ymatrix1(2));
bar3 = bar(3,ymatrix1(3));
bar4 = bar(4,ymatrix1(4));
set(bar1,'DisplayName','C5V',...
    'FaceColor',[0.87058824300766 0.490196079015732 0]);
set(bar2,'DisplayName','C17V',...
    'FaceColor',[0 0.447058826684952 0.74117648601532]);
set(bar3,'DisplayName','C32V','FaceColor',[0 0.498039215803146 0]);
set(bar4,'DisplayName','C32V','FaceColor',[0 0.498039215803146 0]);

% Create errorbar
errorbar(Y1,D1,'DisplayName','data1','LineStyle','none',...
    'LineWidth',1,...
    'Color',[0 0 0]);

% Create title
title('Zen Analysis, 440nm Donor Excitation');

% Create ylabel
ylabel('N-FRET');

box('on');
% Set the remaining axes properties
set('XTick',1,'XTickLabel','');
% Create legend
legend('show');

end