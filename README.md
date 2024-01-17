Steps:
1) Download https://alacritty.org/
  - copy alacritty.yml file to ~/.config/alacritty/alacritty.toml
  - Run /Applications/Alacritty.app/Contents/MacOS/alacritty migrate
2) Install Oh My ZSH https://ohmyz.sh/#install
3) Install Vim: "brew install neovim" 
  - copy init.vim vile to ~/.config/nvim/init.vim
  - install python3:  python3 -m pip install --user --upgrade pynvim)
  - install vundle (https://github.com/VundleVim/Vundle.vim) & run :PluginInstall
  - sudo chown -R $USER ~/.local/share (if deoplete fiel load error)

