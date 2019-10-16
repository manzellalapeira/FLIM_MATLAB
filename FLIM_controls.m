% Data with fresh RBCs from subjects (only cubes 2 and 3 used)

s1_c2_ch1 = [195.14 157.79 135.00 134.83 169.03];
s1_c2_ch2 = [63.46 186.41 106.46 80.15 168.37];
s1_c3_ch1 = [173.64 245.56 197.64 130.62 164.54];
s1_c3_ch2 = [131.58 264.19 118.82 156.11 88.11];

s2_c2_ch1 = [144.78 151.90 95.62 88.83 101.82];
s2_c2_ch2 = [102.24 99.36 115.17 122.25 141.14];
s2_c3_ch1 = [156.75 113.67 160.50 141.59 148.94];
s2_c3_ch2 = [352.63 109.19 106.63 91.19 80.60];

s3_c2_ch1 = [147.37 108.50 98.77 121.09 105.65];
s3_c2_ch2 = [138.00 101.94 127.94 130.26 125.20];
s3_c3_ch1 = [182.14 150.01 114.08 498.70];
s3_c3_ch2 = [67.98 122.17 87.73 83.79 110.49];

s4_c2_ch1 = [87.65 105.62 100.60 105.80];
s4_c2_ch2 = [113.60 105.34 106.17 129.24];
s4_c3_ch1 = [116.37 146.32 285.29 130.76 134.90];
s4_c3_ch2 = [112.38 336.96 120.46 107.20 90.29];

s5_c2_ch1 = [234.44 124.31 149.78 143.28];
s5_c2_ch2 = [127.07 114.93 127.44 111.88 106.59];
s5_c3_ch1 = [223.89 155.64 187.38 261.38 205.37];
s5_c3_ch2 = [101.82 122.72 112.87 119.36 84.00];

s6_c2_ch1 = [104.24 167.12 231.33 109.40 221.34];
s6_c2_ch2 = [91.40 79.78 70.02 76.82 134.23];
s6_c3_ch1 = [202.77 185.62 173.07 156.31 136.40];
s6_c3_ch2 = [80.26 82.64 111.19 117.09 99.28];

averages = [mean(s1_c3_ch1) mean(s2_c3_ch1) mean(s3_c3_ch1) mean(s4_c3_ch1) mean(s5_c3_ch1) mean(s6_c3_ch1)];

figure, bar(averages)   
subjects = averages;