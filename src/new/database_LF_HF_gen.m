function [database_LF_HF50,database_LF_HF60]=database_LF_HF_gen(database)
database_LF_HF50={};
database_LF_HF60={};
k=1;
l=1;
for i=1:length(database)             
    audio_enf = database(i).audio;
    power_enf = database(i).power;
    mu = mean(power_enf(1).enf);
    
    for j=1:length(audio_enf)
        enf = audio_enf(j).enf;
        LF = smooth(enf,.5,'rloess');
        HF = enf-LF;
        if mu >48 && mu <52
            database_LF_HF50(k).name=database(i).name;
            database_LF_HF50(k).audio(j).LF=LF;
            database_LF_HF50(k).audio(j).HF=HF;
        else
            database_LF_HF60(l).name=database(i).name;
            database_LF_HF60(l).audio(j).LF=LF;
            database_LF_HF60(l).audio(j).HF=HF;
        end
    end
    for j=1:length(power_enf)
        enf = power_enf(j).enf;
        LF = smooth(enf,.5,'rloess');
        HF = enf-LF;
        if mu >48 && mu <52
            database_LF_HF50(k).name=database(i).name;
            database_LF_HF50(k).power(j).LF=LF;
            database_LF_HF50(k).power(j).HF=HF;
        else
            database_LF_HF60(l).name=database(i).name;
            database_LF_HF60(l).power(j).LF=LF;
            database_LF_HF60(l).power(j).HF=HF;
        end
    end
    if mu >48 && mu <52
        k=k+1;
    else
        l=l+1;
    end
end
%save('database_LF_HF.mat','database_LF_HF50','database_LF_HF60');
end