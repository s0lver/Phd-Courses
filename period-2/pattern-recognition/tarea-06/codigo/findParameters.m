function [ H,Ci,Si, Wi, bestError ] = findParameters( X, Y )
Hmax = 40;
runs = 31;
meanTypes = [1,2];
%results = zeros((Hmax-3)*length(meanTypes), 7);
row = 1;
config_results = struct('H',0,'meanType',0,'bestSi',{},'bestCi',{},'bestWi',{},'bestError',999,'avgError',999);

for h=3:Hmax
    for i=1:length(meanTypes)
        fprintf('Evaluating configuration %d\n',row);
        config_results(row).H = h;
        config_results(row).meanType = meanTypes(i);
        config_results(row).bestError = 100;
        sum_error = 0;
        for j=1:runs
            [Xtr,Ytr, Xval, Yval] = splitDataset(X,Y,0.3);
            H = h;
            [Ci,Si,Wi] = trainRBFN(Xtr',Ytr',H, meanTypes(i));
            
            [~,err] = classifyRBFN(Xval',Yval',Ci,Si,Wi);
            sum_error = sum_error + err;
            
            if (err < config_results(row).bestError)
                config_results(row).bestSi = Si;
                config_results(row).bestCi = Ci;
                config_results(row).bestWi = Wi;
                config_results(row).bestError = err;
            end
        end
        avg_error = sum_error / runs;
        config_results(row).avgError = avg_error;
        row = row + 1;
    end
end


% Localizar al menor error y devolver sus datos
min_error = 999;
idx_min_error = 0;
for j=1:(row-1)
    disp(config_results(j));
    if (config_results(j).bestError < min_error)
        % Identificación del error menor
        min_error = config_results(j).bestError;
        idx_min_error = j;
    end
end


H = config_results(idx_min_error).H;
Ci = config_results(idx_min_error).bestCi;
Si = config_results(idx_min_error).bestSi;
Wi = config_results(idx_min_error).bestWi;
bestError = config_results(idx_min_error).bestError;
% disp(H);
% disp(bestError);
% disp(Ci);
% disp(Si);
% disp(Wi);
end



