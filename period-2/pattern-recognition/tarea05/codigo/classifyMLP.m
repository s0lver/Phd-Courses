function [Yp,err] = classifyMLP(X, Y, Wij, Wjk) 
[~,N] = size(X);      % Dimensiones en la clasificación

X = [ones(1,N); X];
V = Wij * X;
S = 1./ (1 + exp(-V));
G = Wjk * S;

O = 1./ (1 + exp(-G));
Yp = O > 0.5;

E = Y - Yp;
err = mean(E .^ 2);
end