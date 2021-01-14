# school-5-project

## Notice d'utilisation 
#### Pré-requis
- Matlab en version complète avec les modules: 
    - `Parallel Computing Toolbox`
    - `Statistics and Machine Learning Toolbox`
    - `Deep Learning Toolbox`
    - `Simulink Compiler`
- Téléchargez le add-on 'Deep Learning Toolbox Model' depuis MatLab afin d'installer AlexNet
- *(Opt)* Téléchargez le add-on 'MATLAB Support Package for IP Cameras' depuis MatLab afin d'installer le support aux caméras IP

#### Tutoriel
- Clonez le projet à partir de [Github](https://github.com/azerpas/school-5-project)
    - En le téléchargeant     
    **OU**
    - En faisant `git clone https://github.com/azerpas/school-5-project.git && cd school-5-project` à partir de votre invite de commande
- Téléchargez la base de données de fruit à partir de [ce lien](https://drive.google.com/file/d/1eK9w8Gibo9P7CcO0kwkP35zyiSZ8pcje/view?usp=sharing)
- Décompressez le .zip et déplacez le dossier `fruits360` dans `school-5-project`
- Lancez MatLab et rendez-vous dans `school-5-project`
- Appelez `main` depuis l'invite de commande **ou** faites *"Run"* depuis le bouton vert une fois `main.m` selectionné
- Naviguez dans le menu et utilisez la fonctionnalité de votre choix 
- Pour utiliser la caméra [référez-vous à la documentation](#notice-caméra)

## Notice Caméra

Pour reconnaître un fruit à partir de la caméra:    
- Il faut un réseau de neurones appelé `'net.mat'` à la racine, entraîné à la reconnaissance de fruits.
- Téléchargez l'application : 'ipwebcam'.     
**OU**
- (iOS) Téléchargez l'application : [IP Webcam Home Security Camera](https://apps.apple.com/fr/app/ip-webcam-home-security-camera/id1264454867) *par Waleed Arif Malik*      
Retenez que l'URL de la vidéo se situe en bas de l'application et que le port n'est pas 8888 mais 8080, à la fin de l'adresse http, ajoutez `/video`. Si vous ne parvenez pas à trouver le lien précis, rendez-vous sur Firefox à l'URL en bas de votre application et faites un clic droit "Informations sur l'image" pour trouver la vraie adresse. [Si vous n'y arrivez toujours pas regardez ce lien.](https://fr.mathworks.com/help/supportpkg/ipcamera/ug/connect-to-ip-cameras.html#butdj6y)
![screenshot](https://user-images.githubusercontent.com/19282069/104584563-13456c80-5663-11eb-8559-68bcbcf4ef30.PNG)

- Lancez l'application et cliquez sur 'start server'
- Rendez-vous dans votre navigateur sur le lien affiché sur l'application.
- Ouvrez le fichier `'camscript.m'` dans MatLab et ~~modifiez les derniers chiffres de l'adresse ip de la ligne 5 afin qu'ils correspondent à votre lien sur ipwebcam.~~
- Vous pouvez lancer le script 

## TODO: 

- [x] Créer deux fonctions      
- training.m     
- test.m     
- [x] Sauvegarde du réseau de neurones    
- [x] Lier la caméra par matlab    
