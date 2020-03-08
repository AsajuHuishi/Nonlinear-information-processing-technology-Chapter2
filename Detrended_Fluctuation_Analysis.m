function realpha = Detrended_Fluctuation_Analysis(eta,st)
% eta:噪声强度，分别产生不同噪声 0,1,3,5,7
% 返回realpha:alpha的值
%Zxy,20/3/8
showfig = 0;
N = 10000;
realpha = [];
for D = 1.1:0.1:1.9%%更改，分别产生不同维数时的差分时间序列
% D = 1.1;
w = Weierstrass(D,N);
%% 加噪声
gauss = normrnd(0,st,1,N);
sigma = std(w);
w = w + eta*sigma*gauss;
%% 计算累计离差序列
m = mean(w);
dif = [];
for i = 1:N
    tmp = w(i)-m;
    dif = [dif tmp];
end
y = cumsum(dif);
t = linspace(0, 1, N);
%% 分割区间
Fn = [];
nn = [10 25 40 50 80 100 125 200 250 400 500 1000];
for n = nn%每个区间的长度
    val = N/n;
    yn_total = [];
    for t0 = 1:val
        yval = y(1+(t0-1)*n:t0*n);
        xval = 1+(t0-1)*n:t0*n;
        k = polyfit(xval,yval,1);
        yn = k(1)*xval+k(2);
        yn_total = [yn_total yn];
    end
    F = sqrt((1/N)*sum((yn_total - y).*(yn_total - y)));
    Fn = [Fn F];
end
y1 = log(Fn);
x1 = log(nn);
k1 = polyfit(x1,y1,1);
xx = min(x1):0.1:max(x1);
yfit = k1(1)*xx+k1(2);
%% 画图
if showfig==1
gca = figure;
h1 = plot(x1,y1,'r*');
hold on;
xlabel('log(n)')
ylabel('log[F(n)]')
h2 = plot(xx,yfit,'k-','LineWidth',2);
legend([h1,h2],'不同n的分布','拟合直线','Location','SouthEast')
title(['DFA双对数坐标关系\eta=',num2str(eta),'D=',num2str(D),'斜率\alpha=',num2str(k1(1))]);
saveas(gca,['DFA_',num2str(D),'.png']);
end %endfor showfig
realpha = [realpha k1(1)];
end% endfor D=1.1:0.1:1.9
end %function

