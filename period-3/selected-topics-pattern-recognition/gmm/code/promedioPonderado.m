function [ val ] = promedioPonderado(pesos, valores)
%PROMEDIOPONDERADO Calcula el promedio ponderado del parámetro 'valores' 
% al aplicar los 'pesos'
%
%   values - Puntos a promediar, uno por renglón
%    pesos - Pesos a aplicar, uno por renglón
%
%  Retorna:
%     val  - El promedio ponderado de 'valores'

    % Aplica los pesos a los valores a través del producto punto
    val = pesos' * valores;

    % División por la suma de los pesos
    val = val ./ sum(pesos, 1);
    
end

