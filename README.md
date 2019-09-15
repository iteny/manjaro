# manjaro
Manjaro Configure

## 进入系统更新镜像源
- 全部勾选上点击两次ok即可
- sudo pacman-mirrors -i -c China -m rank
## 更新系统及软件，一路回车即可
- sudo pacman -Syyu
## 一些配置文件文件的路径
- sudo vim /etc/pacman.conf  #pacman的配置文件
- sudo vim ~/.vimrc  #vim的配置文件路径
- sudo vim ~/.config/nvim/init.vim. #neovim的配置文件路径
