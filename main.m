import PackageName.Training.*
import PackageName.Test.*

pathToTrain = "fruits-360/Trainingtest";
pathToTest = "fruits-360/Testtest";

%reseau = Training(pathToTrain);
Test(pathToTest,reseau);