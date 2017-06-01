function [x] = denormf(nx,xmin,xmax)
x=0.5*(nx+1)*(xmax-xmin)+xmin;