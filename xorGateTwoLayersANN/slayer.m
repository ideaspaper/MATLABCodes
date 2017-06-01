function [s1] = slayer(a,w,s,tftype)
% SLAYER - Layer sensitifity
s1 = dtf(a,tftype)*(w')*s;