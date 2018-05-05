## Sentiment Analysis on Demonetization Using Pig

Semantic Analysis of Demonetization project has been developed for the analysis of Indian Demonetization Record.  In this project we will find out the views of different people on the demonetization by analysing the tweets from twitter and we will classify the tweets as positive or negative tweets. You can find the demonetization twitter data in data folder.

For performing whole process I will use HDFS so firstly you have to create a directory in HDFS and move the local file to the HDFS and then run the pig script file.

You can find twitter as well as reting dictionary data into the data folder.

Follow the below steps for successfulling this project.

```
# Create directory in HDFS to store csv and rating dictionary file

$ hadoop fs -mkdir /demion_analysis

# Move local file to the HDFS. Please replace the file path in below given query according to your local system.

$ hadoop fs -copyFromLocal /home/maniram/data/demonetization-tweets.csv /demion_analysis
$ hadoop fs -copyFromLocal /home/maniram/data/AFINN.csv /demion_analysis

```


Now whole jobs is fine. You can execute the pig script using below given command

```
$ pig -x mapreduce /home/maniram/demonotetization_analysis.pig

```

Positive and Negative tweets about demonetization will be stored on HDFS in the given folder which has been mentioned in script file 
You can view the content of positive and negative tweets file using below commands.


```
$ hadoop fs -cat /demion_anaysis/positive_tweets/*00 

$ hadoop fs -cat /demion_anaysis/negative_tweets/*00 
```


Before executing above mentioned process I am considering that hadoop cluster is running in machine.
If not make sure that you have started the hadoop cluster before executing the script file.
