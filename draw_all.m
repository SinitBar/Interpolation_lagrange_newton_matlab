function sin = draw_all(left_board, step, right_board)
x = left_board:step:right_board;
y = (abs((cos(x)).^2 + x)/tan(pi/4)) - 1;
p_lagrange = poly_lagrange(x, y);
y_l = zeros(1,length(x));
for i = 1:length(x)
    y_l = polyval(p_lagrange, x(i));
end
ezplot('(abs((cos(x))^2 + x)/tan(pi/4)) - 1', [0 10])
hold on;
sin = pogreshnost(2.16, x); % 2.16 - случайная точка
%plot(x, y_l, '-k', x, y_l, 'r*'), grid;
axis tight;
end