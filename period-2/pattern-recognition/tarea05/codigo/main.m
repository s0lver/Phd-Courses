clc; clear;

datasets = {'complex','linear','ring','xor'};

% Creación de la combinación de parámetros
H = [3 5 10 20];
%H = [3 5];
nu = [0.005 0.01, 0.05, 0.1];
%nu = [0.005 0.01];
%alpha = [1e-7, 5e-7, 1e-6, 5e-6];
alpha = [1e-7, 5e-7, 1e-6];
%alpha = [5e-7, 1e-6];
Tmax = 20000;
Emin = 1e-9;
opt = 0;
runs = 31;
saveEps = 0;

superS = struct('results',{});    
parfor ds_idx = 1:length(datasets)
    current_iter = 1;
    selectedDataset = datasets(ds_idx);
    fprintf('Evaluating dataset %s.mat\n', char(selectedDataset));
    dataset = load(sprintf('datasets/%s.mat', char(selectedDataset))); % Dataset a utilizar
    
    Xtr = dataset.Xtr;  % Datos prueba
    Ytr = dataset.Ytr;  % Etiquetas prueba
    Xtt = dataset.Xtt;  % Datos entrenamiento
    Ytt = dataset.Ytt;  % Etiquetas entrenamiento
    s = struct('dataset','aa','H',0,'nu',0,'alpha',0,'bestWij',{},'bestWjk',{},'bestError',999,'avgError',999, 'avgTime',999);
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
                    % plotMLP(Xtt, Ytt, Yp, Wij, Wjk, err, selectedDataset, saveEps);
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

%save('c:\users\rafael\dropbox\cinvestav\doctorado\cuatrimestre-2\reconocimiento-patrones\tarea05\codigo\workspace_results.mat');
% Xtr = [-1 -1 1 1;-1 1 -1 1];
% Ytr = [0 1 1 0];
% Xtt = [-1 -1 1 1;-1 1 -1 1];
% Ytt = [0 1 1 0];
% H = 20;
% nu = 0.01;
% alpha = 1e-6;
% Tmax = 20000;
% Emin = 1e-9;
% opt = 0;
% selectedDataset = 'dsName';
% saveEps = 0;

% Leer workspace y escribir código para la gráfica aquí.