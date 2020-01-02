clc
clear all
 a=imread('sd.jpg');
 imgDim=2;
 a=imresize(a,[imgDim imgDim]);
 a = im2double(a);
 a=rgb2gray(a);
 aa=1;
 for i=1:imgDim
     for j=1:imgDim
      b(aa)=a(i,j);
      aa=aa+1;
     end
 end
b
 kurtosis(double(b))
 skewness(double(b))
% count=0;
% for i=1:200
%    for j=1:200
%        count=count+1;
%        aa(count,:)=a(i,j);
%    end
% end
% y=kurtosis(aa);
% skewness(aa)
imshow(a);