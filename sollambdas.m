function [lambdaKs]=sollambdas(sig,Un,T)
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

%T=30;
%sig=0.005;

% Generate initial state
 X(:,1)=random('uniform',-1,1,n,1);
% Generate input secquence
 U=random('uniform',-1,1,m,T);
 U=Un*U/norm(U);
% Generate noise secquence
 W=random('uniform',-1,1,n,T);
 W=sig*W/norm(W);

% Generate data matrices
 for t=1:T
   X(:,t+1)=A*X(:,t)+B*U(:,t)+W(:,t);
 end
 
Xp=X(:,2:end);
Xm=X(:,1:end-1);

Phi=blkdiag((sig^2)*eye(n),-eye(T));

D=[eye(n)      Xp
     zeros(n,n) -Xm
     zeros(m,n) -U];

N=D*Phi*D';


%Computing lambda(K) by solving the SDP provided in Remark 16
[lambdaKs]=lambdas(m,n,N);



