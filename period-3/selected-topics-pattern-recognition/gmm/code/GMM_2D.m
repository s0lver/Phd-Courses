% C�digo y explicaci�n disponible en:
% https://chrisjmccormick.wordpress.com/2014/08/04/gaussian-mixture-models-tutorial-and-matlab-code/
%%======================================================
%% PASO preliminar a): Generaci�n de datos para dos distribuciones de dos dimensiones

mu1     = [1 2];            % Media para distribuci�n 1
sigma1  = [ 3 .2; .2  2];   % Matriz de covarianza para distribuci�n 1
M1 = 200;                   % Cantidad de puntos para distribuci�n 1

mu2 = [-1 -2];              % Media para distribuci�n 2
sigma2 = [2 0; 0 1];        % Matriz de covarianza para distribuci�n 2
M2 = 100;                   % Cantidad de puntos para distribuci�n 2

% Generaci�n de puntos con las medias y matrices previamente definidas.
R1 = chol(sigma1);
X1 = randn(M1, 2) * R1;
X1 = X1 + repmat(mu1, size(X1, 1), 1);

R2 = chol(sigma2);
X2 = randn(M2, 2) * R2;
X2 = X2 + repmat(mu2, size(X2, 1), 1);

X = [X1; X2];
%%=====================================================
%% PASO preliminar b) Gr�fica de los datos y sus PDFs

figure(1);

% Gr�fica scatter de ambas distribuciones
hold off;
plot(X1(:, 1), X1(:, 2), 'bo');
hold on;
plot(X2(:, 1), X2(:, 2), 'ro');

set(gcf,'color','white') % Fondo blanco para la figura

% Creaci�n de una matriz [10,000 x 2] 'gridX' de coordenadas representando
% los valores de entrada sobre la malla
gridSize = 100;
u = linspace(-6, 6, gridSize);
[A B] = meshgrid(u, u);
gridX = [A(:), B(:)];

% C�lculo de la PDF gaussiana para cada punto en la malla.
z1 = pdfGaussiana(gridX, mu1, sigma1);
z2 = pdfGaussiana(gridX, mu2, sigma2);

% Re-formatear las respuestas a 2D para ser graficadas con la funci�n contour
Z1 = reshape(z1, gridSize, gridSize);
Z2 = reshape(z2, gridSize, gridSize);

% Graficar los contornos para mostrar la PDF sobre los datos
[C, h] = contour(u, u, Z1);
[C, h] = contour(u, u, Z2);

axis([-6 6 -6 6])
title('Datos y PDFs originales');

%set(h,'ShowText','on','TextStep',get(h,'LevelStep')*2);


%%====================================================
%% PASO 1: Selecci�n de los valores iniciales para los par�metros de coeficientes, medias y covarianzas

% Sea m el n�mero de datos.
m = size(X, 1);

k = 2;  % Cantidad de cl�sters a formar
n = 2;  % La longitud (dimensionalidad) de los datos.

% Utilizaci�n de kmeans para obtener las medias (centroides) de los k cl�sters iniciales
[indeces,mu] = kmeans(X,k);

sigma = cell(1,k);
coeficientes = zeros(1,2);

% Calcular la covarianza y coeficientes en cada distribuci�n
for j = 1:k
    sigma{j} = cov(X(indeces==j,:));
    coeficientes(:,j) = size(X(indeces==j,:),1);
end

% Matriz para contener las probabilidades a posteriori
p = zeros(m, k);

