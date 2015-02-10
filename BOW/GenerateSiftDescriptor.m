function SiftDescriptor = GenerateSiftDescriptor(image,descriptor_opts)

fprintf('Building Sift Descriptors\n\n');

%% parameters
maxImageSize = descriptor_opts.maxImageSize;
gridSpacing = descriptor_opts.gridSpacing;
patchSize = descriptor_opts.patchSize;


    
    %% load image
    
        
        
        I=load_image(image);
        
        [hgt wid] = size(I);
        if min(hgt,wid) > maxImageSize
            I = imresize(I, maxImageSize/min(hgt,wid), 'bicubic');
            [hgt wid] = size(I);
        end
        
        %% make grid (coordinates of upper left patch corners)
        remX = mod(wid-patchSize,gridSpacing);% the right edge
        offsetX = floor(remX/2)+1;
        remY = mod(hgt-patchSize,gridSpacing);
        offsetY = floor(remY/2)+1;
        
        [gridX,gridY] = meshgrid(offsetX:gridSpacing:wid-patchSize+1, offsetY:gridSpacing:hgt-patchSize+1);

        
        %% find SIFT descriptors
        siftArr = find_sift_grid(I, gridX, gridY, patchSize, 0.8);
        siftArr = normalize_sift(siftArr);
%         
%         features.data = siftArr;
%         features.x = gridX(:) + patchSize/2 - 0.5;
%         features.y = gridY(:) + patchSize/2 - 0.5;
%         features.wid = wid;
%         features.hgt = hgt;
%         features.patchSize=patchSize;

        SiftDescriptor=siftArr;
        
        
%         image_dir=sprintf('%s/%s/',opts.localdatapath,num2string(f,4)); % location descriptor
%         save ([image_dir,'/','sift_features'], 'features');           % save the descriptors
        
%         fprintf('The %d th image finished...\n',f);
        

end% function
