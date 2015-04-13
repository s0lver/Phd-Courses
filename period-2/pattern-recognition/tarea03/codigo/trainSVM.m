%%=========================================================
%%  trainSVM
% Materia: Reconocimiento de patrones
% Nombre: Rafael Pérez Torres
% Fecha: 1-abril-2015
% Tarea No.: 03
% Clase: 008
% Entrena la máquina de vectores de soporte con los parámetros
% especificados. Entrega como resultado, el conjunto de vectores de
% soporte, los productos de alpha * y, además del valor del bias.
%%=========================================================
function [sv,alpha_y,w0] = trainSVM(Xtr,Ytr,params)
% Estableciendo parámetros para solucionar el programa cuadrático
N = length(Ytr);
C = params{3,:};
H = (Ytr*Ytr').*kernel(Xtr,Xtr,params);

f = -ones(N,1);
Aeq = Ytr';
beq = 0;
lb = zeros(N,1);
ub = C*ones(N,1);
opt = optimset('Algorithm','interior-point-convex','Display','off');
alpha = quadprog(H,f,[],[],Aeq,beq,lb,ub,[],opt);

% Una vez obtenidos los alpha, seleccionar los índices de aquellos que
% cumplan con la condición 0 < alpha < C
sv_idx = find(alpha > 0 & alpha < C);

% Los datos de entrenamiento cuyo índice coincida con los alphas
% seleccionados son los vectores de soporte.
sv = Xtr(sv_idx,:);


alpha_y = alpha(sv_idx) .* Ytr(sv_idx,:);

% Calculando bias w_0
n_s = length(sv_idx);
outer_sum = 0;
ys_set = Ytr(sv_idx,:);

for s=1:n_s    
    x_s = sv(s,:);
    inner_sum = 0;
    for m=1:n_s
        idx = sv_idx(m);
        inner_sum = ...
            inner_sum + alpha(idx)*Ytr(idx)*kernel(Xtr(idx,:),x_s, params);
    end
    inner_value = ys_set(s,:) - inner_sum;
    outer_sum = outer_sum + inner_value;
end

w0 = (1/n_s) * outer_sum;

end

