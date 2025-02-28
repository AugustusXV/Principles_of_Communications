function [y_t_1,y_t_2,z_t_1,z_t_2,fsk_out] = FSK_demodulation_nc(fsk,fc_1,fc_2,fb,band,Fs,t)
%FSK_DEMODULATION_NC 此处显示有关此函数的摘要
%   此处显示详细说明
% fsk 整流后的波形
% z_t 滤波后的信号
% 
% 


f_hc1=2*(fc_1-1/2*band)/Fs;
f_hc2=2*(fc_1+1/2*band)/Fs;

f_hc3=2*(fc_2-1/2*band)/Fs;
f_hc4=2*(fc_2+1/2*band)/Fs;

%%设置带通滤波器_1
hc_1=fir1(1024,[f_hc1 f_hc2]);
ch_t_1=filter_without_delay(hc_1,fsk);

hc_2=fir1(1024,[f_hc3 f_hc4]);
ch_t_2=filter_without_delay(hc_2,fsk);

%%和本地载波相乘解调_1
lo_t_1=cos(2*pi*fc_1*t);
y_t_1=ch_t_1.*lo_t_1;     %%解调

lo_t_2=cos(2*pi*fc_2*t);
y_t_2=ch_t_2.*lo_t_2;     %%解调

hl=fir1(128,2*fb/Fs);    %%进行低通滤波
z_t_1=filter_without_delay(hl,y_t_1);
z_t_2=filter_without_delay(hl,y_t_2);

fsk_out = z_t_1 - z_t_2;

end

