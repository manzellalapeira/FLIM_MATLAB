function out = phasor(varargin)
% phasor(filename,figureOption,visualMasking,cziSelection) gets phasor and lifetime
% values for the ROIs specified with a fluorescent channel from a CZI for
% one FOV
%
% Inputs:   varargin{1} = 0, when the program queries the user to select a
%                               file
%                       filename, when the path/file name is specified as
%                               an input
%           varargin{2} = 0; phasor figuure will not be shown
%                       = 1; produces phasor figure
%           varargin{3} = 1; manually selct ROIs from 

if varargin{1} == 0 
    [name,path] = uigetfile('*phasor_G.asc');
    filename = [path,'/',name];
    dispPhasor = 1;
elseif varargin{1} == 2
%     dispPhasor = 2;
%     [name,path] = uigetfile('*phasor_G.asc');
%     filename = [path,'/',name];
%     [name2,path2] = uigetfile('*phasor_G.asc');
%     filename2 = [path2,'/',name2];
else
    filename = varargin{1};
    dispPhasor = 0;
    [path,name,~] = fileparts(filename);
end
disp(filename)
delimiterIn = ' ';
IpG = importdata(filename,delimiterIn);
fileS = strrep(filename,'_G','_S');
IpS = importdata(fileS,delimiterIn);
fileTm = strrep(filename,'phasor_G','color coded value');
Itm = importdata(fileTm,delimiterIn);
%
fileT1 = strrep(filename,'phasor_G','t1');
It1 = importdata(fileT1,delimiterIn);
fileA1 = strrep(filename,'phasor_G','a1[%]');
Ia1 = importdata(fileA1,delimiterIn);
fileT2 = strrep(filename,'phasor_G','t2');
It2 = importdata(fileT2,delimiterIn);
fileA2 = strrep(filename,'phasor_G','a2[%]');
Ia2 = importdata(fileA2,delimiterIn);
%
vars = [IpG(:) IpS(:) Itm(:) It1(:) Ia1(:) It2(:) Ia2(:)];
vars(vars(:,1)==0,:) = [];
vars(vars(:,3)>4000,:) = [];
vars(vars(:,3)<200,:) = [];

again = false;
czi_list = dir([path,'/*.czi']);
CZIn = length(czi_list);
if isfile(strrep(filename,'_phasor_G.asc','.czi'))
    fFile = strrep(filename,'_phasor_G.asc','.czi');
    fluor = 0;
elseif CZIn > 0
    uiwait(msgbox(['Select CZI for ',name]))
    fFile = uigetfile([path,'/*.czi'],['Select CZI for ',name]);
    fFile = [path,'/',fFile];
    fluor = 0;
else
    fluor = 1;
end

if nargin > 1
    dispPhasor = varargin{2};
    if nargin > 2
        again = logical(varargin{3});
        if nargin > 3
            fluor = varargin{4};
        end
    end
end

if dispPhasor == 1
    figure, scatter(vars(:,1),vars(:,2),1,vars(:,3))
    hold on
    th = linspace(0,pi,100);
    x = 0.5*cos(th) + 0.5;
    y = 0.5*sin(th);
    plot(x,y)
    xlim([0 1]),ylim([0 0.6])
    hold off 
end

if fluor == 0
    flI_contents = bfopen(fFile);
    Icz = flI_contents{1,1};
    Iz = Icz{1,1};
    Ir = Icz{2,1};
    %Ifr = Icz{3,1};
    sigCo = wiener2(Ir,[3 3]);
    km = imsegkmeans(sigCo,2);
    if sum(km==2) > sum(km==1)
        km(km==2) = 0;
    else
        km = logical(km - 1);
    end
    km_d = imdilate(km,strel('diamond',1));
    km_d = bwareaopen(km_d,25);
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
    autoImBWd = logical(km_d.*mask2);
