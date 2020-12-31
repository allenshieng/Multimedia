%多媒體Hw2(b)

clc;
clear;
tic;    %計時

% create gaussian filter
G33_1 = fspecial('gaussian', [3 3], 1);
G33_5 = fspecial('gaussian', [3 3], 5);
G33_10 = fspecial('gaussian', [3 3], 10);

%load image
img = imread('./柴犬飛飛.jpg');
I = img;    %儲存原圖

img = double(img);


for x = 1:size(img,1)-2
    for y = 1:size(img,2)-2
        img_t1(x,y,1) = sum(sum(G33_1.*img(x:x+2,y:y+2,1)));
        img_t1(x,y,2) = sum(sum(G33_1.*img(x:x+2,y:y+2,2)));
        img_t1(x,y,3) = sum(sum(G33_1.*img(x:x+2,y:y+2,3)));       
    end
end 

for x = 1:size(img,1)-2
    for y = 1:size(img,2)-2
        img_t2(x,y,1) = sum(sum(G33_5.*img(x:x+2,y:y+2,1)));
        img_t2(x,y,2) = sum(sum(G33_5.*img(x:x+2,y:y+2,2)));
        img_t2(x,y,3) = sum(sum(G33_5.*img(x:x+2,y:y+2,3)));
    end
end

for x = 1:size(img,1)-2
    for y = 1:size(img,2)-2
        img_t3(x,y,1) = sum(sum(G33_10.*img(x:x+2,y:y+2,1)));
        img_t3(x,y,2) = sum(sum(G33_10.*img(x:x+2,y:y+2,2)));
        img_t3(x,y,3) = sum(sum(G33_10.*img(x:x+2,y:y+2,3)));
    end
end 


img_t1 = uint8(img_t1);
img_t2 = uint8(img_t2);
img_t3 = uint8(img_t3);

% % 將image周圍變0
% img = padarray(img,[1,1]);

%印出圖片
subplot(1,3,1);
image(img_t1);
title('Gaussian3*3_1');

subplot(1,3,2);
image(img_t2);
title('Gaussian3*3_5');

subplot(1,3,3);
imshow(img_t3);
title('Gaussian3*3_10');

img_t1 = padarray(img_t1,[1,1]);
img_t2 = padarray(img_t2,[1,1]);
img_t3 = padarray(img_t3,[1,1]);

%PSNR
[peaksnr1,snr1] = psnr(img_t1,I);
[peaksnr2,snr2] = psnr(img_t2,I);
[peaksnr3,snr3] = psnr(img_t3,I);

toc;    %計時結束
