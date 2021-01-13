import PackageName.Training.*
import PackageName.Test.*

cam = ipcam('http://192.168.0.34:8080/video');
disp("Réseau en cours d'importation, veuillez patienter");
load('fruitnet.mat');
disp("Réseau importer");
preview(cam);
val = input("appuyez sur la touche '1' Pour reconnaitre l'image\n");
import PackageName.Test.*
pathToTest = "smartphonePicture";

while(val~=0)
    if(val==1)
        disp('Photo en cours de traitement')
       image=snapshot(cam);
       imshow(image); 
       saveas(imshow(image),'smartphonePicture/imageTaken.png')
       Test(pathToTest,fruitnet);
    end
    val = input("appuyez sur la touche '1' Pour reconnaitre l'image sinon appuyer sur 0\n");
end
disp("Fin du programme")
