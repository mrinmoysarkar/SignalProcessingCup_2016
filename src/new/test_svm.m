function [grid_name,confidence]=test_svm(file_name)
load('train_model.mat');
[x,fs]=audioread(file_name);
[enf,p_a,fc]=get_enf(x,fs,0);
lf=smooth(enf,.5,'rloess');
hf=enf-lf;

if fc==50
    if p_a==0
        sample = enf_feature_50p(lf,hf);
        SVMModels = train_model50p;
        grid_name = grid_name_50p;
    else
        sample = enf_feature_50a(lf,hf);
        SVMModels = train_model50a;
        grid_name = grid_name_50a;
    end
else
    if p_a==0
        sample = enf_feature_60p(lf,hf);
        SVMModels = train_model60p;
        grid_name = grid_name_60p;
    else
        sample = enf_feature_60a(lf,hf);
        SVMModels = train_model60a;
        grid_name = grid_name_60a;
    end
end

p=[];
label='';
for i=1:length(SVMModels)
    [labels,PostProb] = predict(SVMModels{i},sample);
    labels=SVMModels{i}.ClassNames;
    [p(i),mind]=max(PostProb);
    label(i)=char(labels(mind));
end
[m,in]=max(p);
if m > .9
    grid = label(in);
    prob=m;
else
    for i=1:length(grid_name)
        no_of_occurance(i) = length(strfind(label,grid_name(i)));
    end
    [m,in]=max(no_of_occurance);
    indexes=strfind(label,grid_name(in));
    mu = mean(p(indexes));
    %disp(mu);
    grid = 'N';
    if mu > .85
        grid=grid_name(in);
    end
    prob=mu;
end

grid_name=grid;
confidence=prob;
end