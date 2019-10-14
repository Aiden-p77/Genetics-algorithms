function OF=Objective_Function(Ch,N,Ln) 
    OF=ones(N,1);
    for i=1:N
        wt=zeros(1,Ln+1);
        for k=2:Ln+1
           wt(1,k)=Ch(i,k-1)+wt(1,k-1); 
        end
        OF(i,1)=sum(wt);
    end     
end
