%%=========================================================
%%  trainLDAmulti
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 7-abril-2015 
% Tarea No.: 04 
% Clase: 009 
% Realiza el entrenamiento del LDA, obteniendo el vector de pesos y 
% los bias para cada clase
%%=========================================================
function [Wi, W0i] = trainLDAmulti( Xtr, Ytr )
dim = size(Xtr,1);

gamma = unique(Ytr);
c = max(gamma);
Wi  = zeros(dim,c);
W0i = zeros(dim,c);

for i=1:c
    % La clase c conocida sera el 1 en '1 vs todos'
    c_instances = Xtr(:,Ytr==i);    % instancias de clase c
    o_instances = Xtr(:,Ytr~=i);    % instancias de las otras clases
    
    mu_1 = mean(c_instances,2);     % media de clase c
    mu_2 = mean(o_instances,2);     % media del resto de las clases

    S_1 = cov(c_instances');        % Matriz de covarianza de clase c
    S_2 = cov(o_instances');        % Matriz de covarianza del resto de clases
       
    Sw = S_1 + S_2;                 % Matriz de dispersión intra-clase Sw = S1 + S2
    Wi(:,i) = Sw\(mu_1 - mu_2);     % Vector de pesos para clase c
    W0i(:,i) = (mu_1 + mu_2)/2;     % Bias para clase c
end
end