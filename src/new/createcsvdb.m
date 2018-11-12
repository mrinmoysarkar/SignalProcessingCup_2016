clear all;
close all;


% database50p=[];
% database50a=[];
% 
% database60p=[];
% database60a=[];
% 
% root_dir = dir('../../database_raw/');
% for i1=1:size(root_dir,1)
%     name = root_dir(i1).name;
%     if contains(name,'Grid')
%         grid_dir = dir(strcat('../../database_raw/',name,'/'));
%         for i2=1:size(grid_dir,1)
%             grid_dir_name = grid_dir(i2).name;
%             if contains(grid_dir_name,'recordings')
%                 grid_dir_raw = dir(strcat('../../database_raw/',name,'/',grid_dir_name,'/'));
%                 for i3=1:size(grid_dir_raw,1)
%                     grid_dir_raw_name = grid_dir_raw(i3).name;
%                     if contains(grid_dir_raw_name,'wav')
%                         file_name = strcat('../../database_raw/',name,'/',grid_dir_name,'/',grid_dir_raw_name);
%                         %disp(file_name)
%                         label = getid(name);
%                         %disp(label)
%                         
%                         [x,fs]=audioread(file_name);
%                         [enf,p_a,fc]=get_enf(x,fs,0);
%                         
%                         lf=smooth(enf,.5,'rloess');
%                         hf=enf-lf;
%                         
%                         if fc==50
%                             if p_a==0
%                                 sample = enf_feature_50p(lf,hf);
%                                 temp = [sample p_a fc label];
%                                 database50p=[database50p;temp];
%                             else
%                                 sample = enf_feature_50a(lf,hf);
%                                 temp = [sample p_a fc label];
%                                 database50a=[database50a;temp];
%                             end
%                         else
%                             if p_a==0
%                                 sample = enf_feature_60p(lf,hf);
%                                 temp = [sample p_a fc label];
%                                 database60p=[database60p;temp];
%                             else
%                                 sample = enf_feature_60a(lf,hf);
%                                 temp = [sample p_a fc label];
%                                 database60a=[database60a;temp];
%                             end
%                         end
%                     end
%                 end
%             end
%         end
%     end
% end
% csvwrite('dataset50p.csv',database50p);
% csvwrite('dataset50a.csv',database50a);
% csvwrite('dataset60p.csv',database60p);
% csvwrite('dataset60a.csv',database60a);

% grid_dir_raw = dir('../../Recorded_Local_Power/');
% datasetlocal=[];
% for i3=1:size(grid_dir_raw,1)
%     grid_dir_raw_name = grid_dir_raw(i3).name;
%     if contains(grid_dir_raw_name,'wav')
%         file_name = strcat('../../Recorded_Local_Power/',grid_dir_raw_name);
%         %disp(file_name)
%         label = 10;
%         %disp(label)
%         
%         [x,fs]=audioread(file_name);
%         [enf,p_a,fc]=get_enf(x,fs,0);
%         disp(p_a)
%         disp(fc)
%         
%         lf=smooth(enf,.5,'rloess');
%         hf=enf-lf;
%         
%         
%         sample = enf_feature_50p(lf,hf);
%         temp = [sample p_a fc label];
%         datasetlocal=[datasetlocal;temp];
%     end
% end
% csvwrite('datasetlocal50a.csv',datasetlocal);



