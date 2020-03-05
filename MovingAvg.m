function R=MovingAvg(x,k)
% 输入变量   x:信号序列 2D（第i次采集，具体数据）
%            k：窗口长度、平均次数
for i=1:size(x,1)-k+1          % 平均完为L-k+1行
    R(i,:) = 1/k.*sum(x(i:i+k-1,:));
end
        