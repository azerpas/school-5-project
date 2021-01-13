import PackageName.Training.*
import PackageName.Test.*

function camera = camScript(urlToCam)
    cam = ipcam(urlToCam); % 'http://192.168.0.34:8080/video'
    disp("Importing network...");
    net = load('net.mat');
    disp("Network retrieved, accessing the camera...");
    preview(cam);
    val = input("Press '1' whenever you're ready to classify the fruit: \n");
    pathToTest = "smartphonePicture";
    if ~exist(pathToTest, 'dir')
        mkdir(pathToTest)
    end
    

    while(val~=0)
        if(val==1)
            disp('Classifying the picture...')
            image = snapshot(cam);
            imshow(image); 
            t = datetime("now","TimeZone",'Europe/Paris');
            saveas(imshow(image), 'smartphonePicture/imageTaken'+datestr(t, 'ddmmmyyyyHHMMSS')+'.png')
            Test(pathToTest,net);
        end
        disp("Please choose an option:");
        disp("1. Classify the image");
        disp("0. Quit the application");
        val = input("Write a number: \n");
    end
end