#!/usr/bin/bash

# the main thing while you are writing the commands 
# you need to write the complete path of the command for good practice
# the reason behind that is main 2 reasons
# 1. suppose someone create a file called echo with malware content and u are using echo command where u may get trapped .
#  2.also for the security purpose based on the above case

# how to use  CRON command  ------> crontab -e
# m h  dom mon dow   means minutes hours day_of_month month day of week (which week)
# examples 30 3 10 7 4 /usr/local/bin/script
# then after u need to run 
# sudo crontab -u root -e  

# e tag indicates edit

# /tmp/crontab.75XhBk/crontab
# Simple meaning (one place):
# When you run crontab -e, cron does not open the real cron file directly.
# It creates a temporary file in /tmp, opens it in the editor, checks it for errors, and only after you save it installs the job into the real cron location.
# /tmp → temporary directory
# crontab.75XhBk → randomly created temp folder
# crontab → temporary cron file you edit
# After saving, the content is moved to:
# text
# Copy code
# /var/spool/cron/crontabs/<username>
# The /tmp/crontab.* file is temporary and deleted automatically.
# One-line memory:
# /tmp/crontab.* = temporary editing file created by crontab -e

# Why it is used (exact reasons)
# Safety
# The real cron file is never touched directly
# Prevents breaking scheduled jobs if you make a mistake
# Error checking
# Cron first checks the temp file for syntax errors
# If there is an error → job is not installed
# Crash protection
# If editor crashes or system shuts down, real cron is safe
# Multi-user safe
# Each use  r gets a unique temp file
# No conflict when many users edit cron at same time
# Security
# Prevents partial writes or corrupted cron files











  
