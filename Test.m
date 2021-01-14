function Fruits = Test(pathToTest,net) 

    imds = imageDatastore(pathToTest, 'IncludeSubfolders', true, 'LabelSource', "foldernames");
    auds = augmentedImageDatastore([227,227], imds); % Resize to 227 227
    preds = classify(net,auds); 
    disp(preds);
    
    accuracy = sum(result == idsTest.Labels) / numel(idsTest.Labels);
    disp(accuracy);

    confusionchart(idsTest.Labels, result);

end