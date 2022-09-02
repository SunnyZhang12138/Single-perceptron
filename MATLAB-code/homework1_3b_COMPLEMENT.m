clc
clear all
epoch = 20; %��������
[smaple_x1,smaple_x2] = deal([1,0]',[1,1]'); % ÿ������x��ֵ x = [x0,x1,x2]  x0=1
x = [smaple_x1,smaple_x2];
w = [randn(1,length(smaple_x1));zeros(epoch,length(smaple_x1))];  %w �����д洢
eta =0.01; % ѧϰ��

d = [1 0]; %������  desired output       COMPLEMENT
[w0,w1] = deal(0.5,-1);  %COMPLEMENT

for n = 1:epoch
    v = w(n,:)*x;     
    y = hardlim(v);
    error = d-y;
    w(n+1,:) = w(n,:) + eta *error * x';
end
%% ����wight����
figure
set(0,'defaultfigurecolor','w');
plot(1:epoch+1,w(:,1),'c-','linewidth',1.4);
hold on;
plot(1:epoch+1,w(:,2),'b-','linewidth',1.4);
hold on;
xlabel('epoch'); 
ylabel('value of weights');
legend('w0/b','w1');
%% ��������һ��off-line�ĶԱ�ͼ
figure

x1 = [0 1 ]; %һ��㣬����d=0�ĵ�ĺ�����
x2 = [0 0]; %һ��������������
scatter(x1(2),x2(2),'r<','filled')    %d����0�ĵ�
hold on
scatter(x1(1),x2(1),'bs','filled')   %d����1�ĵ�
hold on

t = -1:2;
y1 = -w0/w1;
y2 = -w(epoch+1,1)/w(epoch+1,2);
plot([y1 y1],[-1 3],'m:x','linewidth',1.4);
plot([y2 y2],[-1 3],'y-','linewidth',1.4);
y1_expression = sprintf('off-line calculation:\n%.1f+%.1f*x1 = 0',w0,w1);
y2_expression = sprintf('learning procedure:\n%.1f+%.1f*x1 = 0',w(epoch+1,1),w(epoch+1,2));
legend('d=0','d=1',y1_expression,y2_expression);
title('COMPLEMENT')
xlim([-0.5 2])
ylim([-0.5 2])

    

