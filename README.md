# manjaro
Manjaro Configure

## 进入系统更新镜像源
- 全部勾选上点击两次ok即可
- sudo pacman-mirrors -i -c China -m rank  光有这一步还不行
- sudo /etc/pacman.conf  添加一列[archlinuxcn]
- sudo pacman-mirrors -g  更新源列表
- sudo pacman -Syyu  更新系统
- sudo pacman -S archlinuxcn-keyring  防止PGP签名错误

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
## 输入法
- sudo pacman -S fcitx fcitx-im fcitx-ui-light fcitx-libpinyin fcitx-sunpinyin fcitx-configtool
- sudo pacman -S fcitx-cloudpinyin fcitx-sunpinyin fcitx-googlepinyin fcitx-libpinyin
- sudo pacman -S ttf-dejavu adobe-source-han-sans-otc-fonts
- sudo vim ~/.xprofile

export GTK_IM_MODULE=fcitx

export QT_IM_MODULE=fcitx

export XMODIFIERS="@im=fcitx"

- 运行fcitx，查看有没有什么错误，然后运行fcitx-configtool把喜欢的输入法加入进去
## zsh的安装配置
- sudo pacman -S alacritty  终端仿真器，性能极佳
- vim ~/.config/i3/config  修改i3默认终端为alacritty
- vim ~/.config/alacritty/alacritty  用/size找到文字大小，改成16以上，终端字体太小看不清，找到opacity改成半透明0.5,需要安装compton
- sudo pacman -S zsh 安装zsh
- chsh -s /usr/bin/zsh 修改默认的shell
- sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"  安装on-my-zsh

## xorg套件，更改你的硬件设置
- sudo pacman -S xorg  安装xorg全部
- wget https://raw.githubusercontent.com/iteny/manjaro/master/.xmodmap  已经编辑好了，直接下载到根目录
- xmodmap ~/.xmodmap  让配置生效
## 更改桌面壁纸
- sudo pacman -S feh variety  首先安装壁纸工具feh,然后安装管理器variety
## pacman常用命令
- sudo pacman -Syyu 更新软件库，并更新软件
- sudo pacman -Ss 查询软件关键字
- sudo pacman -Rns 删除软件并且保留自定义的配置文件
- sudo pacman -Qe 查询自己安装的全部软件
- sudo pacman -Qdt 查询不再需要的软件，孤儿软件，可能是其他软件的依赖，当你删除了其他软件，依赖就留了下来
- sudo pacman -R $(pacman -Qdtq) 删除所有孤儿软件
- sudo vim /etc/pacman.conf 配置文件路径
