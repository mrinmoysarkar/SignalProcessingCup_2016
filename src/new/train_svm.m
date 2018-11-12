function y=train_svm(database_root_dir)
database = automatic_training(database_root_dir);
[database_LF_HF50,database_LF_HF60]=database_LF_HF_gen(database);


% 60hz audio train
database = database_LF_HF60;
training_matrix=[];
group={};
l=1;
for i=1:length(database)
    data= database(i).audio;
    name = database(i).name(6);
    for j=1:length(data)
        lf=data(j).LF;
        hf=data(j).HF;
        feature = enf_feature_60a(lf,hf);
        training_matrix(l,:) = feature;
        group{l,1}=name;
        l=l+1;
    end
end
[train_model60a,grid_name_60a] = train_model_gen(training_matrix,group);

%60 hz power train
database = database_LF_HF60;
training_matrix=[];
group={};
l=1;
for i=1:length(database)
    data= database(i).power;
    name = database(i).name(6);
    for j=1:length(data)
        lf=data(j).LF;
        hf=data(j).HF;
        feature = enf_feature_60p(lf,hf);
        training_matrix(l,:) = feature;
        group{l,1}=name;
        l=l+1;
    end
end
[train_model60p,grid_name_60p] = train_model_gen(training_matrix,group);

%50 hz audio train
database = database_LF_HF50;
training_matrix=[];
group={};
l=1;
for i=1:length(database)
    data= database(i).audio;
    name = database(i).name(6);
    for j=1:length(data)
        lf=data(j).LF;
        hf=data(j).HF;
        feature = enf_feature_50a(lf,hf);
        training_matrix(l,:) = feature;
        group{l,1}=name;
        l=l+1;
    end
end
[train_model50a,grid_name_50a] = train_model_gen(training_matrix,group);

%50 hz power train
database = database_LF_HF50;
training_matrix=[];
group={};
l=1;
for i=1:length(database)
    data= database(i).power;
    name = database(i).name(6);
    for j=1:length(data)
        lf=data(j).LF;
        hf=data(j).HF;
        feature = enf_feature_50p(lf,hf);
        training_matrix(l,:) = feature;
        group{l,1}=name;
        l=l+1;
    end
end
[train_model50p,grid_name_50p] = train_model_gen(training_matrix,group);
save('train_model.mat','train_model60p','grid_name_60p','train_model60a','grid_name_60a','train_model50p','grid_name_50p','train_model50a','grid_name_50a');
end