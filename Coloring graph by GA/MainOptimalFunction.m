clc;
clear all
close all
format compact

V=5;
nColor=V;
Pc=0.9; %Crossover
Pm=0.6; %Mutation
Generation_num=1000;
N=2; % Number of chromosom
LengthCh=V; %Length of chromosom


Best=10000;
%% 
%Make graph
%G=RandGraph(V);
%G=CycleGraph(V);
G=FullGraph(V);

%%
%Initial Population
Ch=Initial_Population(N,V,nColor);
i=1;
while( i<=Generation_num )
    %***** Objective Function *****
    OF=Objective_Function(G,Ch,N,V);
    %***** Fitness Function *****
    FF=Fitness_Function(OF);
    %***** Convergence Plot
    ave(i)=sum(FF)/N;
    best(i)=min(FF);
    opt=find(OF==min(OF),1);
    fprintf('Iteration=%d  FF=%f   OF=%f \n',i,best(i),min(OF));    
    %***** FPS selection
    Select_Parent=Selection_FPS(FF,N);
    %***** Crossover *****
    Ch_cm=Crossover_OneOpint(Ch,Select_Parent,N,LengthCh,Pc);
    %***** Mutation *****
    Ch_cm=Mutation_Swap(Ch_cm,N,LengthCh,Pm);
    
    %***** Replacment ****
    OF_cm=Objective_Function(G,Ch_cm,N,V);
    Ch=Replacment_Generational_elitism(Ch,Ch_cm,OF,OF_cm);
    i=i+1;
end
Plot_Graph(G,V);
figure
Plot_Convergence(ave,best);
fprintf('%d ',Ch(opt,:));

