function div_raznost = divided_raznost_with_const_step(x, f, step); % разделенная разность с постоянным шагом step
% x = x0 x1 ...
% f = f0 f1 ...
n = length(x)-1;
div_raznost = end_raznost(x, f, n, 1)/(factorial(n)*step^n);
end