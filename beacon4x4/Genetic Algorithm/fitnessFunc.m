function z=fitnessFunc(x)
x1=round(x(1));
x2=round(x(2));
A=gaEuclidean('k');
z=A(x1,x2);
end

