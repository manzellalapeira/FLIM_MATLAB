function [out,labels] = asc2roi(varargin)
% ASC2MAT()
% ASC2MAT() lets the user open an ASC color-coded image output from the
% FLIM B&H software and select polygonal ROIs to then further analyze
% individually
% This function builds upon FLIM2HIST2() and removes the histogram output
% portion of the algorithm. To be used by another function to further
% analyze samples with multiple ASC files.
%
% INPUTS:   varargin{1} - either 0 to be prompted to select and asc file, or
%                       the name of the asc file itself to be analyzed
%           varargin{2} - name of the image file that contains the
%                       intensity mask
%
% OUTPUTS: mean liftetime per ROI selected, along with a list of pixel
%           calues for histogram calculation

if varargin{1} == 0 
    [file,path] = uigetfile('*.asc');
    filename = [path,'/',file];
    %uiwait(msgbox(['Select your ROIs for the file ',file]))
else
    filename = varargin{1};
    %uiwait(msgbox(['Select ROIs for the file ',name]))
end

delimiterIn = ' ';
I = importdata(filename,delimiterIn);
I = round(I);
I = uint16(I);

[Ix,Iy] = size(I);
if Ix < 512 || Iy < 512
    pad = uint16(zeros(512));
    pad(1:Ix,1:Iy) = I;
    I = pad;
end

auto = 1;
if auto == 1
    p = 0;
    % OPTION 1
    Ig = imgaussfilt(I,3);
    IgBW = imbinarize(Ig);
    IgBW = imfill(IgBW,'holes');
    IgBW = bwareaopen(IgBW,600);
    IgBW = imdilate(IgBW,strel('diamond',2));
    IgBW = imfill(IgBW,'holes');
    %watershed with imposed minimums to avoid over-segmentation
    d_transformC = bwdist(~IgBW);
    DT_complementC = -d_transformC;
    SmaskC = imextendedmin(DT_complementC,2);
    transform2C = imimposemin(DT_complementC,SmaskC);
    iW = watershed(transform2C);
    IgBW(iW == 0) = 0;
    autoImBWd = imerode(IgBW,strel('diamond',3));
    
    % use chi values
    chifile = strrep(filename,'color coded value','chi');
    Chi = importdata(chifile,delimiterIn);
    Chi(Chi<2.00) = 1;
    Chi(Chi>2.00) = 0;

    %autoImBWd = autoImBWd.*logical(Chi);
    if ~isempty(varargin{2})
        flmaskname = varargin{2};
        flI_contents = bfopen(flmaskname);
        Icz = flI_contents{1,1};
        Iz = Icz{1,1};
        Ir = Icz{2,1};
        again = true;
        f1 = figure;
        Icrop = imfuse(imadjust(Ir),Iz);
        mask2 = true(512);
        while again == true
            roi2 = roipoly(Icrop);
            GO = questdlg('Do you want to select another ROI?');
            if strcmp(GO,'No')
                again = false;
            elseif strcmp(GO,'Cancel')
                out = '';
                return
            end
            % make new image masking the previously selected ROIs
            Icrop(roi2) = 0;
            mask2(roi2) = 0;
        end
        close(f1)
    end
    autoImBWd = autoImBWd.*mask2;
    CC = bwconncomp(autoImBWd);
    LM = labelmatrix(CC);
    numBoxes = CC.NumObjects;
    for box = 1:numBoxes
        p = p + 1;
        perim = LM;
        perim(perim~=box) = 0;
        perim(perim==box) = 1;
        roi{p} = perim;
    end

elseif auto == 0
    again = true;
    p = 0;
    f1 = figure;
    Icrop = imadjust(I);
    while again == true
        p = p + 1;
        roi{p} = roipoly(Icrop);
        GO = questdlg('Do you want to select another ROI?');
        if strcmp(GO,'No')
            again = false;
        elseif strcmp(GO,'Cancel')
            out = '';
            return
        end
        % make new image masking the previously selected ROIs
        Icrop(roi{p}) = 0;
    end
    close(f1)
end

