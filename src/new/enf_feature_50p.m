function a = enf_feature_50p(lf,hf)
warning('off','all');
a(1)=mean(lf);%lF
s=0;
for i=1:length(lf)-1
    s=s+abs(lf(i+1)-lf(i));
end
a(2)=s;%lF
a(3)=max(lf)/rms(lf);%lF
a(4)=median(lf);%lf
end

