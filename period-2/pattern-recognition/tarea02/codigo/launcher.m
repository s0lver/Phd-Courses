%%=========================================================
%%  Launcher!
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 17-marzo-2014
% Tarea No.: 02
% Clase: 005
% Prepara y lanza la ejecución de cada algoritmo por cada uno de los
% datasets
%%=========================================================

% Carga del archivo global
datasetFile = load('dataset/handwittern0to9.mat');

% Identificación de características del archivo
labels = datasetFile.Y;
total_datasets = length(datasetFile.X);

% Parámetros de la ejecución
total_classifiers = 7; % 5 + 2 variantes knn
runs = 31;

% placeholders de los errores y tiempos de ejecución, hipermatrices
error_matrix = zeros(runs, total_classifiers, total_datasets);
time_matrix = zeros(runs, total_classifiers, total_datasets);

% Por cada dataset
for current_ds=1:total_datasets
    fprintf('Evaluating dataset %s\n', datasetFile.F{current_ds});
    dataset = datasetFile.X{current_ds};
    
    % Por cada algoritmo
    
    % Clasificador 1.
    % Caso general, clasificador bayesiano
    disp('Starting Bayesian classifier');
    current_classifier = 1;
    for current_iter= 1:runs
        error_bayes = 0;
        tic;
        
        [Xtr, Ytr, Xtt, Ytt] = splitDataset(dataset, labels, 0.3);
        
        [mu_wi,S_wi,P_wi] = trainBayes(Xtr, Ytr);
        [YpredBayesian, err] = classifyBayes(Xtt, Ytt, mu_wi, S_wi, P_wi);
        
        error_bayes = error_bayes + err;
        error_matrix(current_iter, current_classifier, current_ds) = error_bayes;
        
        elapsed_time = toc;
        time_matrix(current_iter, current_classifier, current_ds) = elapsed_time;
    end
    disp('Bayesian classifier done');
    
    % Clasificador 2
    % Caso 1, clasificador de distancia euclideana
    disp('Starting Euclidean classifier');
    current_classifier = 2;
    for current_iter= 1:runs
        error_euclidean = 0;
        tic;
        
        [Xtr, Ytr, Xtt, Ytt] = splitDataset(dataset, labels, 0.3);
        
        [mu_wi,S_wi,P_wi] = trainBayes(Xtr, Ytr);
        
        [YpredEuclidean, err] = classifyEuclidean(Xtt, Ytt, mu_wi);
        
        error_euclidean = error_euclidean + err;
        error_matrix(current_iter, current_classifier, current_ds) = error_euclidean;
        
        elapsed_time = toc;
        time_matrix(current_iter, current_classifier, current_ds) = elapsed_time;
    end
    disp('Euclidean classifier done');
    
    % Clasificador 3
    % Caso 3, clasificador de distancia Mahalanobis
    disp('Starting Mahalanobis classifier');
    current_classifier = 3;
    for current_iter= 1:runs
        error_mahalanobis = 0;
        tic;
        
        [Xtr, Ytr, Xtt, Ytt] = splitDataset(dataset, labels, 0.3);
        
        [mu_wi,S_wi,P_wi] = trainBayes(Xtr, Ytr);
        
        [YpredMahalanobis, err] = classifyMahalanobis(Xtt, Ytt, mu_wi, S_wi);
        
        error_mahalanobis= error_mahalanobis + err;
        error_matrix(current_iter, current_classifier, current_ds) = error_mahalanobis;
        
        elapsed_time = toc;
        time_matrix(current_iter, current_classifier, current_ds) = elapsed_time;
    end
    disp('Mahalanobis classifier done');
    
    % Clasificador 4
    % Clasificador Naive Bayes
    disp('Starting Naïve Bayes classifier');
    current_classifier = 4;
    for current_iter= 1:runs
        error_nb = 0;
        tic;
        
        [Xtr, Ytr, Xtt, Ytt] = splitDataset(dataset, labels, 0.3);
        
        [nv_mu_wi, nv_var_wi, nv_P_wi] = trainNaiveBayes(Xtr, Ytr);
        [YpredNaiveBayes, err] = classifyNaiveBayes(Xtt,Ytt, nv_mu_wi, nv_var_wi, nv_P_wi);
        error_nb = error_nb + err;
        error_matrix(current_iter, current_classifier, current_ds) = error_nb;
        
        elapsed_time = toc;
        time_matrix(current_iter, current_classifier, current_ds) = elapsed_time;
    end
    disp('Naïve Bayes classifier done');
    
    % Clasificador 5
    % Clasificador 1-NN
    n_k = 1;
    fprintf('Starting K-nn classifier (k=%d)\n', n_k);
    current_classifier = 5;
    for current_iter= 1:runs
        tic;
        
        [Xtr, Ytr, Xtt, Ytt] = splitDataset(dataset, labels, 0.3);
        
        [YpredKnn, err] =  knn(n_k, Xtr, Ytr, Xtt, Ytt);
        error_matrix(current_iter, current_classifier, current_ds) = err;
        elapsed_time = toc;
        time_matrix(current_iter, current_classifier, current_ds) = elapsed_time;
    end
    fprintf('K-nn classifier done (k=%d)\n', n_k);
    
    % Clasificador 6
    % Clasificador 5-NN
    n_k = 5;
    fprintf('Starting K-nn classifier (k=%d)\n', n_k);
    current_classifier = 6;
    for current_iter= 1:runs
        tic;
        
        [Xtr, Ytr, Xtt, Ytt] = splitDataset(dataset, labels, 0.3);
        
        [YpredKnn, err] =  knn(n_k, Xtr, Ytr, Xtt, Ytt);
        error_matrix(current_iter, current_classifier, current_ds) = err;
        
        elapsed_time = toc;
        time_matrix(current_iter, current_classifier, current_ds) = elapsed_time;
    end
    fprintf('K-nn classifier done (k=%d)\n', n_k);
    
    % Clasificador 6
    % Clasificador 9-NN
    n_k = 9;
    fprintf('Starting K-nn classifier (k=%d)\n', n_k);
    current_classifier = 7;
    for current_iter= 1:runs
        tic;
        
        [Xtr, Ytr, Xtt, Ytt] = splitDataset(dataset, labels, 0.3);
        
        [YpredKnn, err] =  knn(n_k, Xtr, Ytr, Xtt, Ytt);
        error_matrix(current_iter, current_classifier, current_ds) = err;
        
        elapsed_time = toc;
        time_matrix(current_iter, current_classifier, current_ds) = elapsed_time;
    end
    fprintf('K-nn classifier done (k=%d)\n', n_k);
    
    disp('----------------------------------------------------');
