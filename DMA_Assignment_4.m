% Problem 2

D = [5 8; 10 8; 11 8; 6 7; 10 7; 12 7; 13 7; 5 6; 10 6; 13 6; 6 5; ...
    9 4; 11 5; 14 6; 15 5; 2 4; 3 4; 5 4; 6 4; 7 4; 15 4; 3 3; 7 3; 8 2];
Attrs = ['a';'b';'c';'d';'e';'f';'g';'h';'i';'j';'k';'l';'m';'n';'o';...
    'p';'q';'r';'s';'t';'u';'v';'w';'x'];

for (i = 1:length(D))
    for (j = 1:length(D))
        distanceD(i,j) = norm(D(i,:)-D(j,:));
    end
end


% Problem 3
i=1;
D = [1,5,6,9,15];
for (x = [-1:0.01:20])
    y(i)=0;
    for(j=1:5)   
        y(i) = y(i)+1/(3*5)*(abs((x-D(j))/3)<=1/2);
    end
    i = i+1;
end

x = [-1:0.01:20];
plot(x,y)
hold on;
scatter(D',zeros(5,1))
hold off;
xlabel('x')
ylabel('f(x)')

