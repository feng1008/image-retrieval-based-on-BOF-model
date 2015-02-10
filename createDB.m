function [ ] = createDB(imagepath)
    clc;
    ini;
    detect_opts=[];descriptor_opts=[];dictionary_opts=[];assignment_opts=[];ada_opts=[];

    %image_path='D:\matlabproject\BOW\images\images\';
    %image_path=strcat(rootpath,'\images\images\');
    %picstr=dir('D:\matlabproject\BOW\images\images\*.jpg');
 %   image_path=strcat(rootpath,'images\images\');
 %{
    image_path=strcat(imagepath,'\');
    picstr=dir(strcat(image_path,'*.jpg'));
    length=size(picstr,1);

    for i=1:length
        image_names{i}=strcat(sprintf('%s\%s\',image_path,num2str(i)),'.jpg');
        fprintf('The %dth image name done!\n',i);
    end
    save(strcat(rootpath,'image_names'),'image_names');
%}
   
    %% Descriptors
    descriptor_opts.type='sift';                                                     % name descripto
    descriptor_opts.name=['des',descriptor_opts.type]; % output name (combines detector and descrtiptor name)
    descriptor_opts.patchSize=16;                                                   % normalized patch size
    descriptor_opts.gridSpacing=8; 
    descriptor_opts.maxImageSize=600;
    GenerateSiftDescriptors2(pg_opts,descriptor_opts);

    %% Create the texton dictionary
    dictionary_opts.dictionarySize = 600;
    dictionary_opts.name='sift_features';
    dictionary_opts.type='sift_dictionary';
    CalculateDictionary2(pg_opts, dictionary_opts);

    %% assignment
    assignment_opts.type='1nn';                                 % name of assignment method
    assignment_opts.descriptor_name=descriptor_opts.name;       % name of descriptor (input)
    assignment_opts.dictionary_name=dictionary_opts.name;       % name of dictionary
    assignment_opts.name=['BOW_',descriptor_opts.type];         % name of assignment output
    assignment_opts.dictionary_type=dictionary_opts.type;
    assignment_opts.featuretype=dictionary_opts.name;
    assignment_opts.texton_name='texton_ind';
    do_assignment2(pg_opts,assignment_opts);
end
