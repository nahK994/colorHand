clc
clear all
tic;
load('nn3.mat');
image=imread('image (148).jpg');
imgDim=120;
texDim=2;
count1=0;
count2=0;
count3=0;
    image=imresize(image,[imgDim imgDim]);
    for i=1:imgDim
        for j=1:imgDim
         ansImage(i,j,1)=255; ansImage(i,j,2)=255; ansImage(i,j,3)=255;
        end
    end
    ycbcr = rgb2ycbcr(image);
    Y=ycbcr( :, :, 1);
    r=image( :, :, 1);
    g=image( :, :, 2);
    b=image( :, :, 3);
    
    for bb=1: texDim: imgDim 
        for c=1: texDim: imgDim
          aa=imcrop(image,[bb, c, texDim-1, texDim-1]);
          textures=TextureFeatures(aa);
          for j=bb:1:bb+texDim-1
        for i=c:1:c+texDim-1
            y=Y(j,i);
            InputFeatures=[];
            InputFeatures(1,1)=r(j,i);
            InputFeatures(2,1)=g(j,i);
            InputFeatures(3,1)=b(j,i);
            InputFeatures(4,1)=textures(1);
            InputFeatures(5,1)=textures(2);  
          %  InputFeatures(6,1)=textures(3);  
            ans=nn3(InputFeatures);
            if y>=0 && y<=78     
              NN=ans(1,1);
              NN1=ans(4,1);
              count1=count1+1;
              graph1(count1,:)=[double(NN*100-NN1*100) double(y)];
              pos1(count1,:)=[j i];
           elseif y>=79 && y<=157
               NN=ans(2,1);
               NN1=ans(5,1);
               count2=count2+1;
               graph2(count2,:)=[double(NN*100-NN1*100) double(y)];
               pos2(count2,:)=[j i];
           elseif y>=158 && y<=236
               NN=ans(3,1);
               NN1=ans(6,1);
               count3=count3+1;
               graph3(count3,:)=[double(NN*100-NN1*100) double(y)];
               pos3(count3,:)=[j i];
            end

    end
          end
        end
    end
    
       noOfCluster=3;
       [idx1, c1]=kmeans(graph1,noOfCluster);
       [idx2, c2]=kmeans(graph2,noOfCluster);
       [idx3, c3]=kmeans(graph3,noOfCluster);
       maxX1=-9999; maxY1=-9999;
       maxX2=-9999; maxY2=-9999;
       maxX3=-9999; maxY3=-9999;
       
       for i=1:noOfCluster
            if maxX1 < c1(i,1)
                maxX1=c1(i,1);
                maxY1=c1(i,2);
            end
            
            if maxX2 < c2(i,1)
                maxX2=c2(i,1);
                maxY2=c2(i,2);
            end
            
            if maxX3 < c3(i,1)
                maxX3=c3(i,1);
                maxY3=c3(i,2);
            end
       end
       
      min1=9999; min2=9999; min3=9999; 
      flag1=0; flag2=0; flag3=0;
      count=max(count1,count2);
      count=max(count,count3);
     for i=1:count
         if i<=count1
         dis1=(maxX1-graph1(i,1))*(maxX1-graph1(i,1)) + (maxY1-graph1(i,2))*(maxY1-graph1(i,2)); 
         if dis1 < min1
             min1=dis1;
             flag1=idx1(i,1);
         end
         end
        
        if i<=count2
         dis2=(maxX2-graph2(i,1))*(maxX2-graph2(i,1)) + (maxY2-graph2(i,2))*(maxY2-graph2(i,2)); 
         if dis2 < min2
             min2=dis2;
             flag2=idx2(i,1);
         end
        end
        
        if i<=count3
         dis3=(maxX3-graph3(i,1))*(maxX3-graph3(i,1)) + (maxY3-graph3(i,2))*(maxY3-graph3(i,2)); 
         if dis3 < min3
             min3=dis3;
             flag3=idx3(i,1);
         end
        end
     end
     
     for i=1:count   
            if i<=count1 && idx1(i,1)==flag1
                'a'
                ansImage(pos1(i,1),pos1(i,2),1)=0;
                ansImage(pos1(i,1),pos1(i,2),2)=0;
                ansImage(pos1(i,1),pos1(i,2),3)=0;
            end
        
             if i<=count2 && idx2(i,1)==flag2
                 'b'
                ansImage(pos2(i,1),pos2(i,2),1)=0; 
                ansImage(pos2(i,1),pos2(i,2),2)=0; 
                ansImage(pos2(i,1),pos2(i,2),3)=0; 
            end
         
             if i<=count3 && idx3(i,1)==flag3
                 'c'
                ansImage(pos3(i,1),pos3(i,2),1)=0; 
                ansImage(pos3(i,1),pos3(i,2),2)=0; 
                ansImage(pos3(i,1),pos3(i,2),3)=0; 
             end
     end
        
        for i=1:imgDim
            for j=1:imgDim
               if ansImage(i,j,1)==0 && ansImage(i,j,2)==0 && ansImage(i,j,3)==0 
                   
               else
                   image(i,j,1)=255; image(i,j,2)=255; image(i,j,3)=255; 
               end
            end
        end
        toc
        imshow(image);
 