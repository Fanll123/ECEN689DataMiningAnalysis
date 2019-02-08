%Task 1
% Import the data
% The text file is copied into default working directory
T = readtable("traceDMA.txt");
T.Properties.VariableNames = [{'Port'},{'Size'},{'Class'}];
% Draw the scatter plot
T_tcp = T(T.Class=="tcp",:);
T_udp = T(T.Class=="udp",:);

scatter(table2array(T_tcp(:,1)),table2array(T_tcp(:,2)),[],'r');
hold on;
scatter(table2array(T_udp(:,1)),table2array(T_udp(:,2)),[],'b');
legend('tcp','udp')
xlabel('Port')
ylabel('Size')
set(gca,'xscale','log')
set(gca,'yscale','log')
hold on
% My split points
yL = get(gca,'YLim');
xL = get(gca,'XLim');
xs1 = 600;
line([xs1,xs1],yL,'Color','black','LineWidth',2);

ys2 = 300;
line(xL,[ys2,ys2],'Color','black','LineWidth',2);

ys3 = 15;
line(xL,[ys3,ys3],'Color','black','LineWidth',2);

ys4 = 2.5;
line(xL,[ys4,ys4],'Color','black','LineWidth',2);

xs5 = 5000;
line([xs5,xs5],yL,'Color','black','LineWidth',2);

xs6 = 1280;
line([xs6,xs6],yL,'Color','black','LineWidth',2);

xs7 = 2000;
line([xs7,xs7],yL,'Color','black','LineWidth',2);

xs8 = 3000;
line([xs8,xs8],yL,'Color','black','LineWidth',2);

ys9 = 1150;
line(xL,[ys9,ys9],'Color','black','LineWidth',2);

ys11 = 10;
line(xL,[ys11,ys11],'Color','black','LineWidth',2);

%Task 2
%Implement decision tree using gini index as purity
%Purity threshold is 0.01, Size threshold is 20
Dtree = fitctree(T(:,[1,2]),T(:,3),'SplitCriterion','gdi','PruneCriterion','impurity','MinLeafSize',20);
dtree_prune = prune(Dtree,'Alpha',0.01);
view(dtree_prune,'Mode','graph')

%Plot the decision tree boundary with training data
[KX,KY]=meshgrid(10.^([0:0.01:log10(64000)]), 10.^([0:0.01:log10(4000)]));
kx = KX(:);
ky = KY(:);
[classname,node]=predict(Dtree ,[kx,ky]);
gscatter(kx,ky,classname,'gy')
set(gca,'xscale','log')
set(gca,'yscale','log')
xlabel('Port')
ylabel('Size')
hold on;
scatter(table2array(T_tcp(:,1)),table2array(T_tcp(:,2)),[],'r');
hold on;
scatter(table2array(T_udp(:,1)),table2array(T_udp(:,2)),[],'b');