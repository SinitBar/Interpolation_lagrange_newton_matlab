function draw_all(left_board, step, right_board, random_point)
x = left_board:step:right_board;
y = (cos(x)).^2 + x - 1;
%y = x.^2 + 2*x + 1;
polinom_lagrange = poly_lagrange(x, y)
%p_lagrange = p_lagrange(end:-1:1); % развернули массив, чтобы polyval сработал правильно
y_l = polyval(polinom_lagrange, x);
ezplot('(cos(x))^2 + x - 1', [0 10])
hold on;
pogreshnost_r_n = pogreshnost(random_point, x) % 2.16 - случайная точка
plot(x, y_l, '-k', x, y_l, 'r*'), grid;
axis tight;