function featurevector=do_assign(SiftDescriptor,vocabulary)
    BOW=[];
        
    d2 = EuclideanDistance(SiftDescriptor, vocabulary);
    vocabulary_size=size(vocabulary,1);
    [minz, index] = min(d2', [], 1);

    BOW=hist(index,(1:vocabulary_size));
    texton_ind.data = index;    
    BOW=do_normalize(BOW);
    featurevector=BOW
    %featurevector=BOW.';
%     featurevector=[];
%     
%     for i=1:length(feature)
%         featurevector(feature(i))=featurevector(feature(i))+1;
%     end
end