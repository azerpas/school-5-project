function Fruits = Test(pathToTest,net) 
    idsTest = imageDatastore(pathToTest, 'IncludeSubfolders', true, 'LabelSource', "foldernames");

    pixelRange = [-30 30];
    imageAugmenter = imageDataAugmenter( ...
        'RandXReflection',true, ...
        'RandXTranslation',pixelRange, ...
        'RandYTranslation',pixelRange);
    augimdsTrain = augmentedImageDatastore([227,227],imdsTrain, ...
        'DataAugmentation',imageAugmenter);
        
    result = classify(net,augimdsTrain);
    
    accuracy = sum(result == idsTest.Labels) / numel(idsTest.Labels);
    disp(accuracy);

    confusionchart(idsTest.Labels, result);

end