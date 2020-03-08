function reK = Rescaled_range_analysis(eta,flag,st)
% eta:噪声强度，分别产生不同噪声 0,1,3,5,7
% flag=1：差分
% 返回reK:Hurst
%Zxy,20/3/8
N = 10000;
reK = [];
for D = 1.1:0.1:1.9%%更改，分别产生不同维数时的差分时间序列
% D= 1.1;
w = Weierstrass(D,N);
t = linspace(0, 1, N);
if flag==1
    %% 后项减前项
    dif = [];
    for i = 1:N-1
        dif = [dif w(i+1)-w(i)];
    end
    gauss = normrnd(0,st,1,N-1);
    % plot(dif)
elseif flag==0
    dif = w;
    gauss = normrnd(0,st,1,N);
else
    disp(['wrong flag'])
end
%% 加噪声
sigma = std(dif);
dif = dif + eta*sigma*gauss;
% gca = figure;
% subplot(1,2,1)
% plot(t,w);
% title(['Weierstrass序列D=',num2str(D)])
%% R/S
re1 = [];
re2 = [];
for tau = 2:900
    epsilon = dif(1:tau);
    epsilon_t = mean(epsilon);
    B_record = [];
    for t = 1:tau
        B = getB(t,tau,epsilon,epsilon_t);
        B_record = [B_record B];
    end
    R = max(B_record) - min(B_record);
    S2 = 0;
    for u = 1:tau
        S2 = S2 + (1/tau)*(epsilon(u) - epsilon_t)^2;
    end
    S = sqrt(S2);
    re1 = [re1 log(R/S)];
    re2 = [re2 log(tau)];
end
%% 画拟合直线
hold on;
k = polyfit(re2,re1,1);
K = k(1);
b = k(2);
x = min(re2):0.1:max(re2);
y = K*x+b;
reK = [reK, K];
% subplot(1,2,2);
% h1 = plot(re2,re1,'r.');
% hold on
% h2 = plot(x,y,'k-','LineWidth',3);
% legend([h1,h2],'不同\tau的分布','拟合直线','Location','SouthEast')
% %
% % DD = 2 - K;
% title(['D=',num2str(D),',H=',num2str(K)]);
% xlabel('log(\tau)');
% ylabel('log(R/S)');
% D0 = D*10;
% saveas(gca,[num2str(D0),'.png']);
end
