function Ch=Initial_Population(N,Ln)
    Ch=zeros(N,Ln);
    for i=1:N
        Chn=round(rand(1,Ln));
        Ch(i,:)=Chn(:);
    end
end

