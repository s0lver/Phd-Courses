function [ pdf ] = pdfGaussiana(X, mu, Sigma)
%pdfGaussiana Calcula la pdf de los datos especificados
%      X - Matriz de los datos, uno por renglón
%     mu - Vector renglón para la media
%  Sigma - Matriz de covarianza.

% Obtener longitud del vector
n = size(X, 2);

% Restar la media a cada punto
meanDiff = bsxfun(@minus, X, mu);

% Calcular la pdf Gaussiana
pdf = 1 / sqrt((2*pi)^n * det(Sigma)) * exp(-1/2 * sum((meanDiff * inv(Sigma) .* meanDiff), 2));
end

