function draw_all(left_board, step, right_board, x_points, y_points)
x = left_board:step:right_board;
y = (abs((cos(x)).^2 + x)/tan(pi/4)) - 1;
p_lagrange = poly_lagrange(x, y);
y_l = zeros(1,length(x));
for j = 1:length(x)
    for i=1:length(x)
        y_l(j) = y_l(j) + (p_lagrange(i))*((x(j))^i);
    end
end
%y_points_lagrange = lagrange(x, y, x_points);
%y_points_newton = newton(x, y, x_points);
ezplot('(abs((cos(x))^2 + x)/tan(pi/4)) - 1', [0 10])
hold on;
plot(x, y_l, '-k', x, y_l, 'r*');
%plot(x_points,y_points, '-k', x_points, y_points_lagrange, 'b-', x_points, y_points_lagrange, 'b*');
axis tight;
end