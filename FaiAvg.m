function R=FaiAvg(x,k)
%����ƽ������ͳ��ƽ������
%�������   x:�ź����� 2D����i�βɼ����������ݣ�
%           k:���ڳ��ȡ�ƽ������
% �ж�ƽ���������ܲ��������Ĺ�ϵ����ʣ�����н��д���
%

L=size(x,1)   %�ܳ���
NumOfR=floor(L/k) %ƽ������ź�����������ȡ��
Remainder=mod(L,k)  %ʣ���ź�����


for i=1:NumOfR        % �ɱ������Ĳ���
    R0(i,:) = 1/k.*sum(x(i:i+k-1,:));
end
RRemainder(1,:)=1/Remainder.*sum(x(L-Remainder+1:L,:),1)
R=[R0;RRemainder]