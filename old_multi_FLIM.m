function out = old_multi_FLIM(part,parameters)
% automate threshold analysis

switch part
    case ''
        floor = parameters(1); % photons for threshold
        
        % c1
        folder1 = '/Users/manzellalapeij/Documents/FLIM/Updated Analysis 030416/Analyzed Single Channels/525bp_YFP_cube/';
        % infected
        Di1_1 = dir([folder1,'i780_*-Ch1-_photons.asc']);
        n_i1 = length(Di1_1(not([Di1_1.isdir]))); % number of samples/images per group - same for both channels
        i_c1 = cell(n_i1,2);
        i_c1_s = cell(n_i1);
        for ch = 1:2
            for i = 1:n_i1
                if i < 10
                    tau = dir([folder1,'i780_0',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder1,'i780_0',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [i_c1{i,ch},i_c1_s{i,ch}] = FLIM('main',floor,[tau folder1 a_coef]);
                else
                    tau = dir([folder1,'i780_',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder1,'i780_',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [i_c1{i,ch},i_c1_s{i,ch}] = FLIM('main',floor,[tau folder1 a_coef]);
                end
            end
        end
        % uninfected
        Du1_1 = dir([folder1,'u780_*-Ch1-_photons.asc']);
        n_u1 = length(Du1_1(not([Du1_1.isdir]))); % number of samples/images per group - same for both channels
        u_c1 = cell(n_u1,2);
        u_c1_s = cell(n_u1);
        for ch = 1:2
            for i = 1:n_u1
                if i < 10
                    tau = dir([folder1,'u780_0',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder,'u780_0',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [u_c1{i,ch},u_c1_s{i,ch}] = FLIM('main',floor,[tau folder1 a_coef]);
                else
                    tau = dir([folder1,'u780_',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder1,'u780_',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [u_c1{i,ch},u_c1_s{i,ch}] = FLIM('main',floor,[tau folder1 a_coef]);
                end
            end
        end
        
        % c2
        folder2 = '/Users/manzellalapeij/Documents/FLIM/Updated Analysis 030416/Analyzed Single Channels/CFP_YFP_cube/';
        % infected
        Di2_1 = dir([folder2,'i780_*-Ch1-_photons.asc']);
        n_i2 = length(Di2_1(not([Di2_1.isdir]))); % number of samples/images per group - same for both channels
        i_c2 = cell(n_i2,2);
        i_c2_s = cell(n_i2);
        for ch = 1:2
            for i = 1:n_i2
                if i < 10
                    tau = dir([folder2,'i780_0',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder2,'i780_0',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [i_c2{i,ch},i_c2_s{i,ch}] = FLIM('main',floor,[tau folder2 a_coef]);
                else
                    tau = dir([folder2,'i780_',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder2,'i780_',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [i_c2{i,ch},i_c2_s{i,ch}] = FLIM('main',floor,[tau folder2 a_coef]);
                end
            end
        end
        % uninfected
        Du2_1 = dir([folder2,'u780_*-Ch1-_photons.asc']);
        n_u2 = length(Du2_1(not([Du2_1.isdir]))); % number of samples/images per group - same for both channels
        u_c2 = cell(n_u2,2);
        u_c2_s = cell(n_u2);
        for ch = 1:2
            for i = 1:n_u2
                if i < 10
                    tau = dir([folder2,'u780_0',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder,'u780_0',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [u_c2{i,ch},u_c2_s{i,ch}] = FLIM('main',floor,[tau folder2 a_coef]);
                else
                    tau = dir([folder2,'u780_',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder2,'u780_',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [u_c2{i,ch},u_c2_s{i,ch}] = FLIM('main',floor,[tau folder2 a_coef]);
                end
            end
        end
        
        % c3
        folder3 = '/Users/manzellalapeij/Documents/FLIM/Updated Analysis 030416/Analyzed Single Channels/CFP_Cy3/';
        % infected
        Di3_1 = dir([folder3,'irbcs_*-Ch1-_photons.asc']);
        n_i3 = length(Di3_1(not([Di3_1.isdir]))); % number of samples/images per group - same for both channels
        i_c3 = cell(n_i3,2);
        i_c3_s = cell(n_i3);
        for ch = 1:2
            for i = 1:n_i3
                if i < 10
                    tau = dir([folder3,'irbcs_0',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder3,'irbcs_0',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [i_c3{i,ch},i_c3_s{i,ch}] = FLIM('main',floor,[tau folder2 a_coef]);
                else
                    tau = dir([folder3,'irbcs_',num2str(i),'-Ch',num2str(ch),'-_t*.asc']);
                    if length(tau(not([tau.isdir]))) > 1
                        a_coef = dir([folder3,'irbcs_',num2str(i),'-Ch',num2str(ch),'-_a*.asc']);
                    end
                    [i_c3{i,ch},i_c3_s{i,ch}] = FLIM('main',floor,[tau folder2 a_coef]);
                end
            end
        end
        
    case 'photons'
        folder_name = '/Users/manzellalapeij/Documents/FLIM/Updated Analysis 030416/Analyzed Single Channels/CFP_YFP_cube/';
        D = dir([folder_name,'u780_*-Ch1-_photons.asc']);
        num_i = length(D(not([D.isdir])));
        ch = 2; %channel, either 1 or 2
        %max_photons = zeros(num_i,1);
        avg_photons = zeros(num_i,1);

        for i = 1:num_i
            if i < 10
                name_i = sprintf('u780_0%d-Ch%d-_photons.asc',i,ch);
            else
                name_i = sprintf('u780_%d-Ch%d-_photons.asc',i,ch);
            end
            ph_matrix = dlmread([folder_name,name_i]);
            %max_photons(i) = max(max(ph_matrix));
            avg_photons(i) = mean2(ph_matrix(ph_matrix~=0));
            
        end

        %out = max_photons';
        out = avg_photons';
        
    case 'graph1'

        % c1
        i_c1_ch1 = [48 59 34 71 80 59 63 132 57 61 82 57 80 69 45 70 53 27 81 34 36 36 53 68 46];
        i_c1_ch2 = [97 85 60 138 132 112 109 241 99 117 153 101 138 132 89 124 95 55 129 70 75 84 111 124 86];
        u_c1_ch1 = [20 15 38 66 150 155 36];
        u_c1_ch2 = [43 25 72 96 193 181 85];
        % c2
        i_c2_ch1 = [58 61 72 54 50 39];
        i_c2_ch2 = [66 77 49 52 54 41];
        u_c2_ch1 = [13 16 59 22 17];
        u_c2_ch2 = [14 17 25 25 18];
        % c3
        i_c3_ch1 = [86 90 61 64 51 55 55 48 64 106 45 48 42 74 45 45 47 46 89 51 56 69 131 49 76 107];
        i_c3_ch2 = [63 68 47 56 37 40 44 43 39 94 37 33 44 42 58 40 42 42 69 46 48 56 41 37 71 81];
        u_c3_ch1 = [29 33 20 19 25 20];
        u_c3_ch2 = [22 23 19 19 19 16];

        % cube 1, channel 1
        av_c1ch1 = [mean(i_c1_ch1) mean(u_c1_ch1)];
        %std_c1ch1 = [std(i_c1_ch1) std(u_c1_ch1)];
        err_c1ch1 = [std(i_c1_ch1)/sqrt(numel(i_c1_ch1)) std(u_c1_ch1)/sqrt(numel(u_c1_ch1))];

        % cube 1, channel 2
        av_c1ch2 = [mean(i_c1_ch2) mean(u_c1_ch2)];
        %std_c1ch2 = [std(i_c1_ch2) std(u_c1_ch2)];
        err_c1ch2 = [std(i_c1_ch2)/sqrt(numel(i_c1_ch2)) std(u_c1_ch2)/sqrt(numel(u_c1_ch2))];

        % cube 2, channel 1
        av_c2ch1 = [mean(i_c2_ch1) mean(u_c2_ch1)];
        %std_c2ch1 = [std(i_c2_ch1) std(u_c2_ch1)];
        err_c2ch1 = [std(i_c2_ch1)/sqrt(numel(i_c2_ch1)) std(u_c2_ch1)/sqrt(numel(u_c2_ch1))];

        % cube 2, channel 2
        av_c2ch2 = [mean(i_c2_ch2) mean(u_c2_ch2)];
        %std_c2ch2 = [std(i_c2_ch2) std(u_c2_ch2)];
        err_c2ch2 = [std(i_c2_ch2)/sqrt(numel(i_c2_ch2)) std(u_c2_ch2)/sqrt(numel(u_c2_ch2))];

        % cube 3, channel 1
        av_c3ch1 = [mean(i_c3_ch1) mean(u_c3_ch1)];
        %std_c3ch1 = [std(i_c3_ch1) std(u_c3_ch1)];
        err_c3ch1 = [std(i_c3_ch1)/sqrt(numel(i_c3_ch1)) std(u_c3_ch1)/sqrt(numel(u_c3_ch1))];

        % cube 3, channel 2
        av_c3ch2 = [mean(i_c3_ch2) mean(u_c3_ch2)];
        %std_c3ch2 = [std(i_c3_ch2) std(u_c3_ch2)];
        err_c3ch2 = [std(i_c3_ch2)/sqrt(numel(i_c3_ch2)) std(u_c3_ch2)/sqrt(numel(u_c3_ch2))];

        figure
        barwitherr([err_c1ch1' err_c1ch2' err_c2ch1' err_c2ch2' err_c3ch1' err_c3ch2'], [1 2],[av_c1ch1' av_c1ch2' av_c2ch1' av_c2ch2' av_c3ch1' av_c3ch2']) 

        set(gca,'XTickLabel',{'iRBCs','uRBCs'})
        legend('550/50','525LP','550/50','480/40','605/70','480/40')
        ylabel('Maximum Photon Count')
        grid on
        colormap spring
        
    case 'graph2'
        
        % c1
        i_c1_ch1 = [3.3934    3.7951    3.4726    5.0298    4.1264    2.9582    4.0301   11.3478    5.0056 3.7821    4.9066    6.4549    6.8294    7.0504    3.3047    4.4146    3.6785    2.7484 4.3746    2.2831    2.6522    2.4938    2.6149    4.1571    2.1781];
        i_c1_ch2 = [4.8836    5.8038    5.5565    8.5538    7.4002    5.0447    6.6496   24.8101    8.3530 6.2197    9.2151   14.7171   14.4882   17.7346    6.1959    8.4993    6.7879    4.4777 7.6936    4.0618    4.6328    4.4783    4.9470    7.6377    3.8115];
        u_c1_ch1 = [3.5391    2.2416    5.2145    6.2123    9.0346   12.9738    4.2858];
        u_c1_ch2 = [8.1413    4.5047    7.3796    7.5563   11.6979   14.1252    9.6005];
        % c2
        i_c2_ch1 = [3.6761    3.9473    2.4657    3.8579    4.0663    2.8483];
        i_c2_ch2 = [3.7323    4.0099    2.5090    3.9747    4.2049    2.9154];
        u_c2_ch1 = [1.8413    1.8569    2.2240    2.2398    2.5961];
        u_c2_ch2 = [1.9468    1.9487    2.3600    2.3835    2.7897];
        % c3
        i_c3_ch1 = [4.48 4.23 3.75 3.63 3.35 3.31 3.19 3.27 3.39 3.66 2.21 2.48 2.12 2.8279 2.7013 2.6162 3.06 2.4327 3.5713 3.0667 4.3752 4.6174 4.4745 5.3684 6.1925 6.1719];
        i_c3_ch2 = [4.1034 4.3784 3.7785 3.4154 3.3626 3.2381 3.5464 3.4457 3.3778 4.1734 2.0534 2.2088 2.0292 2.5184 2.4358 2.1903 2.3321 2.1744 2.7576 2.4606 4.3356 4.8579 4.0415 4.5077 5.8437 5.7037];
        u_c3_ch1 = [2.9258    2.8664    2.5074    2.5110    2.7692    2.2240];
        u_c3_ch2 = [4.5337    4.0149    3.6690    3.6921    4.1004    3.4543];

        % cube 1, channel 1
        av_c1ch1 = [mean(i_c1_ch1) mean(u_c1_ch1)];
        %std_c1ch1 = [std(i_c1_ch1) std(u_c1_ch1)];
        err_c1ch1 = [std(i_c1_ch1)/sqrt(numel(i_c1_ch1)) std(u_c1_ch1)/sqrt(numel(u_c1_ch1))];

        % cube 1, channel 2
        av_c1ch2 = [mean(i_c1_ch2) mean(u_c1_ch2)];
        %std_c1ch2 = [std(i_c1_ch2) std(u_c1_ch2)];
        err_c1ch2 = [std(i_c1_ch2)/sqrt(numel(i_c1_ch2)) std(u_c1_ch2)/sqrt(numel(u_c1_ch2))];

        % cube 2, channel 1
        av_c2ch1 = [mean(i_c2_ch1) mean(u_c2_ch1)];
        %std_c2ch1 = [std(i_c2_ch1) std(u_c2_ch1)];
        err_c2ch1 = [std(i_c2_ch1)/sqrt(numel(i_c2_ch1)) std(u_c2_ch1)/sqrt(numel(u_c2_ch1))];

        % cube 2, channel 2
        av_c2ch2 = [mean(i_c2_ch2) mean(u_c2_ch2)];
        %std_c2ch2 = [std(i_c2_ch2) std(u_c2_ch2)];
        err_c2ch2 = [std(i_c2_ch2)/sqrt(numel(i_c2_ch2)) std(u_c2_ch2)/sqrt(numel(u_c2_ch2))];

        % cube 3, channel 1
        av_c3ch1 = [mean(i_c3_ch1) mean(u_c3_ch1)];
        %std_c3ch1 = [std(i_c3_ch1) std(u_c3_ch1)];
        err_c3ch1 = [std(i_c3_ch1)/sqrt(numel(i_c3_ch1)) std(u_c3_ch1)/sqrt(numel(u_c3_ch1))];

        % cube 3, channel 2
        av_c3ch2 = [mean(i_c3_ch2) mean(u_c3_ch2)];
        %std_c3ch2 = [std(i_c3_ch2) std(u_c3_ch2)];
        err_c3ch2 = [std(i_c3_ch2)/sqrt(numel(i_c3_ch2)) std(u_c3_ch2)/sqrt(numel(u_c3_ch2))];

        figure
        barwitherr([err_c1ch1' err_c1ch2' err_c2ch1' err_c2ch2' err_c3ch1' err_c3ch2'], [1 2],[av_c1ch1' av_c1ch2' av_c2ch1' av_c2ch2' av_c3ch1' av_c3ch2']) 

        set(gca,'XTickLabel',{'iRBCs','uRBCs'})
        legend('550/50','525LP','550/50','480/40','605/70','480/40')
        ylabel('Average Photon Count')
        grid on
        colormap summer
end
