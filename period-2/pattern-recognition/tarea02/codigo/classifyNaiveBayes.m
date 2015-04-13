%%=========================================================
%%  Clasificador Naïve Bayes
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 17-marzo-2014
% Tarea No.: 02
% Clase: 005
% Clasificador Naive Bayes
%%=========================================================
function [Ypred,err] = classifyNaiveBayes(Xtt, Ytt, mu_wi, var_wi, P_wi)

% Total de instancias a clasificar
totalInstances = size(Xtt,2);
totalDimensions = size(Xtt,1);

% Total de clases reconocidas durante el entrenamiento
totalClases = size(P_wi,2);

% Inicialización de variables
map = zeros(totalClases,totalInstances);
Ypred = zeros(1,totalInstances);
sigma_error = 0;
prob = zeros(totalDimensions,totalClases);
pdf = zeros(totalClases, totalInstances);

% Por cada instancia a clasificar
for x = 1:totalInstances
    x_i = Xtt(:,x);
    % Por cada una de las clases
    for k = 1:totalClases
        % Calcular la probabilidad de que cada atributo pertenezca a esa
        % clase
        for j = 1:totalDimensions
            prob(j, k) = (1/sqrt(2*pi*var_wi(j, k))) * ...
                exp(- (power(x_i(j) - mu_wi(j,k), 2) / ...
                (2 * var_wi(j, k))) );
        end
        % Calcular la productoria de las probabilidades de los atributos
        % para esta clase
        pdf(k, x) = prod(prob(:,k));
        % Multiplicar por la probabilidad de esta clase (en este caso es
        % constante) y almacenar para decisión posterior
        map(k, x) = pdf(k, x) * P_wi(1,k);
    end
    
    % Una vez calculadas las probabilidades, simplemente elegir la
    % mayor...
    [~,predicted] = max(map(:,x));
    % ...colocarla en Ypred...
    Ypred(x) = predicted;
    %...y actualizar la cantidad de errores en caso de discrepancia
    sigma_error = sigma_error + (predicted ~= Ytt(x));
end

% Calcular el porcentaje de error para este conjunto de prueba
err = (sigma_error * 100)/ totalInstances;
end