function database = automatic_training(database_root_dir)
global delimiter;
%database_root_dir = '..\database\';
database_dir_name=dir(database_root_dir);
grid_index=1;
Grid_name = '';
database={};
%grid_freq =[60,50,60,50,50,50,50,50,60,50];
grid_freq = get_grid_center_freq(database_root_dir);
for i=1:length(database_dir_name)
    grid_name = database_dir_name(i).name;
    if strfind(grid_name,'Grid')
        database(grid_index).name = grid_name;%%
        Grid_name(grid_index) = grid_name(6);
        grid_index = grid_index+1;
        disp(grid_name);
        database_single_grid_dir = strcat(database_root_dir,grid_name,delimiter);
        database_single_grid_name = dir(database_single_grid_dir);
        for j=1:length(database_single_grid_name)
            grid_sample = database_single_grid_name(j).name;
            if strfind(grid_sample,'Audio')
                database_file_dir = strcat(database_single_grid_dir,grid_sample,delimiter);
                database_file_name_list = dir(database_file_dir);
                audio_indx = 1;
                for k=1:length(database_file_name_list)
                    file_name = database_file_name_list(k).name;
                    if strfind(file_name,'wav')
                        audio_file = strcat(database_file_dir,file_name);
                        %%%%%%%% do processing here
                        disp(audio_file);
                        [x,fs] = audioread(audio_file);
                        %%%%%%%%%
                        time_frame=600;%in second
                        Le=time_frame*fs;%total data in one frame
                        L= length(x);
                        total_no_of_frame = ceil(L/Le);
                        %disp(total_no_of_frame);
                        for t=1:total_no_of_frame
                            indx1 = (t-1)*Le+1;
                            indx2 = indx1+Le-1;
                            if indx2>L
                                indx2=L;
                                break;
                            end
                            database(grid_index-1).audio(audio_indx).enf = get_enf(x(indx1:indx2),fs,grid_freq(grid_index-1));%%get_enf_from_audio_signal(x,fs);%%
                            audio_indx = audio_indx+1;
                        end
                    end
                end
            elseif strfind(grid_sample,'Power')
                database_file_dir = strcat(database_single_grid_dir,grid_sample,delimiter);
                database_file_name_list = dir(database_file_dir);
                power_indx = 1;
                for k=1:length(database_file_name_list)
                    file_name = database_file_name_list(k).name;
                    if strfind(file_name,'wav')
                        power_file = strcat(database_file_dir,file_name);
                        %%%% do processing here
                        disp(power_file);
                        [x,fs] = audioread(power_file);
                        %%%%%%%%%%%%%%%%
                        time_frame=600;%in second
                        Le=time_frame*fs;%total data in one frame
                        L= length(x);
                        total_no_of_frame = ceil(L/Le);
                        for t=1:total_no_of_frame
                            indx1 = (t-1)*Le+1;
                            indx2 = indx1+Le-1;
                            if indx2>L
                                indx2=L;
                                break;
                            end
                            database(grid_index-1).power(power_indx).enf = get_enf(x(indx1:indx2),fs,grid_freq(grid_index-1));%%get_enf_from_power_signal(x,fs);%%
                            power_indx = power_indx+1;
                        end
                    end
                end
            end
        end
    end
end
save('database.mat','database');
end