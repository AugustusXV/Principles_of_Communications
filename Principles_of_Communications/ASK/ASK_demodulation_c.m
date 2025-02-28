function [y_t,z_t,fsk_out] = ASK_demodulation_c(ask,fc,fb,band,Fs,t)
%FSK_DEMODULATION_NC 此处显示有关此函数的摘要
%   此处显示详细说明
% ask 整流后的波形
% z_t 滤波后的信号

f_hc1 = 2*(fc - 1/2*band)/Fs;
f_hc2 = 2*(fc + 1/2*band)/Fs;


%%设置带通滤波器_1
hc_1 = fir1(1024,[f_hc1 f_hc2]);
ch_t_1 = filter_without_delay(hc_1,ask);

%%和本地载波相乘解调_1
lo_t_1 = cos(2*pi*fc*t);
y_t = ch_t_1.*lo_t_1;     %%解调

hl = fir1(128,2*fb/Fs);    %%进行低通滤波
z_t = filter_without_delay(hl,y_t);

fsk_out = z_t;

end

