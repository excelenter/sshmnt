#!/bin/bash
# sshmnt.sh
# v. 0.3
#
# Funtion that automatically mounts ssh directories into $SSHFSROOT 
# directory.
#
# $SSHFSROOT is environmental variable.
# 
# Optionally it can change current working directory to mounted directory.
# ( "-nocd" flag )


sshmnt () {

  # Text color variables
  txtbld=$(tput bold)					        # Bold
  txtemph=$(tput setaf 6)				      # Emphasis
  bldred=${txtbld}$(tput setaf 1)		  # Red
  bldgreen=${txtbld}$(tput setaf 2)	  # Green
  bldyellow=${txtbld}$(tput setaf 3)	# Yellow
  bldwhite=${txtbld}         			    # White
  txtrst=$(tput sgr0)					        # Reset

  # Message templates
  info="${bldwhite}[INFO]${txtrst}: "
  warning="${bldyellow}[WARN]${txtrst}: "
  error="${bldred}[FATAL]${txtrst}: "
  success="${bldgreen}[OK]${txtrst}: "

  # Check args
  if [ ! $1 ]; then
    echo "${info}Usage: ${txtbld}sshmnt ${txtrst}${txtemph}user@server.com [-nocd]${txtrst}"
    echo "${info}Flags:"
    echo "${info}${txtemph}-nocd${txtrst}: change current working directory to mounted directory."
    return $?
  fi

  # Check base directory variable
  echo "${info}Checking base directory..."
  if [ ! $SSHFSROOT ]; then
    echo "${warning}${txtemph}\$SSHFSROOT${txtrst} variable doesn't exist or empty."
    echo "${info}Using ${txtemph}$HOME/sshfs/${txtrst} as the base directory."
    SSHFSROOT="$HOME/sshfs/"
  fi
  # And if neccessary, try to create it
  if [ -d "$SSHFSROOT" ]; then
    echo "${success}Base directory ${txtemph}$SSHFSROOT ${txtrst}exists."
  else
    echo "${warning}Base directory ${txtemph}$SSHFSROOT ${txtrst}doesn't exists."
    echo "${info}Creating ${txtemph}$SSHFSROOT ${txtrst}directory..."
    if mkdir "$SSHFSROOT" 2>/dev/null
    then
      echo "${success}Base directory ${txtemph}$SSHFSROOT ${txtrst}was succesfully created."
    else
      echo "${error}Base directory cannot be created."
      return $!
    fi
  fi
  # Check server variable
  # And if neccessary, try to create it
  echo "${info}Checking ${txtemph}$1 ${txtrst}directory..."
  if [ -d "$SSHFSROOT$1" ]; then
    echo "${success}Directory ${txtemph}$1 ${txtrst}exists." 
  else 
    echo "${info}Directory ${txtemph}$1 ${txtrst}doesn't exist."
    echo "${info}Creating ${txtemph}$1 ${txtrst}directory..."
    if mkdir "$SSHFSROOT$1" 2>/dev/null
    then
      echo "${success}Directory ${txtemph}$1 ${txtrst}was successfully created."
    else
      echo "${error}Directory creation error (maybe it was mounted before?)"
      return $!
    fi
  fi

  echo "${info}Mounting ${txtemph}$1 ${txtrst}over ssh..."
  if sshfs "$1": "$SSHFSROOT$1" 2> /dev/null; then
    echo "${success}Mounted succesfully." 
  else 
    echo "${error}Mount error." 
    return $!
  fi

  # Change directory if "-d" flag exists
  if [ "$2" != "-nocd" ]; then
    echo "${info}Changing working directory..."
    if cd $SSHFSROOT$1
    then
      echo "${success}Directory changed!"
    else
      echo "${error}Directory changing error."
      return $!
    fi
  fi

}

