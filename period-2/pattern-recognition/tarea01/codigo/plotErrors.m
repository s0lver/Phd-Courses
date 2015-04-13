% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 10-marzo-2014
% Tarea No.: 01
% Clase: 002
% Grafica los valores en S_errors que representan los errores en la
% ejecución de length(S_error) iteraciones del clasificador bayesiano

function plotErrors(S_errors)
    % Graficar los errores
    figure;
    plot(S_errors, '-o', 'Color', 'k', ...
        'MarkerEdgeColor',[.7 .7 .7],'MarkerFaceColor','r')
    
    % Formateo, leyendas...
    title({'Classification errors'; ...
        sprintf('Error mean %.2f%%',mean(S_errors))});
    xlabel('Independent executions');
    ylabel('Error percentage');
end