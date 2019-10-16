% FLIM Data analyzed by 01/29/16
% Channel 1 - higher wavelength filters (YFP, cy3)
% Channel 2 - lower wavelength fiters (525bp, CFP)

% 525bp/YFP cube - c1

% Merged channels
i_c1_m = [509.50 413.85 315.27 291.46 222.87 312.71 266.35 398.13 299.51...
    410.20 274.76 222.78 146.73 323.95 327.69 418.35 216.8 273.30...
    559.74 393.44 391.51 669.1 229.62 327.97 632.49];
u_c1_m = [162.78 161.98 149.23 138.36 148.68 126.96 190.22];
m_c1_m = [779.36 1107.41 646.07 810.53 602.82 681.00 982.08...
    1001.60 833.21 805.40 696.08 874.27 538.75 758.60 1140.42 733.92...
    784.14 978.09 1106.78 1568.12 823.57];
di_c1_m = [590.51 779.01 726.02 706.19 655.38 676.56 425.17 785.63 655.80 901.62];
% Single channels
i_c1_ch1 = [334.48 316.96 336.62 311.46 267.42 378.25 309.45 415.21...
    320.47 305.43 301.41 245.82 174.30 211.81 218.37 210.54 198.54...
    294.87 228.36 248.39 253.87 248.52 203.37 230.20];
i_c1_ch2 = [220.65 522.65 319.17 293.16 395.67 343.07 300.01 361.03...
    233.18 373.02 272.62 178.49 127.89 170.82 229.06 238.86 299.69...
    205.27 311.40 291.32 197.64 373.70 189.70 146.94];
u_c1_ch1 = [159.38 182.48 262.94 178.20 157.44 138.55 136.58];
u_c1_ch2 = [125.47 127.33 104.24 124.34 141.30 103.21 166.69];
m_c1_ch1 = [554.11 0.00 829.31 711.56 585.14 612.93 1140.28 798.78...
    777.72 600.98 829.33 1322.45 2103.87 830.68 1090.16 1351.97 499.54...
    0.00 0.00 920.22 710.94];
m_c1_ch2 = [709.27 785.66 855.27 813.13 946.41 1122.15 662.94 961.33...
    992.18 744.98 843.11 1044.99 773.59 878.08 636.35 737.39 758.92...
    490.84 908.93 717.07 716.40];
di_c1_ch1 = [431.59 564.90 629.04 774.42 771.77 661.23 612.27 791.20 797.10 641.91];
di_c1_ch2 = [489.83 660.25 703.54 694.68 585.69 514.55 629.96 674.66 667.94 398.73];
% syntheic hemozoin
h_c1_ch1 = [106.25 106.45 106.45 76.73 76.05 49.24 63.80 51.28 45.86 49.06 42.62 40.46 50.17 54.46 44.52 82.72 46.44 49.04 54.11];
h_c1_ch2 = [48.74 38.87 45.34 38.59 34.17 37.77 38.85 38.70 37.50 36.72 33.52 33.61 35.30 35.40 30.05 37.56 36.99 34.52 35.13];

% CFP/YFP cube - c2

% Merged channels
i_c2_m = [292.67 410.16 294.05 281.07 317.48 253.0];
u_c2_m = [154.19 157.49 242.46 150.51 154.83];
m_c2_m = 774;
di_c2_m = [785.13 661.86 658.21 554.69 853.49 519.39 908.69 703.75 619.72 687.74];
% Single channels
i_c2_ch1 = [292.26 364.26 316.16 288.82 272.83 188.82];
i_c2_ch2 = [275.06 230.52 440.14 284.11 480.56 288.82];
u_c2_ch1 = [236.77 241.96 307.25 157.78 180.95];
u_c2_ch2 = [306.25 123.95 179.10 138.03 138.36];
m_c2_ch1 = [334.19 572.86 730.88 679.77 691.05 746.84 446.12];
m_c2_ch2 = [659.53 800.06 737.24 577.64 592.51 644.79 589.88];
di_c2_ch1 = [767.56 758.83 700.83 600.26 821.13 574.05 771.36 658.63 560.64 708.95];
di_c2_ch2 = [549.71 695.83 648.00 739.55 677.11 527.23 603.74 729.17 659.47 689.04];
% synthetic hemozoin
h_c2_ch1 = [98.86 104.61 94.87 107.63 90.12 81.29 62.13 72.80 71.21 73.56 71.49 69.61];
h_c2_ch2 = [76.54 82.67 73.93 84.41 81.33 104.62 92.98 89.79 101.36 96.14 90.42 91.23];

