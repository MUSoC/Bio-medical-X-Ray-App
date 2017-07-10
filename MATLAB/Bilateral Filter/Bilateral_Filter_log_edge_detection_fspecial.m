clc;
clear all;
close all;

Image = double(imread('sample6.png'))/255;
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

BilateralFilteredImage = BfilterGray(MedianFilteredImage, 3, 3, 10);
%figure, imshow(BilateralFilteredImage)

%Implementing LoG-Edge Detection
f=BilateralFilteredImage; 
w=fspecial('log',[3 3],0.5); 
filtered_img=imfilter(f,w,'replicate');

%Implementing morphological operations
se = strel(ones(5,5));
t = imdilate(filtered_img, se);

figure,imshow(filtered_img);
%figure, imshow(t);