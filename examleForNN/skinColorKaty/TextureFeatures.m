function aa =TextureFeatures(aaa)
image=aaa; 
Image = im2double(image);
Image=rgb2gray(Image);
image=rgb2gray(image);
image=im2double(image);
[height width]=size(image);
area=height*width;
min=500; max=0;
Smoothness=0; Uniformity=0; Entropy=0;
SD = std2(image);
M = mean2(image);
index=1;
for i=1:height
    for j=1:width
      if max < image(i,j)
          max = image(i,j);
      end
      if min > image(i,j)
          min = image(i,j);
      end
      b(index)=image(i,j);
      index=index+1;
    end
end

count=0;
[counts,x] = imhist(image);
for i=1:height
    for j=1:width
        bb=int64(image(i,j));
      Uniformity=Uniformity+int64(counts(bb+1))*int64(counts(bb+1));
      counts(bb+1)=0;
      count=count+1;
       ara(count,:)=Image(i,j);
    end
end

range=max-min;
 Smoothness=1/(1+SD*SD);
Smoothness=1-Smoothness;
Entropy = entropy(image);
Kurtosis=kurtosis(b);
Skewness=skewness(b);
% aa=[Uniformity Entropy];  % RGB
% aa=[SD Entropy Uniformity Smoothness];   %YCbCr
 aa=[Entropy Uniformity Kurtosis Skewness];  % HSV
end