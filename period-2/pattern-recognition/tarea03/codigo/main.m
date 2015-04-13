%%=========================================================
%%  main
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 1-abril-2015
% Tarea No.: 03
% Clase: 008
% Punto de entrada de la asignación 3.
%%=========================================================
clear; clc;
ds_names = {'BreastMG.mat','BreastUS.mat','Diabetes.mat','Heart.mat'};
runs = 31;

c_values = [1,10,100,1000];

poly_dimensions = [2,5,10,100];

rbf_gamma = [.01,0.1,0.5,1];

lin_results = zeros(length(c_values),3, length(ds_names));
poly_results = zeros(length(poly_dimensions) * length(c_values),4,length(ds_names));
rbf_results = zeros(length(rbf_gamma) * length(c_values),4,length(ds_names));

for i=1:length(ds_names)
    ds_file = load(sprintf('datasets/%s',ds_names{i}));
    fprintf('Processing dataset %s\n',ds_names{i});
    fprintf('Processing linear kernel\n');
    
    % linear kernel:
    for j=1:length(c_values)
        params = {'lin';0;c_values(j)};
        fprintf('Using params: C=%d\n',c_values(j));
        tic;
        err_avg = launch_execution(ds_file, runs, params);
        time = toc;
        lin_results(j,1,i) = c_values(j);
        lin_results(j,2,i) = err_avg;
        lin_results(j,3,i) = time;
    end
    fprintf('Linear kernel processed\n');
    
    % polynomial
    fprintf('Processing polynomial kernel\n');
    row = 1;
    for j=1:length(poly_dimensions)
        for k=1:length(c_values)
            params = {'poly';poly_dimensions(j);c_values(k)};
            fprintf('Using params: d=%d, C=%d\n',poly_dimensions(j), c_values(k));
            tic;
            err_avg = launch_execution(ds_file, runs, params);
            time = toc;
            poly_results(row,1,i) = poly_dimensions(j);
            poly_results(row,2,i) = c_values(k);
            poly_results(row,3,i) = err_avg;
            poly_results(row,4,i) = time;
            row = row + 1;
        end
    end
    fprintf('Polynomial kernel processed\n');
    
    % rbf
    disp('Processing RBF kernel');
    row = 1;
    for j=1:length(rbf_gamma)
        for k=1:length(c_values)
            params = {'rbf';rbf_gamma(j);c_values(k)};
            fprintf('Using params: gamma=%d, C=%d\n',rbf_gamma(j), c_values(k));
            tic;
            err_avg = launch_execution(ds_file, runs, params);
            time = toc;
            rbf_results(row,1,i) = rbf_gamma(j);
            rbf_results(row,2,i) = c_values(k);
            rbf_results(row,3,i) = err_avg;
            rbf_results(row,4,i) = time;
            row = row + 1;
        end
    end
    fprintf('RBF kernel processed\n');
    fprintf('Dataset %s\n processing done\n',ds_names{i});
    fprintf('-----------\n');
end


