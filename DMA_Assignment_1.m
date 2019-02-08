% Problem 2
% (a)
X = [69;74;68;70;72;67;66;70;76;68;72;79;74;67;66;71;74;75;75;76];
Y = [153;175;155;135;172;150;115;137;200;130;140;265;185;112;140;150;165;185;210;220];
meanX = mean(X);
medX = median(X);
modeX = mode(X);

meanX
medX
modeX


% (b)
% Using biased version which normalize by n, not n-1
varY = var(Y,1)

% (c)
sigX = sqrt(var(X,1))
x = [30:1:120];
gaussianX = normpdf(x,meanX,sigX);
plot(x,gaussianX)

% (d)
freq = sum(X>80)/size(X,1)

% (e)
muXY = mean([X,Y])
% Matlab uses unbiased variant, so we turned it back to biased version
covXY = cov([X,Y],1)
%*(size(X,1)-1)/size(X,1)

% (f)
muX = ones(size(X,1),1)*mean(X);
muY = ones(size(Y,1),1)*mean(Y);
residueX = X- muX;
residueY = Y- muY;

corrXY = residueX.'* residueY/sqrt(var(X,1)*var(Y,1)*size(X,1)^2)

% (g)
scatter(X,Y)
xlabel('Age')
ylabel('Weight')

% Problem 3 
% (a)
X1 = [8;0;10;10;2];
X2 = [-20;-1;-19;-20;0];
D = [X1,X2]
D = [1,-1;0,1;-1,0]

meanD = mean(D)
covarD = cov(D,1)

% (b)
eig(covarD)

% (c)
scatter(X1,X2)
xlabel('X1')
ylabel('X2')

% (d)
[coeff,score,latent,tsquared,explained] = pca(D) 
%The first principle component is:
pc_1 = COEFF(:,1)


mvnpdf([1,-1],meanD,covarD)
% (e)
%The coordinates of all points projected on the first PC:
(D- ones(size(D,1),1)*mean(D)) * pc_1
trainData_pca = 
