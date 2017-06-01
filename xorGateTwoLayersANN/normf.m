function [nx] = normf(x, xmin,xmax)
% NORMF - normalization function
nx = 2*(x-xmin)./(xmax-xmin) -1;