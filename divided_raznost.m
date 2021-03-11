function div_razn = divided_raznost(x, f)
% x = x0 x1 ...
% f = f0 f1 ...
if (length(x) == 1)
    div_razn = f(1); % разделенная разность нулевого порядка = значению функции
else
    y = x;
    y(1) = []; 
    f_y = f;
    f_y(1) = [];
    z = x;
    z(length(x)) = [];
    f_z = f;
    f_z(length(x)) = [];
    div_razn = (divided_raznost(y, f_y) - divided_raznost(z, f_z))/(x(length(x)) - x(1)); % для других порядков работает рекурсивная формула
end
end