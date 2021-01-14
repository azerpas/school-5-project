import PackageName.Training.*
import PackageName.Test.*
import PackageName.getfruit.*
import PackageName.camscript.*

mainF();

function Main = mainF()
    pathToTrain = "fruits360/Training";
    pathToTest = "fruits360/Test";
    disp("Hello ! Please choose an option:");
    disp("1. Train the network (Long process)");
    disp("2. Test the network");
    disp("3. Identify a fruit");
    disp("4. Use camera to identify a fruit");
    x = input("Give a number: ");
    if x == 1
        Training(pathToTrain);
        mainF();
    elseif x == 2
        net = loadnet('net.mat');
        if isempty(net)
            disp("We can't find a 'net.mat' file... We will train the network first.");
            net = Training(pathToTrain);
        end
        Test(pathToTest, net);
        mainF();
    elseif x == 3
        disp("Please enter the relative path to fruit.");
        pathToFruit = input("(ex: ./myfruit.jpg): ");
        net = loadnet('net.mat');
        if isempty(net)
            disp("We can't find a 'net.mat' file... We will train the network first.");
            net = Training(pathToTrain);
        end
        fruit = getfruit(pathToFruit,net);
        disp("The fruit is probably a: "+fruit);
    elseif x == 4
        net = loadnet('net.mat');
        if isempty(net)
            disp("We can't find a 'net.mat' file... We will train the network first.");
            net = Training(pathToTrain);
        end
        disp("");
        disp("Please enter url to ipwebcam with """" in between  ");
        urlToCamera = input("(ex: ""http://192.168.0.34:8080/video""): ");
        path = camscript(urlToCamera);
    else
        disp("Please enter a correct value.");
        mainF();
    end
end

function Net = loadnet(file)
    try
        Net = load(file);
    catch 
        warning("We can't find a 'net.mat' file");
        Net = zeros(0);
    end
end