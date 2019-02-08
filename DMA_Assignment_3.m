% Problem 1
D = [0,2;0,0;1.5,0;5,0;5,2];
D= [2,3,4,5,7,8,12];
C1 = [,2,4];
C2 = [7,8,12,5];
u = [mean(D(C1,:)); mean(D(C2,:))];

eps = Inf;
while(eps > 0)
    for(i=1:5)
        for(j=1:2)
            distD(i,j)= norm(D(i,:)-u(j,:));
        end
    end
    C1 = transpose(find(distD(:,1)<distD(:,2)));
    C2 = transpose(find(distD(:,1)>distD(:,2)));
    del = u - [mean(D(C1,:)); mean(D(C2,:))];
    eps = norm(del(1,:)+del(2,:));
    u = [mean(D(C1,:)); mean(D(C2,:))];
end



% Problem 2
X1 = [0.5;2.2;3.9;2.1;0.5;0.8;2.7;2.5;2.8;0.1];
X2 = [4.5;1.5;3.5;1.9;3.2;4.3;1.1;3.5;3.9;4.1];
X = [X1,X2];
mu1 = [0.5,4.5];
mu2 = [2.2,1.6];
mu3 = [3,3.5];
Mu = [mu1;mu2;mu3];

Sig = [1,0;0,1];
Sig(:,:,2) = [1,0;0,1];
Sig(:,:,3) = [1,0;0,1];
Pc = [1/3 , 1/3 , 1/3];

% (A)  Compute the first EM iterates of the cluster means.
% Expectation step, compute posterior probability W
for (i = 1:3)
    

for (i = 1:3)
    for(j = 1:10)
        pcxj = 0;
        for (k = 1:3)
            pcxj = pcxj + Pc(k)*mvnpdf(X(j,:),Mu(k,:),Sig(:,:,k));
        end
        W(i,j)= Pc(i)*(mvnpdf(X(j,:),Mu(i,:),Sig(:,:,i)))/pcxj;
    end
end
% Compute the updated means
for (i= 1:3)
    Mu1(i,:) = (W(i,:) * X)/(sum(W(i,:)));
end

% (B) Draw the scatter plot
clustercolors = [1 0 0;0 1 0;0 0 1];
scatter(X1,X2,[],[0,0,0])
hold on;
scatter(Mu(:,1),Mu(:,2),[],clustercolors,'s')
hold on;
scatter(Mu1(:,1),Mu1(:,2),[],clustercolors,'d')
legend("Data points","Initial cluster means","Iterated cluster means");
hold off

% (C) Compute the mixture probabilities
for (i = 1:3)
    Pc1(i) = mean(W(i,:));
end

% (D) Compute the covariance matrices
for (i = 1:3)
    sigsum = [0 0 ;0 0];
    for (j = 1:10)
        sigsum = sigsum + W(i,j) * transpose(X(j,:)-Mu(i,:)).*(X(j,:)-Mu(i,:));
    end
    Sig1(:,:,i) = sigsum/(sum(W(i,:)));
end

