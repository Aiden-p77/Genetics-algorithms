function OF=Objective_Function(Ch,N,Ln,wO,pO,w) 
    OF=zeros(N,1);
    for k=1:N
        for i=1:Ln
           f=sum(Ch(k,:).*wO.*pO);
           pen=abs(w-sum(Ch(k,:).*w));
           OF(k)=1/f+pen;
        end
    end     
end