% Use czi to get other fluorescent thresholds
flI = flI_contents{1,1};
omeMeta = flI_contents{1,4};
SizeX = omeMeta.getPixelsSizeX(0).getValue();
SizeY = omeMeta.getPixelsSizeY(0).getValue();
ch = omeMeta.getChannelCount(0);
% get the red chf (usually the last channel, CHECK THIS STEP with
% new acquisition profiles
flI_ch = flI{ch,1};

if SizeX ~= 512 || SizeY ~= 512
    flI_ch = imresize(flI_ch,[512 512]);
    flI_ch = imgaussfilt(flI_ch,10);
    flIb = imbinarize(flI_ch);
    flIb = imerode(flIb,strel('diamond',15));
else
    pI04a = imgaussfilt(flI_ch,19,'Padding','symmetric');
    perF = double(pI04a)/double(max(max(pI04a)));
    newI = double(flI_ch) - perF.*0.5.*double(flI_ch);
    pI04 = imbinarize(uint16(ceil(newI)));
    pI04 = imdilate(pI04,strel('diamond',1));

    Km = imsegkmeans(flI_ch,2);
    Km(Km==1) = 0;
    Km(Km==2) = 1;
    Km = logical(Km);
    Km = imdilate(Km,strel('diamond',2));

    flI_ch = imgaussfilt(flI_ch,1);
    flIb = imbinarize(imadjust(flI_ch));
    flIb = bwareaopen(flIb,20);
    flIb = imfill(flIb,'holes');
    flIb = imerode(flIb,strel('diamond',2));

    flIb = bwareaopen(flIb,25);
end

% look for the t1 and t2 files - if they exist, Cans = 'Yes'
t1_name = strrep(filename,'color coded value','t1');
a1_name = strrep(filename,'color coded value','a1');
t2_name = strrep(filename,'color coded value','t2');
a2_name = strrep(filename,'color coded value','a2');
if isfile(t1_name) && isfile(t2_name)
    Cans = 'Yes';
else
    Cans = 'No';
end
switch Cans
    case 'No'
        roi_data = cell(p,10);
        for r = 1:p
            mask = roi{r};
            dmask = double(mask);
            I = double(I);
            croROI = I.*dmask;
            croROI = croROI(:);
            croROI(croROI==0) = [];
            roi_data{r,1} = croROI;
            fmask = dmask.*double(flIb); %.*mask2; % multiply the polygon mask by the red channel frame
            cROI2 = I.*fmask;
            cROI2 = cROI2(:);
            cROI2(cROI2==0) = [];
            roi_data{r,2} = cROI2;
        end
    case 'Yes'
        % add t1 and t2 as extra rows in roi_data  (total of 4 more)
        delimiterIn = ' ';
        It1 = importdata(t1_name,delimiterIn); 
        Ia1 = importdata(a1_name,delimiterIn);
        It2 = importdata(t2_name,delimiterIn);
        Ia2 = importdata(a2_name,delimiterIn);
        if exist('pad','var') == 1
            pIt1 = zeros(512);
            pIt1(1:Ix,1:Iy) = It1;
            It1 = pIt1;
            pIa1 = zeros(512);
            pIa1(1:Ix,1:Iy) = Ia1;
            Ia1 = pIa1;
            pIt2 = zeros(512);
            pIt2(1:Ix,1:Iy) = It2;
            It2 = pIt2;
            pIa2 = zeros(512);
            pIa2(1:Ix,1:Iy) = Ia2;
            Ia2 = pIa2;
        end
        roi_data = cell(p,10);
        for r = 1:p
            mask = roi{r};
            dmask = double(mask);       %.*Chi;
            I = double(I);
            croROI = I.*dmask.*Chi;
            croROI = croROI(:);
            croROI(croROI==0) = [];
            roi_data{r,1} = croROI;
            %
            fmask = dmask.*double(Km); %.*Chi; %.*mask2; % multiply the polygon mask by the red channel frame
            %
            cROI2m = I.*fmask;
            cROI2 = cROI2m(:);
            cROI2(cROI2==0) = [];
            roi_data{r,2} = cROI2;
            % t1, t2, a1, a2 unmasked
            t1ROI = It1.*dmask; a1ROI = Ia1.*dmask;
            t2ROI = It2.*dmask; a2ROI = Ia2.*dmask;
            t1ROI = t1ROI(:); t2ROI = t2ROI(:);
            a1ROI = a1ROI(:); a2ROI = a2ROI(:);
            t1ROI(t1ROI==0) = []; t2ROI(t2ROI==0) = [];
            a1ROI(a1ROI==0) = []; a2ROI(a2ROI==0) = [];
            roi_data{r,3} = t1ROI;
            roi_data{r,4} = t2ROI;
            roi_data{r,5} = a1ROI;
            roi_data{r,6} = a2ROI;
            % fluorescent masked t1, t2, a1, a2
            t1ROIf = It1.*fmask; a1ROIf = Ia1.*fmask;
            t2ROIf = It2.*fmask; a2ROIf = Ia2.*fmask;
            t1ROIf = t1ROIf(:); t2ROIf = t2ROIf(:);
            a1ROIf = a1ROIf(:); a2ROIf = a2ROIf(:);
            t1ROIf(t1ROIf==0) = []; t2ROIf(t2ROIf==0) = [];
            a1ROIf(a1ROIf==0) = []; a2ROIf(a2ROIf==0) = [];
            roi_data{r,7} = t1ROIf;
            roi_data{r,8} = t2ROIf;
            roi_data{r,9} = a1ROIf;
            roi_data{r,10} = a2ROIf;
        end
        % get label matrix
        %cclabel = bwconncomp(double(autoImBWd).*double(flIb));
        labels{1} = LM;
        labels{2} = I;
        labels{3} = Km;
end
    
out = roi_data;