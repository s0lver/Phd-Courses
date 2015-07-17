clear all; close all;
load lawdata
rng default  % For reproducibility
[bootstat,bootsam] = bootstrp(1000,@corr,lsat,gpa);
bootsam(:,1:5)

figure; hold on;
scatter(gpa, lsat, 'or');
indices = bootsam(:,1);
seleccionadosGpa = gpa(indices);
seleccionadosLsat = lsat(indices);
scatter(seleccionadosGpa, seleccionadosLsat, '*g');