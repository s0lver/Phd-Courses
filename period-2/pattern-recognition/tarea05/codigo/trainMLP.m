%%=========================================================
%%  trainMLP
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 14-abril-2015 
% Tarea No.: 05
% Clase: 011 
% Realiza el entrenamiento de una RNA utilizando el algoritmo de
% Back-propagation.
% La red contiene solamente tres capas, la de entrada, la oculta con la
% cantidad de neuronas H que se especifique como argumento, y la capa de
% salida con únicamente una neurona.
%%=========================================================
function [Wij,Wjk] = trainMLP(X,Y,H,nu,alpha,Tmax,Emin,opt)

[d,N] = size(X);        % Dimensiones
X = [ones(1,N); X];     % Adición del peso artificial para bias

Wij = rand(H, d+1);     % Inicio aleatorio pesos hacia capa oculta
Wjk = rand(1, H);       % Inicio aleatorio pesos hacia capa de salida
WijAnt = zeros(H, d+1); % Pesos de la iteración anterior hacia capa oculta
WjkAnt = zeros(1, H);   % Pesos de la iteración anterior hacia capa de salida

if(opt == 1)
    err_plot = nan(1,Tmax); % Contenedor de errores para la gráfica
    figure;
end
for t=1:Tmax
    perm = randperm(N);         % Permutación de los elementos para evitar
    X = X(:,perm);              % viciar la red neuronal
    Y = Y(:,perm);
    
    %%% Realizar Feed Forward
    % Cálculo de las derivadas de la función de transferencia en cada capa
    % a) Salida de la capa oculta (J) hacia la capa de salida (K)
    Xj = Wij * X;               % Suma ponderada de los pesos y los patrones de entrenamiento
    Oj = 1 ./ (1 + exp(-Xj));   % Función de transferencia (sigmoidal) en capa J
    dOj = Oj .* ( 1 - Oj );     % Derivada de la función de transferencia en capa J
    
    % b) Salida de la capa de salida (K), utilizada para el back propagation
    Xk = Wjk * Oj;              % Suma ponderada de los pesos en capa K y salida de capa J
    Ok = 1 ./ (1 + exp(-Xk));   % Función de transferencia (sigmoidal) en capa K
    dOk = Ok .* ( 1 - Ok );     % Derivada de la función de transferencia en capa K
    
    E = Y - Ok;
    err = mean(E .^ 2);         % Cálculo del error medio cuadrático en las predicciones
    
    if (opt == 1)
        err_plot(t) = err; plot(err_plot);
        title({sprintf('MLP MSE Error plot'); ...
            sprintf('Neurons: %d, nu:%f, alpha: %f, Tmax: %d, Emin: %f',H,nu,alpha,Tmax,Emin)}); drawnow;
    end
    
    %%% Criterio de parada con los pesos actuales
    if (err<Emin)
        return
    end
    
    %%% Realizar Back Propagation
    % a) Actualización de pesos en capa de salida (K)
    dk = dOk .* E;
    DWjk = nu * dk * Oj';   % entrada a esta capa = Oj'
    Tjk = Wjk;
    Wjk = Wjk + DWjk + alpha * WjkAnt;
    WjkAnt = Tjk;
    
    % b) Actualización de pesos en capa oculta (J)
    dj = dOj .* (Wjk' * dk);
    Dwij = nu * dj * X';    % entrada a esta capa = Xtr (permutada)
    Tij = Wij;
    Wij = Wij + Dwij + alpha * WijAnt;
    WijAnt = Tij;
end

end