end

disp('Plotting');

% Graficación
mean_error = zeros (total_classifiers,total_datasets);
mean_time = zeros (total_classifiers,total_datasets);
for i_dataset = 1:total_datasets
    for i_algoritmo = 1:total_classifiers
        mean_error(i_algoritmo,i_dataset) = mean(error_matrix(:,i_algoritmo,i_dataset));
        mean_time(i_algoritmo,i_dataset) = mean(time_matrix(:,i_algoritmo,i_dataset));
    end
end

figure
bar3(mean_error');
title('Comparativa de error');
zlabel('Porcentaje error');
set(gca, 'XTickLabel', {'Bayesian','Euclidean','Mahalanobis','NaiveBayes','Knn (k=1)','Knn (k=5)','Knn (k=9)'})
legend('Bayesian','Euclidean','Mahalanobis','NaiveBayes','Knn (k=1)','Knn (k=5)','Knn (k=9)')
set(gca, 'YTickLabel', datasetFile.F);

figure
bar3(mean_time');
title('Comparativa de tiempos');
zlabel('Segundos');
set(gca, 'XTickLabel', {'Bayesian','Euclidean','Mahalanobis','NaiveBayes','Knn (k=1)','Knn (k=5)','Knn (k=9)'})
legend('Bayesian','Euclidean','Mahalanobis','NaiveBayes','Knn (k=1)','Knn (k=5)','Knn (k=9)')
set(gca, 'YTickLabel', datasetFile.F);