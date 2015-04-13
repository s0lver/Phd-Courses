% Materia: Reconocimiento de patrones
% Nombre: Rafael P�rez Torres
% Fecha: 17-marzo-2014
% Tarea No.: 02
% Clase: 005
% Realiza el entrenamiento del clasificador Naive Bayes.
function [mu_wi,var_wi,P_wi] = trainNaiveBayes(Xtr,Ytr)
totalClasses = size(unique(Ytr),2);

% Identificaci�n de las dimensiones del dataset
[totalDimensions,total_instances] = size(Xtr);

% Inicializaci�n de matrices con dimensiones adecuadas.
mu_wi = zeros(totalDimensions,totalClasses);
var_wi = zeros(totalDimensions,totalClasses);
P_wi = zeros(1,totalClasses);

% Correcci�n para evitar valores con 0 que nulifiquen a las probabilidades.
% Recordar que en la clasificaci�n, Naive Bayes es pr�cticamente reducido a
% una multiplicatoria, por lo que cualquier valor de 0 nulifica el valor
% final.
laplace_correction = 0.01;

% Por cada clase �nica...
for currentClass = 1:totalClasses
    % ... Obtener sus instancias ...
    classInstances = Xtr(:,Ytr==currentClass);
    
    % Calcular la probabilidad de la clase (es constante debido a
    % crossvalind)
    P_wi(currentClass) = size(classInstances,2)/total_instances;
    for currentDim = 1:totalDimensions
        % ... calcular la media de cada dimensi�n para la clase
        mu_wi(currentDim, currentClass) = ...
            mean(classInstances(currentDim,:)) + laplace_correction;
        % ... calcular la varianza de cada dimensi�n para la clase
        var_wi(currentDim, currentClass) = ...
            var(classInstances(currentDim,:)) + laplace_correction;
    end
end
end