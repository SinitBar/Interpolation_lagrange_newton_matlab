function delta = end_raznost(x, f, poryadok, index) % конечная разность порядка poryadok от f(index)
% x = x0 x1 ...
% f = f0 f1 ...
delta = 0;
if (poryadok == 0) % == 1
    delta = f(index);
else
    delta = end_raznost(x, f, poryadok-1, index+1) - end_raznost(x, f, poryadok-1, index);
end
end