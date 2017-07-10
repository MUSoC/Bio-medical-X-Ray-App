clc;
clear all;
close all;

Image = imread('sample7.png');
%figure, imshow(Image);

%If coloured image, convert it to gray
if size(Image,3)== 3
    GrayImage = rgb2gray(Image);
    %figure, imshow(GrayImage);
    Image = GrayImage;
end

%Median Filter
MedianFilteredImage = medfilt2(Image);
%figure,imshow(MedianFilteredImage);
%Otsu's global thresholding algorithm
level = graythresh(MedianFilteredImage); %Finds the optimal thresholding point
BW = im2bw(MedianFilteredImage,level); %Thresholding the image based on that value
figure, imshow(BW);
