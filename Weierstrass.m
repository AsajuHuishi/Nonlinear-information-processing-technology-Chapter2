function [w] = Weierstrass(D,N)
%Weierstrass����
b = 2; 
t = linspace(0, 1, N);
[T,n] = ndgrid(t, (1:1000));
x = (1-cos(b.^n.*T))./(b.^((2-D)*n));
w = sum(x,2);%��n��ͣ����Ƕ������
w = w(:,1);
w = w';
% plot(t, xs)
end

