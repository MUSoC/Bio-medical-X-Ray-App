clc;
clear all;
close all;

Image = imread('sample1.png');
figure, imshow(Image);

%If coloured image, convert it to gray
if size(Image,3)== 3
    GrayImage = rgb2gray(Image);
    figure, imshow(GrayImage);
    Image = GrayImage;
end

%Median Filter
MedianFilteredImage = medfilt2(Image);
figure,imshow(MedianFilteredImage);

%Mean Filter
MeanFilterWindow = fspecial('average', [3 3]);
MeanFilteredImage = imfilter(Image,MeanFilterWindow);
figure, imshow(MeanFilteredImage);

%Gaussian Filter
GaussianFilteredImage = imgaussfilt(Image);
figure, imshow(GaussianFilteredImage);