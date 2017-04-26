function xnmut = mutproc(xn, y)
MutCriteria = 0.01;
RndMut = rand;
xnmut = xn;
if RndMut < MutCriteria,
    [r, ~] = size(y);
    ymin = min(y);
    for i=1:r,
        if y(i, 1) == ymin,
            yminidx = i;
            break
        end
    end
    MutPos = round(randgen(1, 0, 15));
    Maskbit = 2 ^ MutPos;
    Maskbit = uint16(Maskbit);
    xnmut(yminidx, 1) = bitxor(xnmut(yminidx, 1), Maskbit);
end