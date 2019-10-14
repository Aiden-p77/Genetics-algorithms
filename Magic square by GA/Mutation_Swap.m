function Ch_cm=Mutation_Swap(Ch_cm,N,n,Pm)
for i=1:N
    if(rand(1)<=Pm)
       % different position
       position1=round(1+(n-1)*rand(1));
       position2=position1;
       while(position1==position2)
             position2=round(1+(n-1)*rand(1)); 
       end
       temp=Ch_cm(i,position1);
       Ch_cm(i,position1)=Ch_cm(i,position2);
       Ch_cm(i,position2)=temp;
    end
end