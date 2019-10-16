function dataCell = groupFrames()
%
clear('LL')
path = uigetdir();
mlist = dir([path,'/*.mat']);
% if numMasks > 1
%     clist = dir([path,'/*.czi']);
% end
nf = length(mlist);
% frames = cell(nf,2);
data = cell(nf,1);
dC = cell(nf,1);
dif = 0;
for f = 1:nf
    name = fullfile(path,mlist(f).name);
    load(name,'LL')
%     if numMasks > 1
%         fIs = bfopen(fullfile(path,clist(f).name));
%         fI = fIs{1,1}{end,1}; % get the last fluorescence frame
%         paramsF = regionprops(LL{3},double(fI),'Area','MeanIntensity');
%     end
    paramsL = regionprops(logical(LL{1}),'PixelIdxList','Centroid');
    mask = logical(LL{1}).*logical(LL{3});
    allparams = zeros(numel(paramsL),3);
    cellparams = cell(numel(paramsL),10);
    figure, imshow(logical(LL{1}).*logical(LL{3}))
    hold on
    for k = 1:numel(paramsL)
        Idx = paramsL(k).PixelIdxList;
        
        n = dif + k;
        allparams(k,1) = f; % figure number in folder
        cellparams{k,1} = f;
        allparams(k,2) = k; % ROI number in figure
        cellparams{k,2} = k;
        allparams(k,3) = n; % net ROI number
        cellparams{k,3} = n;
        
        tmask = double(mask).*LL{2};
        mt = tmask(Idx);
        mt(mt==0) = [];
        mt(mt>3000) = [];
        allparams(k,4) = mean(mt);
        cellparams{k,4} = mt;
        
        for c = 1:6
            cmask = double(mask).*LL{c+3};
            pt = cmask(Idx);
            if mod(c,2) == 0
                pt(pt==0) = [];
            else
                pt(pt==0) = [];
                pt(pt>3000) = [];
                %pt(pt<200) = [];
            end

            allparams(k,4+c) = mean(pt);
            cellparams{k,4+c} = pt;
        end
        c = paramsL(k).Centroid;
        text(c(1),c(2),sprintf('%d',n),'HorizontalAlignment',...
            'center','VerticalAlignment', 'middle','Color','red');
    end
    F2 = gcf;
    hold off
    dif = dif + numel(paramsL);
    [~,root,~] = fileparts(name);
    saveas(F2,fullfile(path,[root,'ROInum.fig']))
    close(F2)
    
%     frames{f,1} = LL;
%     frames{f,2} = fI;
    data{f} = allparams;
    dC{f} = cellparams;
    
    % save the label figure
    fig = labelROIs(LL{1},double(LL{2}));
    saveas(fig,fullfile(path,[root,'.fig']))
    close(fig)
    clear('LL')
end
dataCell = dC;
data = cell2mat(data);
save(fullfile(path,'combinedData.mat'),'data')