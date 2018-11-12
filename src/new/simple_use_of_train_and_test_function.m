clear all;
close all;

global delimiter;
practice_or_test = 1; %0=practice, 1=test
os = 0; %0==linux or mac, 1=windows
if os == 0
    delimiter = '/'; % for linux or mac
else
    delimiter = '\';
end
train_database_root_directory=strcat('..',delimiter,'..',delimiter,'database_raw',delimiter);%this is the root directory of the trainning database
%train_svm(train_database_root_directory);% this will generate the svm trained model

%%%%%check only one data sample
%  test_file_name = 'C:\Users\mrinmoy\Google Drive\spcup\Practice_dataset\Practice_50.wav';%this is the file name of the test data with full path name with .wav extension;
%  [gridname,confidence] = test(test_file_name);
%  disp(gridname);

%%%%%check multiple data sample at a time
practice_ground_truth = 'AHCFFBGINDAFBDCINNAEHBBADCGNGBDDCHGEAIHIEHECFFNGEI';
test_ground_truth = 'NDDCDNNDAFANGBGBFCEHGHHHGHFDAIDNFHIIECBDENIBEFGNAGIINIGHAEFCCCFDGCECGIEICENBEEHADIHCGAABIHCNDBAGBFBB';
if practice_or_test == 0
%%%%% for practice data
    test_file_rootdir = strcat('..',delimiter,'..',delimiter,'Practice_dataset',delimiter,'Practice_');
    No_of_tests = 50;%for practice it is 50 for test data it is 100
    x_true = practice_ground_truth;
else
%%%%% for test data
    test_file_rootdir = strcat('..',delimiter,'..',delimiter,'Testing_dataset',delimiter,'Test_');
    No_of_tests = 100;%for practice it is 50 for test data it is 100
    x_true = test_ground_truth;
end



for i=1:No_of_tests
    filename = strcat(test_file_rootdir,num2str(i),'.wav');
    [gridname(i),confidence(i)] = test_svm(filename);
end
disp(gridname);

%calculate accuracy

x_pred = gridname;

j=0;
for i = 1:length(x_true)
    if x_pred(i)==x_true(i)
        j=j+1;
    end
end

fprintf('accuracy: %.2f %%\n',(j*100)/length(x_true));