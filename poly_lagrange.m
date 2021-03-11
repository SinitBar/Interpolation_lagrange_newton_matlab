function interpolation_polinom = poly_lagrange(x, f) % возвращает коэффициенты полинома Лагранжа
%x - узлы инетрполяции
%f - значения в узлах
count_nodes = length(x); % количество узлов интерполяции
interpolation_polinom = zeros(1, count_nodes); % интерполяционный многочлен Лагранжа
%2 точки дадут прямую, у многочлена для прямой 2 коэффицента, один
%свободный, другой - при иксе
for i = 1:count_nodes
    denominator = 1; % знаменатель - число
    numerator = ones(1, 1); % числитель - полином
    for j = 1:count_nodes
        if (i~=j)
            denominator = denominator*(x(i) - x(j));
            numerator = conv(numerator, [1, -x(j)]); %домножаем на скобку вида (x-nodes(j))
        end
    end
    numerator = numerator.*(f(i)/denominator);
    interpolation_polinom = interpolation_polinom + numerator;
end
end