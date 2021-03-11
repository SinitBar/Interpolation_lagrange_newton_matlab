function l_n = poly_newton_with_const_step(x, f, step) % вычисляет коэффициенты полинома Ньютона при постоянном шаге step
l_n = f(1);
mnoj = 1;
for i = 1:(length(x)-1)
    mnoj = conv(mnoj, [1/step, -i+1]); % (x-x0)(x-x1)...
    l_n = [0, l_n] + mnoj.*(end_raznost(x, f, i, 1)/factorial(i));
end
end