function [] = plotCentroids(H, X, Ci, Si, selectedDataset, saveEps)
figure;
plot(X(:,1), X(:,2), 'r+')
%x0=10;y0=10;
x0=0;y0=0;
width=550;height=550;
set(gcf,'units','points','position',[x0,y0,width,height])
hold on


plot(Ci(:,1), Ci(:,2), 'b*')
hold on

th = 0:pi/50:2*pi;
for i=1:H
    xunit = Si(i) * cos(th) + Ci(i,1);
    yunit = Si(i) * sin(th) + Ci(i,2);
    plot(xunit, yunit,'g');
end

if (saveEps == 1)
    saveas(gca, sprintf('%s-centroids.eps',selectedDataset),'epsc');
end
end