% CFP/cy3 cube - c3

% Single channels
i_c3_ch1 = [344.21 350.62 296.47 279.97 243.28 296.80 256.94 315.97 352.25 316.86 308.98 285.62 287.67 290.55 306.01 298.54 275.35 278.83 267.87 281.96 291.29 234.14 296.18 295.81 326.04 311.41 325.42];
i_c3_ch2 = [305.00 294.26 396.56 351.42 345.44 616.08 567.95 360.19 414.20 408.95 369.50 339.89 268.84 301.98 294.44 276.45 564.16 270.21 252.99 266.96 240.41 238.55 338.04 307.44 345.37 380.30 346.42];
u_c3_ch1 = [358.90 281.32 519.53 257.77 353.35 325.67];
u_c3_ch2 = [862.88 303.26 429.43 777.91 639.83 461.37];
m_c3_ch1 = [];
m_c3_ch2 = [];
di_c3_ch1 = [556.30 626.60 599.37 632.17 680.48 630.97 636.06 640.91 692.87 756.49];
di_c3_ch2 = [669.52 602.31 571.34 615.33 714.53 565.25 732.05 583.76 1091.39 666.12];
du_c3_ch1 = [256.61 430.02 261.07 517.29 422.41 302.51 229.52 222.05 224.96 271.98 305.51 270.72 388.76 470.16 285.87 369.72 268.97];
du_c3_ch2 = [579.28 364.33 557.22 377.69 282.80 403.97 260.39 285.60 221.43 314.57 281.13 339.55 486.67 360.59 314.24 466.50 360.51];
% t groups were iRBCs with triton added in the media (~0.1%)
t_c3_ch1 = [308.04 289.65 245.74 243.47 399.92 196.72 551.73];
t_c3_ch2 = [394.59 424.99 327.35 365.89 362.62 386.02 748.88];
% synthetic hemozoin
h_c3_ch1 = [83.45 67.78 70.48 60.54 68.72 77.55 68.59 80.19 65.96 70.73 128.13 53.75 67.14 71.92 104.63 82.34 68.51];
h_c3_ch2 = [69.59 99.64 61.19 267.41 40.56 81.14 115.47 51.35 141.03 52.21 32.71 40.97 45.80 48.80 181.29 121.01 33.10];

%% Graphs:   

% cube 1, channel 1
av_c1ch1 = [mean(i_c1_ch1) mean(u_c1_ch1) mean(m_c1_ch1) mean(di_c1_ch1) mean(h_c1_ch1)];
std_c1ch1 = [std(i_c1_ch1) std(u_c1_ch1) std(m_c1_ch1) std(di_c1_ch1) std(h_c1_ch1)];
err_c1ch1 = [std(i_c1_ch1)/sqrt(numel(i_c1_ch1)) std(u_c1_ch1)/sqrt(numel(u_c1_ch1)) std(m_c1_ch1)/sqrt(numel(m_c1_ch1)) std(di_c1_ch1)/sqrt(numel(di_c1_ch1)) std(h_c1_ch1)/sqrt(numel(h_c1_ch1))];

% cube 1, channel 2
av_c1ch2 = [mean(i_c1_ch2) mean(u_c1_ch2) mean(m_c1_ch2) mean(di_c1_ch2) mean(h_c1_ch2)];
std_c1ch2 = [std(i_c1_ch2) std(u_c1_ch2) std(m_c1_ch2) std(di_c1_ch2) std(h_c1_ch2)];
err_c1ch2 = [std(i_c1_ch2)/sqrt(numel(i_c1_ch2)) std(u_c1_ch2)/sqrt(numel(u_c1_ch2)) std(m_c1_ch2)/sqrt(numel(m_c1_ch2)) std(di_c1_ch2)/sqrt(numel(di_c1_ch2)) std(h_c1_ch2)/sqrt(numel(h_c1_ch2))];

