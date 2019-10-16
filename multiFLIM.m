function out = multiFLIM(matfile,stats,graph,thresh,xtra)
% multiFLIM(matfile,stats,graph,thresh)
% multiFLIM() can analyze multiple samples that were imaged over one or 
% more ASC files, takes all the ROIs and pools them for an individual 
% sample and provides analysis and stats.
% Required m-files: asc2mat.m, mFLIMstat.m, and bio-formats package
% INPUTS:   matfile - either a matrix file (cell array) or 1 to pick a
%                   folder
%           stats - 1 if you want to send the data to stats m-file,
%                   0 if you want the data to be saved as a .mat
%           graph -  1 if you want to graph data (errorbar and histogram
%                   plots)
%                   0 for no plots
%                   * If user inputs 0 for stats and 1 for graph, the program
%                   will correct as graph = 0 because you need the stats
%                   output for the graph commands.
%           thresh- Value(s) of threshold for lifetime in the form [a b], 
%                   if you don't want to apply threshold or N/A, enter 0 (zero)
%           xtra-   Input 0 if you only want mean lifetime based
%                   thresholding or 1 if you have a fluorescence channel
%
% OUTPUTS:  out{1} - Returns individual ROI means in group (folder) and the
%                   group name
%           out{2} - T-test results for all the group pair combinations
%           out{3} - Data that can be used to make errorbar plots
%           out{4} - Histogram data
% Written by Javier Manzella-Lapeira, summer/fall 2018


% if there isn't an input matrix file called, run the ROI algorithm
if iscell(matfile) == 0
    append = 1;
    main_fold = uigetdir(); % folder containing the sample folders
    sub_fold_list = dir(main_fold); % these contain asc files to be analyzed
    sub_fold_list = sub_fold_list([sub_fold_list.isdir]==1);
    sf_n = length(sub_fold_list);
    if sf_n > 2
        n_groups = sf_n-2;
        main_dat_cell = cell(n_groups,2);
        no_folder = 0;
    elseif sf_n == 2
        n_groups = 1;
        main_dat_cell = cell(1,2);
        sf_n = 3;
        no_folder = 1;
    end
    for f = 3:sf_n
        if no_folder == 0
            name_sf = sub_fold_list(f).name;
            fulln_sf = [main_fold,'/',name_sf];
        elseif no_folder == 1
            name_sf = main_fold;
            fulln_sf = main_fold;
        end
        main_dat_cell{f-2,2} = name_sf;
        asc_list = dir([fulln_sf,'/*color coded value.asc']);
        asc_n = length(asc_list);
        if xtra == 0
            dat_cell = cell(1,7); % initiate cell array for ROI data across files
        elseif xtra == 1
            dat_cell = cell(1,10);
        end
        for i = 1:asc_n
            fname = [fulln_sf,'/',asc_list(i).name];
            if xtra == 0
                [dat,LL] = asc2mat(fname); % this function returns a cell-array with 
                %pixel lifetime values per roi selected for this fov
            elseif xtra == 1
                rootn = asc_list(i).name;
                %rootn2 = [rootn(1:end-26),'.czi'];  % modify to match the CZIs each time you run it ******
                %rootn2 = [rootn(1:end-22),'.czi'];  % modify to match the CZIs each time you run it ******
                %rootn2 = ['0',rootn(9),'-',rootn(11:12),'.czi'];
                rootn2 = [rootn(7:11),'.czi'];
                fname2 = [fulln_sf,'/',rootn2];
                [dat,LL] = asc2mat(fname,fname2);
            elseif xtra == 2
                
            end
            save([fname(1:end-3),'mat'],'LL');
            dat_cell = [dat_cell; dat];
        end
        dat_cell = dat_cell(2:end,:);
        main_dat_cell{f-2,1} = dat_cell;
    end
    m_name = 'data_matrix.mat';
    datname = [main_fold,'/data_matrix.mat'];
    if exist(datname,'file') == 0
        save(datname,'main_dat_cell','-v7.3')
    else
        mat_list = dir([main_fold,'/data_matrix*.mat']);
        num = numel(mat_list);
        num = num + 1;
        m_name = ['data_matrix',num2str(num),'.mat'];
        datname = [main_fold,'/data_matrix',num2str(num),'.mat'];
        save(datname,'main_dat_cell','-v7.3')
    end
