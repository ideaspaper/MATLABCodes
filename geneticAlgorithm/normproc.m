function y = normproc(x, xmin, xmax, ymin, ymax)
y = (x - xmin) * (ymax - ymin) / (xmax - xmin) + ymin;