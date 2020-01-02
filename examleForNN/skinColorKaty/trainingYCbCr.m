% updated

% 'skin'
clc
clear all
count=0;
imgDim=34; % 38
texDim=2;
InputFeatures=[];
ccount=0;
for a=1:250
    
    ccount=ccount+1;
    ccount
    
    str2='b (';   
    str=int2str(a);
    aa=strcat(str2,str);
    str1=').jpg';
    image=imread(strcat(aa,str1));  
    
    image=imresize(image,[imgDim imgDim]);
          ycbcr = rgb2ycbcr(image);
          Y=ycbcr( :, :, 1);
          CB=ycbcr( :, :, 2);
          CR=ycbcr( :, :, 3);
    for bb=1:texDim:imgDim
        for c=1:texDim:imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
    for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=Y(j,i);
            count=count+1;
            InputFeatures(1,count)=CB(j,i);
            InputFeatures(2,count)=CR(j,i);
            InputFeatures(3,count)=textures(1);
            InputFeatures(4,count)=textures(2);
            InputFeatures(5,count)=textures(3); 
            InputFeatures(6,count)=textures(4);

               if y>=0 && y<=78     
                Target(1,count)=1;
               elseif y>=79 && y<=157
                Target(2,count)=1;
               elseif y>=158 && y<=236
                Target(3,count)=1;
                end
            %   Target(1,count)=1;
        end
    end
        end
    end
end


for a=1:131
    
    ccount=ccount+1;
    ccount
    
    str2='d (';   
    str=int2str(a);
    aa=strcat(str2,str);
    str1=').bmp';
    image=imread(strcat(aa,str1));  
    
       image=imresize(image,[imgDim imgDim]);
          ycbcr = rgb2ycbcr(image);
          Y=ycbcr( :, :, 1);
          CB=ycbcr( :, :, 2);
          CR=ycbcr( :, :, 3);
    for bb=1:texDim:imgDim
        for c=1:texDim:imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
    for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=Y(j,i);
            count=count+1;
            InputFeatures(1,count)=CB(j,i);
            InputFeatures(2,count)=CR(j,i);
            InputFeatures(3,count)=textures(1);
            InputFeatures(4,count)=textures(2);
            InputFeatures(5,count)=textures(3); 
            InputFeatures(6,count)=textures(4);

               if y>=0 && y<=78     
                Target(1,count)=1;
               elseif y>=79 && y<=157
                Target(2,count)=1;
               elseif y>=158 && y<=236
                Target(3,count)=1;
                end
              % Target(1,count)=1;
        end
    end
        end
    end
end


% 'non-skin'
imgDim=38; % 40
for a=1:490
    
    ccount=ccount+1;
    ccount
    
     str2='c (';   
    str=int2str(a);
    aa=strcat(str2,str);
    str1=').jpg';
    image=imread(strcat(aa,str1));  
    
       image=imresize(image,[imgDim imgDim]);
          ycbcr = rgb2ycbcr(image);
          Y=ycbcr( :, :, 1);
          CB=ycbcr( :, :, 2);
          CR=ycbcr( :, :, 3);
    for bb=1:texDim:imgDim
        for c=1:texDim:imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
    for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=Y(j,i);
            count=count+1;
            InputFeatures(1,count)=CB(j,i);
            InputFeatures(2,count)=CR(j,i);
            InputFeatures(3,count)=textures(1);
            InputFeatures(4,count)=textures(2);
            InputFeatures(5,count)=textures(3); 
            InputFeatures(6,count)=textures(4);

               if y>=0 && y<=78     
                Target(4,count)=1;
               elseif y>=79 && y<=157
                Target(5,count)=1;
               elseif y>=158 && y<=236
                Target(6,count)=1;
                end
%               Target(2,count)=1;
        end
    end
        end
    end
end

imgDim=28; % 32
for a=1:220
    
    ccount=ccount+1;
    ccount
    
     str2='e (';   
    str=int2str(a);
    aa=strcat(str2,str);
    str1=').jpg';
    image=imread(strcat(aa,str1));  
    
       image=imresize(image,[imgDim imgDim]);
          ycbcr = rgb2ycbcr(image);
          Y=ycbcr( :, :, 1);
          CB=ycbcr( :, :, 2);
          CR=ycbcr( :, :, 3);
    for bb=1:texDim:imgDim
        for c=1:texDim:imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
    for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=Y(j,i);
            count=count+1;
            InputFeatures(1,count)=CB(j,i);
            InputFeatures(2,count)=CR(j,i);
            InputFeatures(3,count)=textures(1);
            InputFeatures(4,count)=textures(2);
            InputFeatures(5,count)=textures(3); 
            InputFeatures(6,count)=textures(4);

               if y>=0 && y<=78     
                Target(1,count)=1;
               elseif y>=79 && y<=157
                Target(2,count)=1;
               elseif y>=158 && y<=236
                Target(3,count)=1;
                end
%               Target(1,count)=1;
        end
    end
        end
    end
end


[row col]=size(InputFeatures);
row
col
