#We need to write code that will query the meta data of an instance within GCP and provide a json formatted output. 

The folder contains two scripts and one text file-

compute_engine.sh - 
This script copies the metadata1.sh inside the compute engine
Connects to the compute engine via ssh
Outputs the compute engine metadata in output file and copies it on local system

metadata1.sh - This script curls the metadata of compute engine

output1.txt - This file holds the output of metadata1.sh on local system