% database50p=[];
% database50a=[];
% 
% database60p=[];
% database60a=[];
% 
% grid_dir_raw = dir('../../Practice_dataset/');
% gt = 'AHCFFBGINDAFBDCINNAEHBBADCGNGBDDCHGEAIHIEHECFFNGEI';
% 
% for i3=1:size(grid_dir_raw,1)
%     grid_dir_raw_name = grid_dir_raw(i3).name;
%     if contains(grid_dir_raw_name,'wav')
%         file_name = strcat('../../Practice_dataset/',grid_dir_raw_name);
%         no = extractBetween(grid_dir_raw_name,'Practice_','.wav');
%         no = str2num(no{1});
%         label = gt(no)-'A'+1;
%         %fprintf('label %d no %d :: %s\n',label,no,grid_dir_raw_name);
%         
%         [x,fs]=audioread(file_name);
%         [enf,p_a,fc]=get_enf(x,fs,0);
%         if label == 14
%             fprintf('fc %d p-a %d \n',fc,p_a);
%         end
%         
%         lf=smooth(enf,.5,'rloess');
%         hf=enf-lf;
%         if fc==50
%             if p_a==0
%                 sample = enf_feature_50p(lf,hf);
%                 temp = [sample p_a fc label];
%                 database50p=[database50p;temp];
%             else
%                 sample = enf_feature_50a(lf,hf);
%                 temp = [sample p_a fc label];
%                 database50a=[database50a;temp];
%             end
%         else
%             if p_a==0
%                 sample = enf_feature_60p(lf,hf);
%                 temp = [sample p_a fc label];
%                 database60p=[database60p;temp];
%             else
%                 sample = enf_feature_60a(lf,hf);
%                 temp = [sample p_a fc label];
%                 database60a=[database60a;temp];
%             end
%         end
%     end
% end
% 
% csvwrite('datasetpractice50p.csv',database50p);
% csvwrite('datasetpractice50a.csv',database50a);
% csvwrite('datasetpractice60p.csv',database60p);
% csvwrite('datasetpractice60a.csv',database60a);



database50p=[];
database50a=[];

database60p=[];
database60a=[];

grid_dir_raw = dir('../../Testing_dataset/');
gt = 'NDDCDNNDAFANGBGBFCEHGHHHGHFDAIDNFHIIECBDENIBEFGNAGIINIGHAEFCCCFDGCECGIEICENBEEHADIHCGAABIHCNDBAGBFBB';

for i3=1:size(grid_dir_raw,1)
    grid_dir_raw_name = grid_dir_raw(i3).name;
    if contains(grid_dir_raw_name,'wav')
        file_name = strcat('../../Testing_dataset/',grid_dir_raw_name);
        no = extractBetween(grid_dir_raw_name,'Test_','.wav');
        no = str2num(no{1});
        label = gt(no)-'A'+1;
        %fprintf('label %d no %d :: %s\n',label,no,grid_dir_raw_name);
        
        [x,fs]=audioread(file_name);
        [enf,p_a,fc]=get_enf(x,fs,0);
        if label == 14
            fprintf('fc %d p-a %d \n',fc,p_a);
        end
        
        lf=smooth(enf,.5,'rloess');
        hf=enf-lf;
        if fc==50
            if p_a==0
                sample = enf_feature_50p(lf,hf);
                temp = [sample p_a fc label];
                database50p=[database50p;temp];
            else
                sample = enf_feature_50a(lf,hf);
                temp = [sample p_a fc label];
                database50a=[database50a;temp];
            end
        else
            if p_a==0
                sample = enf_feature_60p(lf,hf);
                temp = [sample p_a fc label];
                database60p=[database60p;temp];
            else
                sample = enf_feature_60a(lf,hf);
                temp = [sample p_a fc label];
                database60a=[database60a;temp];
            end
        end
    end
end

csvwrite('datasettest50p.csv',database50p);
csvwrite('datasettest50a.csv',database50a);
csvwrite('datasettest60p.csv',database60p);
csvwrite('datasettest60a.csv',database60a);



function y=getid(x)
y=0;
if contains(x,'_A')
    y=1;
elseif contains(x,'_B')
    y=2;
elseif contains(x,'_C')
    y=3;
elseif contains(x,'_D')
    y=4;
elseif contains(x,'_E')
    y=5;
elseif contains(x,'_F')
    y=6;
elseif contains(x,'_G')
    y=7;
elseif contains(x,'_H')
    y=8;
elseif contains(x,'_I')
    y=9;
end
end