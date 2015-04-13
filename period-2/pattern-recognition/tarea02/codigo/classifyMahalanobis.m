%%=========================================================
%%  Clasificador Mahalanobis
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 17-marzo-2014
% Tarea No.: 02
% Clase: 005
% Clasificador Mahalanobis
%%=========================================================

function [Ypred,err] = classifyMahalanobis(Xtt, Ytt, mu_wi, S_wi)
% Total de instancias a clasificar
totalInstances = size(Xtt,2);
totalDimensions = size(Xtt,1);
% Total de clases reconocidas durante el entrenamiento
totalClasses = size(mu_wi,2);

% Inicialización de variables
estimations = zeros(totalClasses,totalInstances);
Ypred = zeros(1,totalInstances);
sigma_error = 0;

% Calcular las inversas por separado para economizar tiempo
pinv_matrix = zeros(totalDimensions,totalDimensions,totalClasses);

% Ciclo A: Cálculo de las matrices inversas. Se realiza de forma separada para
% evitar su cálculo permanente en los ciclos anidados.
for i = 1:totalClasses
    pinv_matrix(:,:,i) = pinv (S_wi(:,:,i));
end

% Por cada instancia a clasificar
for instanceIndex = 1:totalInstances
    currentInstance = Xtt(:,instanceIndex);
    
    % Calcular la probabilidad de que pertenezca a cada clase
    for currentClass = 1:totalClasses
        
        difference = (currentInstance - mu_wi(:,currentClass));
        % Cálculo de la distancia Mahalanobis, reutilizando el valor
        % obtenido durante el entrenamiento e invertido en el ciclo A
        distance = difference' * pinv_matrix(:,:,currentClass) * difference;
        
        % Almacenar la probabilidad de pertenencia a esta clase (aka la
        % distancia)
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

%Calcular el porcentaje de error para este conjunto de prueba
err = (sigma_error * 100)/ totalInstances;
end
