%%=========================================================
%%  main
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 14-abril-2015 
% Tarea No.: 05
% Clase: 011 
% Lanza la ejecución del entrenamiento y clasificación a través de una RNA
% multicapa utilizando el algoritmo de back-propagation. Se lanza la
% ejecución en paralelo por cada uno de los datasets y se recaban los
% resultados en superS.
%%=========================================================
clc; clear;

datasets = {'complex','linear','ring','xor'};

% Creación de la combinación de parámetros
H = [3 5 10 20];
nu = [0.005 0.01, 0.05, 0.1];
alpha = [1e-7, 5e-7, 1e-6];
Tmax = 20000;
Emin = 1e-9;
opt = 0;
runs = 31;
saveEps = 1;

superS = struct('results',{});    
parfor ds_idx = 1:length(datasets)
    current_iter = 1;
    selectedDataset = datasets(ds_idx);
    fprintf('Evaluating dataset %s.mat\n', char(selectedDataset));
    dataset = load(sprintf('datasets/%s.mat', char(selectedDataset))); % Dataset a utilizar
    
    Xtr = dataset.Xtr;  % Datos entrenamiento
    Ytr = dataset.Ytr;  % Etiquetas entrenamiento
    Xtt = dataset.Xtt;  % Datos prueba
    Ytt = dataset.Ytt;  % Etiquetas prueba
    
    % Estructura para guardar los resultados de la configuración de
    % parámetros actual
    s = struct('dataset','aa','H',0,'nu',0,'alpha',0,'bestWij',{},'bestWjk',{},'bestError',999,'avgError',999, 'avgTime',999);
    
    % Ejecución de la RNA con cada una de las configuraciones
    for H_idx=1:length(H)
        for nu_idx=1:length(nu)
            for alpha_idx=1:length(alpha)
                
                fprintf('With %s.mat\tH=%d\tnu=%f\talpha=%.9f... ', char(selectedDataset), ...
                    H(H_idx), ...
                    nu(nu_idx), ...
                    alpha(alpha_idx));
                
                s(current_iter).dataset = selectedDataset;
                s(current_iter).H = H(H_idx);
                s(current_iter).nu = nu(nu_idx);
                s(current_iter).alpha = alpha(alpha_idx);
                s(current_iter).bestError = 999;
                sigma_error = 0;
                sigma_time = 0;
                for r=1:runs
                    tic;
                    [Wij, Wjk] = trainMLP(Xtr, Ytr, ...
                        H(H_idx), ...
                        nu(nu_idx), ...
                        alpha(alpha_idx), ...
                        Tmax, Emin, opt); % Realizar entrenamiento
                    
                    [Yp,err] = classifyMLP(Xtt, Ytt, Wij, Wjk); % Realizar clasificación
                    running_time = toc;
                    
                    sigma_error = sigma_error + err;
                    sigma_time = sigma_time + running_time;
                    if (err < s(current_iter).bestError) % Si el error es menor que en la iter anterior, tomar como mejores pesos!
                        s(current_iter).bestWij = Wij;
                        s(current_iter).bestWjk = Wjk;
                        s(current_iter).bestError = err;
                    end
                end
                s(current_iter).avgError = sigma_error / runs;
                s(current_iter).avgTime = sigma_time / runs;
                fprintf('done (in %f, %f seconds [avg,total], err =%f, %f [avg, lowest], )!\n', s(current_iter).avgTime, sigma_time, s(current_iter).avgError, s(current_iter).bestError);
                current_iter = current_iter + 1;
            end
        end
    end
    superS(ds_idx).results = s;
    fprintf('End evaluating dataset %s.mat\n', char(selectedDataset));
end

% Una vez que se lee el workspace del resultado, se obtienen las mejores
% configuraciones y se grafican.
clc; clear;
%load(sprintf('workspace_results.mat'));
for i=1:length(datasets)
    min_error = 999;
    idx_min_error = 0;
    for j=1:size(superS(i).results,2)
        if (superS(i).results(j).bestError < min_error)
            % Identificación del error menor
            min_error = superS(i).results(j).bestError;
            idx_min_error = j;
        end
    end
    
    % Toma de datos de los resultados y graficación.
    % Los resultados se toman para rotular la gráfica
    selectedDataset = datasets(i);
    dataset = load(sprintf('datasets/%s.mat', char(selectedDataset))); % Dataset a utilizar
    Xtt = dataset.Xtt;  
    Ytt = dataset.Ytt;
    bestWij = superS(i).results(idx_min_error).bestWij;
    bestWjk = superS(i).results(idx_min_error).bestWjk;
    bestH = superS(i).results(idx_min_error).H;
    bestAlpha = superS(i).results(idx_min_error).alpha;
    bestNu = superS(i).results(idx_min_error).nu;
    [Yp,err] = classifyMLP(Xtt,Ytt,bestWij,bestWjk); % retomar Yp (olvidé guardarlo en el workspace en el parfor xD)
    plotMLP(Xtt, Ytt, Yp, bestWij, bestWjk, bestH, bestAlpha, bestNu, Tmax, Emin, err, char(selectedDataset), 1);
end