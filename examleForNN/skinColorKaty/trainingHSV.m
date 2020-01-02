% updated

% 'skin'
clc
clear all
count=0;
imgDim=36;
texDim=4;
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
          hsv = rgb2hsv(image);
          h=hsv( :, :, 1);
          s=hsv( :, :, 2);
          v=hsv( :, :, 3);
    for bb=1:texDim:imgDim
        for c=1:texDim:imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
    for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=v(j,i)*255;
            count=count+1;
            InputFeatures(1,count)=h(j,i);
            InputFeatures(2,count)=s(j,i);
            InputFeatures(3,count)=v(j,i);
            InputFeatures(4,count)=textures(1);
            InputFeatures(5,count)=textures(2);
            InputFeatures(6,count)=textures(3);
            InputFeatures(7,count)=textures(4);
        %    InputFeatures(8,count)=textures(5);
          %  InputFeatures(9,count)=textures(6);
          %  InputFeatures(10,count)=textures(7);
%                if y>=0 && y<=85     
%                 Target(1,count)=1;
%                elseif y>=86 && y<=170
%                 Target(2,count)=1;
%                elseif y>=171 && y<=255
%                 Target(3,count)=1;
%                 end
             Target(1,count)=1;
        end
    end
        end
    end
end


% for a=1:131    
%     ccount=ccount+1;
%     ccount
%     
%     str2='d (';   
%     str=int2str(a);
%     aa=strcat(str2,str);
%     str1=').bmp';
%     image=imread(strcat(aa,str1));  
%  
%     image=imresize(image,[imgDim imgDim]);
%           hsv = rgb2hsv(image);
%           h=hsv( :, :, 1);
%           s=hsv( :, :, 2);
%           v=hsv( :, :, 3);
%     for bb=1:texDim:imgDim
%         for c=1:texDim:imgDim
%           aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
%           textures=TextureFeatures(aa);
%     for j=bb:1:bb+texDim-1
%         for i=c:1:c+texDim-1
%             y=v(j,i)*255;
%             count=count+1;
%             InputFeatures(1,count)=h(j,i);
%             InputFeatures(2,count)=s(j,i);
%             InputFeatures(3,count)=textures(1);
%             InputFeatures(4,count)=textures(2);
%             InputFeatures(5,count)=textures(3);
%             InputFeatures(6,count)=textures(4);
%             InputFeatures(7,count)=textures(5);
%             InputFeatures(8,count)=v(j,i);
% %                if y>=0 && y<=85     
% %                 Target(1,count)=1;
% %                elseif y>=86 && y<=170
% %                 Target(2,count)=1;
% %                elseif y>=171 && y<=255
% %                 Target(3,count)=1;
% %                 end
%              Target(1,count)=1;
%     end
%         end
%     end
% end
% end

% 'non-skin'
imgDim=36;
for a=1:250    
    ccount=ccount+1;
    ccount
    
     str2='c (';   
    str=int2str(a);
    aa=strcat(str2,str);
    str1=').jpg';
  %  strcat(aa,str1)
    image=imread(strcat(aa,str1));  

   
    image=imresize(image,[imgDim imgDim]);
          hsv = rgb2hsv(image);
          h=hsv( :, :, 1);
          s=hsv( :, :, 2);
          v=hsv( :, :, 3);
    for bb=1:texDim:imgDim
        for c=1:texDim:imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
    for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=v(j,i)*255;
            count=count+1;
            InputFeatures(1,count)=h(j,i);
            InputFeatures(2,count)=s(j,i);
            InputFeatures(3,count)=v(j,i);
            InputFeatures(4,count)=textures(1);
            InputFeatures(5,count)=textures(2);
            InputFeatures(6,count)=textures(3);
            InputFeatures(7,count)=textures(4);
      %      InputFeatures(8,count)=textures(5);
           % InputFeatures(8,count)=textures(5);
%             InputFeatures(9,count)=textures(6);
%             InputFeatures(10,count)=textures(7);
%                if y>=0 && y<=85     
%                 Target(4,count)=1;
%                elseif y>=86 && y<=170
%                 Target(5,count)=1;
%                elseif y>=171 && y<=255
%                 Target(6,count)=1;
%                 end
             Target(2,count)=1;
    end
        end
    end
    end
end

% imgDim=32;
% for a=1:220
%     
%     ccount=ccount+1;
%     ccount
%     
%      str2='e (';   
%     str=int2str(a);
%     aa=strcat(str2,str);
%     str1=').jpg';
%     image=imread(strcat(aa,str1));  
%    
%     image=imresize(image,[imgDim imgDim]);
%           hsv = rgb2hsv(image);
%           h=hsv( :, :, 1);
%           s=hsv( :, :, 2);
%           v=hsv( :, :, 3);
%     for bb=1:texDim:imgDim
%         for c=1:texDim:imgDim
%           aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
%           textures=TextureFeatures(aa);
%     for j=bb:1:bb+texDim-1
%         for i=c:1:c+texDim-1
%             y=v(j,i)*255;
%             count=count+1;
%              InputFeatures(1,count)=h(j,i);
%             InputFeatures(2,count)=s(j,i);
%             InputFeatures(3,count)=v(j,i);
%             InputFeatures(4,count)=textures(1);
%             InputFeatures(5,count)=textures(2);
%             InputFeatures(6,count)=textures(3);
%             InputFeatures(7,count)=textures(4);
%             InputFeatures(8,count)=textures(5);
%             InputFeatures(9,count)=textures(6);
%             InputFeatures(10,count)=textures(7);
% %                if y>=0 && y<=85     
% %                 Target(1,count)=1;
% %                elseif y>=86 && y<=170
% %                 Target(2,count)=1;
% %                elseif y>=171 && y<=255
% %                 Target(3,count)=1;
% %                 end
%              Target(1,count)=1;
%     end
%         end
%     end
% end
% end
 [row col]=size(InputFeatures)
 [row col]=size(Target)