% === Odor Identification - Perceptron Case Study
% -----------------------------------------------
clear; clc;
% --- INPUT AND TARGET OF LEARNING SET
p1=[0.8;0.7;0.1]; p2=[0.85;0.75;0.05]; p3=[0.9;0.8;0.15]; 
p4=[0.2;0.9;0.4]; p5=[0.1;0.8;0.5]; p6=[0.25;0.8;0.4];
p7=[0.15;0.4;0.8]; p8=[0.1;0.45;0.85]; p9=[0.15;0.5;0.9];
p10=[0.1;0.05;0.05]; p11=[0.05;0.02;0]; p12=[0;0;0];
t1=[0;0]; t2=[0;0]; t3=[0;0];
t4=[0;1]; t5=[0;1]; t6=[0;1];
t7=[1;0]; t8=[1;0]; t9=[1;0];
t10=[1;1]; t11=[1;1]; t12=[1;1];
% --- BATCH OF INPUT AND TARGET
p=[p1 p2 p3 p4 p5 p6 p7 p8 p9 p10 p11 p12];
t=[t1 t2 t3 t4 t5 t6 t7 t8 t9 t10 t11 t12];
% -- WEIGHT AND BIAS INITIALIZATION
[rowp,colp]=size(p);
[rowt,~]=size(t);
ni=rowp;                % NUMBER OF INPUT
nt=rowt;                % NUMBER OF TARGET
nls=colp;               % NUMBER OF LEARNING SET
w=2*rand(nt,ni)-1;      % WEIGHT
b=2*rand(nt,1)-1;       % BIAS
o=ones(1,nls);          % MATRIX FILLED WITH 1
% --- LEARNING PROCESS
epoch = 0; J = 1;
while J>0 && epoch<2000
    epoch = epoch + 1; disp (epoch);
    n=w*p+b*o;
    a=hardlim(n);
    e=t-a;
    J=sse(e);
    w=w+e*p';           % WEIGHT UPDATE
    b=b+e*o';           % BIAS UPDATE
end
disp('end of learning');
disp(epoch);
disp(J);
disp(w);
disp(b);
