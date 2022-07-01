#!/usr/local/bin/zsh

#This script will loop over a playwright test the specified number of times. It will only work properly with pre-set playwright scripts that you've configured in a local project.

#This script takes 4 arguments from a user. e.g. "pw-loop 5 conditions.spec.mjs qa --headed"
NUM=$1 #the number of times to loop over a playwright test
ENV=$2 #the environment to run the test against. Local by default, or QA url if specified by the user
TEST=$3 #the test name to loop over
OPTIONS=$4 #any playwright option flags, e.g. --headed

if [ -z "$NUM" ]; 
then
   printf "Please specify the following arguments when running the pw-loop script: \n"
   printf "1. Number of times to loop over a playwright test (e.g. 5). \n"
   printf "2. The environment to run the test against (e.g. local or qa). \n"
   printf "3. Name of the test to loop over (e.g. pipelineViewSettings.spec.mjs). \n"
   printf "4. Optional flags (e.g. --headed). \n"
   printf "Example Input: 'pw-loop 5 qa conditions.spce.mjs --headed' \n"
else
   printf "\nLooping over $TEST, $NUM times in $ENV environment \n"
   if [[ $ENV == "qa" ]];
   then
   for i in {1..$NUM}; do yarn test:pw:qa $TEST $OPTIONS; done
   else
   for i in {1..$NUM}; do yarn test:pw $TEST $OPTIONS; done
   fi
fi




