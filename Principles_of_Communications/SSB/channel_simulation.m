function received_signal = channel_simulation(transmitted_signal, snr, fc, fs)
% 模拟通信系统中的信号传输及AWGN干扰
% signal_type: 'sine', 'cosine', or 'square'
% duration: 信号持续时间 (s)
% snr: 信噪比 (dB)

% 添加高斯加性白噪声
temp = awgn(transmitted_signal, snr, 'measured');
% 滤波器及补偿
% 此处fc已经为SSB调制进行调整
Wm = 2*fc/fs;             % 归一化截止频率固定计算方法
h = fir1(64,Wm);          % 窗滤波器
received_signal = filter_without_delay(h,temp);
end
