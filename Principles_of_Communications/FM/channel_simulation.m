function output_signal = channel_simulation(transmitted_signal, snr, Fs, m_f, fm, fc)
% 模拟通信系统中的信号传输及AWGN干扰
% signal_type: 'sine', 'cosine', or 'square'
% duration: 信号持续时间 (s)
% snr: 信噪比 (dB)

% 添加高斯加性白噪声
temp = awgn(transmitted_signal, snr, 'measured');
% 滤波器及补偿
B = (1 + m_f) * fm;
up = fc + B/2;
down = fc - B/2;
bp_window = hamming(65); % 使用 Hamming 窗
h = fir1(64, [down, up]/(Fs/2), 'bandpass', bp_window);
received_signal = filter_without_delay(h,temp);
output_signal = received_signal;
end