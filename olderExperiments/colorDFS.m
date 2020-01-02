function aa=colorDFS(a, i, j)
  
    [height width dim]=size(a);
    a(i,j,1)=255; a(i,j,2)=255; a(i,j,3)=255;
    
    c=i-1; d=j-1;
    if c>=1 && d>=1 &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    a =colorDFS(a,c,d);
    end
    
    c=i-1; d=j;
    if c>=1 &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    a =colorDFS(a,c,d);
    end
    
    c=i-1; d=j+1;
    if c>=1 && d<=width &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    a =colorDFS(a,c,d);
    end
    
    c=i; d=j-1;
    if d>=1 &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    a =colorDFS(a,c,d);
    end
    
    c=i; d=j+1;
    if d<=width &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    a =colorDFS(a,c,d);
    end
    
    c=i+1; d=j-1;
    if c<=height && d>=1 &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    a=colorDFS(a,c,d);
    end
    
    c=i+1; d=j;
    if c<=height &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    a =colorDFS(a,c,d);
    end
    
    c=i+1; d=j+1;
    if c<=height && d<=width &&  (a(c,d,1)~=255 || a(c,d,2)~=255 || a(c,d,3)~=255)
    a=colorDFS(a,c,d);
    end
    
    aa=a;
end