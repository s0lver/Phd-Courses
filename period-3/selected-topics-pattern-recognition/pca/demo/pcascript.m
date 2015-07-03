clear all;
close all;
% Generar datos
x(1,:) = randn(1,100);
x(2,:) = randn(1,100)*3;
[p(1,:),p(2,:)] = cart2pol(x(1,:),x(2,:));
p(1,:) = p(1,:)-pi/3;
[x(1,:),x(2,:)] = pol2cart(p(1,:),p(2,:));
X = x;
figure;
scatter(X(1,:),X(2,:), 'ok');
hold on;

% Sustrae la media de cada característica
muX = mean(X,2);
X = X - muX(:,ones(1,size(X,2)));

% Calcula la matriz de covarianza
S = cov(X);

% Computa autovalores/autovectores
[PC,V] = eig(S);

% Extrae diagonal de la matri
V = diag(V);

% Ordenar en orden decreciente
[junk, rindices] = sort(-1*V);
V = V(rindices);

% Tomar según orden anterior
PC = PC(:,rindices);

% Proyectar el conjunto de datos original
signals = PC' * X';
signals = signals';

scatter(signals(1,:),signals(2,:), '+r');