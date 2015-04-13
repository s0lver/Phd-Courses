%%=========================================================
%%  classifyLDAmulti
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 7-abril-2015 
% Tarea No.: 04 
% Clase: 009 
% Realiza la clasificación mediante LDA, devolviendo las etiquetas
% asignadas y el porcentaje de errores
%%=========================================================
function [ Yp, err ] = classifyLDAmulti( Xtt, Ytt, Wi, W0i )
gamma = unique(Ytt);        % Clases en set de test
c = max(gamma);             % Cantidad de clases distintas

Pw_t = zeros(1,c);          % (auxiliar) Probabilidad de cada clase
t_instances = size(Xtt,2);  % Total de instancias a clasificar

Yp = zeros(1,t_instances);  % Etiquetas asignadas a cada instancia
sigma_error = 0;            % Acumulador de errores

for i=1:t_instances         % Por cada instancia ...
    for j=1:c               % ... calcular su pertenencia a cada clase j
        Pw_t(:,j) = Wi(:,j)' * ( Xtt(:,i) - W0i(:,j) ); 
    end
    [~,pred] = max(Pw_t);   % La clase asignada es la de mayor probabilidad
    Yp(:,i) = pred;
    sigma_error = sigma_error + (pred ~= Ytt(i)); % Incrementar error (si aplica)
end

err = (sigma_error * 100)/ t_instances; % Cálculo del porcentaje de error
end