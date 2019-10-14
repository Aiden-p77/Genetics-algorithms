function g=CycleGraph(v)
    g=zeros(v);
    for i=1:v-1
        g(i,i+1)=1;
        g(i+1,i)=1;
    end
    g(v,1)=1;
    g(1,v)=1;
end