elseif fluor == 1
    Ifl = imread(strrep(filename,'phasor_G.asc','intensity_image.tif'));
    Ig = imgaussfilt(Ifl,2);
    IgBW = imbinarize(Ig);
    IgBW = imfill(IgBW,'holes');
    IgBW = bwareaopen(IgBW,600);
    %watershed with imposed minimums to avoid over-segmentation
    d_transformC = bwdist(~IgBW);
    DT_complementC = -d_transformC;
    SmaskC = imextendedmin(DT_complementC,2);
    transform2C = imimposemin(DT_complementC,SmaskC);
    iW = watershed(transform2C);
    IgBW(iW == 0) = 0;
    autoImBWd = imerode(IgBW,strel('diamond',3));
elseif fluor == 2 % mask with intensity of autofluorescence, eliminate fluorescent signal (dead stain)

    cziData = bfopen(fFile);
    cziFrames = cziData{1,1};
    deadMarker = cziFrames{2,1};
    deadMarker = flipud(deadMarker);
    deadM = wiener2(deadMarker,[3 3]);
    deadBin = imbinarize(deadM);
    deadBin = bwareaopen(deadBin,10);
    dB = imdilate(deadBin,strel('disk',3));
    dBf = imfill(dB,'holes');

    s401 = imread(strrep(filename,'phasor_G.asc','intensity_image.tif'));
    s401G = imgaussfilt(s401,1);
    s401B = imbinarize(imadjust(s401G));
    s401Bd = imdilate(s401B,strel('disk',5));
    s401Bdf = imfill(s401Bd,'holes');
    s401Be = imerode(s401Bdf,strel('diamond',3));
    s401mask = bwareaopen(s401Be,100);
    % do watershed on this mask
    d_transformC = bwdist(~s401mask);
    DT_complementC = -d_transformC;
    SmaskC = imextendedmin(DT_complementC,2);
    transform2C = imimposemin(DT_complementC,SmaskC);
    iW = watershed(transform2C);
    s401mask(iW == 0) = 0;

    %autoBW = s401mask.*imcomplement(dBf);
    sumBW_death = s401mask + dBf;
    alive = bwpropfilt(s401mask,sumBW_death,'MaxIntensity',[1 1]);
    autoImBWd = bwareaopen(alive,500);
end

IpG(IpG==0) = NaN;
IpS(IpS==0) = NaN;
Itm(Itm==0) = NaN;
It1(It1==0) = NaN;
Ia1(Ia1==0) = NaN;
It2(It2==0) = NaN;
Ia2(Ia2==0) = NaN;
propG = regionprops(autoImBWd,IpG,'PixelValues');
propS = regionprops(autoImBWd,IpS,'PixelValues');
propT = regionprops(autoImBWd,Itm,'PixelValues');
propT1 = regionprops(autoImBWd,It1,'PixelValues');
propA1 = regionprops(autoImBWd,Ia1,'PixelValues');
propT2 = regionprops(autoImBWd,It2,'PixelValues');
propA2 = regionprops(autoImBWd,Ia2,'PixelValues');
lenS = length(propG);
prop = zeros(lenS,7);
for l = 1:lenS
    prop(l,1) = nanmean(propG(l).PixelValues);
    prop(l,2) = nanmean(propS(l).PixelValues);
    prop(l,3) = nanmean(propT(l).PixelValues);
    prop(l,4) = nanmean(propT1(l).PixelValues);
    prop(l,5) = nanmean(propA1(l).PixelValues);
    prop(l,6) = nanmean(propT2(l).PixelValues);
    prop(l,7) = nanmean(propA2(l).PixelValues);
end
%prop = [[propG.MeanIntensity]' [propS.MeanIntensity]' [propT.MeanIntensity]'];
if dispPhasor == 1
    figure, scatter(prop(:,1),prop(:,2),1,prop(:,3))
    hold on
    th = linspace(0,pi,100);
    x = 0.5*cos(th) + 0.5;
    y = 0.5*sin(th);
    plot(x,y)
    xlim([0 1]),ylim([0 0.6])
    hold off
end
out = prop;