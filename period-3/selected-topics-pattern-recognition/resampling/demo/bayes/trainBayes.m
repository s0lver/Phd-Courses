% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 10-marzo-2014
% Tarea No.: 01
% Clase: 002
% Entrenamiento del clasificador bayesiano
function [mu_wi,S_wi,P_wi] = trainBayes(Xtr,Ytr)
    % Se identifica la cantidad de clases únicas en el set
    totalClasses = size(unique(Ytr),2);

    % Se identifica la cantidad de dimensiones y la cantidad total de
    % instancias en el set
    [totalDimensions,total_instances] = size(Xtr);

    % Inicialización de matrices con dimensiones adecuadas.
    mu_wi = zeros(totalDimensions,totalClasses);
    S_wi = zeros(totalDimensions,totalDimensions,totalClasses);
    P_wi = zeros(1,totalClasses);

    % Por cada clase única...
    for currentClass = 1:totalClasses
        % ... Obtener sus instancias ...
        classInstances = Xtr(:,Ytr==currentClass); 
        for currentDim = 1:totalDimensions
            % ... calcular la media de cada dimensión para la clase
            mu_wi(currentDim, currentClass) = ...
                mean(classInstances(currentDim,:));
        end
        
        % Generar la matriz de covarianza para la clase
        S_wi(:,:,currentClass) = cov(Xtr(:,Ytr==currentClass)');
        % Calcular la probabilidad de la clase
        P_wi(currentClass) = size(classInstances,2)/total_instances;
    end
end