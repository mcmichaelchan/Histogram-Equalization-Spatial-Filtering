function equalize_hist(input)
img = imread(input);
imshow(img);
pause(3);
[height,width] = size(img);

numberOfPixelsOfEachLevel = zeros(1,256);

%?????????
for i = 1:height
    for j = 1:width
        numberOfPixelsOfEachLevel(img(i,j) + 1) = numberOfPixelsOfEachLevel(img(i,j) + 1) + 1;
    end
end



%??????????
numberOfPixel = height * width * 1.0;
densityOfLevel = zeros(1, 256);
for i = 1:256
    densityOfLevel(i) = numberOfPixelsOfEachLevel(i) / numberOfPixel;
end

bar(densityOfLevel,0.5);

%??Cdf
cdf = zeros(1, 256);
cdf(1) = densityOfLevel(1);
for i = 2:256  
    cdf(i) = cdf(i - 1) + densityOfLevel(i);  
end  
    
%????level
newLevel = zeros(1, 256);
for i = 1:256
    newLevel(i) = round((cdf(i) * 255));
end
newLevel = uint8(newLevel);
%??????
for i = 1:height
    for j = 1:width
        img(i,j) = newLevel(img(i,j) + 1);
    end
end

imshow(img);
imwrite(uint8(img),'qualized.png');