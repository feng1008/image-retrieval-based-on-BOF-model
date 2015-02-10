% ========================================================================
% Image Classification using Bag of Words
% Created by zhaofeng(feng1008wd@gmail.com)
% QQ: 710926685
% Sun Yat-sen University,Guangzhou,China
% 02/03/2015

clear pg_opts
rootpath=pwd;

%%
addpath BOW;

%% change these paths to point to the image, data and label location
images_set=strcat(rootpath,'\images\');
datapath=strcat(rootpath,'\data\');
globalpath=strcat(datapath,'\global\');
siftpath=strcat(datapath,'\sift\');
hogpath=strcat(datapath,'\hog\');
surfpath=strcat(datapath,'\surf\');
labels=strcat(rootpath,'\labels\');

%%
pg_opts.imgpath=images_set; % image path
pg_opts.datapath=datapath;
pg_opts.globaldatapath=globalpath;
pg_opts.siftpath=siftpath;
pg_opts.hogpath=hogpath;
pg_opts.surfpath=surfpath;
pg_opts.labelspath=labels;

%%
pg_opts.image_names=sprintf('%simage_names.mat',labels);
image_names=getfield(load(pg_opts.image_names),'image_names');
pg_opts.nimages=length(image_names);

%% creat the directory to save data 
MakeDataDirectory(pg_opts);
