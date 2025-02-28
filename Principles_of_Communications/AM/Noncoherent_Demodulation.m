function [m_t,mix_t] = Noncoherent_Demodulation(am_t,fc,Fs)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
mix_t=am_t.*am_t;
Wm=2*fc/Fs;     % 归一化截止频率，决定滤波器的频率范围。
h=fir1(64,Wm);  % 生成一个长度为 64 的 FIR 低通滤波器，用于去掉平方信号中的高频分量
m2_t=filter_without_delay(h,mix_t);
m_t=sqrt(m2_t);

m_t=m_t-mean(m_t);% 去除直流分量
m_t=m_t/max(abs(m_t));  % 归一化
end