% RGB Image to YIQ Image
% YIQ  builds the basis for the NTSC (National Television System Commitee) format.
% The Component division of YIQ :
% Y=0.30R+0.59G+0.11B
% I=0.60R-0.28G-0.32B
% Q=0.21R-0.52G+0.31B


load clown.mat;
colormap(map);

img = imread("./tree.jpg")
YIQ = uint8(zeros(size(img)));
image(img)

% RGB to YIQ 
% for i=1:size(img,1)
%     for j=1:size(img,2)
%         YIQ(i,j,1) = 0.2989*img(i,j,1) + 0.5870*img(i,j,2) + 0.1140*img(i,j,3);
%         YIQ(i,j,2) = 0.596*img(i,j,1) - 0.274*img(i,j,2) - 0.322*img(i,j,3);
%         YIQ(i,j,3) = 0.211*img(i,j,1) - 0.523*img(i,j,2) + 0.312*img(i,j,3);
%     end
% end

% RGB to Grayscale 
for i=1:size(img,1)
    for j=1:size(img,2)
        YIQ(i,j,1) = 0.30*img(i,j,1) + 0.59*img(i,j,2) + 0.11*img(i,j,3);
        YIQ(i,j,2) = 0.30*img(i,j,1) + 0.59*img(i,j,2) + 0.11*img(i,j,3);
        YIQ(i,j,3) = 0.30*img(i,j,1) + 0.59*img(i,j,2) + 0.11*img(i,j,3);
    end
end

subplot(1,2,1);image(img)
axis("off")
subplot(1,2,2);image(YIQ)
axis("off")

