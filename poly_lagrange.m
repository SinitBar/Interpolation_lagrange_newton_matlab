function interpolation_polinom = poly_lagrange(nodes, f)
%nodes - узлы инетрполяции
%f - значения в узлах
count_nodes = length(nodes); % количество узлов интерполяции
interpolation_polinom = zeros(1, count_nodes); % интерполяционный многочлен Лагранжа
%2 точки дадут прямую, у многочлена для прямой 2 коэффицента, один
%свободный, другой - при иксе
for i = 1:count_nodes
    denominator = 1; % знаменатель - число
    numerator = ones(1, 1); % числитель - полином
    for j = 1:count_nodes
        if (i~=j)
            denominator = denominator*(nodes(i) - nodes(j));
            numerator = conv(numerator, [1, -nodes(j)]); %домножаем на скобку вида (x-nodes(j))
        end
    end
    numerator = numerator.*(f(i)/denominator);
    interpolation_polinom = interpolation_polinom + numerator;
end
%interpolation_polinom = interpolation_polinom(end:-1:1); % переворачиваем
%массив, потому что он хранится в виде от больших степеней к меньшим,
% а нам надо наоборот 
% если последние две строчки закомментированы, то массив возвращает
% коэффиценты от большей степени икс к меньшей, аналогичная строчка в
% draw_all тоже должна быть закомментирована