sshmnt: mount directories over SSH with ease
============================================

What this script can do for me?
------------------------------- 
This script helps you with mounting directories over SSH.
It mounts remote directory into *$SSHFSROOT* (which is an environmental
variable) into corresponding folder. If folder for remote directory
doesn't exists, script will create it for you.

Script changes your working directory to the newly mounted folder.
If you want to stay where you are, add "-nocd" flag to the end of the script.

Installation
------------

1. Clone git repository:
`git clone git://github.com/excelenter/sshmnt.git`
2. Source this script somewhere in your .bashrc. Like that:
`source ~/sshmnt/sshmnt.sh`
3. Now you have *sshmnt* function. Enjoy!

About
-----

This is my first shell script. It's kinda simple, but it works for me (for my girlfriend, actually; 
I wrote that for her). If this script contains bugs, logic fails, whatever -- please tell me about them.

Thanks a lot!

