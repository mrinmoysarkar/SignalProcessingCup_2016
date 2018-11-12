function a = enf_feature_50a(lf,hf)
warning('off','all');
% ONLY HF
a(1)=sum(0.5*abs(hf))/length(hf);
a(2)=log(var(xcorr(hf)));
[G,H]=arburg(hf,4);
a(3)=G(2);
end
