function OF=Objective_Function(Ch,N,Summing,n) 
    nDec=sqrt(n);
    OF=ones(N,1);
    sumRow=zeros(nDec,1);
    sumCol=zeros(1,nDec);

    for i=1:N
        ssCol=0;
        ssRow=0;
        sumCol(1,1)=sum(Ch(i,1:3));
        sumCol(1,2)=sum(Ch(i,4:6));
        sumCol(1,3)=sum(Ch(i,7:9));
        
        sumRow(1,1)=sum(Ch(i,1:3:7));
        sumRow(2,1)=sum(Ch(i,2:3:8));
        sumRow(3,1)=sum(Ch(i,3:3:9));
        for j=1:nDec
            ssRow=ssRow+abs(Summing-sumRow(j,1));
            ssCol=ssCol+abs(Summing-sumCol(1,j));
        end
        OF(i)=ssCol+ssRow;
    end     
end
