#! /bin/bash

echo Welcome to Fever310 Modeller
echo Attempting to read files in Data folder...
## Using an ls -l to print info about the data files
## Put any preprocessing stuff below to replace the ls -l ../Data
ls -l ../Data
echo Now processing the data...
## Using a wc to print info about the data files
## Put any analysis and model building commands below to replace the wc ../Data/*.csv
wc ../Data/*.csv
echo Done\!