% cube 2, channel 1
av_c2ch1 = [mean(i_c2_ch1) mean(u_c2_ch1) mean(m_c2_ch1) mean(di_c2_ch1) mean(h_c2_ch1)];
std_c2ch1 = [std(i_c2_ch1) std(u_c2_ch1) std(m_c2_ch1) std(di_c2_ch1) std(h_c2_ch1)];
err_c2ch1 = [std(i_c2_ch1)/sqrt(numel(i_c2_ch1)) std(u_c2_ch1)/sqrt(numel(u_c2_ch1)) std(m_c2_ch1)/sqrt(numel(m_c2_ch1)) std(di_c2_ch1)/sqrt(numel(di_c2_ch1)) std(h_c2_ch1)/sqrt(numel(h_c2_ch1))];

% cube 2, channel 2
av_c2ch2 = [mean(i_c2_ch2) mean(u_c2_ch2) mean(m_c2_ch2) mean(di_c2_ch2) mean(h_c2_ch2)];
std_c2ch2 = [std(i_c2_ch2) std(u_c2_ch2) std(m_c2_ch2) std(di_c2_ch2) std(h_c2_ch2)];
err_c2ch2 = [std(i_c2_ch2)/sqrt(numel(i_c2_ch2)) std(u_c2_ch2)/sqrt(numel(u_c2_ch2)) std(m_c2_ch2)/sqrt(numel(m_c2_ch2)) std(di_c2_ch2)/sqrt(numel(di_c2_ch2)) std(h_c2_ch2)/sqrt(numel(h_c2_ch2))];

% cube 3, channel 1
av_c3ch1 = [mean(i_c3_ch1) mean(u_c3_ch1) mean(m_c3_ch1) mean(di_c3_ch1) mean(h_c3_ch1)];
std_c3ch1 = [std(i_c3_ch1) std(u_c3_ch1) std(m_c3_ch1) std(di_c3_ch1) std(h_c3_ch1)];
err_c3ch1 = [std(i_c3_ch1)/sqrt(numel(i_c3_ch1)) std(u_c3_ch1)/sqrt(numel(u_c3_ch1)) std(m_c3_ch1)/sqrt(numel(m_c3_ch1)) std(di_c3_ch1)/sqrt(numel(di_c3_ch1)) std(h_c3_ch1)/sqrt(numel(h_c3_ch1))];

% cube 3, channel 2
av_c3ch2 = [mean(i_c3_ch2) mean(u_c3_ch2) mean(m_c3_ch2) mean(di_c3_ch2) mean(h_c3_ch2)];
std_c3ch2 = [std(i_c3_ch2) std(u_c3_ch2) std(m_c3_ch2) std(di_c3_ch2) std(h_c3_ch2)];
err_c3ch2 = [std(i_c3_ch2)/sqrt(numel(i_c3_ch2)) std(u_c3_ch2)/sqrt(numel(u_c3_ch2)) std(m_c3_ch2)/sqrt(numel(m_c3_ch2)) std(di_c3_ch2)/sqrt(numel(di_c3_ch2)) std(h_c3_ch2)/sqrt(numel(h_c3_ch2))];

figure
barwitherr([err_c1ch1' err_c1ch2' err_c2ch1' err_c2ch2' err_c3ch1' err_c3ch2'], [1 2 3 4 5],[av_c1ch1' av_c1ch2' av_c2ch1' av_c2ch2' av_c3ch1' av_c3ch2']) 

set(gca,'XTickLabel',{'iRBCs','uRBCs','Merozoites','diRBCs','Hemozoin'})
   legend('550/50','525LP','550/50','480/40','605/70','480/40')
   ylabel('Average Autofluorescence Lifetime (ps)')
   grid on
   colormap jet
   
%% - GROUPING FILTERS

