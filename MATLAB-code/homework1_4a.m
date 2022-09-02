clc
clear all

[smaple_x1,smaple_x2,smaple_x3,smaple_x4,smaple_x5,smaple_x6] = deal([1 0],[1,0.8],[1,1.6],[1,3],[1,4.0],[1,5.0]); % ÿ������x��ֵ x = [x0,x1,x2]  x0=1
x = [smaple_x1;smaple_x2;smaple_x3;smaple_x4;smaple_x5;smaple_x6];
d = [0.5 1 4 5 6 8 ]'; %������ 

w = inv(x'*x)*x'*d; 
y = x*w;
%% ����wight����
figure
scatter(x(:,2),d,'r','filled')    %d����0�ĵ�
hold on

set(0,'defaultfigurecolor','w');
t  = x(:,2)';
plot(t,y,'c-','linewidth',1.4);
hold on;

xlabel('x'); 
ylabel('y');
y_expression = sprintf('y = %.4f+%.4f*x',w(1),w(2));
legend('sample',y_expression);
