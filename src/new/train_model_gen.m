function [train_model,grid_name] = train_model_gen(training,group)
warning('off','all');
classesall = unique(group);
grid_name = char(classesall);
t=1:length(classesall);
combination_matrix = combnk(t,2);
[r,c]=size(combination_matrix);
for k=1:r
    grid_no = combination_matrix(k,:);
    yy={};
    xx=[];
    l=1;
    for i=1:2
        for j=1:length(training)
            if char(classesall(grid_no(i))) == char(group(j))
                xx(l,:)=training(j,:);
                yy{l,1}=char(group(j));
                l=l+1;
            end
        end
    end
    classes = unique(yy);
    SVMModels{k} = fitcsvm(xx,yy,'ClassNames',classes,'Standardize',true,...
        'KernelFunction','rbf','BoxConstraint',1);
    CompactSVMModel = compact(SVMModels{k});%
    CompactSVMModel = fitPosterior(CompactSVMModel,xx,yy);%
    SVMModels{k} = CompactSVMModel;
end
train_model = SVMModels;
end