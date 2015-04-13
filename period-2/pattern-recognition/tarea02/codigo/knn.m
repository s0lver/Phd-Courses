%%=========================================================
%%  Clasificador k-nn
% Materia: Reconocimiento de patrones
% Nombre: Rafael P�rez Torres
% Fecha: 17-marzo-2014
% Tarea No.: 02
% Clase: 005
% Ejecuta knn, con los valores especificados
%%=========================================================
function [Ypred, err] =  knn (k, Xtr, Ytr, Xtt, Ytt)
% Identificaci�n de los par�metros de la ejecuci�n
[~, totalTestInstances] = size(Xtt);
[~, totalTrainingInstances] = size(Xtr);

% Inicializaci�n de variables auxiliares
Ypred = zeros(1,totalTestInstances);
sigma_error = 0;

% Por cada uno de los puntos de prueba
for index_x_i = 1:totalTestInstances
    x_i = Xtt(:,index_x_i);
    
    % Calcular la distancia hacia cada uno de los otros puntos, repitiendo
    % la instancia para realizar el c�lculo de forma matricial
    repeated_x_i = repmat(x_i,1,totalTrainingInstances);
    distances = euclidean(repeated_x_i', Xtr');
    
    % Ordenar por orden de cercan�a
    [~, indexes] = sort(distances,'ascend');
    
    % Seleccionar los k vecinos m�s cercanos
    selected_knn = indexes(1:k);
    
    % Obtener las clases de los vecinos m�s cercanos
    c_knn = Ytr(:,selected_knn);
    
    % Obtener y asignar la clase con mayor frecuencia en los k vecinos m�s
    % cercanos
    predicted = mode(c_knn);
    Ypred(index_x_i) = predicted;
    
    % Actualizar contador de errores en caso de ser necesario
    sigma_error = sigma_error + (predicted ~= Ytt(index_x_i));
end

% Calcular el porcentaje de error para este conjunto de prueba
err = (sigma_error * 100)/ totalTrainingInstances;
end

function d = euclidean(a, b)
% Funci�n optimizada para calcular las diferencias entre cada par de
% elementos de la matriz a y la matriz b
diff = a-b;
d = sqrt( sum(diff .* diff,2));
end