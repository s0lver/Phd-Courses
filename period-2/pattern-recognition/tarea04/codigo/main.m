%%=========================================================
%%  main
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 7-abril-2015 
% Tarea No.: 04 
% Clase: 009 
% Lanza la ejecución del entrenamiento y clasificación para cada uno de los
% datasets
%%=========================================================

clear; clc;
dss = 8;
err_matrix = zeros(1,dss);
for i=1:dss
    dataset = load(sprintf('datasets\\clouds0%d.mat',i));
    Xtr = dataset.Xtr;
    Ytr = dataset.Ytr;
    Xtt = dataset.Xtt;
    Ytt = dataset.Ytt;
    
    % Entrenamiento
    [Wi, W0i] = trainLDAmulti( Xtr, Ytr );
    
    % Clasificación
    [ Yp, err ] = classifyLDAmulti( Xtt, Ytt, Wi, W0i );
    err_matrix(:,i) = err;
    
    % Gráfica
    plotLDAmulti(Xtt, Ytt, Yp, Wi, W0i, err, sprintf('clouds0%d.mat',i), false);
end