% Iterar hasta alcanzar convergencia
for iter = 1:1000
    fprintf('  EM Iteraci�n %d\n', iter);

    %%===================================================
    %% PASO 2: (Esperanza): Calcular las probabilidades a posteriori de que 
    %% cada dato pertenezca a cada grupo
    
    % Matriz para contener las PDF para cada dato por cada cl�ster
    % Un rengl�n por dato, una columna por cl�ster
    pdf = zeros(m, k);
    
    % En cada cl�ster ...
    for j = 1:k
        % Evaluar la PDF gaussiana para todos los datos en el cl�ster 'j'
        % [g(x|u,sigma)]
        pdf(:, j) = pdfGaussiana(X, mu(j, :), sigma{j});
    end
    
    % Multiplicar cada valor de la PDF por la probabilidad a priori de los
    % cl�sters
    %    pdf  [m  x  k]
    %   coef  [1  x  k]   
    %  pdf_w  [m  x  k]
    pdf_w = bsxfun(@times, pdf, coeficientes);
    
    % Dividir las probabilidades ponderadas por la suma de probabilidades
    % ponderadas de todos los cl�sters
    %   sum(pdf_w, 2) -- Suma sobre todos los clusters.
    p = bsxfun(@rdivide, pdf_w, sum(pdf_w, 2));
    
    %%===============================================
    %% PASO 3: Maximizaci�n
    %%
    %%Reestimaci�n de los par�metros del GMM

    % Backup de las medias actuales
    prevMu = mu;    
    
    % Por cada cl�ster...
    for j = 1:k
    
        % Estimaci�n de los coeficientes mixtos (probabilidad a priori) del
        % cl�ster 'j'
        coeficientes(j) = mean(p(:, j), 1);
        
        % Calcular la nueva media para el cl�ster 'j' 
        mu(j, :) = promedioPonderado(p(:, j), X);

        % Optimizaci�n: Restar la media del cl�ster a cada punto
        Xm = bsxfun(@minus, X, mu(j, :));
        
        % Calcular la matriz de covarianza para el cl�ster 'j'
        sigma_k = zeros(n, n);
        for i = 1:m
            sigma_k = sigma_k + (p(i, j) .* (Xm(i, :)' * Xm(i, :)));
        end
        
        % Dividir entre la suma de los probabilidades
        sigma{j} = sigma_k ./ sum(p(:, j));
    end
    
    %%===============================================
    %% Paso 4. Verificar convergencia
    if (mu == prevMu)
        break
    end
            
% Fin del algoritmo
end

% p almacena la probabilidad de pertenecer a cada grupo.
[~,Kpred] = max(p,[],2);
K1 = repmat(1,1,M1);
K2 = repmat(2,1,M2);
K_inicial = [K1 K2]';

%%=====================================================
%% Paso posterior: Graficar las distribuciones y las pdf estimadas

% Mostrar una gr�fica scatter de las dos distribuciones
figure(2);
hold off;
plot(X1(:, 1), X1(:, 2), 'bo');
hold on;
plot(X2(:, 1), X2(:, 2), 'ro');

set(gcf,'color','white') % Fondo blanco

plot(mu1(1), mu1(2), 'kx');
plot(mu2(1), mu2(2), 'kx');

% Creaci�n de una matriz [10,000 x 2] 'gridX' de coordenadas representando
% los valores de entrada sobre la malla
gridSize = 100;
u = linspace(-6, 6, gridSize);
[A, B] = meshgrid(u, u);
gridX = [A(:), B(:)];

% C�lculo de la PDF gaussiana para cada punto en la malla.
z1 = pdfGaussiana(gridX, mu(1, :), sigma{1});
z2 = pdfGaussiana(gridX, mu(2, :), sigma{2});

% Re-formatear las respuestas a 2D para ser graficadas con la funci�n contour
Z1 = reshape(z1, gridSize, gridSize);
Z2 = reshape(z2, gridSize, gridSize);

% Graficar los contornos para mostrar la PDF sobre los datos
[C, h] = contour(u, u, Z1);
[C, h] = contour(u, u, Z2);
axis([-6 6 -6 6])

title('Datos originales y PDFs estimadas');

% Graficar errores y mostrar estad�stica
errores = Kpred ~= K_inicial;
porcentaje_error = sum(errores) / (M1+M2);
fprintf('Porcentaje de error: %f%% (%d instancias) \n',porcentaje_error, sum(errores));
plot(X(errores, 1), X(errores, 2), 'g*');