% ========================================================================
% Image Classification using Bag of Words
% Created by zhaofeng(feng1008wd@gmail.com)
% QQ: 710926685
% Sun Yat-sen University,Guangzhou,China
% 02/03/2015
%% initialize the settings
display('*********** start *********')
clc;
ini;
detect_opts=[];descriptor_opts=[];dictionary_opts=[];assignment_opts=[];ada_opts=[];


%% SIFT Descriptors
descriptor_opts.type='sift';                                                     % name descripto
descriptor_opts.name=['des',descriptor_opts.type]; % output name (combines detector and descrtiptor name)
descriptor_opts.patchSize=16;                                                   % normalized patch size
descriptor_opts.gridSpacing=8; 
descriptor_opts.maxImageSize=600;
%GenerateSiftDescriptors(pg_opts,descriptor_opts);
%GenerateSiftDescriptors2(pg_opts,descriptor_opts);

%% SURF Descriptors
descriptor_opts.type='surf';                                                     % name descripto
descriptor_opts.name=['des',descriptor_opts.type]; % output name (combines detector and descrtiptor name)
descriptor_opts.name='NumOctaves';
descriptor_opts.value=4;
GenerateSURFDescriptors(pg_opts,descriptor_opts);

%% Create the texton dictionary
dictionary_opts.dictionarySize = 1000;
dictionary_opts.name='sift_features';
dictionary_opts.type='sift_dictionary';
% %CalculateDictionary(pg_opts, dictionary_opts);
% %CalculateDictionary2(pg_opts, dictionary_opts);

%% Create the texton dictionary
% dictionary_opts.dictionarySize = 1000;
% dictionary_opts.name='surf_features';
% dictionary_opts.type='surf_dictionary';
% CalculateSurfDictionary(pg_opts, dictionary_opts);

%% assignment
assignment_opts.type='1nn';                                 % name of assignment method
assignment_opts.descriptor_name=descriptor_opts.name;       % name of descriptor (input)
assignment_opts.dictionary_name=dictionary_opts.name;       % name of dictionary
assignment_opts.name=['BOW_',descriptor_opts.type];         % name of assignment output
assignment_opts.dictionary_type=dictionary_opts.type;
assignment_opts.featuretype=dictionary_opts.name;
assignment_opts.texton_name='texton_ind';
%do_assignment2(pg_opts,assignment_opts);

%% CompilePyramid
% pyramid_opts.name='spatial_pyramid';
% pyramid_opts.dictionarySize=dictionary_opts.dictionarySize;
% pyramid_opts.pyramidLevels=3;
% pyramid_opts.texton_name=assignment_opts.texton_name;
%CompilePyramid(pg_opts,pyramid_opts);
%CompilePyramid2(pg_opts,pyramid_opts);

%% Classification
% classify_opts.dictionary=dictionary_opts.type;
% classify_opts.dictionarySize = 10;
% kNN(pg_opts,classify_opts);
% do_classification_rbf_svm
% show_results_script
%% histogram intersection kernel
do_classification_inter_svm
show_results_script