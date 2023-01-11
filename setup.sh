# Sets up symbolic link to dot files under git

rm ~/.vimrc
rm ~/.tmux.conf
rm ~/.zshrc
rm ~/.gitignore
rm ~/.gitconfig

ln -s ~/git/dot-files/vimrc ~/.vimrc
ln -s ~/git/dot-files/tmux.conf ~/.tmux.conf
ln -s ~/git/dot-files/zshrc ~/.zshrc
ln -s ~/git/dot-files/gitignore ~/.gitignore
ln -s ~/git/dot-files/gitconfig ~/.gitconfig

# Fix permission for some folders
mkdir -p /usr/local/share/zsh/site-functions
chmod 755 /usr/local/share/zsh
chmod 755 /usr/local/share/zsh/site-functions
