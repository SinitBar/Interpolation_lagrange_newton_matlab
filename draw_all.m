function draw_all(left_board, step, right_board, random_point)
x = left_board:step:right_board; % выбрали промежуток интерполирования от левой до правой границы, выбрали шаг
f = (cos(x)).^2 + x - 1;
polinom_lagrange = poly_lagrange(x, f) % нашли полином Лагранжа
polinom_newton = poly_newton(x, f) % нашли полином Ньютона
polinom_newton_with_const_step = poly_newton_with_const_step(x, f, step) % нашли полином Ньтона с константным шагом
h = 0:0.001:10;
f_l = polyval(polinom_lagrange, h); % нашли массив значений полинома Лагранжа в узлах
f_n = polyval(polinom_newton, h);% нашли массив значений полинома Ньютона в узлах
f_n_const = polyval(polinom_newton_with_const_step, h); % нашли массив значений полинома Ньютона с константным шагом в узлах
ezplot('(cos(x))^2 + x - 1', [0 10]) % рисует реальную функцию, синяя линия
hold on; % остаемся на том же графике
r_n_in_point = pogreshnost(random_point, x) % выводит теоретическую погрешность
real_pogreshnost_lagrange = abs(((cos(random_point))^2 + random_point - 1) - polyval(polinom_lagrange, random_point)) 
% real_pogreshnost - абсолютное значение разницы между интерполируемой
% функцией и интерполяционным многочленом в выбранной random_point
real_pogreshnost_newton = abs(((cos(random_point))^2 + random_point - 1) - polyval(polinom_newton, random_point)) 
real_pogreshnost_newton_with_const_step = abs(((cos(random_point))^2 + random_point - 1) - polyval(polinom_newton_with_const_step, random_point))
plot(h, f_l, '-k'), grid; % , h, f_l, 'r*' рисует полином лагранжа, черные линии, красные звездочки
hold on;
% plot(h, f_n, '-m'), grid; % , h, f_n, 'g*' рисует полином ньютона, сиренивые линии, зеленые звездочки
hold on;
% plot(h, f_n_const, '-c'), grid; % , h, f_n_const, 'y*' рисует полином ньютона (с постоянным шагом), голубые линии, желтые звездочки
axis tight; % подгоняет границы осей под крайние значения функций
mas_coefs = polyfit(x, f, 11)