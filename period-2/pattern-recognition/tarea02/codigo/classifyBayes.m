%%=========================================================
%%  Clasificador Bayesiano
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 10-marzo-2014
% Tarea No.: 02
% Clase: 005
% Clasifica los datos recibidos en base a los parámetros creados en el
% entrenamiento
%%=========================================================
function [Ypred,err] = classifyBayes(Xtt,Ytt,mu_wi,S_wi,P_wi)
% Total de instancias a clasificar
totalInstances = size(Xtt,2);
totalDimensions = size(Xtt,1);
% Total de clases reconocidas durante el entrenamiento
totalClasses = size(P_wi,2);

% Inicialización de variables
map = zeros(totalClasses,totalInstances);
Ypred = zeros(1,totalInstances);
sigma_error = 0;

% Calcular las inversas y determinantes por separado para economizar tiempo
pinv_matrix = zeros(totalDimensions,totalDimensions,totalClasses);
det_matrix = zeros(1,totalClasses);
for i = 1:totalClasses
    pinv_matrix(:,:,i) = pinv (S_wi(:,:,i));
    det_matrix(i) = det(S_wi(:,:,i));
end

% Por cada instancia a clasificar
for instanceIndex = 1:totalInstances
    currentInstance = Xtt(:,instanceIndex);
    % Calcular la probabilidad de que pertenezca a cada clase
    for currentClass = 1:totalClasses
        % Calcular la pdf para realizar el cálculo de map
        diff = (currentInstance - mu_wi(:,currentClass));
        
        pdf = (1/(power(2*pi,totalDimensions/2) * sqrt( det_matrix(currentClass) ))) ...
                * exp( -0.5 * diff' * pinv_matrix(:,:,currentClass) * diff );
        
        % Calcular y almacenar la probabilidad de la instancia para
        % esta clase
        map(currentClass, instanceIndex) =  pdf * P_wi(1,currentClass);
    end
    
    % Una vez calculadas las probabilidades, simplemente elegir la
    % mayor...
    [~,predicted] = max(map(:,instanceIndex));
    % ...colocarla en Ypred...
    Ypred(instanceIndex) = predicted;
    %...y actualizar la cantidad de errores en caso de discrepancia
    sigma_error = sigma_error + (predicted ~= Ytt(instanceIndex));
end

% Calcular el porcentaje de error para este conjunto de prueba
err = (sigma_error * 100)/ totalInstances;
end