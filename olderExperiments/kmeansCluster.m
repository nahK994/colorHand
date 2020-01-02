clc
clear all

x=[22 26 20 25 22 26 0 0 0 0 0 0 0 0 0 40 45 43 44 47];
for i=1:20
     y(i,1)=x(i);
end
plot(y,'b*'); 

[idx, c]=kmeans(y,3);
size(idx)
size(c)

fprintf('%f  %f  %f\n',c(1,1),c(2,1),c(3,1));

count=1;
for i=1:20
   fprintf('%d  %d\n',count,idx(i,1));
   count=count+1;
end