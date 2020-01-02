% updated

% 'skin'
clc
clear all
load('ExampleImagesKaty.mat');
count=0;
imgDim=58;
texDim=2;
InputFeatures=[];
for a=1:330
    a
    image=ExampleImagesKaty{a};
    image=imresize(image,[imgDim imgDim]);
          r=image( :, :, 1);
          g=image( :, :, 2);
          b=image( :, :, 3);
          ycbcr = rgb2ycbcr(image);
          Y=ycbcr( :, :, 1);
    for bb=1:texDim:imgDim
        for c=1:texDim:imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
    for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=Y(j,i);
            count=count+1;
            InputFeatures(1,count)=r(j,i);
            InputFeatures(2,count)=g(j,i);
            InputFeatures(3,count)=b(j,i);
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
for a=331:560
    a
    image=ExampleImagesKaty{a};
    image=imresize(image,[imgDim imgDim]);
          r=image( :, :, 1);
          g=image( :, :, 2);
          b=image( :, :, 3);
          ycbcr = rgb2ycbcr(image);
          Y=ycbcr( :, :, 1);
    for bb=1:texDim:imgDim
        for c=1:texDim:imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
    for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=Y(j,i);
            count=count+1;
            InputFeatures(1,count)=r(j,i);
            InputFeatures(2,count)=g(j,i);
            InputFeatures(3,count)=b(j,i);
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
