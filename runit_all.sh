#!/bin/bash

NUM_PY_THREADS=$1

# unpack and download data
bzip2 -dk carra_prep2/preprocessing/gbd_metadata/data/uspto_data/INV_COUNTY_*.TXT.bz2
bzip2 -dk carra_prep2/preprocessing/gbd_metadata/data/uspto_data/INVENTOR_*.TXT.bz2
bzip2 -dk carra_prep2/preprocessing/gbd_metadata/data/usgs_data/AllNames_*.txt.bz2
bzip2 -dk assignee_prep2/uspto_data/ASG_NAMES_UPRD_*.TXT.bz2
bzip2 -dk assignee_prep2/uspto_data/PN_ASG_UPRD_*.TXT.bz2
cd carra_prep2
./dat_to_xml/get_uspto_data.sh &
PID1=$!
./xml_rewrite/get_uspto_data.sh &
PID2=$!
wait $PID1 $PID2

# process the data
./doitall.sh $NUM_PY_THREADS
cd ../assignee_prep2
cp ../carra_prep2/outputs/csv_output/prdn_metadata.csv ./csv_data/
cp ../carra_prep2/outputs/json_output/*.json ./json_data/
cp ../carra_prep2/outputs/xml_output/xml_with_inventors/*.bz2 ./xml_data/
./run_it.sh $NUM_PY_THREADS
cd ../
