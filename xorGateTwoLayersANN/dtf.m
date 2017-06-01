function [dv] = dtf(a,tftype)
%DTF - Derivative of transfer function
if tftype == 0,
  dv = diag (ones(size(a))); %linear transfer function
end
if tftype == 1,
  dv = diag (a .* (1-a)); %logsig transfer function
end
if tftype == 2,
  dv = diag (1 - a .* a); %tansig transfer function
end