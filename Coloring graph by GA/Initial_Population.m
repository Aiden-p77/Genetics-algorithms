function Ch=Initial_Population(N,v,n)
    Ch=zeros(N,v);
    for i=1:N
        Chn=round(1+(n-1).*rand(1,v));
        Ch(i,:)=Chn(:);
    end
end

