clc
clear all
tic
load('nnYang.mat');
image=imread('5.jpg');
imgDim=120;
count=0;
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
             ans=nnYang(InputFeatures);
            y=Y(bb,c);
            if y>=0 && y<=78     
               nn=ans(1,1);
               nn1=ans(4,1);
           elseif y>=79 && y<=157
               nn=ans(2,1);
               nn1=ans(5,1);
           elseif y>=158 && y<=236
               nn=ans(3,1);
               nn1=ans(6,1);
            end
             if nn*100-nn1*100 >=40
                 
             else
                 ansImage(bb,c,1)=255; ansImage(bb,c,2)=255; ansImage(bb,c,3)=255;    
             end
%             count=count+1;
%              graph(count,:)=[double(nn*100-nn1*100) double(y)];
%              pos(count,:)=[bb c];
        end
    end
%     noOfCluster=5;
%        [idx, c]=kmeans(graph,noOfCluster);
%        maxX=-9999; maxY=-9999;
%        for i=1:noOfCluster
%             if maxX < c(i,1)
%                 maxX=c(i,1);
%                 maxY=c(i,2);
%             end
%        end
%        
%       min=9999; 
%       flag=0;
%      for i=1:count
%          dis=(maxX-graph(i,1))*(maxX-graph(i,1)) + (maxY-graph(i,2))*(maxY-graph(i,2)); 
%          if dis < min
%              min=dis;
%              flag=idx(i,1);
%          end
%      end
%      
%         for i=1:count
%             if idx(i,1)~=flag
%                 ansImage(pos(i,1),pos(i,2),1)=255; 
%                   ansImage(pos(i,1),pos(i,2),2)=255; 
%                     ansImage(pos(i,1),pos(i,2),3)=255; 
%             end
%         end
        toc
        imshow(ansImage);