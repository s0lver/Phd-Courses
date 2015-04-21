%%=========================================================
%%  Split dataset
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 20-abril-2015
% Tarea No.: 06
% Clase: 012
% Divide al dataset en componentes de training y validation
%%=========================================================
function [Xtr, Ytr, Xval, Yval] =  splitDataset (dataset, labels, factor)
    [training, testing] = crossvalind('HoldOut', labels, factor);
     
     Xtr = dataset(:,training);
     Ytr = labels(:,training);
     
     Xval = dataset(:,testing);
     Yval = labels(:,testing);
end