import PackageName.Training.*
import PackageName.Test.*
import PackageName.getfruit.*

pathToTrain = "fruits360/Training";
pathToTest = "fruits360/Test";

function Main = main()
    disp("Hello ! Please choose an option:");
    disp("1. Train the network (Long process)");
    disp("2. Test the network");
    disp("3. Identify a fruit");
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
    else
        disp("Please enter a correct value.");
        main();
    end
end