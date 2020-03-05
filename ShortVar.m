% ��ʱ����
%
%
%
function [En,TimeFrame]=ShortVar(x,Fs,FrameLength,FrameStep,win)
%filedir=['F:\�ĵ�\¼��\'];                % ����·��
%filename='a.m4a';   % �����ļ���
%fle=[filedir filename];    % ����������·�����ļ���
%[x,Fs]=audioread(fle);       % ���������ļ�
%x=x(:,1);
%Fs = Fs; %����Ƶ��
%FrameLength=0.01;            %֡���ȣ���λs��
%FrameStep=0.01;            %֡�ƣ�s
XFrame=framing(x,Fs,FrameLength,FrameStep,win);

 fn=size(XFrame,2);              % ���֡��
% time=(0:N-1)/Fs;           % ������źŵ�ʱ��̶�
En=zeros(1,length(fn))
for i=1 : fn
     u=XFrame(:,i);              % ȡ��һ֡
     u2=var(u,1);               % ������/N��
     En(i)=sum(u2);         % ��һ֡�ۼ����
end
 
TimeSignal=(0:length(x)-1)./Fs;
TimeFrame=(0:fn-1).*FrameStep;
subplot 211; plot(TimeSignal,x); % ����ʱ�䲨�� 
 title('ԭʼ����');
 ylabel('��ֵ'); xlabel(['ʱ��/s' 10 '(a)']);
% frameTime=frame2time(fn,wlen,inc,Fs);   % ���ÿ֡��Ӧ��ʱ��
subplot 212; plot(TimeFrame,En)     % ������ʱ����ͼ
 title('��ʱ����');
 ylabel('��ֵ'); xlabel(['ʱ��/s' 10 '(b)']);
end
