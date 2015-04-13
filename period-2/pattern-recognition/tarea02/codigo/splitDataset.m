%%=========================================================
%%  Split dataset
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 17-marzo-2014
% Tarea No.: 02
% Clase: 005
% Divide al dataset en componentes de training y test
%%=========================================================
function [Xtr, Ytr, Xtt, Ytt] =  splitDataset (dataset, labels, factor)
    [training, testing] = crossvalind('HoldOut', labels, factor);
     
     Xtr = dataset(:,training);
     Ytr = labels(:,training);
     
     Xtt = dataset(:,testing);
     Ytt = labels(:,testing);
end