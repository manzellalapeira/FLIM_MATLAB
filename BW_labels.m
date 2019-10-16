function BW_labels(L,bw)

s = regionprops(L, 'Centroid');
figure,imshow(bw,[])
hold on
for k = 1:numel(s)
    c = s(k).Centroid;
    text(c(1), c(2), sprintf('%d', k), ...
        'HorizontalAlignment', 'center','Color','red','FontSize',20, ...
        'VerticalAlignment', 'middle');
end
hold off