function Fruits = Test(pathToTest,net) 

    imds = imageDatastore(pathToTest, 'IncludeSubfolders', true, 'LabelSource', "foldernames");
    auds = augmentedImageDatastore([227,227], imds); % Resize to 227 227
    preds = classify(net,auds); 
    disp(preds);
    
    numCorrect = nnz(imds.Labels == preds);
    fracCorrect = numCorrect/numel(preds);
    disp(fracCorrect); % Number of valid results
    confusionchart(imds.Labels, preds);

end