a_525 = [mean(i_c1_ch2) mean(u_c1_ch2) mean(m_c1_ch2) mean(di_c1_ch2) mean(h_c1_ch2)];
s_525 = [std(i_c1_ch2) std(u_c1_ch2) std(m_c1_ch2) std(di_c1_ch2) std(h_c1_ch2)];
e_525 = [std(i_c1_ch2)/sqrt(numel(i_c1_ch2)) std(u_c1_ch2)/sqrt(numel(u_c1_ch2)) std(m_c1_ch2)/sqrt(numel(m_c1_ch2)) std(di_c1_ch2)/sqrt(numel(di_c1_ch2)) std(h_c1_ch2)/sqrt(numel(h_c1_ch2))];

a_480 = [mean([i_c2_ch2 i_c3_ch2]) mean([u_c2_ch2 u_c3_ch2]) mean([m_c2_ch2 m_c3_ch2]) mean([di_c2_ch2 di_c3_ch2]) mean([h_c2_ch2 h_c3_ch2])];
s_480 = [std([i_c2_ch2 i_c3_ch2]) std([u_c2_ch2 u_c3_ch2]) std([m_c2_ch2 m_c3_ch2]) std([di_c2_ch2 di_c3_ch2]) std([h_c2_ch2 h_c3_ch2])];
e_480 = [std([i_c2_ch2 i_c3_ch2])/sqrt(numel([i_c2_ch2 i_c3_ch2])) std([u_c2_ch2 u_c3_ch2])/sqrt(numel([u_c2_ch2 u_c3_ch2])) std([m_c2_ch2 m_c3_ch2])/sqrt(numel([m_c2_ch2 m_c3_ch2])) std([di_c2_ch2 di_c3_ch2])/sqrt(numel([di_c2_ch2 di_c3_ch2])) std([h_c2_ch2 h_c3_ch2])/sqrt(numel([h_c2_ch2 h_c3_ch2]))];

a_575 = [mean([i_c1_ch1 i_c1_ch2]) mean([u_c1_ch1 u_c1_ch2]) mean([m_c1_ch1 m_c1_ch2]) mean([di_c1_ch1 di_c1_ch2]) mean([h_c1_ch1 h_c1_ch2])];
s_575 = [std([i_c1_ch1 i_c1_ch2]) std([u_c1_ch1 u_c1_ch2]) std([m_c1_ch1 m_c1_ch2]) std([di_c1_ch1 di_c1_ch2]) std([h_c1_ch1 h_c1_ch2])];
e_575 = [std([i_c1_ch1 i_c1_ch2])/sqrt(numel([i_c1_ch1 i_c1_ch2])) std([u_c1_ch1 u_c1_ch2])/sqrt(numel([u_c1_ch1 u_c1_ch2])) std([m_c1_ch1 m_c1_ch2])/sqrt(numel([m_c1_ch1 m_c1_ch2])) std([di_c1_ch1 di_c1_ch2])/sqrt(numel([di_c1_ch1 di_c1_ch2])) std([h_c1_ch1 h_c1_ch2])/sqrt(numel([h_c1_ch1 h_c1_ch2]))];

a_550 = [mean([i_c1_ch1 i_c2_ch1]) mean([u_c1_ch1 u_c2_ch1]) mean([m_c1_ch1 m_c2_ch1]) mean([di_c1_ch1 di_c2_ch1]) mean([h_c1_ch1 h_c2_ch1])];
s_550 = [std([i_c1_ch1 i_c2_ch1]) std([u_c1_ch1 u_c2_ch1]) std([m_c1_ch1 m_c2_ch1]) std([di_c1_ch1 di_c2_ch1]) std([h_c1_ch1 h_c2_ch1])];
e_550 = [std([i_c1_ch1 i_c2_ch1])/sqrt(numel([i_c1_ch1 i_c2_ch1])) std([u_c1_ch1 u_c2_ch1])/sqrt(numel([u_c1_ch1 u_c2_ch1])) std([m_c1_ch1 m_c2_ch1])/sqrt(numel([m_c1_ch1 m_c2_ch1])) std([di_c1_ch1 di_c2_ch1])/sqrt(numel([di_c1_ch1 di_c2_ch1])) std([h_c1_ch1 h_c2_ch1])/sqrt(numel([h_c1_ch1 h_c2_ch1]))];

