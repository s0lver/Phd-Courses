%%=========================================================
%%  calculateRadios
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 20-abril-2015 
% Tarea No.: 06
% Clase: 012 
% Calcula el tamaño de los radios de cada uno de los centroides obtenidos
% mediante kmeans
%%=========================================================
function [ Si ] = calculateRadios( Ci, H, Kradios, meanType )
Si = zeros(1,H);
distances = dist(Ci');                      % Cálculo de las distancias inter-centroides
consideredDistances = zeros(Kradios, H);

centroidDistances = distances(2:end, 1);    % Obtención de las distancias para el primer centroide
orderedDistances = sort(centroidDistances); % Ordena las distancias 
consideredDistances(:,1) = orderedDistances(1:Kradios);% Toma el top-Kradios de las distancias

% Obtención de las distancias para los centroides 2 hasta end-1 (por cuestiones de out of bounds)
for i=2:(H-1)
    centroidDistances = distances([1:i-1 i+1:end], i);
    orderedDistances = sort(centroidDistances);
    consideredDistances(:,i) = orderedDistances(1:Kradios);
end

% Obtención de las distancias para el último centroide
centroidDistances = distances(1:(H-1), H);
orderedDistances = sort(centroidDistances);
consideredDistances(:,H) = orderedDistances(1:Kradios);

% Cálculo de los radios, utilizando cualquiera de las dos medias
for i=1:H
    if (meanType == 1)
        Si(i) = sqrt(sum(consideredDistances(:,i).^2)/Kradios);
    else
        Si(i) = sqrt(prod(consideredDistances(:,i)));
    end
end
end

