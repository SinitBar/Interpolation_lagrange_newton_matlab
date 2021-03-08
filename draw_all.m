function draw_all(left_board, step, right_board, x_points, y_points)
x = left_board:step:right_board;
y = (abs((cos(x)).^2 + x)/tan(pi/4)) - 1;
y_points_lagrange = lagrange(x, y, x_points);
%y_points_newton = newton(x, y, x_points);
ezplot('(abs((cos(x))^2 + x)/tan(pi/4)) - 1', [0 10])
hold on;
plot(x_points,y_points, '-k', x_points, y_points_lagrange, 'b-', x_points, y_points_lagrange, 'b*');
axis tight;
end