%% 画在该eta下不同的D和K的关系
clear all
close all
k = figure;
flag = 0;st=0.001;
reD = 1.1:0.1:1.9;
eta = 0; 
reK = Rescaled_range_analysis(eta,flag,st);
k0 = plot(reD,reK,'ks','MarkerFaceColor','k');
hold on;

eta = 1; 
reK = Rescaled_range_analysis(eta,flag,st);
k1 = plot(reD,reK,'ks','MarkerFaceColor','w');
hold on;

eta = 3; 
reK = Rescaled_range_analysis(eta,flag,st);
k2 = plot(reD,reK,'k^','MarkerFaceColor','k');
hold on;

eta = 5; 
reK = Rescaled_range_analysis(eta,flag,st);
k3 = plot(reD,reK,'k^','MarkerFaceColor','w');
hold on;

eta = 7; 
reK = Rescaled_range_analysis(eta,flag,st);
k4 = plot(reD,reK,'ko','MarkerFaceColor','k');
legend([k0,k1,k2,k3,k4],'\eta=0','\eta=1','\eta=3','\eta=5','\eta=7');

xlabel('D');
ylabel('H')
title(['R/S'])

saveas(k,'RS.png')