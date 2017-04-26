function xsel = selproc(x, y)
[r, ~] = size(x);
ymin = min(y);
ymax = max(y);
yy = normproc(y, ymin, ymax, 0, 1);
%Running total
RunTot = zeros(r, 1);
for i=1:r,
    tmp = 0;
    for j=1:i,
        tmp = tmp + yy(j, 1);
    end
    RunTot(i, 1) = tmp;
end
RunTotMax = max(RunTot);
%Roullete wheel selection
xsel = zeros(r, 1);
RltRnd = randgen(r, 0, RunTotMax);
for i=1:r,
    for j=1:r,
        if RltRnd(i, 1) < RunTot(j, 1),
            xsel(i, 1) = x(j, 1);
            break,
        end
    end
end 