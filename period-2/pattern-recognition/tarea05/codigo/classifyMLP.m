%%=========================================================
%%  classifyMLP
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 14-abril-2015 
% Tarea No.: 05
% Clase: 011 
% Realiza la clasificación en una RNA, simulando un feed forward que
% proporciona como entrada los datos a clasificar. Como salida se obtienen
% las etiquetas que el clasificador asigna a los datos de entrada.
%%=========================================================
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