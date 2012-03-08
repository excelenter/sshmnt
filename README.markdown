sshmnt: mount directories over SSH with ease
============================================

What this script can do for me?
-------------------------------

This script helps you with mounting directories over SSH.
It mounts remote directory into *$SSHFSROOT* (which is an environmental
variable) into corresponding folder. If folder for remote directory
doesn't exists, script will create it for you.

Optionally script can change your working directory to newly mounted folder ( "-d" flag ).

Installation
------------

1. Clone git repository:
    git clone git://github.com/excelenter/sshmnt.git
2. Source this script somewhere in your .bashrc. Like that:
    source ~/sshmnt/sshmnt.sh
3. Or even that:
    . ~/sshmnt/sshmnt.sh
4. Now you have *sshmnt* function. Enjoy!

After that

About
-----

This is my first shell script. It's kinda simple, but it works for me (for my girlfriend, actually; 
I wrote that for her). If this script contains bugs, logic fails, whatever -- please tell me about them.

Thanks a lot!

