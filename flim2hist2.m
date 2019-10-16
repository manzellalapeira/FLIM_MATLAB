function out = flim2hist2()
% FLIM2HIST2()
% flim2hist2() lets the user open an ASC color-coded image output from the
% FLIM B&H software and select polygonal ROIs to then further analyze
% individually
% Main difference between the original and this updated version is the
% ability to select polygonal versus rectangular ROIs
% ONE FILE INPUT

[file,path] = uigetfile('*.asc');

if file == 0
    uiwait(msgbox('Algorithm Canceled. Try again. Click OK to continue.'));
    out = '';
    return
end

delimiterIn = ' ';
I = importdata([path,file],delimiterIn);
I = round(I);
I = uint16(I);

again = true;
p = 0;
f1 = figure;
uiwait(msgbox('Select your ROIs. Click OK to continue.'));
while again == true
    p = p + 1;
    roi{p} = roipoly(imadjust(I));
    GO = questdlg('Do you want to select another ROI?');
    if strcmp(GO,'No')
        again = false;
    elseif strcmp(GO,'Cancel')
        out = '';
        return
    end
end
close(f1)

roi_data = cell(p,3);

for r = 1:p
    mask = roi{r};
    mask = double(mask);
    I = double(I);
    croROI = I.*mask;
    croROI = croROI(:);
    croROI(croROI==0) = [];
    figure
    h = histogram(croROI);
    h.Normalization = 'probability';
    h.BinWidth = 0.25;
    roi_data{r,1} = croROI;
    roi_data{r,2} = h;
    roi_data{r,3} = [mean(double(croROI));std(double(croROI))];
end


out = roi_data;