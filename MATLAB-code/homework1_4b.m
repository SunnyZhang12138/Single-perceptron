clc
clear all

d = [0.5 1 4 5 6 8 ]; %列向量 

epoch = 100; %迭代次数
[smaple_x1,smaple_x2,smaple_x3,smaple_x4,smaple_x5,smaple_x6] = deal([1 0],[1,0.8],[1,1.6],[1,3],[1,4.0],[1,5.0]); % 每个样本x的值 x = [x0,x1,x2]  x0=1
x = [smaple_x1;smaple_x2;smaple_x3;smaple_x4;smaple_x5;smaple_x6];

w = [randn(1,length(smaple_x1));zeros(epoch,length(smaple_x1))];%w 按照行存储
e = [randn(1,length(d));zeros(epoch,length(d))];%w 按照行存储

eta =0.01; % 学习率

for n = 1:epoch
    y = w(n,:)*x';     
    e(n,:) = d-y;
    w(n+1,:) = w(n,:) + eta *e(n,:) * x;
end

%% 画出wight曲线
figure
set(0,'defaultfigurecolor','w');
plot(1:epoch+1,w(:,1),'c-','linewidth',1.4);
hold on;
plot(1:epoch+1,w(:,2),'b-','linewidth',1.4);
hold on;
xlabel('epoch'); 
ylabel('value of weights');
legend('w0/b','w1');

figure
scatter(x(:,2),d,'r','filled'); 
hold on
t  = x(:,2)'; 
plot(t,[ 0.5554 1.7314  2.9074  4.9653  6.4353  7.9052],'c-','linewidth',1.4);
plot(t,y,'b-','linewidth',1.4);
hold on

xlabel('x'); 
ylabel('y');
y2_expression = sprintf('y = %.4f+%.4f*x',w(epoch+1,1),w(epoch+1,2));
legend(y2_expression);

figure
cost = zeros(101,1);
cost = 0.5.*sum(e.*e,2)';
plot(1:epoch+1,cost);
xlabel('epoch'); 
ylabel('Error');
xlim([0 100])


