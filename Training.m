function TrainFruits = Training(pathToTrain)
    % -------------------------
    % Create new layers to train
    % -------------------------
    net = alexnet;
    layers = net.Layers;
    layers(end-2) = fullyConnectedLayer(4); % 131 nb de classes
    layers(end) = classificationLayer;
    % -------------------------
    % Set up training data
    % -------------------------
    imds = imageDatastore(pathToTrain, 'IncludeSubfolders', true, 'LabelSource', "foldernames");
    disp(imds.Labels);
    % -------------------------
    % Train network with Training data
    % -------------------------
    options = trainingOptions('sgdm','InitialLearnRate', 0.001);
    auds = augmentedImageDatastore([227,227], imds); % Resize to 227 227
    [fruitnet,info] = trainNetwork(auds, layers, options);
    disp(info)
    plot(info.TrainingLoss);
    
    TrainFruits = fruitnet;
end