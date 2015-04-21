function [Ci,Si,Wi] = trainRBFN(X,Y,H, tipoMedia)
Kradios = 2;

% Obtener grupos
[~, Ci] = kmeans(X, H);
% Calcular radios
Si  = calculateRadios(Ci, H, Kradios, tipoMedia);
%Calcular pesos
repSi  = repmat(Si,size(X,1),1);
G  = exp(-(dist(X,Ci').^2)./(2*repSi.^2));
G = [G ones(size(X,1),1)];
Wi = (G'*G)\(G'*Y);
end