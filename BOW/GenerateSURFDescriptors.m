function [] = GenerateSURFDescriptors(opts,descriptor_opts)

fprintf('Building Sift Descriptors\n\n');

%% parameters
descriptor_flag=1;
name = descriptor_opts.name;
value = descriptor_opts.value;

% 
% try
%     descriptor_opts2=getfield(load([opts.globaldatapath,'/',descriptor_opts.name,'_settings']),'descriptor_opts');
%     if(isequal(descriptor_opts,descriptor_opts2))
%         descriptor_flag=0;
%         display('descriptor has already been computed for this settings');
%     else
%         display('Overwriting descriptor with same name, but other descriptor settings !!!!!!!!!!');
%     end
% end


if(descriptor_flag)
    
    %% load image
    load(opts.image_names);         % load image in data set
    nimages=opts.nimages;           % number of images in data set
    
    for f = 1:nimages
 
        I=load_image(image_names{f});
        fprintf('Processing %s: \n', image_names{f});
        
        %% find SURF descriptors
        points = detectSURFFeatures(I,name,value);
        [features, valid_points] = extractFeatures(I, points);
        
        image_dir=sprintf('%s/%s',opts.surfpath); % location descriptor
        save ([image_dir,num2str(f),'_surf_features'], 'features');           % save the descriptors
        
        fprintf('The %d th image finished...\n',f);
        
        
        
    end % for
    save ([opts.globaldatapath,'/',descriptor_opts.name,'_settings'],'descriptor_opts');      % save the settings of descriptor in opts.globaldatapath
end % if

end% function
