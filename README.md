## 我的vim配置
剥离自[spf13-vim][1]，一个相当有影响力的好配置。
但目前对我来说它过于庞杂，vim的启动时间虽然不长，但有时有点影响心情。
因而决定自行将其中的一些东西摘取出来，作为自己今后vim的配置。

## 配置文件列表
参照我的[neovim][2]的配置思路，分为以下文件：

+ __vimrc__ 主配置文件，包含[vundle][3]的初始化和vim插件的初次安装
+ __plugins.vim__ 插件列表文件，包含所有安装的插件，按照[spf13-vim][1]进行分组
+ __plugins.rc.vim__ 插件的配置，尽可能地不包含vim的基本配置
+ __local.vim__ vim的基本配置，离开了插件也能运行

考虑再三，还是用[vundle][3]。
原因主要是两个，比较熟悉vundle，及[neobundle][4]相对会难操作一点。
但不排除以后改用[neobundle][4]。

## 几点事项
1. 这个配置只打算在linux上（目前是在archlinux）进行使用。
2. 这个配置并不完善，许多地方会有问题。
3. 感谢__Steve Francia__在github上分享了这么有用的配置。

[1]: https://github.com/spf13/spf13-vim.git
[2]: https://github.com/gisphm/myneovimrc.git
[3]: https://github.com/gmarik/Vundle.vim.git
[4]: https://github.com/Shougo/neobundle.vim.git
