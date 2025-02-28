function [analytic_signal, instantaneous_phase, instantaneous_frequency, output_signal] = FM_noncoherent_demodulation(input_signal, Fs, fc)

% temp = input_signal/max(abs(input_signal));
% 第一步：计算复包络
analytic_signal = hilbert(input_signal);  % 使用 Hilbert 变换
% 第二步：提取瞬时相位
instantaneous_phase = unwrap(angle(analytic_signal));
% 第三步：计算瞬时频率（相位的一阶差分）(差分代替微分)有问题
instantaneous_frequency = [diff(instantaneous_phase), 0] * Fs / (2*pi);
% 第四步：提取调制信号
output_signal = instantaneous_frequency - fc;  % 消除载波频率的偏移
end