titanic_data = load '/titanic_analysis/TitanicData.txt' using PigStorage(',') as
(PassengerId:int,Survived:int,Pclass:int,Name:chararray,Sex:chararray,Age:int,
SibSp:int,Parch:int,Ticket:chararray,Fare:int,Cabin:chararray,Embarked:chararray);

-- Extract useful column from the raw data
feature_data = foreach titanic_data generate Survived,Sex,Age;

-- Split data into survived and died passanger
SPLIT feature_data INTO died_Passanger IF(Survived==0),survived_Passanger IF(Survived==1);  


-- Group pasanger by gender
survived_gender_grp = GROUP survived_Passanger by Sex;
died_gender_grp = GROUP died_Passanger by Sex;

-- Generate avg age for both female and male for died and survived people

sur_avg_age = foreach survived_gender_grp generate CONCAT('Survived_',group) ,AVG(survived_Passanger.Age) as avg_age; 
died_avg_age = foreach died_gender_grp generate CONCAT('Died_',group) ,AVG(died_Passanger.Age) as avg_age; 

merged_data = UNION sur_avg_age,died_avg_age;                       --  Merge data in single unit

STORE merged_data INTO '/titanic_analysis/aaa_report.txt' using PigStorage(',');  --  Store the Accident Average Age Report to HDFS

avg_age_report = load '/titanic_analysis/aaa_report.txt' using PigStorage(',') as (category:chararray,avg_age:int);
dump avg_age_report;



