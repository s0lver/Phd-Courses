%%=========================================================
%%  launch_execution
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 1-abril-2015
% Tarea No.: 03
% Clase: 008
% Lanza la ejecución del clasificador svm, realizando las etapas de
% entrenamiento y clasificación.
%%=========================================================
function err_avg = launch_execution(ds_file,runs,params)
% Identificación de características del archivo
labels = ds_file.Y;
data = ds_file.X;
err_avg = 0;
for i=1:runs
    [Xtr, Ytr, Xtt, Ytt] = splitDataset(data, labels, 0.3);
    [sv,alpha_y,w0] = trainSVM(Xtr,Ytr,params);
    [~,err_i] = classifySVM(Xtt,Ytt,sv,alpha_y,w0,params);
    err_avg = err_avg + err_i;
end
err_avg = err_avg/runs;
end