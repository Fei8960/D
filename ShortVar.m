% 短时能量
%
%
%
function [En,TimeFrame]=ShortVar(x,Fs,FrameLength,FrameStep,win)
%filedir=['F:\文档\录音\'];                % 设置路径
%filename='a.m4a';   % 设置文件名
%fle=[filedir filename];    % 构成完整的路径和文件名
%[x,Fs]=audioread(fle);       % 读入数据文件
%x=x(:,1);
%Fs = Fs; %采样频率
%FrameLength=0.01;            %帧长度，单位s；
%FrameStep=0.01;            %帧移，s
XFrame=framing(x,Fs,FrameLength,FrameStep,win);

 fn=size(XFrame,2);              % 求出帧数
% time=(0:N-1)/Fs;           % 计算出信号的时间刻度
En=zeros(1,length(fn))
for i=1 : fn
     u=XFrame(:,i);              % 取出一帧
     u2=var(u,1);               % 求出方差（/N）
     En(i)=sum(u2);         % 对一帧累加求和
end
 
TimeSignal=(0:length(x)-1)./Fs;
TimeFrame=(0:fn-1).*FrameStep;
subplot 211; plot(TimeSignal,x); % 画出时间波形 
 title('原始波形');
 ylabel('幅值'); xlabel(['时间/s' 10 '(a)']);
% frameTime=frame2time(fn,wlen,inc,Fs);   % 求出每帧对应的时间
subplot 212; plot(TimeFrame,En)     % 画出短时方差图
 title('短时方差');
 ylabel('幅值'); xlabel(['时间/s' 10 '(b)']);
end
