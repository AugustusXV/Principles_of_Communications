function VSB = VSB_modulation(t,fc,m_t,fN)
%UNTITLED2 此处显示有关此函数的摘要
% fs:截止频率
% fN:采样频率
% 相移法,下边带调制
temp = cos(2*pi*fc*t);
DSB = m_t .* temp;
fs = fc;
fp = 1;
Wp = fp/(fN/2);
Ws = fs/(fN/2);
Rp = 3;  % 通带内最大衰减
Rs = 25; % 阻带内最小衰减
[n,Wn] = buttord(Wp,Ws,Rp,Rs,'s');	% buttord用来根据指标计算阶数和截止频率
[b,a] = butter(n,Wn,'s');   		% 计算模拟低通或带通
VSB = filter(b,a,DSB);
end