function draw_all(left_board, step, right_board, random_point)
x = left_board:step:right_board; % выбрали промежуток интерполирования от левой до правой границы, выбрали шаг
f = (cos(x)).^2 + x - 1;
polinom_lagrange = poly_lagrange(x, f) % нашли полином Лагранжа
polinom_newton = poly_newton(x, f) % нашли полином Ньютона
polinom_newton_with_const_step = poly_newton_with_const_step(x, f, step) % нашли полином Ньтона с константным шагом
f_l = polyval(polinom_lagrange, x); % нашли массив значений полинома Лагранжа в узлах
f_n = polyval(polinom_newton, x);% нашли массив значений полинома Ньютона в узлах
f_n_const = polyval(polinom_newton_with_const_step, x); % нашли массив значений полинома Ньютона с константным шагом в узлах
ezplot('(cos(x))^2 + x - 1', [0 10]) % рисует реальную функцию, синяя линия
hold on; % остаемся на том же графике
r_n_in_point = pogreshnost(random_point, x) % выводит теоретическую погрешность
real_pogreshnost_lagrange = abs(((cos(random_point))^2 + random_point - 1) - polyval(polinom_lagrange, random_point)) 
% real_pogreshnost - абсолютное значение разницы между интерполируемой
% функцией и интерполяционным многочленом в выбранной random_point
real_pogreshnost_newton = abs(((cos(random_point))^2 + random_point - 1) - polyval(polinom_newton, random_point)) 
real_pogreshnost_newton_with_const_step = abs(((cos(random_point))^2 + random_point - 1) - polyval(polinom_newton_with_const_step, random_point))
plot(x, f_l, '-k', x, f_l, 'r*'), grid; % рисует полином лагранжа, черные линии, красные звездочки
hold on;
plot(x, f_n, '-m', x, f_n, 'g*'), grid; % рисует полином ньютона, сиренивые линии, зеленые звездочки
hold on;
plot(x, f_n_const, '-c', x, f_n_const, 'y*'), grid; % рисует полином ньютона (с постоянным шагом), голубые линии, желтые звездочки
axis tight; % подгоняет границы осей под крайние значения функций