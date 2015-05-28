function [ val ] = promedioPonderado(pesos, valores)
%PROMEDIOPONDERADO Calcula el promedio ponderado del par�metro 'valores' 
% al aplicar los 'pesos'
%
%   values - Puntos a promediar, uno por rengl�n
%    pesos - Pesos a aplicar, uno por rengl�n
%
%  Retorna:
%     val  - El promedio ponderado de 'valores'

    % Aplica los pesos a los valores a trav�s del producto punto
    val = pesos' * valores;

    % Divisi�n por la suma de los pesos
    val = val ./ sum(pesos, 1);
    
end

