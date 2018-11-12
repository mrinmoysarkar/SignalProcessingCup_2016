function grid_center_freq = get_grid_center_freq(database_root_dir)
global delimiter;
database_dir_name=dir(database_root_dir);
grid_index=0;
grid_center_freq=[];
for i=1:length(database_dir_name)
    grid_name = database_dir_name(i).name;
    if strfind(grid_name,'Grid')
        grid_index = grid_index+1;
        database_single_grid_dir = strcat(database_root_dir,grid_name,delimiter);
        database_single_grid_name = dir(database_single_grid_dir);
        for j=1:length(database_single_grid_name)
            grid_sample = database_single_grid_name(j).name;
            if strfind(grid_sample,'Power')
                database_file_dir = strcat(database_single_grid_dir,grid_sample,delimiter);
                database_file_name_list = dir(database_file_dir);
                for k=1:length(database_file_name_list)
                    file_name = database_file_name_list(k).name;
                    if strfind(file_name,'wav')
                        power_file = strcat(database_file_dir,file_name);
                        %%%% do processing here
                        %disp(power_file);
                        [x,fs] = audioread(power_file);
                        %%%%%%%%%%%%%%%%
                        time_frame=600;%in second
                        Le=time_frame*fs;%total data in one frame
                        L= length(x);
                        for t=1:1
                            indx1 = (t-1)*Le+1;
                            indx2 = indx1+Le-1;
                            if indx2>L
                                indx2=L;
                                break;
                            end
                            enf = get_enf(x(indx1:indx2),fs,0);%%get_enf_from_power_signal(x,fs);%%
                            mu=mean(enf);
                            if mu>48 && mu<52
                                grid_center_freq(grid_index) = 50;
                            else
                                grid_center_freq(grid_index) = 60;
                            end
                        end
                        break;
                    end
                end
                break;
            end
        end
    end
end
end
