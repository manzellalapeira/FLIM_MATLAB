phasor(varargin)
% phasor() 

if varargin{1} == 0 
    [name,path] = uigetfile('*phasor_G.asc');
    filename = [path,'/',name];
    dispPhasor = 1;
elseif varargin{1} == 2
    dispPhasor = 2;
    [name,path] = uigetfile('*phasor_G.asc');
    filename = [path,'/',name];
    [name2,path2] = uigetfile('*phasor_G.asc');
    filename2 = [path2,'/',name2];
else
    filename = varargin{1};
    [path,name,~] = fileparts(filename);
end

delimiterIn = ' ';
IpG = importdata(filename,delimiterIn);
fileS = strrep(filename,'G','S');
IpS = importdata(fileS,delimiterIn);
fileTm = strrep(filename,'phasor_G','color_coded_value');
Itm = importdata(fileTm,delimiterIn);
vars = [IpG IpS Itm];
vars(vars(:,1)==0,:) = [];

if dispPhasor == 1
    figure, scatter(I(:),IS(:),Itm(:))
    hold on
    th = linspace(0,pi,100);
    x = 0.5*cos(th) + 0.5;
    y = 0.5*sin(th);
    plot(x,y)
    xlim([0 1]),ylim([0 0.6])
    
elseif dispPhasor == 2 % two samples
    
end

fileChi = strrep(file,'G','Chi');
fileChi = strrep(file,'phasor_G','Chi');
fileChi = strrep(filename,'phasor_G','Chi');
iC = importdata(fileChi,delimiterIn);
iC(iC>10) = 0;
figure, imshow(iC,[])
figure,scatter(I(:),IS(:),'.')
vC = iC(:);
min(min(vC))
vC(vC==0) = NaN;
figure,scatter(I(:),IS(:),1,iC(:))
hold on, xlim([0 1]),ylim([0 0.6])
plot(x,y)
hBrushLine = findall(gca,'tag','Brushing');
brushedData = get(hBrushLine, {'Xdata','Ydata'});
gca
hBrushLine = findall(gca,'tag','Brushing');
hBrushLine = findall(gca,'tag','Brushing')
hBrushLine = findall(gcf,'tag','Brushing')
hBrushLine = findall(gca,'tag','Brushing')
brushedData = get(hBrushLine, {'Xdata','Ydata'});
hBrushLine = findall(gcf,'tag','Brushing')
brushedData = get(hBrushLine, {'Xdata','Ydata'});
hB = findobj(gcf,'-property','BrushData')
hold off
gcf