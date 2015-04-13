% Materia: Reconocimiento de patrones
% Nombre: Rafael P�rez Torres
% Fecha: 10-marzo-2014
% Tarea No.: 01
% Clase: 002
% Prepara y lanza la secuencia de actividades entrenar, clasificar,
% graficar Bayes
function launcher(dataset)
tic;
    runs = 31;
    S_errors = zeros(1,runs);

    % Cargar dataset
    [ds] = load(sprintf('datasets/%s',dataset));
    
    % Por cada ejecuci�n
    for i = 1:runs
        % Crear los subset de entrenamiento (70%) y prueba(30%)
        [training, testing] = crossvalind('HoldOut', ds.Y, 0.3);

        Xtr = ds.X(:,training);
        Ytr = ds.Y(:,training);

        Xtt = ds.X(:,testing);
        Ytt = ds.Y(:,testing);

        % Entrenar y clasificar
        [mu_wi,S_wi,P_wi] = trainBayes(Xtr, Ytr);
        [Ypred, err] = classifyBayes(Xtt, Ytt, mu_wi, S_wi, P_wi);
        % Recoger el error de cada iteraci�n ...
        % ... (�til para la graficaci�n de los errores en las iteraciones)
        S_errors(i) = err;
    end
toc;
    % Graficar los resultados de la �ltima ejecuci�n
    plotBayes(Xtt, Ytt, Ypred, mu_wi, S_wi, P_wi, err, dataset);

    % Graficar los errores de cada iteraci�n
    plotErrors(S_errors);
end