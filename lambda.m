function [lambdaKs,Ks]=lambda(m,n,N)
Q = sdpvar(n,n);
L = sdpvar(m,n);
beta = sdpvar(1,1);
zeta = sdpvar(1,1);

LMI=[Q zeros(n,3*n+m);
    zeros(n,n) -Q -L' -Q zeros(n,n);
    zeros(m,n) -L -beta*eye(m) zeros(m,n) L;
    zeros(n,n) -Q zeros(n,m) eye(n) Q;
    zeros(n,2*n) L' Q Q]-zeta*[N zeros(2*n+m,2*n);zeros(2*n,4*n+m)];
F=[LMI>=0,Q>=0,zeta>=0,beta>=0];

options=sdpsettings('solver','mosek','verbose',0);
optimize(F,-beta,options)

Ks=value(L)*inv(value(Q));

lambdaKs=sqrt(value(beta));