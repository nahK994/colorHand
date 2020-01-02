clc
clear all
load('netYCbCrZaidan.mat');
image=imread('a (1).jpg');
imgDim=360;
    image=imresize(image,[imgDim imgDim]);
    ycbcr = rgb2ycbcr(image);
          Y=ycbcr( :, :, 1);
          CB=ycbcr( :, :, 2);
          CR=ycbcr( :, :, 3);
    ansImage=image;
    for bb=1:1:imgDim
        for c=1:1:imgDim
          InputFeatures=[];
            InputFeatures(1,1)=CB(bb,c);
            InputFeatures(2,1)=CR(bb,c);
             ans=netYCbCrZaidan(InputFeatures);
          nn=ans(1,1);
          nn1=ans(2,1);
          
          if nn*100>=85 
              
          else 
               ansImage(bb,c,1)=255; ansImage(bb,c,2)=255; ansImage(bb,c,3)=255;
          end
        end
    end
    imshow(ansImage);