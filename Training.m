function TrainedNet = Training(pathToTrain)
    % -------------------------
    % Set up training data
    % -------------------------
    imdsTrain = imageDatastore(pathToTrain, 'IncludeSubfolders', true, 'LabelSource', "foldernames");
    nbCategories = numel(categories(imdsTrain.Labels));
    % -------------------------
    % Create new layers to train
    % -------------------------
    net = alexnet;
    layers = net.Layers;
    layersTransfer = layers(1:end-3);
    layersTransfer(end+1) = fullyConnectedLayer(nbCategories, 'WeightLearnRateFactor', 20, 'BiasLearnRateFactor', 20);
    layersTransfer(end+1) = softmaxLayer();
    layersTransfer(end+1) = classificationLayer();
    % -------------------------
    % Modify images to fit network
    % -------------------------
    pixelRange = [-30 30];
    imageAugmenter = imageDataAugmenter( ...
        'RandXReflection',true, ...
        'RandXTranslation',pixelRange, ...
        'RandYTranslation',pixelRange);
    augimdsTrain = augmentedImageDatastore([227,227],imdsTrain, ...
        'DataAugmentation',imageAugmenter);
    % -------------------------
    % Train network with Training data
    % -------------------------
    options = trainingOptions('sgdm', ...
        'LearnRateSchedule','piecewise', ...
        'LearnRateDropFactor',0.2, ...
        'LearnRateDropPeriod',5, ...
        'MaxEpochs',20, ...
        'MiniBatchSize',64, ...
        'Verbose',false, ...
        'ExecutionEnvironment','gpu', % À ENLEVER, si sur CPU
        'Plots','training-progress');
    [net,info] = trainNetwork(augimdsTrain, layers, options);
    disp(info);
    plot(info.TrainingLoss);
    save('./net.mat','net');
    TrainedNet = net;
end