a_605 = [mean(i_c3_ch1) mean(u_c3_ch1) mean(m_c3_ch1) mean(di_c3_ch1) mean(h_c3_ch1)];
s_605 = [std(i_c3_ch2) std(u_c3_ch2) std(m_c3_ch2) std(di_c3_ch2) std(h_c3_ch2)];
e_605 = [std(i_c3_ch2)/sqrt(numel(i_c3_ch2)) std(u_c3_ch2)/sqrt(numel(u_c3_ch2)) std(m_c3_ch2)/sqrt(numel(m_c3_ch2)) std(di_c3_ch2)/sqrt(numel(di_c3_ch2)) std(h_c3_ch2)/sqrt(numel(h_c3_ch2))];

figure
barwitherr([e_525' e_480' e_575' e_550' e_605'], [1 2 3 4 5],[a_525' a_480' a_575' a_550' a_605'])
set(gca,'XTickLabel',{'iRBCs','uRBCs','Merozoites','diRBCs','Hemozoin'})
   legend('525 LP','480/40','575 LP','550/50','605/70')
   ylabel('Average Autofluorescence Lifetime (ps)')
   grid on
   colormap jet
   
   %% - a set that compares single to merged channels
%infected
avg_ti_merge = [mean(i_c1_m) mean(i_c1_ch1) mean(i_c1_ch2)...
                mean(i_c2_m) mean(i_c2_ch1) mean(i_c2_ch2)];
std_ti_merge = [std(i_c1_m) std(i_c1_ch1) std(i_c1_ch2)...
                std(i_c2_m) std(i_c2_ch1) std(i_c2_ch2)];
sem_ti_merge = [std(i_c1_m)/sqrt(numel(i_c1_m)) std(i_c1_ch1)/sqrt(numel(i_c1_ch1)) std(i_c1_ch2)/sqrt(numel(i_c1_ch1))...
                std(i_c2_m)/sqrt(numel(i_c2_m)) std(i_c2_ch1)/sqrt(numel(i_c2_ch1)) std(i_c2_ch2)/sqrt(numel(i_c2_ch2))];
%names_merge = {'Cube 1 Mix' 'Cube 1 Ch1' 'Cube 1 Ch2' 'Cube 2 Mix' 'Cube 2 Ch1' 'Cube 2 Ch2'}; % The names are the same for the first three graphs
figure, hold on
bar(avg_ti_merge,'FaceColor','r'),title('Infected RBCs - Comparison Between Merged Channels and Single Channels')
set(gca,'XTickLabel',{'' 'Cube 1 Mix' 'Cube 1 Ch1' 'Cube 1 Ch2' 'Cube 2 Mix' 'Cube 2 Ch1' 'Cube 2 Ch2' ''});
ylabel('Lifetime tau (ps)');
errorbar(avg_ti_merge,sem_ti_merge, '.') 
hold off

%uninfected
avg_tu_merge = [mean(u_c1_m) mean(u_c1_ch1) mean(u_c1_ch2)...
                mean(u_c2_m) mean(u_c2_ch1) mean(u_c2_ch2)];
std_tu_merge = [std(u_c1_m) std(u_c1_ch1) std(u_c1_ch2)...
                std(u_c2_m) std(u_c2_ch1) std(u_c2_ch2)];
sem_tu_merge = [std(u_c1_m)/sqrt(numel(u_c1_m)) std(u_c1_ch1)/sqrt(numel(u_c1_ch1)) std(u_c1_ch2)/sqrt(numel(u_c1_ch1))...
                std(u_c2_m)/sqrt(numel(u_c2_m)) std(u_c2_ch1)/sqrt(numel(u_c2_ch1)) std(u_c2_ch2)/sqrt(numel(u_c2_ch2))];
figure, hold on
bar(avg_tu_merge,'FaceColor','r'),title('Healthy RBCs - Comparison Between Merged Channels and Single Channels')
set(gca,'XTickLabel',{'' 'Cube 1 Mix' 'Cube 1 Ch1' 'Cube 1 Ch2' 'Cube 2 Mix' 'Cube 2 Ch1' 'Cube 2 Ch2' ''});
ylabel('Lifetime tau (ps)');
errorbar(avg_tu_merge,sem_tu_merge, '.') 
hold off

