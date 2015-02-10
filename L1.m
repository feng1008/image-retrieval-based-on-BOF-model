function L1(numOfReturnedImages, queryImageFeatureVector, queryImage_name, dataset)

% extract image fname from queryImage and dataset

%dataset_image_names = dataset(:, end);

% compute manhattan distance
ini;
image_path=pg_opts.imgpath;
% image_names=getfield(load(strcat(rootpath,'image_names.mat')),'image_names');
manhattan = zeros(size(dataset, 1), 1);
for k = 1:size(dataset, 1)
    manhattan(k) = sum( abs(dataset(k, :) - queryImageFeatureVector) ./ ( 1 + dataset(k, :) + queryImageFeatureVector ) );
end

% add image fnames to manhattan
%manhattan = [manhattan dataset_image_names];

% sort them according to smallest distance
[sortedDist index] = sortrows(manhattan);
%sortedImgs = sortedDist(:, 2);

% clear axes
arrayfun(@cla, findall(0, 'type', 'axes'));

% display query image
%str_name = int2str(queryImage_name);
%queryImage = imread( strcat('images\', str_name, '.jpg') );
queryImage=imread(queryImage_name);
subplot(3, 7, 1);
imshow(queryImage, []);
title('Query Image', 'Color', [1 0 0]);

% dispaly images returned by query
for m = 1:numOfReturnedImages
%     img_name=index(m);
    img_name = image_names(index(m));
    [pathstr, name, ext] = fileparts(img_name{1});
%     str_name = strcat(image_path, img_name, '.jpg');
    returnedImage = imread(img_name{1});
    subplot(3, 7, m+1);
    imshow(returnedImage, []);
    title(strcat(name, ext), 'Color', [1 0 1]);
end

end