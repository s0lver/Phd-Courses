% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 17-marzo-2014
% Tarea No.: 02
% Clase: 005
% Realiza el entrenamiento del clasificador Naive Bayes.
function [mu_wi,var_wi,P_wi] = trainNaiveBayes(Xtr,Ytr)
totalClasses = size(unique(Ytr),2);

% Identificación de las dimensiones del dataset
[totalDimensions,total_instances] = size(Xtr);

% Inicialización de matrices con dimensiones adecuadas.
mu_wi = zeros(totalDimensions,totalClasses);
var_wi = zeros(totalDimensions,totalClasses);
P_wi = zeros(1,totalClasses);

% Corrección para evitar valores con 0 que nulifiquen a las probabilidades.
% Recordar que en la clasificación, Naive Bayes es prácticamente reducido a
% una multiplicatoria, por lo que cualquier valor de 0 nulifica el valor
% final.
laplace_correction = 0.01;

% Por cada clase única...
for currentClass = 1:totalClasses
    % ... Obtener sus instancias ...
    classInstances = Xtr(:,Ytr==currentClass);
    
    % Calcular la probabilidad de la clase (es constante debido a
    % crossvalind)
    P_wi(currentClass) = size(classInstances,2)/total_instances;
    for currentDim = 1:totalDimensions
        % ... calcular la media de cada dimensión para la clase
        mu_wi(currentDim, currentClass) = ...
            mean(classInstances(currentDim,:)) + laplace_correction;
        % ... calcular la varianza de cada dimensión para la clase
        var_wi(currentDim, currentClass) = ...
            var(classInstances(currentDim,:)) + laplace_correction;
    end
end
end