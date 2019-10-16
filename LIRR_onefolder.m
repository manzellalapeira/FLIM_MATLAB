function out = LIRR_onefolder()


fold = uigetdir(); % folder containing the sample folders
asc_list = dir([fold,'/*750_a2[%].asc']);
%asc_list = dir([fold,'/*NADH_a2[%].asc']);
asc_n = length(asc_list);
dat_cell = cell(asc_n,3); % initiate cell array for ROI data across files
%tMito = 0;
for i = 1:asc_n
    rootn = asc_list(i).name;
    Rdat = LIRR_asc2ratmat([fold,'/',asc_list(i).name]);
    rootn2 = [rootn(1:end-14),'.czi'];
    %rootn2 = ['0',rootn(9),'-',rootn(11:12),'.czi']; % modify to match the CZIs each time you run it ******
    %rootn2 = [rootn(1:end-10),'.czi'];
    Iczi = bfopen([fold,'/',rootn2]);
    Ifl = Iczi{1,1};
    omeMeta = Iczi{1,4};
    ch = omeMeta.getChannelCount(0);
    mitoRed = Ifl{ch,1}; % assuming the mito dye is the last channel
    mitoR = imgaussfilt(mitoRed,1);
    mRb = imbinarize(imadjust(mitoR));
    mRbe = imerode(mRb,strel('diamond',2));
    mRbe = bwareaopen(mRbe,5);
    mRdat = Rdat.*double(mRbe);
    mitos = regionprops(mRbe,Rdat,'PixelValues');
    Nm = length(mitos);
    avMito = zeros(Nm,1);
    cumMito = cell(Nm,1);
    for j = 1:Nm
        mit = mitos(j).PixelValues;
        mit(mit>1) = NaN;
        mit(mit==0) = NaN;
        avMito(j) = nanmean(mit);
        cumMito{j} = mit;
    end
    dat_cell{i,1} = mRdat;
    dat_cell{i,2} = avMito;
    dat_cell{i,3} = cumMito;
end

out = dat_cell;

% 
% dat_cell = dat_cell(2:end,:);
% main_dat_cell{f-2,1} = dat_cell;
% m_name = 'data_matrix.mat';
% datname = [main_fold,'/data_matrix.mat'];
% if exist(datname,'file') == 0
%     save(datname,'main_dat_cell')
% else
%     mat_list = dir([main_fold,'/data_matrix*.mat']);
%     num = numel(mat_list);
%     num = num + 1;
%     m_name = ['data_matrix',num2str(num),'.mat'];
%     datname = [main_fold,'/data_matrix',num2str(num),'.mat'];
%     save(datname,'main_dat_cell')
% end
% 
% % Mean, group, and stats if user inputs stats TRUE
% if stats == 1
%     numcols = size(main_dat_cell,2);
%     if numcols > 1
%         usrans = inputdlg('Select data column to analyze:');
%         usrans = str2double(cell2mat(usrans));
%     else
%         usrans = 1;
%     end
%     [means,pairs] = mFLIMstat(main_dat_cell,thresh,usrans);
%     if append == 1
%         stats_name = [main_fold,'/stats_for_',m_name];
%         save(stats_name,'means','pairs')
%     else
%         save(['mFLIMstats_',datestr(datetime('now')),'.mat'],'means','pairs')
%     end
%     out{1} = means;
%     out{2} = pairs;
%     % take these means and turn them into stdevs and main group means
% else
%     out = 'Please select the stats option for a data output.';
%     graph = 0;
% end
% 
% % Graphs
% if graph == 1
%     fig_data = zeros(n_groups,3); % 1st column the number of ROIS, 2nd the means, 3rd the stdev
%     hist_data = cell(n_groups,3);
%     roi_hist = cell(n_groups,2);
%     for i = 1:n_groups
%         % prepare data for histograms
%         % first histogram pools pixel mean lifetime values for each group
%         cpixels = main_dat_cell{i,1};
%         if size(cpixels,2) > 1 
%             cpixels = cpixels(:,usrans);
%         end
%         pixels = cell2mat(cpixels);
%         pixels(pixels<thresh(1)) = [];
%         pixels(pixels>thresh(2)) = [];
%         hist_data{i,1} = pixels;
%         [H,edges] = histcounts(pixels,100,'Normalization','probability');
%         edges = edges(2:end);
%         %H = histcounts(pixels,'BinWidth',0.25,'Normalization','probability');
%         hist_data{i,2} = H;
%         hist_data{i,3} = edges;
%         % histogram data for the ROIs
%         roiM = means{i};
%         [H2,edges2] = histcounts(roiM,100,'Normalization','probability');
%         edges2 = edges2(2:end);
%         roi_hist{i,1} = H2;
%         roi_hist{i,2} = edges2;
%         
%         % add group means, stdevs, and data to figure
%         good_rois = means{i};
%         good_rois(isnan(good_rois)) = [];
%         fig_data(i,1) = numel(good_rois);
%         group_avg = nanmean(means{i});
%         group_std = nanstd(means{i});
%         fig_data(i,2) = group_avg;
%         fig_data(i,3) = group_std;
%         if i == 1
%             figure
%             errorbar(i,group_avg,group_std)
%             hold on
%         else
%             errorbar(i,group_avg,group_std)
%         end
%     end
%     xticks(1:1:n_groups), xticklabels(main_dat_cell(:,2))
%     %set(gca,'XTickLabel',main_dat_cell(:,2))
%     hold off
%     % Make histogram for pixels
%     figure
%     hold on
%     for j = 1:n_groups
%         h = hist_data{j,2};
%         E = hist_data{j,3};
%         plot(E,h)
%     end
%     xlabel('Lifetime (ps)'), ylabel('Probability-normalized Counts'), title('Normalized pixel histograms')
%     legend(main_dat_cell(:,2));
%     hold off
%     % Make histogram for ROIs
%     figure
%     hold on
%     for k = 1:n_groups
%         h2 = roi_hist{k,1};
%         E2 = roi_hist{k,2};
%         plot(E2,h2)
%     end
%     xlabel('Lifetime (ps)'), ylabel('Probability-normalized Counts'), title('Normalized ROI histograms')
%     legend(main_dat_cell(:,2));
%     hold off
% %     figure
% %     for k = 1:n_groups
% %         h = histogram(hist_data{k});
% %         h.Normalization = 'probability';  
% %         h.BinWidth = 0.25;
% %         %savefig(h,'histogram.fig')
% %     end
%     out{3} = fig_data;
%     out{4} = hist_data;
% end
% 
