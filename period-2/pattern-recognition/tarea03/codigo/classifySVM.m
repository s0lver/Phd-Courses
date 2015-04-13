%%=========================================================
%%  classifySVM
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 1-abril-2015 
% Tarea No.: 03 
% Clase: 008 
% Realiza la clasificación de las instancias especificadas (Xtt,Ytt) 
% utilizando los datos de la svm especificados como argumentos (sv,
% alpha_y,w0,params).
% Entrega como resultado las predicciones obtenidas así como el porcentaje
% de errores.
%%=========================================================
function [Yp,e] = classifySVM(Xtt,Ytt,sv,alpha_y,w0,params)
Yp = sign(kernel(sv,Xtt,params)'*alpha_y+w0);
e = 100 * sum(Yp ~= Ytt) / length(Xtt);
end