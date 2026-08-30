#!/bin/bash

# get the current dir from where this script is running from 
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

trap exit ERR
if [ -d $HOME/.tmux  ]
then
    echo .tmux already exist
    mv $HOME/.tmux $HOME/.tmux.bak
fi

if [ -e $HOME/.tmux.conf  ]
then
    echo .tmux.conf already exist
    mv $HOME/.tmux.conf $HOME/.tmux.conf.bak
fi

cp -r $SCRIPT_DIR $HOME/.tmux
ln -s $HOME/.tmux/.tmux.conf $HOME/.tmux.conf

tmux source-file ~/.tmux.conf
