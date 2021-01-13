import PackageName.Training.*
import PackageName.Test.*
import PackageName.getfruit.*
import PackageName.camscript.*

pathToTrain = "fruits360/Training";
pathToTest = "fruits360/Test";

function Main = main()
    disp("Hello ! Please choose an option:");
    disp("1. Train the network (Long process)");
    disp("2. Test the network");
    disp("3. Identify a fruit");
    disp("4. Use camera to identify a fruit");
    x = input("Give a number: ");
    if x == 1
        Training(pathToTrain);
        main();
    else if x == 2
        net = load('net.mat');
        if isempty(net)
            disp("We can't find a 'net.mat' file... We will train the network first.");
            net = Training(pathToTrain);
        end
        Test(pathToTest, net);
        main();
    else if x == 3
        disp("Please enter the relative path to fruit.");
        pathToFruit = input("(ex: ./myfruit.jpg): ");
        net = load('net.mat');
        if isempty(net)
            disp("We can't find a 'net.mat' file... We will train the network first.");
            net = Training(pathToTrain);
        end
        fruit = getFruit(pathToFruit,net);
        disp("The fruit is probably a: "+fruit);
    else if x == 4
        net = load('net.mat');
        if isempty(net)
            disp("We can't find a 'net.mat' file... We will train the network first.");
            net = Training(pathToTrain);
        end
        disp("Please enter url to ipwebcam.");
        urlToCamera = input("(ex: http://192.168.0.34:8080/video): ");
        camScript(urlToCamera);
    else
        disp("Please enter a correct value.");
        main();
    end
end
