errorPlot = zeros(2000,1);
x = 1:2000;
% --- input and target of learning set
p1 = [0;0]; p2 = [0;5]; p3 = [5;0]; p4 = [5;5];
t1 = [0]; t2 = [5]; t3 = [5]; t4 = [0];
po = [p1 p2 p3 p4];
to = [t1 t2 t3 t4];

%----Weight and bias initialization
[rowp,colp] = size(po);
[rowt, ~] = size(to);
ni = rowp;  %number of input
nt = rowt;  %number of target
nls = colp; %number of learning set
nnum = 5; %jumlah node hidden layer
w1 = 2*rand(nnum, ni) - 1;
b1 = 2*rand(nnum, 1) -1;
w2 = 2*rand(nt, nnum) - 1;
b2 = 2*rand(nt, 1) -1;
o = ones(1, nls);

% --- normalization of input and target
pmin = min(min(po)); pmax = max(max(po));
tmin = min(min(to)); tmax=max(max(to));
p = normf(po, pmin, pmax);
t = normf(to, tmin, tmax);

lr = 0.3;   % --- learning process
momOriginal = 0.2; % --- nilai momentum apabila butuh di reset
theta = 0.05;   % --- tresshold perubahan error
deltaError = 0; % --- perubahan error
increase = 1.1; % decrease factor
decrease = 0.6; % increase factor
dw1 = zeros(nnum, ni);
db1 = zeros(nnum, 1);
dw2 = zeros(nt, nnum);
db2 = zeros(nt, 1);

errtol = 1; errtolmax=1e-6; epoch=0; epochmax=2000;
errtolSebelum = 0;
mom = momOriginal; %nilai momentum awal
while errtol > errtolmax && epoch < epochmax
  epoch = epoch+1; disp(epoch);
  errtol=0;
  for i = 1:nls
    %forward propagation
    a0 = p(:,i);
    a1 = fpnet(a0,w1,b1,1); %logsig transfer function
    a2 = fpnet(a1,w2,b2,0); %linear transfer function
    a = a2;
    % --- backward propagation
    e = t(:,i)-a;
    J = sse(e);
    if J > errtolmax/nls,
      % --- sensitifity calculation
      s2 = sout(a2,t(:,i),0);
      s1 = slayer( a1,w2,s2,1 );
      % --- weight and bias update
      dw2 = mom*dw2 - (1-mom)*lr*s2*a1';
      db2 = mom*db2 - (1-mom)*lr*s2;
      dw1 = mom*dw1 - (1-mom)*lr*s1*a0';
      db1 = mom*db1 - (1-mom)*lr*s1;
      % --- simpan sebelum di update
      temp_w2= w2;
      temp_b2= b2;
      temp_w1= w1;
      temp_b1= b1;
      % --- update weight dan bias
      w2 = w2 + dw2;
      b2 = b2 + db2;
      w1 = w1 + dw1;
      b1 = b1 + db1;
    end
    errtol = errtol+J;
  end
  % --- algoritma perubahan learning rate
  deltaError = errtol-errtolSebelum;
  deltaError = deltaError / errtol;
  errtolSebelum = errtol;
  if deltaError > 0 && deltaError > theta,
      w2 = temp_w2;
      b2 = temp_b2;
      w1 = temp_w1;
      b1 = temp_b1;
      lr = lr*decrease;
      mom=0;
  end
  if deltaError > 0 && deltaError < theta,
      mom=momOriginal;
  end
  if deltaError <= 0,
      lr = lr*increase;
      mom=momOriginal;
  end
  errorPlot(epoch,1)= errtol;
end
disp('DONE!');
disp('Error:'); disp(errtol)
disp('Weight 1:'); disp(w1);
disp('Bias 1:'); disp(b1);
disp('Weight 2:'); disp(w2);
disp('Bias 2:'); disp(b2);
plot(x,errorPlot)

myInput = [0;0];
disp('Input:'); disp(myInput);
myInput = normf(myInput, 0, 5);
myInput2 = fpnet(myInput,w1,b1,1);
myOutput = fpnet(myInput2,w2,b2,2);
myOutput = denormf(myOutput, 0, 5);
disp('Output:'); disp(myOutput)
myInput = [0;5];
disp('Input:'); disp(myInput);
myInput = normf(myInput, 0, 5);
myInput2 = fpnet(myInput,w1,b1,1);
myOutput = fpnet(myInput2,w2,b2,2);
myOutput = denormf(myOutput, 0, 5);
disp('Output:'); disp(myOutput);
myInput = [5;0];
disp('Input:'); disp(myInput);
myInput = normf(myInput, 0, 5);
myInput2 = fpnet(myInput,w1,b1,1);
myOutput = fpnet(myInput2,w2,b2,2);
myOutput = denormf(myOutput, 0, 5);
disp('Output:'); disp(myOutput);
myInput = [5;5];
disp('Input:'); disp(myInput);
myInput = normf(myInput, 0, 5);
myInput2 = fpnet(myInput,w1,b1,1);
myOutput = fpnet(myInput2,w2,b2,2);
myOutput = denormf(myOutput, 0, 5);
disp('Output:'); disp(myOutput);