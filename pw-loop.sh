#!/usr/local/bin/zsh

#This script will loop over a playwright test the specified number of times. It will only work properly with pre-set playwright scripts that you've configured in a local project.

#This script takes 4 arguments from a user. e.g. "pw-loop 5 conditions.spec.mjs qa --headed"
NUM=$1 #the number of times to loop over a playwright test
TEST=$2 #the test name to loop over
ENV=$3 #the environment to run the test against. Local by default, or QA url if specified by the user
OPTIONS=$4 #any playwright option flags, e.g. --headed

if [[ $ENV == "qa" ]]; 
then
for i in {1..$NUM}; do yarn test:pw:qa $TEST $OPTIONS; done
else
for i in {1..$NUM}; do yarn test:pw $TEST $OPTIONS; done
fi

# for i in {1..$NUM}; do yarn test:pw $TEST; done

