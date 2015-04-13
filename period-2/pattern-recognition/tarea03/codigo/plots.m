%%
% Utilizado para realizar las gráficas una vez terminada la ejecución de
% los procesos (requiere que las variables existan en el workspace actual)
%
lin_error_plot_data = zeros(length(c_values),length(ds_names));
lin_time_plot_data = zeros(length(c_values),length(ds_names));
lin_plot_y_labels = repmat(cellstr(''), length(c_values),1);
for i=1:length(c_values)
    lin_error_plot_data(:,i) = lin_results(:,2,i);
    lin_time_plot_data(:,i) = lin_results(:,3,i);
    lin_plot_y_labels{i} = sprintf('C=%d',c_values(i));
end

size_poly_plot_data = length(poly_dimensions) * length(c_values);
poly_error_plot_data = zeros(size_poly_plot_data, length(ds_names));
poly_time_plot_data = zeros(size_poly_plot_data, length(ds_names));
poly_plot_y_labels = repmat(cellstr(''),size_poly_plot_data,1);
for i=1:length(ds_names)
    poly_error_plot_data(:,i) = poly_results(:,3,i);
    poly_time_plot_data(:,i) = poly_results(:,4,i);
    
    row = 1;
    for j=1:length(poly_dimensions)
        for k=1:length(c_values)
            poly_plot_y_labels{row} = sprintf('D=%d, C=%d', poly_dimensions(j), c_values(k));
            row = row + 1;
        end
    end
end

size_rbf_plot_data = length(rbf_gamma) * length(c_values);
rbf_error_plot_data = zeros(size_rbf_plot_data, length(ds_names));
rbf_time_plot_data = zeros(size_rbf_plot_data, length(ds_names));
rbf_plot_y_labels = repmat(cellstr(''),size_rbf_plot_data,1);
for i=1:length(ds_names)
    rbf_error_plot_data(:,i) = rbf_results(:,3,i);
    rbf_time_plot_data(:,i) = rbf_results(:,4,i);
end
row = 1;
for j=1:length(rbf_gamma)
    for k=1:length(c_values)
        rbf_plot_y_labels{row} = sprintf('Gamma=%.2f, C=%d', rbf_gamma(j), c_values(k));
        row = row + 1;
    end
end
%%%
figure
bar3(lin_error_plot_data,0.5);
title('Comparativa de error');
xlabel('Dataset');
ylabel('Parámetros ejecución');
zlabel('Porcentaje error');
set(gca, 'XTickLabel', ds_names);
set(gca, 'YTickLabel', lin_plot_y_labels);

figure
bar3(lin_time_plot_data,0.5);
title('Comparativa de tiempo');
xlabel('Dataset');
ylabel('Parámetros ejecución');
zlabel('Segundos');
set(gca, 'XTickLabel', ds_names);
set(gca, 'YTickLabel', lin_plot_y_labels);
%%%
figure
bar3(poly_error_plot_data);
title('Comparativa de error');
xlabel('Dataset');
ylabel('Parámetros ejecución');
zlabel('Porcentaje error');
set(gca, 'XTickLabel', ds_names);
set(gca, 'YTick', 1:length(poly_plot_y_labels));
set(gca, 'YTickLabel', poly_plot_y_labels);

figure
bar3(poly_time_plot_data);
title('Comparativa de tiempo');
xlabel('Dataset');
ylabel('Parámetros ejecución');
zlabel('Segundos');
set(gca, 'XTickLabel', ds_names);
set(gca, 'YTick', 1:length(poly_plot_y_labels));
set(gca, 'YTickLabel', poly_plot_y_labels);
%%%
figure
bar3(rbf_error_plot_data);
title('Comparativa de error');
xlabel('Dataset');
ylabel('Parámetros ejecución');
zlabel('Porcentaje error');
set(gca, 'XTickLabel', ds_names);
set(gca, 'YTick', 1:length(rbf_plot_y_labels));
set(gca, 'YTickLabel', rbf_plot_y_labels);

figure
bar3(rbf_time_plot_data);
title('Comparativa de tiempo');
xlabel('Dataset');
ylabel('Parámetros ejecución');
zlabel('Segundos');
set(gca, 'XTickLabel', ds_names);
set(gca, 'YTick', 1:length(rbf_plot_y_labels));
set(gca, 'YTickLabel', rbf_plot_y_labels);