%merozoites
avg_tm_merge = [mean(m_c1_m) mean(m_c1_ch1) mean(m_c1_ch2)...
                mean(m_c2_m) mean(m_c2_ch1) mean(m_c2_ch2)];
std_tm_merge = [std(m_c1_m) std(m_c1_ch1) std(m_c1_ch2)...
                std(m_c2_m) std(m_c2_ch1) std(m_c2_ch2)];
sem_tm_merge = [std(m_c1_m)/sqrt(numel(m_c1_m)) std(m_c1_ch1)/sqrt(numel(m_c1_ch1)) std(m_c1_ch2)/sqrt(numel(m_c1_ch1))...
                std(m_c2_m)/sqrt(numel(m_c2_m)) std(m_c2_ch1)/sqrt(numel(m_c2_ch1)) std(m_c2_ch2)/sqrt(numel(m_c2_ch2))];
figure, hold on
bar(avg_tm_merge, 0.5,'FaceColor','r'),title('Merozoites - Comparison Between Merged Channels and Single Channels')
set(gca,'XTickLabel',{'' 'Cube 1 Mix' 'Cube 1 Ch1' 'Cube 1 Ch2' 'Cube 2 Mix' 'Cube 2 Ch1' 'Cube 2 Ch2' ''});
ylabel('Lifetime tau (ps)');
errorbar(avg_tm_merge,sem_tm_merge, '.') 
hold off

%%           - compare groups
% cube 1
% merged
avg_t_c1m = [mean(i_c1_m) mean(u_c1_m) mean(m_c1_m)];
std_t_c1m = [std(i_c1_m) std(u_c1_m) std(m_c1_m)];
sem_t_c1m = [std(i_c1_m)/sqrt(numel(i_c1_m)) std(u_c1_m)/sqrt(numel(u_c1_m)) std(m_c1_m)/sqrt(numel(m_c1_m))];
names_tm = ['iRBCs' 'uRBCs' 'Merozoites'];
figure, hold on
bar(avg_t_c1m),title('Comparison Between Samples Using 525bp/YFP Cube - Merged Channels')
set(gca,'XTickLabel',{'' 'iRBCs' '' 'uRBCs' '' 'Merozoites' ''});
ylabel('Lifetime tau (ps)');
errorbar(avg_t_c1m,sem_t_c1m, '.') 
hold off
% single
avg_t_c1s = [mean(i_c1_ch1) mean(u_c1_ch1) mean(m_c1_ch1) mean(i_c1_ch2) mean(u_c1_ch2) mean(m_c1_ch2)];
std_t_c1s = [std(i_c1_ch1) std(u_c1_ch1) std(m_c1_ch1) std(i_c1_ch2) std(u_c1_ch2) std(m_c1_ch2)];
sem_t_c1s = [std(i_c1_ch1)/sqrt(numel(i_c1_ch1)) std(u_c1_ch1)/sqrt(numel(u_c1_ch1)) std(m_c1_ch1)/sqrt(numel(m_c1_ch1))...
             std(i_c1_ch2)/sqrt(numel(i_c1_ch2)) std(u_c1_ch2)/sqrt(numel(u_c1_ch2)) std(m_c1_ch2)/sqrt(numel(m_c1_ch2))];
