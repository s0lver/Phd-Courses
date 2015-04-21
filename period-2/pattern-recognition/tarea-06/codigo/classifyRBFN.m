function [ Yp,err ] = classifyRBFN( Xtt,Y,Ci,Si,Wi )
repSi  = repmat(Si,size(Xtt,1),1);
X  = exp(-(dist(Xtt,Ci').^2)./(2*repSi.^2));
X = [X ones(size(X,1),1)];
Ytesting = X * Wi;
Yp = Ytesting > 0.5;
E = Y - Yp;
err = mean(E .^ 2);
end