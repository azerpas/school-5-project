# school-5-project

## Notice d'utilisation 
#### Pré-requis
- Matlab en version complète avec les modules: 
    - `Parallel Computing Toolbox`
    - `Statistics and Machine Learning Toolbox`
    - `Deep Learning Toolbox`
    - `Simulink Compiler`
- Téléchargez le 'Deep Learning Toolbox Model' depuis MatLab afin d'installer AlexNet

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
