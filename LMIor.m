function [Ko]=LMIor(m,n,N)
P=sdpvar(n,n);
L=sdpvar(m,n);
alp=sdpvar(1,1);

LMI=[P zeros(n,2*n+m);
     zeros(n,n) -P -L' zeros(n,n);
     zeros(m,n) -L zeros(m,m) L;
     zeros(n,2*n) L' P]-alp*[N zeros(2*n+m,n);zeros(n,3*n+m)];

F=[LMI>=0,alp>=0,P>=0.000001*eye(n)];

optimize(F)

P1=value(P);
L1=value(L);

Ko=L1*P1^(-1);