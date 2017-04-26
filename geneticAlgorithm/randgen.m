function r = randgen(popnum, vmin, vmax)
r = rand(popnum, 1) .* (vmax - vmin) + vmin;