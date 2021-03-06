
%BASIC GA THEORY
%=====================================
clear;
%Function desription
p = 0:0.01:10;
q = fitfunc(p);
%-------------------------------------
%Problem : maximize function using GA
%-------------------------------------
xmin = 0; xmax = 10; popnum = 50; cnt = 1; SSE = 100;
%Initial process
x = randgen(popnum, xmin, xmax);
y = fitfunc(x);
xinit = x;
yinit = y;
plot(p, q, 'b-', x, y, 'ro');
disp('Press any key to continue...')
pause;

while SSE > 1e-6 && cnt < 1000,
    %Selection process =======================
    xrep = selproc(x, y);
    %Crossover process =======================
    xnrep = convdec2uint16(xrep, xmin, xmax);
    xncross = crossproc(xnrep);
    xcross = convuint162dec(xncross, xmin, xmax);
    ycross = fitfunc(xcross);
    %Mutation process ========================
    xnmut = mutproc(xncross, ycross);
    xmut = convuint162dec(xnmut, xmin, xmax);
    ymut = fitfunc(xmut);
    %Termination criteria --------------------
    SSE = sum((ymut-y).^2);
    cnt = cnt + 1;
    %Updating population ---------------------
    x = xmut; y = ymut;
    %Display result --------------------------
    plot(p, q, 'b-', x, y, 'ro');
    disp(cnt); pause(1);
end
xlast = sum(x) / popnum;
disp(SSE); disp(xlast);
disp('end of program');
    
    