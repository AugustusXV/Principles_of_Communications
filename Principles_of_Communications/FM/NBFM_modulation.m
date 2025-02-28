function NBFM = NBFM_modulation(t, m_t, fc, A)
%NBFM_MODULATION 此处显示有关此函数的摘要
% 暂时无法观察到明显的FM波形，有待改进
yt = cumtrapz(t, m_t);
% yt = yt - mean(yt); % 去掉直流分量
c1 = A * cos(2*pi*fc*t);
c2 = A * cos(2*pi*fc*t - pi/2);
temp = yt .* c2;
NBFM = c1 - temp;
end

