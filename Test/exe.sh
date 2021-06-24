#!/bin/bash

echo "Starting job on " `date` #Date/time of start of job
echo "Running on: `uname -a`" #Condor job is running on this node
echo "System software: `cat /etc/redhat-release`" #Operating System on that node

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /eos/user/g/gayalasa/CondoBase/CMSSW_10_6_12/src/myAnalyzers/BtoKsMuMu
eval `scramv1 runtime -sh`
echo $CMSSW_BASE "is the CMSSW we created on the local worker node"
cd test
cmsRun Run_TnP_Condor.py maxE=3000 saveInSync=True "$@"