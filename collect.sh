#!/usr/bin/bash
cp ~/.vimrc ~/Repos/config/
cp ~/.bashrc ~/Repos/config/
cp ~/.gitconfig ~/Repos/config/
rm ~/Repos/config/bin/*
cp ~/bin/git_diff_wrapper ~/Repos/config/bin/
cp ~/bin/load_shared ~/Repos/config/bin/
cp ~/bin/tml ~/Repos/config/bin/
rm -rf ~/Repos/config/alacritty
cp -R ~/.config/alacritty ~/Repos/config
rm -rf ~/Repos/config/conky
cp -R ~/.config/conky ~/Repos/config
rm -rf ~/Repos/config/neofetch
cp -R ~/.config/neofetch ~/Repos/config

