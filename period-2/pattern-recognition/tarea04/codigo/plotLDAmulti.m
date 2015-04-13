%%=========================================================
%%  plotLDAmulti
% Materia: Reconocimiento de patrones 
% Nombre: Rafael P�rez Torres 
% Fecha: 7-abril-2015 
% Tarea No.: 04 
% Clase: 009 
% Grafica los resultados de la ejecuci�n del clasificador LDA, incluyendo
% los errores, as� como las regiones de decisi�n detectadas.
%%=========================================================

function plotLDAmulti(Xtt, Ytt, Yp, Wi, W0i, err, selectedDataset, saveEps)
% Creaci�n de un grid con 100 puntos sint�ticos para la identificaci�n
% de las regiones de inter�s
xRange = linspace(min(Xtt(1,:)), max(Xtt(1,:)), 50);
yRange = linspace(min(Xtt(2,:)), max(Xtt(2,:)), 50);
[x, y] = meshgrid(xRange,yRange);

imageSize = size(x);

% Conversi�n de los puntos sint�ticos a matriz para su clasificaci�n por el propio LDA
xy = [x(:) y(:)];

synt_y = ones(1,size(xy,1));    % Creacion de un set de etiquetas sint�tico
for i=1:max(Yp)                 % El clasificador LDA lo requiere de la misma
    synt_y(1,i) = i;            % dimensi�n. 
                                % Se requiere que dentro lleve al menos una vez
                                % las etiquetas de todas las clases, ya que
                                % el clasificador tiene una llamada a un
                                % unique para sus tareas internas.
end

% Se recaban �nicamente las etiquetas asignadas para mostrar los puntos con
% los colores de cada clase asignada.
[labels, ~] = classifyLDAmulti(xy', synt_y, Wi, W0i);

% Se modifica la forma de los datos clasificados de vector a matriz para generar 
% la imagen de fondo
regionsMap = reshape(labels, imageSize);

figure;
% Se escala la matriz de etiquetas al tama�o de los rangos y se muestra
% como fondo en la gr�fica. De esta forma ya se muestra el espacio
% particionado.
imagesc(xRange,yRange,regionsMap);
hold on;
set(gca,'ydir','normal');

regionsColor = [.76 1 .85; ...      % Colores para las regiones
    1 .88 1; ...
    .93 .90 .87; ...
    .93 .91 .75; ...
    .94 1 1; ...
    .98 .92 .84; ...
    .98 .98 .82; ...
    .80 .92 .77; ...
    1 .97 .86];
colormap(regionsColor);

classColors = ['y','m','b','r','k','c','w','g', 'y'];   % Colores para las clases

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
wrongPoints = Xtt(:,Ytt~=Yp);
plot(wrongPoints(1,:),wrongPoints(2,:),'r+', 'MarkerSize', 12);

% Formateo, leyendas,...
legend(legends, 'Location','NorthOutside','Orientation','horizontal');
xlabel('Attribute 1');
ylabel('Attribute 2');
title({sprintf('LDA classifier one vs. others (%s dataset)', selectedDataset); ...
    sprintf('%.2f %% error',err)});

if (saveEps == 1)
    saveas(gca, sprintf('%s.eps',selectedDataset),'epsc');
end
end