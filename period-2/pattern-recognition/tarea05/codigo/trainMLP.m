%%=========================================================
%%  trainMLP
% Materia: Reconocimiento de patrones 
% Nombre: Rafael P�rez Torres 
% Fecha: 14-abril-2015 
% Tarea No.: 05
% Clase: 011 
% Realiza el entrenamiento de una RNA utilizando el algoritmo de
% Back-propagation.
% La red contiene solamente tres capas, la de entrada, la oculta con la
% cantidad de neuronas H que se especifique como argumento, y la capa de
% salida con �nicamente una neurona.
%%=========================================================
function [Wij,Wjk] = trainMLP(X,Y,H,nu,alpha,Tmax,Emin,opt)

[d,N] = size(X);        % Dimensiones
X = [ones(1,N); X];     % Adici�n del peso artificial para bias

Wij = rand(H, d+1);     % Inicio aleatorio pesos hacia capa oculta
Wjk = rand(1, H);       % Inicio aleatorio pesos hacia capa de salida
WijAnt = zeros(H, d+1); % Pesos de la iteraci�n anterior hacia capa oculta
WjkAnt = zeros(1, H);   % Pesos de la iteraci�n anterior hacia capa de salida

if(opt == 1)
    err_plot = nan(1,Tmax); % Contenedor de errores para la gr�fica
    figure;
end
for t=1:Tmax
    perm = randperm(N);         % Permutaci�n de los elementos para evitar
    X = X(:,perm);              % viciar la red neuronal
    Y = Y(:,perm);
    
    %%% Realizar Feed Forward
    % C�lculo de las derivadas de la funci�n de transferencia en cada capa
    % a) Salida de la capa oculta (J) hacia la capa de salida (K)
    Xj = Wij * X;               % Suma ponderada de los pesos y los patrones de entrenamiento
    Oj = 1 ./ (1 + exp(-Xj));   % Funci�n de transferencia (sigmoidal) en capa J
    dOj = Oj .* ( 1 - Oj );     % Derivada de la funci�n de transferencia en capa J
    
    % b) Salida de la capa de salida (K), utilizada para el back propagation
    Xk = Wjk * Oj;              % Suma ponderada de los pesos en capa K y salida de capa J
    Ok = 1 ./ (1 + exp(-Xk));   % Funci�n de transferencia (sigmoidal) en capa K
    dOk = Ok .* ( 1 - Ok );     % Derivada de la funci�n de transferencia en capa K
    
    E = Y - Ok;
    err = mean(E .^ 2);         % C�lculo del error medio cuadr�tico en las predicciones
    
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
    % a) Actualizaci�n de pesos en capa de salida (K)
    dk = dOk .* E;
    DWjk = nu * dk * Oj';   % entrada a esta capa = Oj'
    Tjk = Wjk;
    Wjk = Wjk + DWjk + alpha * WjkAnt;
    WjkAnt = Tjk;
    
    % b) Actualizaci�n de pesos en capa oculta (J)
    dj = dOj .* (Wjk' * dk);
    Dwij = nu * dj * X';    % entrada a esta capa = Xtr (permutada)
    Tij = Wij;
    Wij = Wij + Dwij + alpha * WijAnt;
    WijAnt = Tij;
end

end

