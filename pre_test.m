clc,clear;
rootpath=pwd;
image_path=strcat(rootpath,'\images\');
picstr=dir(strcat(image_path,'\*.jpg'));
image_length=size(picstr,1);
%% To generate the image_names
for i=1:image_length
    image_names{i}=strcat(sprintf('%s%s',image_path,picstr(i).name));
    fprintf('The %dth image name done!\n',i);
end
save(strcat(rootpath,'\labels\','image_names'),'image_names');

%% To resize the images
% image_names=getfield(load(strcat(rootpath,'image_names')),'image_names');
% for i=1:length
%     I=imread(image_names{i});
%     I=imresize(I,[256 256]);
%     imwrite(I,image_names{i});
% end