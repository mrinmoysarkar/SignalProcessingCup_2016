function a = enf_feature_60a(lf,hf)
warning('off','all');
a(1)=log(var(xcorr(lf)));%LF
a(2)=iqr(lf);%LF
a(3)=median(hf);%HF
a(4)=sum(periodogram(lf));%LF
end