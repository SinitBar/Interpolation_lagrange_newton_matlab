function y_array = lagrange(x, y, x_array)
%clc; % очистка экрана вывода
% x - массив иксов, на котором рассматриваем данную функцию (узлы)
% у - массив у-значений на данных х (значения узлов)
% х_array - иксы точек для построения полинома 
% y_array - значения для построения полинома
count_nodes = length(x); % количество узлов
count_points = length(x_array); % количество точек, для которых нужно вернуть значение
y_array = zeros(1,count_points);
% полинома лагранжа
for number = 1:count_points
    for i = 1:count_nodes
        slagaemoe = y(i);
        for j = 1:count_nodes
            if (i ~= j)
                slagaemoe = slagaemoe * (x_array(number) - x(j)) / (x(i) - x(j));
            end
        end
        y_array(number) = y_array(number) + slagaemoe;
        % считаем значение полинома лагранжа для точки с номером number
    end
end
end

