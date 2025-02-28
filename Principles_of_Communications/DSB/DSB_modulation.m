function DSB = DSB_modulation(m_t,t,fc)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
carrier = cos(2 * pi * fc * t);
DSB=m_t.*carrier;
end