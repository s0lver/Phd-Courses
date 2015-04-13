%%=========================================================
%%  Clasificador Euclidiano
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 17-marzo-2014
% Tarea No.: 02
% Clase: 005
% Clasificador euclidiano
%%=========================================================
function [Ypred,err] = classifyEuclidean(Xtt,Ytt,mu_wi)
% Total de instancias a clasificar
totalInstances = size(Xtt,2);

% Total de clases reconocidas durante el entrenamiento
totalClases = size(mu_wi,2);

% Inicialización de variables
estimations = zeros(totalClases,totalInstances);
Ypred = zeros(1,totalInstances);
sigma_error = 0;

% Por cada instancia a clasificar
for instanceIndex = 1:totalInstances
    currentInstance = Xtt(:,instanceIndex);
    
    % Calcular la probabilidad de que pertenezca a cada clase
    for currentClass = 1:totalClases
        % Cálculo de la distancia euclideana entre la instancia y la matriz
        % de medias de la clase actual
        distance = sqrt(sum((currentInstance-mu_wi(:,currentClass)).^2));
        
        % Almacenamiento de la probabilidad para decidir posteriormente
        estimations(currentClass, instanceIndex) =  distance;
    end
    
    % Una vez calculadas las probabilidades, elegir la de menor
    % distancia...
    [~,predicted] = min(estimations(:,instanceIndex));
    % ...colocarla en Ypred...
    Ypred(instanceIndex) = predicted;
    %...y actualizar la cantidad de errores en caso de discrepancia
    sigma_error = sigma_error + (predicted ~= Ytt(instanceIndex));
end

% Calcular el porcentaje de error para este conjunto de prueba
err = (sigma_error * 100)/ totalInstances;
end
