clear all;clc;

tic
%The true system in Example 18
A=[1 -0.374 -0.19 -0.321 0.056 -0.026;
    0 0.982 0.01 0 -0.003 0.001;
    0 0.115 0.975 0 -0.269 0.191;
    0 0.001 0.01 1 -0.001 0.001;
    0 0 0 0 0.741 0;
    0 0 0 0 0 0.741];
B=[0.007 0 -0.043 0 0.259 0;
    -0.003 0 0.03 0 0 0.259]';
[n,m]=size(B);

T=500;
sig=0.005;

% Generate initial state
% X(:,1)=normrnd(0,1,n,1);
% Generate input secquence
% U=normrnd(0,1,m,T);
% Generate noise secquence
% W=random('uniform',-sig,sig,n,T)/n;

% Generate data matrices
% for t=1:T
%   X(:,t+1)=A*X(:,t)+B*U(:,t)+W(:,t);
% end
% 
% Xp=X(:,2:end);
% Xm=X(:,1:end-1);
% 
% Phi=blkdiag(T*(sig^2)*eye(n),-eye(T));
% 
% D=[eye(n)      Xp
%      zeros(n,n) -Xm
%      zeros(m,n) -U];
% 
% N=D*Phi*D';
% Computing Ko using the LMI-based method
% [Ko]=LMIor(m,n,N);

%Load the data set used in Example 18 and Ko computed with the the LMI-based method
load data_Example_18_Ko.mat

%Computing lambda(K) by solving the SDP provided in Remark 16
[lambdaKo]=lambdaK(m,n,N,Ko);

%Computing lambda by solving the SDP provided Theorem 15
[lambdaKs,Ks]=lambda(m,n,N);


