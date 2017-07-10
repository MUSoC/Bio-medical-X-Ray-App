clc;
clear all;
close all;

Image = imread('sample5.png');
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
%Implementing Canny Edge Detection
BW = edge(MedianFilteredImage,'Sobel');
%figure,imshow(BW);

%Implementing Hough Transform with BW as input
[H,T,R] = hough(BW);
%rho (R) is the distance from the origin to the line along a vector 
%perpendicular to the line 
%theta (T) is the angle in degrees between the x-axis and this vector. 
%Standard Hough Transform (H)is a parameter space matrix 
%whose rows and columns correspond to rho and theta values respectively.

P  = houghpeaks(H,5,'threshold',ceil(0.3*max(H(:))));
%peaks (P) is a matrix returned by the houghpeaks function that contains the row and column coordinates
%of the Hough transform bins to use in searching for line segments

lines = houghlines(BW,T,R,P,'FillGap',5,'MinLength',7);
figure, imshow(MedianFilteredImage), hold on
for k = 1:length(lines)
   xy = [lines(k).point1; lines(k).point2];
   plot(xy(:,1),xy(:,2),'LineWidth',2,'Color','green');
end

