function [t,ASK,hc,ch_t] = ASK_modulation(Fs,fc,data,sps)
%FSK_MODULATION 此处显示有关此函数的摘要
%   此处显示详细说明
dt = 1/Fs;
data_1 = data;
N = length(data);                       % 数据序列长度
number_of_samples = round(N * sps);     % 样本总数
t = (0:number_of_samples-1) * dt;       % 时间向量
gt = ones(1, sps);                      % 生成脉冲响应

p_t_1 = zeros(1, number_of_samples);    % 初始化脉冲信号向量
p_t_1(1:sps:end) = data_1;              % 在每个符号周期上设置脉冲信号

s_t_1 = filter(gt, 1, p_t_1);           % 用脉冲响应滤波脉冲信号

lo_t = cos(2 * pi * fc * t);        % 生成本地振荡信号

s_ask = s_t_1 .* lo_t;              % 幅度调制信号

ASK = s_ask;

hc = fir1(1024, [0.17 0.23]);           % 设计低通滤波器
ch_t = filter_without_delay(hc, ASK);   % 使用滤波器对接收信号进行滤波
end

