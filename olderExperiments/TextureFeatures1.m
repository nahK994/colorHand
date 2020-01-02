function aa =TextureFeatures(aaa)
image=aaa; 
Image = im2double(image);
Image=rgb2gray(Image);
image=rgb2gray(image);
[height width]=size(image);
area=height*width;

Smoothness=0; Uniformity=0; Entropy=0;
SD = std2(image);
 Smoothness=1/(1+SD);

Smoothness=1-Smoothness;
Entropy = entropy(image);
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
Kurtosis=kurtosis(ara);
Skewness=skewness(ara);
aa=[Uniformity Entropy SD];
end