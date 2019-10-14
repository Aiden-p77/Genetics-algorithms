function OF=Objective_Function(Ch,N,f)    
    OF=zeros(N,1);
    for i=1:N
        OF(i)=f(bin2dec(Ch(i,:)));
    end     
end
