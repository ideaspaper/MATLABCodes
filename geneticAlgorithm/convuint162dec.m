function y = convuint162dec(x, ymin, ymax)
x = double(x)
y = normproc(x, 0 , 65535, ymin, ymax);