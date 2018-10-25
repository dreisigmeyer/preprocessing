#!/bin/bash

cd carra_prep2
./doitall.sh
cd ../assignee_prep2
cp ../carra_prep2/outputs/csv_output/prdn_metadata.csv ./csv_data/
cp ../carra_prep2/outputs/json_output/*.json ./json_data/
cp ../carra_prep2/outputs/xml_output/xml_with_inventors/*.bz2 ./xml_data/
./run_it.sh
./get_iops.sh
cd ../
