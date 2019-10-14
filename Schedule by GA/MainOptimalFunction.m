clc;
clear all
close all
format compact

Pc=0.7; %Crossover
Pm=0.4; %Mutation
Generation_num=100;
N=2; % Number of chromosom
%LengthCh=0; %Length of chromosom
vBest=inf;

%%
[nP,prs]=inputProcess();
LengthCh=nP;
%%
%Initial Population
Ch=Initial_Population(N,1,nP,LengthCh,prs);
i=1;
while(i<=Generation_num)
        %***** Objective Function *****
        OF=Objective_Function(Ch,N,LengthCh);
        %***** Fitness Function *****
        FF=Fitness_Function(OF);
        %***** Convergence Plot
        ave(i)=sum(FF)/N;
        best(i)=max(FF);
       % opt=find(FF==max(FF),1);
        opt=find(FF==max(FF),1);
        fprintf('Iteration=%d  FF=%f  OF=%f  Number of chromosom=%d \n',i,best(i),OF(opt),opt);
        if (vBest>=OF(opt))
           vBest=OF(opt);
           mBest=Ch(opt,:);
           wt=zeros(1,LengthCh+1);
           for k=2:LengthCh+1
               wt(1,k)=mBest(1,k-1)+wt(1,k-1); 
           end
        end
        %***** FPS selection
        Select_Parent=Selection_FPS(FF,N);
        %***** Crossover *****
        %Ch_cm=Crossover_OneOpint(Ch,Select_Parent,N,LengthCh,Pc);
        Ch_cm=pmx_Crossover(Ch,Select_Parent,N,LengthCh,Pc);
        %***** Mutation *****
        Ch_cm=Mutation_Swap(Ch_cm,N,LengthCh,Pm);
        %***** Replacment ****
        OF_cm=Objective_Function(Ch_cm,N,LengthCh);
        Ch=Replacment_Generational_elitism(Ch,Ch_cm,OF,OF_cm);
        i=i+1;
end

figure
Plot_Convergence(ave,best);
fprintf('\n Best order process(Fcfs algorithm)=  ');
fprintf('%d ',mBest);
fprintf('\n Waiting time=  ');
fprintf('%d+',wt); 
fprintf('=%d',vBest);