function OF=Objective_Function(G,Ch,N,v)    
    OF=zeros(N,1);
    counter=0;
    for k=1:N
        for i=1:v-1
           for j=1:v
              if G(i,j)==1
                 if Ch(k,i)==Ch(k,j)
                    counter=counter+1; 
                 end
              end
           end
        end
        OF(k,1)=counter;
    end     
end
