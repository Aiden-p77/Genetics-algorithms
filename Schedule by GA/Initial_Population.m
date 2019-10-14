function Ch=Initial_Population(N,a,b,Ln,prs)
    Ch=zeros(N,Ln);
    temp=prs;
    for i=1:N
        for j=1:Ln
            r=round(a+(b-a).*rand(1));
            Ch(i,j)=temp(1,r);
            temp(:,r)=[];
            b=b-1;
        end
        temp=prs;
        b=Ln;
    end
end

