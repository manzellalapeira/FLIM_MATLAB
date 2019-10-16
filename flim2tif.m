function flim2tif()

[file,path] = uigetfile('*.asc');

delimiterIn = ' ';
I = importdata([path,file],delimiterIn);
I = round(I);
I = uint16(I);
newname = [path,file(1:end-3),'.tif'];
imwrite(I,newname)
