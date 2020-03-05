function R=FaiAvg(x,k)
%分离平均，传统的平均方法
%输入变量   x:信号序列 2D（第i次采集，具体数据）
%           k:窗口长度、平均次数
% 判断平均次数和总测量次数的关系，对剩余序列进行处理
%

L=size(x,1)   %总长度
NumOfR=floor(L/k) %平均后的信号数量，向下取整
Remainder=mod(L,k)  %剩余信号序列


for i=1:NumOfR        % 可被整除的部分
    R0(i,:) = 1/k.*sum(x(i:i+k-1,:));
end
RRemainder(1,:)=1/Remainder.*sum(x(L-Remainder+1:L,:),1)
R=[R0;RRemainder]