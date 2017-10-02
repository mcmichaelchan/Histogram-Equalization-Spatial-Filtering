function filter2d(input_img, filter)
img = imread(input_img);
imshow(img);
pause(3);
[iheight,iwidth] = size(img);
[fheight,fwidth] = size(filter);

factor = (fheight-1);

newMatrix = zeros(iheight + factor, iwidth + factor);

for i = 1:iheight
    for j = 1:iwidth
        newMatrix(i + factor/2, j + factor/2) = img(i, j);
    end
end

newImg = zeros(iheight, iwidth);

for i = 1:iheight
    for j = 1:iwidth
        for k = 1:fheight
            for l = 1:fheight
            newImg(i,j) = newImg(i,j) + newMatrix(i+k-1,j+l-1) * filter(k,l);
            end
        end
        newImg(i,j) = round(newImg(i,j));
    end
end

imshow(uint8(newImg));
imwrite(uint8(newImg),'filtered.png');