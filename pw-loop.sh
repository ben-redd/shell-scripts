#!/usr/local/bin/zsh

#This script will loop over a playwright test the specified number of times

NUM=$1
TEST=$2
ENV=$3
OPTIONS=$4

if [[ $ENV == "qa" ]]; 
then
for i in {1..$NUM}; do yarn test:pw:qa $TEST $OPTIONS; done
else
for i in {1..$NUM}; do yarn test:pw $TEST $OPTIONS; done
fi

# for i in {1..$NUM}; do yarn test:pw $TEST; done

