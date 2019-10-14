clc;
clear all
close all
format compact


Pc=0.8; %Crossover
Pm=0.1; %Mutation
%% 
%% 
%% 
Generation_num=1000;
N=4; % Number of chromosom
LengthCh=8; %Length of chromosom
load('f.mat')
x=1:256;
plot(x,f,'LineWidth',2);

%%
%Initial Population
Ch=Initial_Population(N,0,255);

%***** Objective Function *****
OF=zeros(N,1);
OF=Objective_Function(Ch,N,f);

i=1;
while( i<=Generation_num )
    %***** Fitness Function *****
    FF=Fitness_Function(OF);
    %***** Convergence Plot
    ave(i)=sum(FF)/N;
    best(i)=max(FF);
    xopt=find(FF==max(FF),1);
    fprintf('Iteration=%d  FF=%f   near optimal x=%d \n',i,best(i),bin2dec(Ch(xopt,:)))
    
    
    %***** FPS selection
    Select_Parent=Selection_FPS(FF,N);
    %***** Crossover *****
    Ch_cm=Crossover_OneOpint(Ch,Select_Parent,N,LengthCh,Pc);
    
    %***** Mutation *****
    Ch_cm=Mutation_Swap(Ch_cm,N,LengthCh,Pm);
    
    %***** Replacment ****
    OF_cm=Objective_Function(Ch_cm,N,f);
    Ch=Replacment_Generational_elitism(Ch,Ch_cm,OF,OF_cm);
    OF=Objective_Function(Ch,N,f);
    
    i=i+1;
end

figure
Plot_Convergence(ave,best);
