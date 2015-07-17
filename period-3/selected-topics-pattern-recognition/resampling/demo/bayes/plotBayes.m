% Materia: Reconocimiento de patrones
% Nombre: Rafael P�rez Torres
% Fecha: 10-marzo-2014
% Tarea No.: 01
% Clase: 002
% Grafica los resultados de la ejecuci�n del clasificador Bayes,
%   incluyendo los errores as� como la identificaci�n de las regiones de
%   decisi�n detectadas.

function plotBayes(Xtt,Ytt, Ypred, mu_wi, S_wi, P_wi, err, selectedDataset)
    % Creaci�n de un grid con 100 puntos sint�ticos para la identificaci�n
    % de las regiones de inter�s
    xRange = linspace(min(Xtt(1,:)), max(Xtt(1,:)), 50);
    yRange = linspace(min(Xtt(2,:)), max(Xtt(2,:)), 50);
    [x, y] = meshgrid(xRange,yRange);

    imageSize = size(x);

    % Conversi�n de los puntos sint�ticos a matriz...
    xy = [x(:) y(:)];

    % ... para su clasificaci�n por el propio Bayes.
    % Solamente se requieren las etiquetas que se le asignan a los puntos,
    % ya que con ellas se crear�n las regiones
    [labels, ~] = classifyBayes(xy', zeros(1,size(xy,1)), ...
        mu_wi, S_wi, P_wi);

    % Se cambia la forma de los datos clasificados, de vector a matriz
    % nuevamente para la generaci�n de la imagen de fondo
    regionsMap = reshape(labels, imageSize);

    figure;
    % Se escala la matriz de etiquetas al tama�o de los rangos y se muestra
    % como fondo en la gr�fica. De esta forma ya se muestra el espacio
    % particionado.
    imagesc(xRange,yRange,regionsMap);
    hold on;
    set(gca,'ydir','normal');

    % Se establece una lista de colores para las regiones y otra para las
    % clases de los puntos
    regionsColor = [.76 1 .85; 1 .88 1; .93 .90 .87; .93 .91 .75; ...
                    .94 1 1; .98 .92 .84; .98 .98 .82;  .80 .92 .77; ...
                    1 .97 .86];
    colormap(regionsColor);
    classColors = ['y','m','b','r','k','c','w','g', 'y'];      
    
    % Se grafican los puntos (en grupos) de cada clase con las mismas
    % caracter�sticas.
    totalClasses = length(unique(Ytt));
    legends = cell(totalClasses + 1,1);
    for currentClass = 1:totalClasses
        plot(Xtt(1,Ytt == currentClass), Xtt(2,Ytt == currentClass), ...
            'MarkerFaceColor', classColors(currentClass), ...
            'MarkerEdgeColor', [.7 .7 .7], ...
            'Marker', 'o', ...
            'LineStyle', 'none');
        legends{currentClass} = sprintf('Class %d',currentClass);
    end
    legends{length(legends)} = 'Errors';
    % Se extraen y grafican los puntos mal clasificados, aquellos distintos
    % en el ground truth (Ytt) y el resultado de Bayes (Ypred)
    
    wrongPoints = Xtt(:,Ytt~=Ypred);
    plot(wrongPoints(1,:),wrongPoints(2,:),'r+', 'MarkerSize', 12);
    
    % Formateo, leyendas,...
    legend(legends, 'Location','NorthOutside','Orientation','horizontal');
    xlabel('Attribute 1');
    ylabel('Attribute 2');
    title({sprintf('Bayesian classifier (%s dataset)', selectedDataset); ...
        sprintf('%.2f %% error',err)});
end