%%=========================================================
%%  main
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 20-abril-2015 
% Tarea No.: 06
% Clase: 012 
% Punto de partida de la implementación de RBFN
% Permite seleccionar el dataset a utilizar
%%=========================================================
clc; close all; clear all;
datasets = {'complex','linear','ring','xor'};
exitOption = length(datasets)+1;
while (1)
    %clc;
    disp('Opciones: ')
    for i=1:length(datasets)
        dsName = cat(1,datasets(i));
        legend = {sprintf('[%d] -> Dataset %s',i),char(datasets(i))};
        disp([legend{:}]);
    end
    fprintf('[%d] -> Exit\n', exitOption);
    variable = input('Select a dataset: ');
    
    if (variable > exitOption)
        continue;
    elseif (variable == exitOption)
        disp('Bye');
        return;
    else
        saveEps = 0;
        dataset = load(sprintf('datasets/%s.mat',char(datasets(variable))));
        dsName = char(datasets(variable));
        Xtr = dataset.Xtr;
        Ytr = dataset.Ytr;
        Xtt = dataset.Xtt;
        Ytt = dataset.Ytt;
        [ H,Ci,Si,Wi, bestError ] = findParameters(Xtr,Ytr);
        fprintf('Best error: %f\n', bestError);
        fprintf('Best H: %d\n', H);
        plotCentroids(H,Xtr',Ci,Si, dsName, saveEps);
        [Yp,err] = classifyRBFN(Xtt', Ytt', Ci, Si, Wi);
        plotRBFN(Xtt, Ytt, H, Yp, Ci, Si, Wi, err, dsName, saveEps);
        save(sprintf('/home/rafael/git/Phd-Courses/period-2/pattern-recognition/tarea-06/best-%s.mat',dsName), ...
            'H', 'Ci', 'Si', 'Wi', 'bestError');
    end
end