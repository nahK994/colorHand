clc
clear all

load('nnYCbCr250Zaidan.mat');
image=imread('qwer.jpg');
imgDim=200;
texDim=4;
noOfCluster=2;
objectSize=30;
count=0;
sum=0;
    image=imresize(image,[imgDim imgDim]);
    ansImage=image;

Image=ansImage;
Image= rgb2ycbcr(Image);
     for i=1:imgDim        % These are some explicit rules. If neural network fails and treats some non-skin as skin.....
    for j=1:imgDim
            if ansImage(i,j,1)==255 && ansImage(i,j,2)==255 && ansImage(i,j,3)==255
                
            else 
                 cb=Image(i,j,2); cr=Image(i,j,3);
                 if (cr>132) && (cr<173) && (cb>76) && (cb<126)
                     
                 else
                     ansImage(i,j,1)=255; 
                     ansImage(i,j,2)=255; 
                     ansImage(i,j,3)=255; 
                 end
            end
            end
     end
    
    ycbcr = rgb2ycbcr(image);
    Y=ycbcr( :, :, 1);
    cb=ycbcr( :, :, 2);
    cr=ycbcr( :, :, 3);
    tic;
    for bb=1: texDim: imgDim 
        for c=1: texDim: imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);       % This is texture features into 2x2 sub-block of main image.
          for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=Y(j,i);
            InputFeatures=[];
            InputFeatures(1,1)=cb(j,i);
            InputFeatures(2,1)=cr(j,i);
            InputFeatures(3,1)=textures(1);
            InputFeatures(4,1)=textures(2);
            InputFeatures(5,1)=textures(3);  
            InputFeatures(6,1)=textures(4);  
          ans=nnYCbCr250Zaidan(InputFeatures);       %  This part for neural network.
%           if y>=0 && y<=78   
%                nn=ans(1,1);
%                nn1=ans(4,1);
%            elseif y>=79 && y<=157
%                nn=ans(2,1);
%                nn1=ans(5,1);
%            elseif y>=158 && y<=236
%                nn=ans(3,1);
%                nn1=ans(6,1);
%             end
             nn=ans(1,1);
             count=count+1;
             graph(count,:)=[double(nn*100) double(y)];   % This array is used to make k means clustering to find the threshold value
             pos(count,:)=[j i];     % this array is used to store its corrosponding pixel positions in image.
    end
          end
        end
    end
    toc
      
       [idx, c]=kmeans(graph,noOfCluster);
       maxX=-9999; maxY=-9999;
       for i=1:noOfCluster    % this is to find the centroid with maximum neural network output
            if maxX < c(i,1)
                maxX=c(i,1);
                maxY=c(i,2);
            end
       end
       
      min=9999; 
      flag=0;
     for i=1:count    % this is to find our desired cluster number
         dis=(maxX-graph(i,1))*(maxX-graph(i,1)) + (maxY-graph(i,2))*(maxY-graph(i,2)); 
         if dis < min
             min=dis;   
             flag=idx(i,1);
         end
     end
     
        for i=1:count     % other points are treated as non-skin
            if idx(i,1)~=flag
                ansImage(pos(i,1),pos(i,2),1)=255; 
                  ansImage(pos(i,1),pos(i,2),2)=255; 
                    ansImage(pos(i,1),pos(i,2),3)=255; 
            end
        end
     
           IMAGE=ansImage;
     for i=1:imgDim    % This is to clear noisy part. Here skin objects with   numberOfPixel<=10 will be vanished..
    for j=1:imgDim
            if IMAGE(i,j,1)==255 && IMAGE(i,j,2)==255 && IMAGE(i,j,3)==255
                
            else
               [IMAGE sum]=dfs(IMAGE, i, j);
              if sum<=objectSize
               ansImage=colorDFS(ansImage,i,j);
              end
    end
     end
     end
       % ansImage=imresize(ansImage,[200 200]);
       imshow(ansImage);