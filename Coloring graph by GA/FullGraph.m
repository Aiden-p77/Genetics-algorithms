function g=FullGraph(v)
    g=ones(v);
    for i=1:v
       g(i,i)=0; 
    end
end