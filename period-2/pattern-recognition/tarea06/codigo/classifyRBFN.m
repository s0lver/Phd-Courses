%%=========================================================
%%  classifyRBFN
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 20-abril-2015 
% Tarea No.: 06
% Clase: 012 
% Clasifica los datos mediante RBFN utilizando los parámetros generados 
% durante la etapa de entrenamiento.
%%=========================================================
function [ Yp,err ] = classifyRBFN( Xtt,Y,Ci,Si,Wi )
repSi  = repmat(Si,size(Xtt,1),1);          % Vector de radios aumentado para realizar la división
X  = exp(-(dist(Xtt,Ci').^2)./(2*repSi.^2));% Evaluación de función de activación (Gaussiana) sobre los datos
X = [X ones(size(X,1),1)];                  % Adición de bias
Ytesting = X * Wi;                          % Salida de la red
Yp = Ytesting > 0.5;
E = Y - Yp;
err = mean(E .^ 2);                         % Cálculo de error MSE
end