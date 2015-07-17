% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 10-marzo-2014
% Tarea No.: 01
% Clase: 002
% Clasifica los datos recibidos en base a los parámetros creados en el
% entrenamiento
function [Ypred,err] = classifyBayes(Xtt,Ytt,mu_wi,S_wi,P_wi)
    % Total de instancias a clasificar
    totalInstances = size(Xtt,2);
    totalDimensions = size(Xtt,1);
    % Total de clases reconocidas durante el entrenamiento
    totalClases = size(P_wi,2);
    
    % Inicialización de variables
    map = zeros(totalClases,totalInstances);
    Ypred = zeros(1,totalInstances);
    sigma_error = 0;
    
    % Por cada instancia a clasificar
    for instanceIndex = 1:totalInstances
        currentInstance = Xtt(:,instanceIndex);
        % Calcular la probabilidad de que pertenezca a cada clase
        for currentClass = 1:totalClases
            % map=pdf*p_wi, por lo que hay que realizar el cálculo de pdf
            % Se ha dividido por legibilidad y evitar errores
            
%             frac = 1/(power(2*pi,totalDimensions/2) * sqrt( det(S_wi(:,:,currentClass))) );
%             % Diferencia entre la instancia actual y la matriz de medias de
%             % la clase actual
%             diff = (currentInstance - mu_wi(:,currentClass));
%             
%             exponent = (-1/2) * diff';
%             exponent = exponent * pinv (S_wi(:,:,currentClass));
%             exponent = exponent * diff;
%             exponent = exp(exponent);
            diff = (currentInstance - mu_wi(:,currentClass));
            
            pdf = (1/(power(2*pi,totalDimensions/2) * sqrt( det(S_wi(:,:,currentClass))))) ...
                * exp( -0.5 * diff' * pinv (S_wi(:,:,currentClass)) * diff );
            
            % Calcular y almacenar la probabilidad de la instancia para
            % esta clase
            map(currentClass, instanceIndex) =  pdf * P_wi(1,currentClass);
        end

        % Una vez calculadas las probabilidades, simplemente elegir la
        % mayor...
        [~,predicted] = max(map(:,instanceIndex));
        % ...colocarla en Ypred... 
        Ypred(instanceIndex) = predicted;
        %...y actualizar la cantidad de errores en case de discrepancia
        sigma_error = sigma_error + (predicted ~= Ytt(instanceIndex));
    end

    % Calcular el porcentaje de error para este conjunto de prueba
    err = (sigma_error * 100)/ totalInstances;
end