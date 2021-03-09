function r_n = pogreshnost(point, x) % x - узлы, point - точка
% считаем теор погрешность в точке point
% тут всего 2 варианта: для 5 узлов и для 12
M_5 = 16; % max на [0, 10] для 5 производной
M_12 = 2048; % max на [0, 10] для 12 производной
W = ones(1, 1); % полином омега нный из формулы погрешности
for i = 1:length(x)
    W = conv(W, [-x(i) 1]);
end
if (length(x) == 5)
    r_n = (M_5/factorial(5))*abs(polyval(W, point));
else
    r_n = (M_12/factorial(12))*abs(polyval(W, point));
end


