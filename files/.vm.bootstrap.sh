#!/usr/bin/env bash
#Copyright (C) dirlt

rm -rf repo
rm -rf .private
ln -s /vagrant/repo repo
ln -s /vagrant/KuaiPan/private .private
source repo/notes/files/.shrc
install_files
if [ $SHELL != "/bin/zsh" ]; then
    chsh -s /bin/zsh
fi
