clear all;
i=imread('passport_01.jpg');
img_gray=rgb2gray(i);
img=imresize(img_gray,[600,NaN]);
iBlur=imgaussfilt(img,'FilterSize',3);
J=im2bw(iBlur,0.5);
J=imcomplement(J);
se = strel('rectangle',[13 13]);
closeBW = imclose(J,se);
T= imerode(closeBW,se);
%figure, imshow(closeBW)
%figure, imshow(T)
[C h]=imcontour(T,9); %2036
%imshow(F);