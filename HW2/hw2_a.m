%多媒體Hw2(a)

clc;
clear;
tic;    %計時

% create gaussian filter
G33 = fspecial('gaussian', [3 3], 1);    % creates a Gaussian filter with hsize =
% [3 3] and sigma = 1
G55 = fspecial('gaussian', [5 5], 1);
G77 = fspecial('gaussian', [7 7], 1);

%load image
img = imread('./柴犬飛飛.jpg');
I = img;    %儲存原圖

% img = padarray(img,[1,1]);
img = double(img);


for x = 1:size(img,1)-2
    for y = 1:size(img,2)-2
        img_t1(x,y,1) = sum(sum(G33.*img(x:x+2,y:y+2,1)));
        img_t1(x,y,2) = sum(sum(G33.*img(x:x+2,y:y+2,2)));
        img_t1(x,y,3) = sum(sum(G33.*img(x:x+2,y:y+2,3)));       
    end
end 

for x = 1:size(img,1)-4
    for y = 1:size(img,2)-4      
        img_t2(x,y,1) = sum(sum(G55.*img(x:x+4,y:y+4,1)));
        img_t2(x,y,2) = sum(sum(G55.*img(x:x+4,y:y+4,2)));
        img_t2(x,y,3) = sum(sum(G55.*img(x:x+4,y:y+4,3)));
    end
end

for x = 1:size(img,1)-6
    for y = 1:size(img,2)-6
        img_t3(x,y,1) = sum(sum(G77.*img(x:x+6,y:y+6,1)));
        img_t3(x,y,2) = sum(sum(G77.*img(x:x+6,y:y+6,2)));
        img_t3(x,y,3) = sum(sum(G77.*img(x:x+6,y:y+6,3)));
    end
end 

img_t1 = uint8(img_t1);
img_t2 = uint8(img_t2);
img_t3 = uint8(img_t3);


%印出圖片
subplot(1,3,1);
image(img_t1);
title('Gaussian3*3');

subplot(1,3,2);
image(img_t2);
title('Gaussian5*5');

subplot(1,3,3);
image(img_t3);
title('Gaussian7*7');

img_t1 = padarray(img_t1,[1,1]);
img_t2 = padarray(img_t2,[2,2]);
img_t3 = padarray(img_t3,[3,3]);

%PSNR
[peaksnr1,snr1] = psnr(img_t1,I);
[peaksnr2,snr2] = psnr(img_t2,I);
[peaksnr3,snr3] = psnr(img_t3,I);

toc;    %計時結束