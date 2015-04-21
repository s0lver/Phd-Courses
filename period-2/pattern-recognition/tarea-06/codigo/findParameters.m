%%=========================================================
%%  findParameters
% Materia: Reconocimiento de patrones 
% Nombre: Rafael Pérez Torres 
% Fecha: 20-abril-2015 
% Tarea No.: 06
% Clase: 012 
% Permite realizar el entrenamiento híbrido, devolviendo los parámetros que
% alcanzan mejores (menores) valores de error
%%=========================================================
function [ H,Ci,Si, Wi, bestError ] = findParameters( X, Y )
% Parámetros globales de la ejecución
Hmax = 40;
runs = 31;
meanTypes = [1,2];
row = 1;
config_results = struct('H',0,'meanType',0,'bestSi',{},'bestCi',{},'bestWi',{},'bestError',999,'avgError',999);

for h=3:Hmax                            % Por cada cantidad de neuronas
    for i=1:length(meanTypes)           % Por cada tipo de media
        fprintf('Evaluating configuration %d\n',row);
        config_results(row).H = h;
        config_results(row).meanType = meanTypes(i);
        config_results(row).bestError = 100;
        sum_error = 0;
        for j=1:runs                    % Durante 31 ejecuciones
            [Xtr,Ytr, Xval, Yval] = splitDataset(X,Y,0.3);
            H = h;
            [Ci,Si,Wi] = trainRBFN(Xtr',Ytr',H, meanTypes(i));
            
            [~,err] = classifyRBFN(Xval',Yval',Ci,Si,Wi);
            sum_error = sum_error + err;
            
            if (err < config_results(row).bestError)    % Rescatar el menor error
                config_results(row).bestSi = Si;
                config_results(row).bestCi = Ci;
                config_results(row).bestWi = Wi;
                config_results(row).bestError = err;
            end
        end
        avg_error = sum_error / runs;
        config_results(row).avgError = avg_error;       % Indicar error promedio
        row = row + 1;
    end
end


% Localización del índice de la configuración con menor error
min_error = 999;
idx_min_error = 0;
for j=1:(row-1)
    disp(config_results(j));
    if (config_results(j).bestError < min_error)
        min_error = config_results(j).bestError;
        idx_min_error = j;
    end
end


% Devolución de los datos de la configuración que alcanzó el menor error
H = config_results(idx_min_error).H;
Ci = config_results(idx_min_error).bestCi;
Si = config_results(idx_min_error).bestSi;
Wi = config_results(idx_min_error).bestWi;
bestError = config_results(idx_min_error).bestError;
end



