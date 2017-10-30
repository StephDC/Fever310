#! /bin/bash
PREF=`pwd`/$1

echo \# Welcome to Fever310 Modeller
echo \# Attempting to read files in Data folder...
echo PREFIX=$PREF
## Using an ls -l to print info about the data files
## Put any preprocessing stuff below to replace the ls -l ../Data
ls -l $PREF/Data
ls /tmp/DS310 || mkdir /tmp/DS310
$PREF/Fever310/mergeLabel.py $PREF/Data/dengue_features_train.csv $PREF/Data/dengue_labels_train.csv /tmp/DS310/merge.csv
head -n 1 /tmp/DS310/merge.csv > /tmp/DS310/sj.csv
head -n 1 /tmp/DS310/merge.csv > /tmp/DS310/iq.csv
cat /tmp/DS310/merge.csv | grep sj >> /tmp/DS310/sj.csv
cat /tmp/DS310/merge.csv | grep iq >> /tmp/DS310/iq.csv
echo Now processing the data...
## Using a wc to print info about the data files
## Put any analysis and model building commands below to replace the wc ../Data/*.csv
wc $PREF/Data/*.csv
wc /tmp/DS310/*.csv
echo \# Cleaning up...
#rm -frv /tmp/DS310
mv /tmp/DS310 $PREF/Run
echo \# Done\!
