function [wO,pO,n]=ObjectInput()
    load('weight.mat');
    wO=weight;
    load('p.mat');
    pO=p;
    n=size(wO,2);
end