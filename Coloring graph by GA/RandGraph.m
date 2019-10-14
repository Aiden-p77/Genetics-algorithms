function g=RandGraph(v)
    for i=1:v
       for j=i+1:v
          g(i,i)=0;
          g(i,j)=round(rand(1));
          g(j,i)=g(i,j);
       end
    end
end