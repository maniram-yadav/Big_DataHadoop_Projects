titanic_data = load '/titanic_analysis/TitanicData.txt' using PigStorage(',') as
(PassengerId:int,Survived:int,Pclass:int,Name:chararray,Sex:chararray,Age:int,
SibSp:int,Parch:int,Ticket:chararray,Fare:int,Cabin:chararray,Embarked:chararray);

-- Extract useful column from the raw data for analysis

feature_data = FOREACH titanic_data generate Survived,Pclass;

SPLIT feature_data into died IF(Survived==0), survived IF(Survived==1);

died_pclass_group = GROUP died by Pclass;
survived_pclass_group = GROUP survived by Pclass;

count_died = foreach died_pclass_group generate CONCAT('Died_Pclass_',(chararray)group),COUNT(died);
count_survived = foreach survived_pclass_group generate CONCAT('Survived_Pclass_',(chararray)group),COUNT(survived);

class_report = UNION count_died,count_survived;
STORE class_report INTO '/titanic_analysis/Pclass_analysis.txt' using PigStorage(',');

class_report_data = load '/titanic_analysis/Pclass_analysis.txt' using PigStorage(',') as (category:chararray,total:int);
dump class_report_data;
