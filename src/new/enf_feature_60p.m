function a = enf_feature_60p(lf,hf)
warning('off','all');
s=0;
for i=1:length(hf)-1
    s=s+abs(hf(i+1)-hf(i));
end
a(1)=s;%HF
a(2)=log(var(xcorr(hf)));%HF
[G,H]=arburg(hf,4);
a(3)=log(H);%HF
end
