function [freq,spectrum]=analyze_spectrum(x,Fs,NFFT)

Num=floor(length(x)/NFFT)+1;
Tail=Num*NFFT-length(x);
x=[x zeros(1, Tail)];
spectrum=zeros(1,NFFT);
for n=1:Num
    seg=x((n-1)*NFFT+1:n*NFFT);
    spectrum=spectrum+abs(fftshift(fft(seg,NFFT))).^2;
end
%spectrum=10*log10(spectrum);
delta_F=Fs/NFFT;
K=[-NFFT/2:(NFFT/2-1)];
freq=delta_F*K;
end