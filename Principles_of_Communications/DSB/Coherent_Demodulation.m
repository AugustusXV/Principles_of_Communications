function [m_t,mix_t] = Coherent_Demodulation(input,t,fc,Fs)
%UNTITLED3 此处提供此函数的摘要
%   此处提供详细说明
local_t=cos(2*pi*fc*t);
mix_t=input.*local_t;
Wm=2*fc/Fs;
h=fir1(64,Wm);
m_t=filter_without_delay(h,mix_t);
m_t=m_t/max(abs(m_t));
end

