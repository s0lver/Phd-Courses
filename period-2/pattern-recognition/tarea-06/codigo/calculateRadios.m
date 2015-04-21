function [ Si ] = calculateRadios( Ci, H, Kradios, tipoMedia )
Si = zeros(1,H);
distances = dist(Ci');
consideredDistances = zeros(Kradios, H);
% first radio
centroidDistances = distances(2:end, 1);
orderedDistances = sort(centroidDistances);
consideredDistances(:,1) = orderedDistances(1:Kradios);

%in-between radios
for i=2:(H-1)
    centroidDistances = distances([1:i-1 i+1:end], i);
    orderedDistances = sort(centroidDistances);
    consideredDistances(:,i) = orderedDistances(1:Kradios);
end

% last radio
centroidDistances = distances(1:(H-1), H);
orderedDistances = sort(centroidDistances);
consideredDistances(:,H) = orderedDistances(1:Kradios);

for i=1:H
    if (tipoMedia == 1)
        Si(i) = sqrt(sum(consideredDistances(:,i).^2)/Kradios);
    else
        Si(i) = sqrt(prod(consideredDistances(:,i)));
    end
end
end

