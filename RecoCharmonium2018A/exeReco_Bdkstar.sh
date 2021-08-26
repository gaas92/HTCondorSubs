#!/bin/bash
echo "Starting job on " `date` #Date/time of start of job
echo "Running on: `uname -a`" #Condor job is running on this node
echo "System software: `cat /etc/redhat-release`" #Operating System on that node

source /cvmfs/cms.cern.ch/cmsset_default.sh
cd /afs/cern.ch/work/g/gayalasa/public/B0Analysis/CMSSW_10_2_18/src/Ponia/OniaPhoton
eval `scramv1 runtime -sh`
echo $CMSSW_BASE "is the CMSSW we created on the local worker node"
cd test
cmsRun Bdkstar_Rootupler_Condor.py inputFile=$1 njob=$2