% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 10-marzo-2014
% Tarea No.: 01
% Clase: 002
% Permite al usuario seleccionar el dataset a procesar e iniciar las tareas
% del clasificador bayesiano

close all; clear all;
datasets = {'clouds01','clouds02','halfkernel','overlapped','twospirals'};
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
        launcher(char(datasets(variable)));
    end
end