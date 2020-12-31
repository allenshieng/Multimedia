clc;
clear;
tic;

%load image
img = imread('./柴犬飛飛.jpg');

I = img;    %儲存原圖

edge_dect = [1 1 1;0 0 0;-1 -1 -1];
unsharp_mask = [-1 -1 -1;-1 8 -1;-1 -1 -1];

% img = padarray(img,[1,1]);

img = double(img);

for x = 1:size(img,1)-2
    for y = 1:size(img,2)-2
        img_edge(x,y,1) = sum(sum(edge_dect.*img(x:x+2,y:y+2,1)));
        img_edge(x,y,2) = sum(sum(edge_dect.*img(x:x+2,y:y+2,2)));
        img_edge(x,y,3) = sum(sum(edge_dect.*img(x:x+2,y:y+2,3)));       
    end
end

for x = 1:size(img,1)-2
    for y = 1:size(img,2)-2
        img_sharp(x,y,1) = sum(sum(unsharp_mask.*img(x:x+2,y:y+2,1)));
        img_sharp(x,y,2) = sum(sum(unsharp_mask.*img(x:x+2,y:y+2,2)));
        img_sharp(x,y,3) = sum(sum(unsharp_mask.*img(x:x+2,y:y+2,3)));       
    end
end


% Apply edge-detection
% show image
subplot(1,2,1);
title('edge-detection');
img_edge = uint8(img_edge);
image(img_edge);

%Apply Unsharp mask
%show image
img_sharp = padarray(img_sharp,[1,1]);
img_sharp = I - uint8(img_sharp);

subplot(1,2,2);
title('unsharp-mask');
image(img_sharp);

toc;