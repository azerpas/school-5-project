function Fruit = getFruit(pathToFruit,net)
    readim = imread(pathToFruit);
    resizedIm = imresize(readim, [227, 227]);
    if isa(net, 'struct') == 1
        [result,score] = classify(net.net, resizedIm);
    else
        [result,score] = classify(net, resizedIm);
    end
    %{ 
        GET SCORES
    %}
    [~,idx] = sort(score,'descend');
    idx = idx(5:-1:1); % Get first 5 scores
    if isa(net, 'struct') == 1
        classes = net.net.Layers(end).Classes;
    else
        classes = net.Layers(end).Classes;
    end
     
    classNamesTop = string(classes(idx));
    scoreTop = score(idx);

    %{
        DISPLAY SCORES
    %}
    h = figure;
    h.Position(3) = 2*h.Position(3);
    ax1 = subplot(1,2,1);
    ax2 = subplot(1,2,2);
    image(ax1, readim);
    title(ax1, {char(result),num2str(max(score),2)});
    barh(ax2, scoreTop)
    xlim(ax2, [0 1])
    title(ax2, 'Top 5')
    xlabel(ax2, 'Probability')
    yticklabels(ax2, classNamesTop)
    ax2.YAxisLocation = 'right';

    Fruit = char(result);
end
