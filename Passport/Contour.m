clear all;
i=imread('Passportb.jpg');
img_gray=rgb2gray(i);
[h,w]=size(img_gray);
img=imresize(i,1000/w);
