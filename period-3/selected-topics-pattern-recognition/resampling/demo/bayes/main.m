% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 10-marzo-2014
% Tarea No.: 01
% Clase: 002
% Permite al usuario seleccionar el dataset a procesar e iniciar las tareas
% del clasificador bayesiano

close all; clear all;
datasets = {'clouds01','clouds02','halfkernel','overlapped','twospirals'};
% Cargar dataset
dataset = 'clouds01';
[ds] = load(sprintf('datasets/%s',dataset));

% Crear los subset de entrenamiento (70%) y prueba(30%)
[training, testing] = crossvalind('HoldOut', ds.Y, 0.3);

Xtr = ds.X(:,training);
Ytr = ds.Y(:,training);

Xtt = ds.X(:,testing);
Ytt = ds.Y(:,testing);

% Entrenar y clasificar
[mu_wi,S_wi,P_wi] = trainBayes(Xtr, Ytr);
[Ypred, err] = classifyBayes(Xtt, Ytt, mu_wi, S_wi, P_wi);
% Graficar
plotBayes(Xtt, Ytt, Ypred, mu_wi, S_wi, P_wi, err, dataset);