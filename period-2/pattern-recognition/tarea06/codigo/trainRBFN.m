%%=========================================================
%%  trainRBFN
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 20-abril-2015 
% Tarea No.: 06
% Clase: 012 
% Permite realizar el entrenamiento híbrido, devolviendo los parámetros que
% alcanzan mejores (menores) valores de error
%%=========================================================
function [Ci,Si,Wi] = trainRBFN(X,Y,H, tipoMedia)
Kradios = 2;

[~, Ci] = kmeans(X, H);                             % Obtener grupos
Si  = calculateRadios(Ci, H, Kradios, tipoMedia);   % Calcular radios
repSi  = repmat(Si,size(X,1),1);                    % Vector de radios aumentados para realizar división
G  = exp(-(dist(X,Ci').^2)./(2*repSi.^2));          % Función de activación (capa oculta)
G = [G ones(size(X,1),1)];                          % Adición de bias
Wi = (G'*G)\(G'*Y);                                 % Calcular pesos
end