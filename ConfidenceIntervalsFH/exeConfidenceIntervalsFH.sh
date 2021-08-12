#!/bin/bash
echo "Starting job on " `date` #Date/time of start of job
echo "Running on: `uname -a`" #Condor job is running on this node
echo "System software: `cat /etc/redhat-release`" #Operating System on that node

source /eos/user/h/hcrottel/new_env/bin/activate      #Horacio env
cd /eos/user/g/gayalasa/CondoBase/ConfidenceIntervalsFC #Spot

python Run_CI_Job.py --Bin $1 --Step $2 --FH $3 