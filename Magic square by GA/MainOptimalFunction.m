clc;
clear all
close all
format compact

mn= 3;  %Matrix degree
Summing=24; %Sum row and col
Pc=0.5; %Crossover
Pm=0.8; %Mutation
%Generation_num=2000;
N=4; % Number of chromosom
LengthCh=mn*mn; %Length of chromosom

%%
%Initial Population
Ch=Initial_Population(N,1,15,LengthCh);
i=1;
while(1)
        %***** Objective Function *****
        OF=Objective_Function(Ch,N,Summing,LengthCh);
        %***** Fitness Function *****
        FF=Fitness_Function(OF);
        %***** Convergence Plot
        ave(i)=sum(FF)/N;
        best(i)=max(FF);
       % opt=find(FF==max(FF),1);
        opt=find(FF==max(FF));
        fprintf('Iteration=%d  FF=%f  OF=%f  Number of chromosom=%d \n',i,best(i),OF(opt),opt);
        if(best(i) == 1)
            break;
        end
        %***** FPS selection
        Select_Parent=Selection_FPS(FF,N);
        %***** Crossover *****
        Ch_cm=Crossover_OneOpint(Ch,Select_Parent,N,LengthCh,Pc);
        %***** Mutation *****
        Ch_cm=Mutation_Swap(Ch_cm,N,LengthCh,Pm);
        %***** Replacment ****
        OF_cm=Objective_Function(Ch_cm,N,Summing,LengthCh);
        Ch=Replacment_Generational_elitism(Ch,Ch_cm,OF,OF_cm);
        i=i+1;
end

figure
Plot_Convergence(ave,best);
fprintf('Answer=  ');
fprintf('%d ',Ch(opt,:));
