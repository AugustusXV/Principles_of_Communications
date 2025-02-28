function SSB = SSB_modulation(t,fc,fm,am)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
% 相移法
temp = cos(2 * pi * (fc+fm) * t);
s_USB = 1/2 * am .* temp;
SSB = s_USB;
% s_LSB = 1/2 * am .* temp;
% SSB = s_LSB;
end