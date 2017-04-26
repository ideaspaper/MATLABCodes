function y = fitfunc(x)
y=-exp(-0.16 * x) .* sin(0.5 * pi * x);
%y=-y;%set for min searching