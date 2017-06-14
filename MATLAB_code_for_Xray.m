clc;
clear all;
close all;
I = imread('sample1.png');
figure, imshow(I);
if size(I,3)==3
    J = rgb2gray(I);
    figure, imshow(J);
    I = J;
end
K=medfilt2(I);
figure,imshow(K);
H = fspecial('average', [3 3]);
L = imfilter(I,H);
figure, imshow(L);
M = imgaussfilt(I);
figure, imshow(M);
