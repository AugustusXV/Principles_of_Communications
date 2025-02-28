function AM = AM_modulation(Am,m_t,fc,t)
%AM_MODULATION 此处显示有关此函数的摘要
%   此处显示详细说明
s_t=cos(2*pi*fc*t);
AM=(Am+m_t).*s_t;
end

