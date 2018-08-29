#!/bin/bash 

# Run this script from the root of the project directory!

BASH_PROFILE=~/.bash_profile
TMUX_PROFILE=~/.tmux_conf
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
echo -e "$BLUE_BOLD=>$WHITE Copying over fresh $YELLOW.bash_profile$WHITE to $GREEN~/\033[00m"
cp .bash_profile $BASH_PROFILE

# Checks for existance of current .tmux_conf and makes a local backup
if [ -a $TMUX_PROFILE ]; then
    echo -e "$BLUE_BOLD=>$WHITE Making a backup of $YELLOW$TMUX_PROFILE$WHITE to $GREEN$TMUX_PROFILE.bak"
    mv &TMUX_PROFILE $TMUX_PROFILE.bak
fi

# Copies over the repo's version of .tmux_conf to the local user's home directiory
echo -e "$BLUE_BOLD=>$WHITE Copying over fresh $YELLOW.tmux_conf$WHITE to $GREEN~/\033[00m"
cp .tmux_conf $TMUX_PROFILE

# Pulls down pre-reqs
if ! [ -f ~/.git-completion.bash ]; then
    echo -e "$BLUE_BOLD=>$WHITE Downloading$YELLOW git-completion.bash$WHITE to $GREEN~/\033[00m"
    curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

# if ! [ -f ~/.git-prompt.sh ]; then
#     echo -e "$BLUE_BOLD=>$WHITE Downloading$YELLOW git-prompt.sh$WHITE to $GREEN~/\033[00m"
#     curl -s https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
# fi

if ! [ -f ~/.bash-git-prompt/gitprompt.sh ]; then
    echo -e "$BLUE_BOLD=>$WHITE Downloading $YELLOW.bash-git-prompt$WHITE to $GREEN~/\033[00m"
    git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
fi

echo "This bash profile expects the installation of autoenv to ~/.autoenv"
echo "Please run \"git clone git://github.com/kennethreitz/autoenv.git ~/.autoenv\""
