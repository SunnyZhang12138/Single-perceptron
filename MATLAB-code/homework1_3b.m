clc
clear all
epoch =30; %迭代次数
[smaple_x1,smaple_x2,smaple_x3,smaple_x4] = deal([1,0,0]',[1,0,1]',[1,1,0]',[1,1,1]'); % 每个样本x的值 x = [x0,x1,x2]  x0=1
x = [smaple_x1,smaple_x2,smaple_x3,smaple_x4];
% w = [randn(1,length(smaple_x1));zeros(epoch,length(smaple_x1))];  %w 按照行存储
w = [[0.2 0.6 1.0];zeros(epoch,length(smaple_x1))];  %w 按照行存储
eta =2.5; % 学习率

% d = [0,0,0,1]; %行向量  desired output   AND
% d = [0,1 1 1]; %行向量  desired output     OR
% d = [1 0]; %行向量  desired output       COMPLEMENT
d = [1 1 1 0];  %                               NAND

% % [w0,w1,w2] = deal(-1.5,1,1);   % AND
% % [w0,w1,w2] = deal(-0.5,1,1);    % OR
% [w0,w1,w2] = deal(0.5,-1,0);  %COMPLEMENT
[w0,w1,w2] = deal(1.5,-1,-1);   % NAND

for n = 1:epoch
    v = w(n,:)*x;     
    y = hardlim(v);
    error = d-y;
    w(n+1,:) = w(n,:) + eta *error * x';
end

%% 画出wight曲线
figure

set(0,'defaultfigurecolor','w');
plot(1:epoch+1,w(:,1),'c-','linewidth',1.4);
hold on;
plot(1:epoch+1,w(:,2),'b-','linewidth',1.4);
hold on;
plot(1:epoch+1,w(:,3),'g-','linewidth',1.4);
xlabel('epoch'); 
ylabel('value of weights');
legend('w0/b','w1','w2');
title('eta =2.5')
%% 画出和上一题off-line的对比图
% 
% 
% x1 = [0 0 1 1]; %一组点，所有d=0的点的横坐标
% x2 = [0 1 0 1]; %一组点的所有纵坐标
% 
% scatter(x1(2:4),x2(2:4),'r<','filled')    %d等于0的点
% hold on
% scatter(x1(1),x2(1),'bs','filled')   %d等于1的点
% hold on
% 
% 
% t = -1:2;
% y1 = -(w1*t+w0)/w2;
% y2 = -(w(epoch+1,2)*t+w(epoch+1,1))/w(epoch+1,3);
% plot(t,y1,'m:x','linewidth',1.4);
% plot(t,y2,'y-','linewidth',1.4);
% xlim([-0.5 2])
% ylim([-0.5 2])
% % y1_expression = sprintf('off-line calculation:\n%.1f+%.1f*x1+%.1f*x2 = 0',w0,w1,w2);
% % y2_expression = sprintf('learning procedure:\n%.1f+%.1f*x1+%.1f*x2 = 0',w(epoch+1,1),w(epoch+1,2),w(epoch+1,3));
% % legend('d=0','d=1',y1_expression,y2_expression);
% title('OR')