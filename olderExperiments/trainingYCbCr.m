% updated

% 'skin'
clc
clear all
load('ExampleImagesKaty.mat');
count=0;
imgDim=60;
InputFeatures=[];
for a=1:170
    image=ExampleImagesKaty{a};
    image=imresize(image,[imgDim imgDim]);
    ycbcr = rgb2ycbcr(image);
              Y=ycbcr( :, :, 1);
          CB=ycbcr( :, :, 2);
          CR=ycbcr( :, :, 3);
    for bb=1:4:imgDim
        for c=1:4:imgDim
          aa=imcrop(image,[bb, c, 3, 3]);
          textures=TextureFeaturesYCbCr(aa);
    for j=bb:1:bb+3
        for i=c:1:c+3
            y=Y(j,i);
            count=count+1;
            InputFeatures(1,count)=y;
            InputFeatures(2,count)=CB(i,j);
            InputFeatures(3,count)=CR(i,j);
            InputFeatures(4,count)=textures(1);
            InputFeatures(5,count)=textures(2);
            InputFeatures(6,count)=textures(3);

                if y>=0 && y<=78     
                Target(1,count)=1;
               elseif y>=79 && y<=157
               Target(2,count)=1;
               elseif y>=158 && y<=236
               Target(3,count)=1;
                end
        end
    end
        end
    end
end

% 'non-skin'
for a=171:330
    image=ExampleImagesKaty{a};
    image=imresize(image,[imgDim imgDim]);
    ycbcr = rgb2ycbcr(image);
              Y=ycbcr( :, :, 1);
          CB=ycbcr( :, :, 2);
          CR=ycbcr( :, :, 3);
    for bb=1:4:imgDim
        for c=1:4:imgDim
          aa=imcrop(image,[bb, c, 3, 3]);
          textures=TextureFeaturesYCbCr(aa);
    for j=bb:1:bb+3
        for i=c:1:c+3
            y=Y(j,i);
            count=count+1;
            InputFeatures(1,count)=y;
            InputFeatures(2,count)=CB(i,j);
            InputFeatures(3,count)=CR(i,j);
            InputFeatures(4,count)=textures(1);
            InputFeatures(5,count)=textures(2);
            InputFeatures(6,count)=textures(3);

                if y>=0 && y<=78     
                Target(4,count)=1;
               elseif y>=79 && y<=157
               Target(5,count)=1;
               elseif y>=158 && y<=236
               Target(6,count)=1;
                end
        end
    end
        end
    end
end

[row col]=size(InputFeatures);
row
col
