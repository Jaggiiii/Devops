#!/usr/bin/bash

# note we can set jobs using "at" command

# the syntax is like 
#at 8:11 -f ./switch_case.sh
# -f is a test operator.
# -f checks whether a file exists AND is a regular file

#atq is used to check all the jobs that were in the queue
# if it is showing empty that means there were no jons currenlt
# atrm job_id    is used to remove that job eg : atrm 3.

echo "hello jagadeesh,your scheduled job is exectued" >> /home/jaggi/job.log