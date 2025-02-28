function  y=filter_without_delay(h,x)
delay=floor(length(h)/2);
x=[x zeros(1,delay)];
y=filter(h,1,x);
y=y(delay+1:end);