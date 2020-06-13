#!/bin/bash

# ToDo: make sure json dir exists 

for i in 1 2 3 4; do
  echo $i
  get-my-tasks.sh $i > json/$i.json
done

Rscript my-tasks.R