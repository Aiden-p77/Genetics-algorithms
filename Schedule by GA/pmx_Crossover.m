function Ch_cm=pmx_Crossover(Ch,Sel_Parent,N,n,Pc)
for b=1:2:N
  if(rand(1)<=Pc)
    P1=Ch(Sel_Parent(b),:);
    P2=Ch(Sel_Parent(b+1),:);
    child1=zeros(1,n);
    child2=zeros(1,n);
    for k=1:n%replace 10 and increase number if here infinity if problem d=0;
        fC1=find(P2);
        for i=1:n%%replace 10 and increase number if here infinity if problem with r1==r2
            r=randi([2,size(P2,2)-1],1,2);
            lo=min(r);
            up=max(r);
%lo=3;
%up=5;
            if lo==up
                continue
            else
                break
            end
        end
        for i=lo:up
            child1(i)=P2(fC1(i));
        end
        for i= lo:up
            a=P1(i);%2
            u=child1(i);%5
            G=find(a==child1);
            if (isempty(G)&& a~=u)
                Z=find(u==P1);
                if child1(Z)==0
                    child1(Z)=a;
                else
                    t=P2(Z);%7
                    Z=find(t==P1);%3
                    child1(Z)=a;
                end 
            end
        end
        d=find(child1==0);%here deal with matrix size and also embed if the position is already occupied.....
        if (d==0)
            continue
        else
            break
        end
    end
    for i=1:size(d,2)
        child1(d(i))=P1(d(i));
    end
    Ch_cm(b,:)=child1;
    fC2=find(P1);
    for k=1:10
        for i=lo:up
            child2(i)=P1(fC2(i));
        end
        for i= lo:up
            a=P2(i);%7
            u=child2(i);%5
            G=find(a==child2);
            if isempty(G)&& a~=u
                Z=find(u==P2);
                if child2(Z)==0
                    child2(Z)=a;
                else
                    t=P1(Z);%7
                    Z=find(t==P2);%3
                    child2(Z)=a;
                end 
            end
        end
        d=find(child2==0);%here deal with matrix size and also embed if the position is already occupied.....
        if (d==0)
            continue
        else
            break
        end
    end
    for i=1:size(d,2)
        child2(d(i))=P2(d(i));
    end
    Ch_cm(b+1,:)=child2;
  else
    Ch_cm(b,:)  =Ch(Sel_Parent(b),:);
    Ch_cm(b+1,:)=Ch(Sel_Parent(b+1),:);
  end
end