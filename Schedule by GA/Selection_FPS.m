function FPS=Selection_FPS(FF,N)
P=FF./(sum(FF));

Sum_P(1)=P(1);
for i=2:N
   Sum_P(i)=Sum_P(i-1)+P(i);
end

for i=1:2:N
    temp=find(rand(1)-Sum_P<=0);
    FPS(i)=temp(1);
    temp=find(rand(1)-Sum_P<=0);
    FPS(i+1)=temp(1);
    while FPS(i)==FPS(i+1)
      temp=find(rand(1)-Sum_P<=0);
      FPS(i+1)=temp(1);
    end
end
end

