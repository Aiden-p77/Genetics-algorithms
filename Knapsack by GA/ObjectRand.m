function [wO,pO]=ObjectRand(n,a,b)
    wO=zeros(1,n);
    pO=zeros(1,n);
    for i=1:n
       wO(1,i)=round((a+(b-a)*rand(1)));
       pO(1,i)=round(rand(1));
    end
end