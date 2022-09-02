clc
clear all
epoch =50; %迭代次数
[smaple_x1,smaple_x2,smaple_x3,smaple_x4] = deal([1,0,0]',[1,0,1]',[1,1,0]',[1,1,1]'); % 每个样本x的值 x = [x0,x1,x2]  x0=1
x = [smaple_x1,smaple_x2,smaple_x3,smaple_x4];
w = [randn(1,length(smaple_x1));zeros(epoch,length(smaple_x1))];  %w 按照行存储

eta =1.0; % 学习率

% d = [0,0,0,1]; %行向量  desired output   AND
% d = [0,1 1 1]; %行向量  desired output     OR
% d = [1 0]; %行向量  desired output       COMPLEMENT
% d = [1 1 1 0];  %                               NAND

d = [0 1 1 0];  %         XOR

% % [w0,w1,w2] = deal(-1.5,1,1);   % AND
% % [w0,w1,w2] = deal(-0.5,1,1);    % OR
% [w0,w1,w2] = deal(0.5,-1,0);  %COMPLEMENT
% [w0,w1,w2] = deal(1.5,-1,-1);   % NAND

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
xlim([0 50])
