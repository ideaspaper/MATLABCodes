function y = convdec2uint16(x, xmin, xmax)
y = uint16(normproc(x, xmin, xmax , 0, 65535));