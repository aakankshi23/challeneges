#!/bin/bash/
gcloud compute scp C:/Users/HP/Documents/FnP/metadata1.sh --zone="us-east4-c" instance-1:/home/verma_aakash3103/tests/

gcloud compute ssh --zone "us-east4-c" "instance-1" --project "just-camera-375607" \
--command="cd  /home/verma_aakash3103/tests/ && sh metadata1.sh "

gcloud compute scp instance-1:/home/verma_aakash3103/tests/output1.txt --zone="us-east4-c" C:/Users/HP/Documents/FnP/  
