function Ch_cm=Crossover_OneOpint(Ch,Sel_Parent,N,n,Pc)
for i=1:2:N
    if(rand(1)<=Pc)
      Cut=round(1+(n-2)*rand(1));
      Ch_cm(i,:)  =[ Ch(Sel_Parent(i),1:Cut)   Ch(Sel_Parent(i+1),Cut+1:n) ];
      Ch_cm(i+1,:)=[ Ch(Sel_Parent(i+1),1:Cut) Ch(Sel_Parent(i),Cut+1:n)   ];
    else
       Ch_cm(i,:)  =Ch(Sel_Parent(i),:);
       Ch_cm(i+1,:)=Ch(Sel_Parent(i+1),:);
    end
end