function Ch=Initial_Population(N,a,b)
    Ch=zeros(N,1);
    for i=1:N
        Ch(i)=round(a+(b-a).*rand(1,1));
    end
   Ch=dec2bin(Ch,8);
end

