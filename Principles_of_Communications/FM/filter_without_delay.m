function  y=filter_without_delay(h,x)
% 零相位 FIR 滤波器
% 在对输入信号进行 FIR 滤波时，补偿由滤波器本身引入的延迟，使输出信号对齐输入信号的起点。
delay=floor(length(h)/2);
x=[x zeros(1,delay)];

y=filter(h,1,x);
% h 是滤波器系数。
% 1 表示滤波器的分母系数（即没有 IIR 部分，滤波器是纯 FIR）。
% x 是待滤波的信号。

y=y(delay+1:end);
end