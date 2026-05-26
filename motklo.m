clc
clear all
%Set T
T=30;
%Set input level
Un=5;

 
for i=1:31
    sig=0+0.001*(i-1);
    N=0;
    lambdaD = zeros(1, 1000);
    while N<1000
        [lambdaKs]=sollambdas(sig,Un,T);
        N = N + 1;
        lambdaD(N) = lambdaKs;  
    end
    lambdaDA(i) = mean(lambdaD);
    lambdaDstd(i) = std(lambdaD);
    sigg(i)=sig;
end
lambdaDAP = lambdaDA + lambdaDstd;
lambdaDAM = lambdaDA - lambdaDstd;

save("motklodataT30N1000U10sigto03","lambdaDAM","lambdaDAP","lambdaDA","lambdaDstd","lambdaD","sigg")

