%%=========================================================
%%  Split dataset
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 1-abril-2015
% Tarea No.: 03
% Clase: 008
% Divide al dataset en componentes de training y test
%%=========================================================
function [Xtr, Ytr, Xtt, Ytt] =  splitDataset (dataset, labels, factor)
    [training, testing] = crossvalind('HoldOut', labels, factor);
     Xtr = dataset(training,:);
     Ytr = labels(training,:);
     
     Xtt = dataset(testing,:);
     Ytt = labels(testing,:);
end