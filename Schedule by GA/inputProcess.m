function [nP,prs]=inputProcess()
    load('process.mat');
    prs=process;
    nP=size(prs,2);
end