names_ts = ['iRBCs Ch1' 'uRBCs Ch1' 'mer Ch1' 'iRBCs Ch2' 'uRBCs Ch2' 'mer Ch2'];
figure, hold on
bar(avg_t_c1s, 0.5),title('Comparison Between Samples Using 525bp/YFP Cube - Single Channels')
set(gca,'XTickLabel',{'' 'iRBCs Ch1' 'uRBCs Ch1' 'mer Ch1' 'iRBCs Ch2' 'uRBCs Ch2' 'mer Ch2' ''});
ylabel('Lifetime tau (ps)');
errorbar(avg_t_c1s,sem_t_c1s, '.') 
hold off
% cube 2
% merged
avg_t_c2m = [mean(i_c1_m) mean(u_c1_m) mean(m_c1_m)];
std_t_c2m = [std(i_c1_m) std(u_c1_m) std(m_c1_m)];
sem_t_c2m = [std(i_c1_m)/sqrt(numel(i_c1_m)) std(u_c1_m)/sqrt(numel(u_c1_m)) std(m_c1_m)/sqrt(numel(m_c1_m))];
figure, hold on
bar(avg_t_c2m),title('Comparison Between Samples Using CFP/YFP Cube - Merged Channels')
set(gca,'XTickLabel',{'' 'iRBCs' '' 'uRBCs' '' 'Merozoites' ''});
ylabel('Lifetime tau (ps)');
errorbar(avg_t_c2m,sem_t_c2m, '.') 
hold off
% single
avg_t_c2s = [mean(i_c2_ch1) mean(u_c2_ch1) mean(m_c2_ch1) mean(i_c2_ch2) mean(u_c2_ch2) mean(m_c2_ch2)];
std_t_c2s = [std(i_c2_ch1) std(u_c2_ch1) std(m_c2_ch1) std(i_c2_ch2) std(u_c2_ch2) std(m_c2_ch2)];
sem_t_c2s = [std(i_c2_ch1)/sqrt(numel(i_c2_ch1)) std(u_c2_ch1)/sqrt(numel(u_c2_ch1)) std(m_c2_ch1)/sqrt(numel(m_c2_ch1))...
             std(i_c2_ch2)/sqrt(numel(i_c2_ch2)) std(u_c2_ch2)/sqrt(numel(u_c2_ch2)) std(m_c2_ch2)/sqrt(numel(m_c2_ch2))];
figure, hold on
bar(avg_t_c2s, 0.5),title('Comparison Between Samples Using CFP/YFP Cube - Single Channels')
set(gca,'XTickLabel',{'' 'iRBCs Ch1' 'uRBCs Ch1' 'mer Ch1' 'iRBCs Ch2' 'uRBCs Ch2' 'mer Ch2' ''});
ylabel('Lifetime tau (ps)');
errorbar(avg_t_c2s,sem_t_c2s, '.') 
hold off

%% MitoTracker Red Analysis
% These experiments will confirm whether or not the presence of the dye
% will affect the intrinsic FLIM signatures
% Data was acquired with the c2 - CFP/YFP cube

free_i = [289.64 573.37 339.71 344.20 292.85];
red_i = [225.69 201.01 169.21 228.25 211.53];
free_u = [176.71 163.58 159.01];
red_u = [200.91 359.08];

%% 2015 data

% Analysis comparing the infected, uninfected, and both anti-malarials
% average t's from each image acquired
%tm_u = [57.33 115.84 70.78 121.41 173.77 157.82 123.61 119.12 121.38 ...
%    145.97 215.83 199.30 398.30 209.75 249.65 481.10 77.63 319.73 ...
%    269.61 117.56 285.67 179.78 273.16 92.62 222.92 147.49]; 
%tm_i = [608.33 442.17 997.46 260.56 397.01 1234.92 1119.16 940.95 ...
%    1143.48 1144.21 235.92 211.88 219.76 153.63 410.87 594.07 ...
%    601.65 242.70 560.84];
%tm_g = [360.57 476.57 651.59 417.04 567.99 649.97 1050.07 319.59 ...
%    252.40 257.03 560.66 255.10 897.69 684.30 314.08 250.80 356.19 ...
%    620.42 355.42 217.44 207.30 362.59 254.37 364.28 185.93 291.53];
%tm_h = [229.46 243.93 300.29 267.95 189.66 307.18 394.06 335.66 ...
%    302.20 348.81 383.57 536.53 387.65 542.88 310.06 467.76 304.61 ...
%    361.81 439.04];

%avg_tm = [mean(tm_u) mean(tm_i) mean(tm_g) mean(tm_h)];
%sdev_tm = [std(tm_u) std(tm_i) std(tm_g) std(tm_h)];
%SEM = [std(tm_u)/sqrt(numel(tm_u)) std(tm_i)/sqrt(numel(tm_i)) ...
%    std(tm_g)/sqrt(numel(tm_g)) std(tm_h)/sqrt(numel(tm_h))];
%names = ['uRBCs iRBCs' 'gRBCs' 'Hz'];

%figure
%hold on
%bar(avg_tm, 0.5)
%errorbar(avg_tm,SEM, '.')

%h = ttest2(tm_u,tm_i);
%disp(h)