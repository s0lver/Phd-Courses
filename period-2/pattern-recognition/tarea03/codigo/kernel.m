%%=========================================================
%%  kernel
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 1-abril-2015
% Tarea No.: 03
% Clase: 008
% Aplica la transformación kernel a los datos especificados como argumento
%%=========================================================
function [kernel_matrix] = kernel(A,B,params)
switch params{1}
    case 'lin' 
        kernel_matrix = A*B';
    case 'poly'
        kernel_matrix = power(A*B',params{2});
    case 'rbf'
        % kernel_matrix = exp(-params{2} * power(pdist2(A,B),2));
        kernel_matrix = exp(-params{2} * power( ...
            sqrt(bsxfun(@plus,sum(A.^2,2),sum(B.^2,2)') - 2*(A*B')),...
            2));
        
    otherwise
        error('not recognized')
end
end

