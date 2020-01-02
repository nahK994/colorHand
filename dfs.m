function [aa sum]=dfs(a, i, j)
  
    [height width dim]=size(a);
    a(i,j,1)=255; a(i,j,2)=255; a(i,j,3)=255;
    sum1=0; sum2=0; sum3=0; sum4=0; 
    sum5=0; sum6=0; sum7=0; sum8=0;
    
    c=i-1; d=j-1;
    if c>=1 && d>=1 && (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    [a sum1]=dfs(a,c,d);
    end
    
    c=i-1; d=j;
    if c>=1 &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    [a sum2]=dfs(a,c,d);
    end
    
    c=i-1; d=j+1;
    if c>=1 && d<=width &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    [a sum3]=dfs(a,c,d);
    end
    
    c=i; d=j-1;
    if d>=1 &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    [a sum4]=dfs(a,c,d);
    end
    
    c=i; d=j+1;
    if d<=width &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    [a sum5]=dfs(a,c,d);
    end
    
    c=i+1; d=j-1;
    if c<=height && d>=1 &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    [a sum6]=dfs(a,c,d);
    end
    
    c=i+1; d=j;
    if c<=height &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    [a sum7]=dfs(a,c,d);
    end
    
    c=i+1; d=j+1;
    if c<=height && d<=width &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    [a sum8]=dfs(a,c,d);
    end
    
    aa=a;
    sum=sum1+sum2+sum3+sum4+sum5+sum6+sum7+sum8+1;
end