function fig = labelROIs(L,Mtau)
% Mtau should be the double mode of the lifetime image

L = logical(L);
Mtau = Mtau.*double(L);
mt = regionprops(L,Mtau,'PixelValues');
bw = L;
bw(bw>0) = 1;
bw = logical(bw);
s = regionprops(L, 'Centroid');
figure, imshow(bw)
hold on
for k = 1:numel(s)
    pt = mt(k).PixelValues;
    pt(pt==0) = [];
    pt(pt>3000) = [];
    t = mean(pt);
    c = s(k).Centroid;
    text(c(1), c(2), sprintf('%d', t), ...
        'HorizontalAlignment', 'center', ...
        'VerticalAlignment', 'middle','Color','red');
end
fig = gcf;
hold off