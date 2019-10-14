function Ch=Replacment_Generational_elitism(Ch,Ch_cm,OF,OF_cm)
if(min(OF)<min(OF_cm))
    row_OF=find(OF==min(OF),1);
    temp_Ch=Ch(row_OF,:);
    Ch=Ch_cm;
    Ch(row_OF,:)=temp_Ch;
else
    Ch=Ch_cm;
end