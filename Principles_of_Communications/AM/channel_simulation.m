function received_signal = channel_simulation(transmitted_signal, snr, fc, Fs)
% 添加高斯加性白噪声
temp = awgn(transmitted_signal, snr, 'measured');
% 滤波器及补偿
Wm = 2*fc/Fs;
h = fir1(64,Wm);
received_signal = filter_without_delay(h,temp);
end