function FM = FM_modulation(t,m_t,K_f,fc,A)
%UNTITLED 此处显示有关此函数的摘要
%   此处显示详细说明
yt = cumtrapz(t, m_t);
% yt = yt - mean(yt); % 去掉直流分量

% 计算瞬时相位
phi_t = K_f * yt;

% 生成 FM 信号
FM = A * cos(2*pi*fc*t + phi_t);
end