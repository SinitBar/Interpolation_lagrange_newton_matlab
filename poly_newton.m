function polinom_newton = poly_newton(x, f); % возвращает коэффициенты полинома Ньютона
% x - массив узлов x0 x1 ...
% f - массив значений в них сооветственно
polinom_newton = f(1);
x_array = x(1);
f_array = f(1);
poly_mnoj = 1; % (x-x0)(x-x1)...
for i = 1:(length(x)-1)
    poly_mnoj = conv(poly_mnoj, [1, -x(i)]);
    x_array = [x_array, x(i+1)];
    f_array = [f_array, f(i+1)];
%     newton_polinom = polinom_newton
%     mnojitel = poly_mnoj
    polinom_newton = [0 polinom_newton] + poly_mnoj.*divided_raznost(x_array, f_array);
end
end