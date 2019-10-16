function [means,pairs] = mFLIMstat(data,thresh,col)
% mFLIMstat(data,thresh)
% data must be a n-by-2 cell array where n corresponds to the number of
% sample groups to analyze, first column contains lifetime values per ROI
% as a cell matrix, second column contains the name of the sample group

ratio = 0;
sdat = size(data);
if sdat(2) ~= 2
    uiwait(msgbox('Input data file should be a cell array of size n-by-2.'))
    return
end
% Extract the names and data cells
names = data(:,2); 
datc = data(:,1);

ndatc = numel(datc);
gr_roi_means = cell(ndatc,1);
for gr = 1:ndatc
    samples = datc{gr};
    num_samples = size(samples,1);
    roi_means = zeros(num_samples,1);
    for sp = 1:num_samples
        if col == 0
            t1 = samples{sp,2};
            t2 = samples{sp,3};
            A1 = samples{sp,4};
            A2 = samples{sp,5};
            compare = A1 > A2;
            tMax = t1.*double(compare) + t2.*double(imcomplement(compare));
            roi_means(sp) = mean(tMax);
        else
            % go through each ROI, apply thresh and avg
            one_roi = samples{sp,col};
            if ~isempty(one_roi)
                totalpx = numel(one_roi);
                one_roi(one_roi<thresh(1)) = [];
                one_roi(one_roi>thresh(2)) = [];
                if ratio == 1
    %                 highVals = one_roi;
    %                 highVals(highVals<900) = [];
    %                 highQuant = numel(highVals);
    %                 lowVals = one_roi;
    %                 lowVals(lowVals>600) = [];
    %                 lowQuant = numel(lowVals);
    %                 if lowQuant == 0
    %                     lowQuant = 1;
    %                 end
    %                 m_one_roi = numel(one_roi)/totalpx;
                elseif totalpx <200
                    m_one_roi = NaN;
                else
                    m_one_roi = mean(one_roi);
                end

                roi_means(sp) = m_one_roi;
            else
                roi_means(sp) = NaN;
            end
        end
    end
    gr_roi_means{gr} = roi_means;
end

% T-test pairs
dcomb = nchoosek(gr_roi_means,2);
ncomb = nchoosek(names,2);
nc = size(dcomb,1);
sigpairs = cell(nc,2);
for p = 1:nc
    sigpairs{p,1} = [ncomb{p,1},' and ',ncomb{p,2}];
    [ss,pval] = ttest2(dcomb{p,1},dcomb{p,2});
    sigpairs{p,2} = [ss,pval];
end
pairs = sigpairs;
means = gr_roi_means;

