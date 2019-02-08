% Question 1

% The categorical value for "T", "F" are replaced by "0","1" respectively.
% The labels for "Y" and "N" are replaced by "1" and "0" respectively

Xtrain = [1,1,5;1,1,7;1,0,8;0,0,3;0,1,7;0,1,4;0,0,5;1,0,6;0,1,1]
Ytrain = [1;1;0;1;0;0;0;1;0];

nY = sum(Ytrain == 1)
nN = sum(Ytrain == 0)

P1_a1_Y = sum(Xtrain(Ytrain == 1,1)==1)/nY
P1_a2_Y = sum(Xtrain(Ytrain == 1,2)==0)/nY

mu_a3_Y = sum(Xtrain(Ytrain == 1,3))/nY
sig_a3_Y = sqrt(norm((Xtrain(Ytrain == 1,3)-mu_a3_Y),2)^2/nY)

P1_a1_N = sum(Xtrain(Ytrain == 0,1)==1)/nN
P1_a2_N = sum(Xtrain(Ytrain == 0,2)==0)/nN

mu_a3_N = sum(Xtrain(Ytrain == 0,3))/nN
sig_a3_N = sqrt(norm((Xtrain(Ytrain == 0,3)-mu_a3_N),2)^2/nN)

% For the testing point (T,F,1.0):
P_CY = 4/9*P1_a1_Y*P1_a2_Y*normpdf(1,mu_a3_Y,sig_a3_Y)
P_CN = 5/9*P1_a1_N*P1_a2_N*normpdf(1,mu_a3_N,sig_a3_N)
P_Y = P_CY/(P_CY+P_CN)

Class = P_Y > 1/2

% Question 2

% The input test point is (3,4)

xt = [3,4];

mu1 = [1,3];
mu2 = [5,5];

Sig1 = [5 3;3 2];
Sig2 = [2 0;0 1];
p_c1 =0.5;
p_c2 = 0.5;

px_c1 = p_c1*mvnpdf(xt,mu1,Sig1);
px_c2 = p_c2*mvnpdf(xt,mu2,Sig2);
px_1 = px_c1/(px_c1+px_c2);

Class = 2-(px_1>0.5)

% Question 3

% The categorical value for "Sport", "Vintage" and "SUV" are replaced by 
% "1","2","3" respectively.
% The labels for "L" and "H" are replaced by "0" and "1" respectively

D = [25,1;20,2;25,1;45,3;20,1;25,3];
Y = [0;1;0;1;1;1];

% The purity threshould is 100%
Pt = 1;
n = length(D);
n0 = sum(Y==0);
n1 = sum(Y==1);

pureity_D = max(n0/n, n1/n);
decision_tree = tree;


