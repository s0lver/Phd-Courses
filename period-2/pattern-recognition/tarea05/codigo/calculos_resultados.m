clc;
suma_tiempo_total = 0;
for i=1:length(datasets)
    suma_errores = 0;
    suma_tiempos_promedio = 0;
    min_error = 999;
    idx_min_error = 0;
    for j=1:size(superS(i).results,2)
        suma_tiempos_promedio = suma_tiempos_promedio + sum( superS(i).results(j).avgTime);
        suma_errores  = suma_errores + superS(i).results(j).avgError;
        
        if (superS(i).results(j).bestError < min_error)
            min_error = superS(i).results(j).bestError;
            idx_min_error = j;
        end
    end
    %fprintf('dataset %s sumtmp = %f * 31 = %f\n', char(datasets(i)), suma_tiempos_promedio, suma_tiempos_promedio * 31);
    %fprintf('dataset %s promedio x ejecucion= %f\n', char(datasets(i)), suma_tiempos_promedio/size(superS(i).results,2));
    %suma_tiempo_total = suma_tiempo_total + (suma_tiempos_promedio * 31);
    %fprintf('dataset %s avg error = %f\n', char(datasets(i)), suma_errores/size(superS(i).results,2));
    fprintf('dataset %s lowest error = %f in %d conf\n', char(datasets(i)), min_error, idx_min_error);
end
%fprintf('suma tiempo total %f\n',suma_tiempo_total);