function ask = ASK_channel_simulation(transmitted_signal, snr, fb, fc)
%FSK_ 此处显示有关此函数的摘要
%   此处显示详细说明
temp = awgn(transmitted_signal, snr, 'measured');
fc_1 = fc - fb;
fc_2 = fc + fb;
Wn = [fc_1, fc_2] / (1000 / 2);  % 归一化频率（以奈奎斯特频率为单位）
hc = fir1(1024, Wn, 'bandpass');
ask = filter_without_delay(hc, temp); % 使用滤波器对接收信号进行滤波
end