else
    main_dat_cell = matfile;
    append = 0;
    n_groups = size(main_dat_cell,1);
end

%% Mean, group, and stats if user inputs stats TRUE
if stats == 1
    numcols = size(main_dat_cell,2);
    if numcols > 1
        usrans = inputdlg('Select data column to analyze. Enter 0 for a different program analysis.');
        usrans = str2double(cell2mat(usrans));
    else
        usrans = 1;
    end
    [means,pairs] = mFLIMstat(main_dat_cell,thresh,usrans);
    if append == 1
        stats_name = [main_fold,'/stats_for_',m_name];
        save(stats_name,'means','pairs')
    else
        save(['mFLIMstats_',datestr(datetime('now')),'.mat'],'means','pairs')
    end
    out{1} = means;
    out{2} = pairs;
    % take these means and turn them into stdevs and main group means
else
    out = 'Please select the stats option for a data output.';
    graph = 0;
end

%% Graphs
if graph == 1
    fig_data = zeros(n_groups,3); % 1st column the number of ROIS, 2nd the means, 3rd the stdev
    hist_data = cell(n_groups,3);
    roi_hist = cell(n_groups,2);
    for i = 1:n_groups
        % prepare data for histograms
        % first histogram pools pixel mean lifetime values for each group
        cpixels = main_dat_cell{i,1};
        if size(cpixels,2) > 1 
            cpixels = cpixels(:,usrans);
        end
        pixels = cell2mat(cpixels);
        pixels(pixels<thresh(1)) = [];
        pixels(pixels>thresh(2)) = [];
        hist_data{i,1} = pixels;
        [H,edges] = histcounts(pixels,100,'Normalization','probability');
        edges = edges(2:end);
        %H = histcounts(pixels,'BinWidth',0.25,'Normalization','probability');
        hist_data{i,2} = H;
        hist_data{i,3} = edges;
        % histogram data for the ROIs
        roiM = means{i};
        [H2,edges2] = histcounts(roiM,100,'Normalization','probability');
        edges2 = edges2(2:end);
        roi_hist{i,1} = H2;
        roi_hist{i,2} = edges2;
        
        % add group means, stdevs, and data to figure
        good_rois = means{i};
        good_rois(isnan(good_rois)) = [];
        fig_data(i,1) = numel(good_rois);
        group_avg = nanmean(means{i});
        group_std = nanstd(means{i});
        fig_data(i,2) = group_avg;
        fig_data(i,3) = group_std;
        if i == 1
            figure
            errorbar(i,group_avg,group_std)
            hold on
        else
            errorbar(i,group_avg,group_std)
        end
    end
    xticks(1:1:n_groups), xticklabels(main_dat_cell(:,2))
    %set(gca,'XTickLabel',main_dat_cell(:,2))
    hold off
    % Make histogram for pixels
    figure
    hold on
    for j = 1:n_groups
        h = hist_data{j,2};
        E = hist_data{j,3};
        plot(E,h)
    end
    xlabel('Lifetime (ps)'), ylabel('Probability-normalized Counts'), title('Normalized pixel histograms')
    legend(main_dat_cell(:,2));
    hold off
    % Make histogram for ROIs
    figure
    hold on
    for k = 1:n_groups
        h2 = roi_hist{k,1};
        E2 = roi_hist{k,2};
        plot(E2,h2)
    end
    xlabel('Lifetime (ps)'), ylabel('Probability-normalized Counts'), title('Normalized ROI histograms')
    legend(main_dat_cell(:,2));
    hold off
%     figure
%     for k = 1:n_groups
%         h = histogram(hist_data{k});
%         h.Normalization = 'probability';  
%         h.BinWidth = 0.25;
%         %savefig(h,'histogram.fig')
%     end
    out{3} = fig_data;
    out{4} = hist_data;
end

