#!/bin/bash 

# Run this script from the root of the project directory!

BASH_PROFILE=~/.bash_profile
cd="${0%/*}"

# Colors
WHITE="\033[0;37m"
YELLOW="\033[0;33m"
GREEN="\033[0;32m"
BLUE_BOLD="\033[1;34m"

# Checks for existance of current .bash_profile and makes a local backup
if [ -a $BASH_PROFILE ]; then
    echo -e "$BLUE_BOLD=>$WHITE Making a backup of $YELLOW$BASH_PROFILE$WHITE to $GREEN$BASH_PROFILE.bak"
    mv $BASH_PROFILE $BASH_PROFILE.bak
fi

# Copies over the repo's version of .bash_profile to the local user's home directiory
echo -e "$BLUE_BOLD=>$WHITE Copying over fresh $YELLOW.bash_profile$WHITE to $GREEN~/"
cp .bash_profile $BASH_PROFILE

# Pulls down pre-reqs
if ! [ -f ~/.git-completion.bash ]; then
    echo -e "$BLUE_BOLD=>$WHITE Downloading$YELLOW git-completion.bash$WHITE to $GREEN~/"
    curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

if ! [ -f ~/.git-prompt.sh ]; then
    echo -e "$BLUE_BOLD=>$WHITE Downloading$YELLOW git-prompt.sh$WHITE to $GREEN~/"
    curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

echo "This bash profiel expects the installation of autoenv to ~/.autoenv"
echo "Please run \"git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv\""