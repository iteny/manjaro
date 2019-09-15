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
- sudo vim ~/.config/nvim/init.vim  #neovim的配置文件路径
## 更改你喜欢的shell,因为bash shell可能功能太差了
- which zsh  #查看一下zsh的位置
- chsh -s /usr/bin/zsh  #更改zsh为默认的shell
## 字体放大
- vim ~/.Xresources  #打开配置文件
- Xft.dpi  #把数值改成200，或者更大然后reboot重启系统
