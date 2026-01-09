#!/usr/bin/bash

# to know whether command is successful or not we are going to know it by using exit codes.
# echo $? is the way to check exit codes  if it is 0 then it is successful and if it is other than 0 it was not successful. which was really important  in the automation only proceed to next step if your exit code is 0 else exit and log the error.

# note that no statement is going to run after exit code /exit statement.

echo "hello jagadeesh" >> package_install_results.log

package=htkvvop

sudo apt install $package >> package_install_results.log

if [ $? -eq 0 ] 
then
     echo "the installation of $package was successful ."
     echo "the new command is available here"
     which $package
else
     echo "$package failed to install ." >> package_install_failures.log
fi      

echo "next _page"

echo "hello world "
exit 199
echo $?