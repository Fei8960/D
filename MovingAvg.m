function R=MovingAvg(x,k)
% �������   x:�ź����� 2D����i�βɼ����������ݣ�
%            k�����ڳ��ȡ�ƽ������
for i=1:size(x,1)-k+1          % ƽ����ΪL-k+1��
    R(i,:) = 1/k.*sum(x(i:i+k-1,:));
end
        