There have been as many inquisitions as there have been questions raised and equally that many types of analysis methods applied to arrive at conclusions. But this project is not about analyzing why or what made the Titanic sink – it is about analyzing the data that is present about the Titanic publicly. It actually uses Pig MapReduce to analyze and arrive at:

In this project I will find out the following result from titanic data.

* The average age of the people (both male and female) who died in the tragedy using Pig MapReduce.

* How many persons survived – traveling class wise.



**DATA SET DESCRIPTION**

Column 1 : PassengerId

Column 2 : Survived  (survived=0 & died=1)

Column 3 : Pclass

Column 4 : Name

Column 5 : Sex

Column 6 : Age

Column 7 : SibSp

Column 8 : Parch

Column 9 : Ticket

Column 10 : Fare

Column 11 : Cabin

Column 12 : Embarked

The titanic data set have been given in this repository in titanicdata file. Store the data in HDFS in mentiond directory in pig script file.
and the execute the pig script file.
Run the following command to count and store the average age of survived and died passanger.

```
$ pig -x mapreduce '/home/maniram/data/titanic_avg_age_report.pig' 
-- make sure have changed the file path according to your local system in above line

```

To find out the dead and servived passanger report run the second pig script file using following command

```
$ pig -x mapreduce '/home/maniram/data/titanic_pclass_report.pig'
-- make sure have changed the file path according to your local system in above line.

```


After executing above Pis script file your result be saved in HDFS as well it the result will be shown in shell terminal also.

Make sure your hadoop cluster is running before executing the pig script file.


