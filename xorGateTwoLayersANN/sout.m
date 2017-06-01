function [so] = sout(a,t,tftype)
% SOUT - Output sensitifity
so = -2*dtf(a,tftype)*(t-a);