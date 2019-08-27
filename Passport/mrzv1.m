clear all;
i=imread('passport_07.jpeg');
img_gray=rgb2gray(i);
img=imresize(img_gray,[600,NaN]);
iBlur=imgaussfilt(img,'FilterSize',3);
J=im2bw(iBlur,0.5);
J=imcomplement(J);
%se1=strel('line',1,45);
%K=imerode(J,se1);
se = strel('rectangle',[13 13]);
closeBW = imclose(J,se);
T= imerode(closeBW,se);
reg=regionprops(T,'BoundingBox');
x=0;
y=0;
area=0;
for i=1:length(reg)
    arr=reg(i).BoundingBox;
    area=arr(3)*arr(4);
    if (area>(x*y))
        boundingBox=arr;
        x=arr(3);
        y=arr(4);
    end
end
padding=15;
boundingBox(1)=boundingBox(1)-padding;
boundingBox(2)=boundingBox(2)-padding;
boundingBox(3)=boundingBox(3)+padding*2;
boundingBox(4)=boundingBox(4)+padding*2;
chut=imcrop(img,boundingBox);
imshow(chut)
