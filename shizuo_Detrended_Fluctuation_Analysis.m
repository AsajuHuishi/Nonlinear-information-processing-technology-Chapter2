%% 画在该eta下不同的D和alpha的关系
clear all
close all
k = figure;
reD = 1.1:0.1:1.9;
eta = 0; st=0.001;
realpha = Detrended_Fluctuation_Analysis(eta,st);
k0 = plot(reD,realpha,'ks','MarkerFaceColor','k');
hold on;

eta = 1; 
realpha = Detrended_Fluctuation_Analysis(eta,st);
k1 = plot(reD,realpha,'ks','MarkerFaceColor','w');
hold on;

eta = 3; 
realpha = Detrended_Fluctuation_Analysis(eta,st);
k2 = plot(reD,realpha,'k^','MarkerFaceColor','k');
hold on;

eta = 5; 
realpha = Detrended_Fluctuation_Analysis(eta,st);
k3 = plot(reD,realpha,'k^','MarkerFaceColor','w');
hold on;

eta = 7; 
realpha = Detrended_Fluctuation_Analysis(eta,st);
k4 = plot(reD,realpha,'ko','MarkerFaceColor','k');
legend([k0,k1,k2,k3,k4],'\eta=0','\eta=1','\eta=3','\eta=5','\eta=7');

xlabel('D');
ylabel('alpha')
title(['DFA'])

saveas(k,['DFA_eta=',num2str(eta),'.png'])