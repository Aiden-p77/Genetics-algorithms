function Ch=Initial_Population(N,a,b,n)
    Ch=zeros(N,n);
    for i=1:N
        Chn=round(a+(b-a).*rand(3,3));
        Ch(i,:)=Chn(:);
    end
end

