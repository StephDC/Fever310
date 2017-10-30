#! /bin/bash
PREF=`pwd`/$1

echo \# Welcome to Fever310 Modeller
echo \# Attempting to read files in Data folder...
echo PREFIX=$PREF
## Using an ls -l to print info about the data files
## Put any preprocessing stuff below to replace the ls -l ../Data
ls -l "$PREF/Data"
ls /tmp/DS310 || mkdir /tmp/DS310
python3 "$PREF/Fever310/mergeLabel.py" "$PREF/Data/dengue_features_train.csv" "$PREF/Data/dengue_labels_train.csv" /tmp/DS310/merge.csv
python3 "$PREF/Fever310/getWeekNum.py" "$PREF/Data/submission_format.csv" /tmp/DS310/submit.csv
head -n 1 /tmp/DS310/merge.csv > /tmp/DS310/sj.csv
head -n 1 /tmp/DS310/merge.csv > /tmp/DS310/iq.csv
cat /tmp/DS310/merge.csv | grep sj >> /tmp/DS310/sj.csv
cat /tmp/DS310/merge.csv | grep iq >> /tmp/DS310/iq.csv
cp "$PREF/Fever310/fevertimesinmodel.math"  /tmp/DS310/model.math
echo Now processing the data...
## Using a wc to print info about the data files
## Put any analysis and model building commands below to replace the wc ../Data/*.csv
math -run -noprompt < /tmp/DS310/model.math
echo \# Cleaning up...
mv /tmp/DS310/result.csv "$PREF"
#rm -frv /tmp/DS310
mv /tmp/DS310 "$PREF/Intermediate_Result"
echo \# Done\!
