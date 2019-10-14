clc;
clear all
close all
format compact

w=30;
Pc=0.8; %Crossover
Pm=0.2; %Mutation
Generation_num=1000;
N=4; % Number of chromosom
maxP=-inf;

%% 
nObject=10;
a=1;
b=10;
%[wO,wP]=ObjectRand(nObject,a,b);
[wO,wP,nObject]=ObjectInput();
LengthCh=nObject; %Length of chromosom

%%
%Initial Population
Ch=Initial_Population(N,LengthCh);
i=1;
while( i<=Generation_num )
    %***** Objective Function *****
    OF=Objective_Function(Ch,N,LengthCh,wO,wP,w);
    %***** Fitness Function *****
    FF=Fitness_Function(OF);
    %***** Convergence Plot
    ave(i)=sum(FF)/N;
    best(i)=max(FF);
    
    fprintf('Iteration=%d  Best chromosome price =%f \n',i,max(OF));
    if (maxP <= max(OF))
       maxP=max(OF); 
       opt=Ch(find(OF==max(OF),1),:);
    end
    %***** FPS selection
    Select_Parent=Selection_FPS(FF,N);
    %***** Crossover *****
    Ch_cm=Crossover_OneOpint(Ch,Select_Parent,N,LengthCh,Pc);
    %***** Mutation *****
    Ch_cm=Mutation_Swap(Ch_cm,N,LengthCh,Pm);
    
    %***** Replacment ****
    OF_cm=Objective_Function(Ch_cm,N,nObject,wO,wP,w);
    Ch=Replacment_Generational_elitism(Ch,Ch_cm,OF,OF_cm);
    i=i+1;
end
figure
Plot_Convergence(ave,best);
fprintf('Maximum price=%f \n',maxP);
fprintf('Items(weight,price): \n');
%fprintf('%d ',Ch(opt,:));
for i=1:nObject
   if (opt(1,i)==1)
       fprintf('%d(%d,%d),',i,wO(1,i),wP(1,i));
   end
end

